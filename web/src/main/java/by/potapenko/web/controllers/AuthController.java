package by.potapenko.web.controllers;

import by.potapenko.database.dto.LoginDto;
import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.service.UserService;
import by.potapenko.web.util.UtilitySiteUrl;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.modelmapper.internal.bytebuddy.utility.RandomString;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.UnsupportedEncodingException;

import static by.potapenko.web.util.PagesUtil.LOGIN;
import static by.potapenko.web.util.PagesUtil.RECOVER;
import static by.potapenko.web.util.PagesUtil.REGISTRATION;
import static by.potapenko.web.util.PagesUtil.RESET_PASSWORD;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;
    private final JavaMailSender mailSender;

    @GetMapping("login")
    public String getLoginPage() {
        return LOGIN;
    }

    @GetMapping("registration")
    public String getRegistrationPage() {
        return REGISTRATION;
    }

    @PostMapping("registration")
    public String registration(UserCreationDto user, Model model) {
        if (userService.getByEmail(user.getEmail()).isEmpty()) {
            userService.create(user);
            model.addAttribute("create_user", true);
        } else {
            model.addAttribute("email_error", true);
        }
        return REGISTRATION;
    }

    @GetMapping("logout")
    public String getLogoutUser() {
        return "redirect:/login";
    }

    @GetMapping("recover")
    public String getRecoverPage() {
        return RECOVER;
    }

    @PostMapping("recover")
    public String recover(HttpServletRequest request, LoginDto login, Model model) throws MessagingException, UnsupportedEncodingException {
        if (userService.getByEmail(login.email()).isPresent()) {
            String token = RandomString.make(30);
            userService.updateResetPasswordToken(token, login.email());
            String resetPasswordLink = UtilitySiteUrl.getSiteURL(request) + "/reset_password/token=" + token;
            sendEmail(login.email(), resetPasswordLink);
            model.addAttribute("message_send", true);
            return RECOVER;
        } else {
            model.addAttribute("message_send", false);
            return RECOVER;
        }
    }

    @GetMapping("/reset_password/{token}")
    public String getLoginPage(@PathVariable String token, Model model) {
        if (userService.getByResetPasswordToken(token).isEmpty()) {
            model.addAttribute("user_token_found", false);
        }
        model.addAttribute("token", token);
        model.addAttribute("user_token_found", true);
        return RESET_PASSWORD;
    }

    @PostMapping("/reset_password")
    public String getLoginPage(String token, String password, Model model) {
        if (userService.getByResetPasswordToken(token).isEmpty()) {
            userService.updatePassword(token, password);
            model.addAttribute("change_password", true);
        }
        model.addAttribute("change_password", true);
        return RESET_PASSWORD;
    }

    public void sendEmail(String recipientEmail, String link) throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("carRantal@shopme.com", "Car rental Service");
        helper.setTo(recipientEmail);
        String subject = "Here's the link to reset your password from car rental service";
        String content = "<p>Hello,</p>"
                + "<p>You have requested to reset your password.</p>"
                + "<p>Click the link below to change your password:</p>"
                + "<p><a href=\"" + link + "\">Change my password</a></p>"
                + "<br>"
                + "<p>Ignore this email if you do remember your password, "
                + "or you have not made the request.</p>";

        helper.setSubject(subject);
        helper.setText(content, true);
        mailSender.send(message);
    }
}
