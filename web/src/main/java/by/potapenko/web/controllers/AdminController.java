package by.potapenko.web.controllers;

import by.potapenko.service.UserService;
import by.potapenko.web.util.AuthenticationUtil;
import by.potapenko.web.util.PagesUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static by.potapenko.web.util.PagesUtil.ADMIN_PROFILE;
import static by.potapenko.web.util.PagesUtil.LOGIN_ADMIN;
import static by.potapenko.web.util.PathUtil.ADMIN;
import static by.potapenko.web.util.PathUtil.LOGIN;
import static by.potapenko.web.util.PathUtil.PROFILE;

@Controller
@RequiredArgsConstructor
@RequestMapping(ADMIN)
public class AdminController {

    private final UserService userService;

    @GetMapping(LOGIN)
    public String getLoginAdminPage() {
        return LOGIN_ADMIN;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping
    public String getAdminPage(Authentication authentication) {
//        if(authentication.getAuthorities()
//                .stream()
//                .map(r->r.getAuthority().contains("USER"))
//                .findFirst()
//                .isPresent()){
//            return HOME;
//        }
        return PagesUtil.ADMIN;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping(PROFILE)
    public String getProfilePage(Model model) {
        if (AuthenticationUtil.getUserDetails() != null) {
            userService.getById(AuthenticationUtil.getUserDetails().getId())
                    .map(userDto -> model.addAttribute("uzer", userDto))
                    .orElse(model.addAttribute("error", true));
        }
        return ADMIN_PROFILE;
    }
}
