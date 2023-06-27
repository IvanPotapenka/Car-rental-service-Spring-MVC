package by.potapenko.web.controllers;

import by.potapenko.database.dto.LoginDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import static by.potapenko.web.util.PagesUtil.LOGIN;

@Controller
@RequestMapping("login")
@SessionAttributes("user")
@RequiredArgsConstructor
public class LoginController {
    private final UserService userService;
    private final ModelMapper modelMapper;

    @GetMapping
    public String getLoginPage() {
        return LOGIN;
    }

    @PostMapping
    public String login(LoginDto user, Model model) {
        if (userService.findByEmailAndPassword(user).isEmpty()) {
            model.addAttribute("find_user_error", true);
            return LOGIN;
        } else {
            model.addAttribute("user", modelMapper.map(user, UserDto.class));
            ;
            return "redirect:/catalog";
        }
    }
}
