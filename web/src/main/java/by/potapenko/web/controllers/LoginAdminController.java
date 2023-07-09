package by.potapenko.web.controllers;

import by.potapenko.database.dto.LoginAdminDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import static by.potapenko.web.util.PagesUtil.ADMIN;
import static by.potapenko.web.util.PagesUtil.LOGIN_ADMIN;

@Controller
@RequestMapping("login_admin")
@SessionAttributes("admin")
@RequiredArgsConstructor
public class LoginAdminController {
    private final UserService userService;

    @GetMapping
    public String getLoginAdminPage() {
        return "loginAdmin";
    }

    @PostMapping
    public String loginAdmin(LoginAdminDto loginAdmin, Model model) {
        if (userService.findByLoginAndPassword(loginAdmin).isEmpty()) {
            model.addAttribute("find_admin_error", true);
            return LOGIN_ADMIN;
        } else {
            model.addAttribute("admin", loginAdmin);
            return ADMIN;
        }
    }
}
