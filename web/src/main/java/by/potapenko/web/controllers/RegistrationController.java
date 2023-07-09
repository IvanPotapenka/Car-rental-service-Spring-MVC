package by.potapenko.web.controllers;

import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static by.potapenko.web.util.PagesUtil.REGISTRATION;

@Controller
@RequestMapping("registration")
@RequiredArgsConstructor
public class RegistrationController {

    private final UserService userService;

    @GetMapping
    public String getRegistrationPage() {
        return "registration";
    }

    @PostMapping
    public String registration(UserCreationDto user, Model model) {
        if (userService.findByEmail(user.getEmail()).isEmpty()) {
            userService.create(user);
            model.addAttribute("create_user", true);
        } else {
            model.addAttribute("email_error", true);
        }
        return REGISTRATION;
    }
}
