package by.potapenko.web.controllers;

import by.potapenko.database.dto.LoginDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static by.potapenko.web.util.PagesUtil.RECOVER;

@Controller
@RequestMapping("recover")
@RequiredArgsConstructor
public class RecoverController {

    private final UserService userService;

    @GetMapping
    public String getRecoverPage() {
        return RECOVER;
    }

    @PostMapping
    public String recover(LoginDto login) {
        if (userService.findByEmail(login.email()).isPresent()) {
            return "redirect:/recover?email=true";
        } else {
            return "redirect: /recover?email=false";
        }
    }
}
