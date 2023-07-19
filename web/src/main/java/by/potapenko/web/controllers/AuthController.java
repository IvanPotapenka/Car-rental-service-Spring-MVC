package by.potapenko.web.controllers;

import by.potapenko.database.dto.LoginDto;
import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import static by.potapenko.web.util.PagesUtil.LOGIN;
import static by.potapenko.web.util.PagesUtil.RECOVER;
import static by.potapenko.web.util.PagesUtil.REGISTRATION;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("login")
    public String getLoginPage() {
        return LOGIN;
    }

    @GetMapping("registration")
    public String getRegistrationPage() {
        return REGISTRATION;
    }

    @PostMapping("registration")
    public String registration(UserCreationDto user, String password, String passwordCheck, Model model) {
        if (!password.equals(passwordCheck)) {
            model.addAttribute("password_error", true);
            return REGISTRATION;
        }
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
    public String recover(LoginDto login) {
        if (userService.getByEmail(login.email()).isPresent()) {
            return "redirect:/recover?email=true";
        } else {
            return "redirect: /recover?email=false";
        }
    }
}
