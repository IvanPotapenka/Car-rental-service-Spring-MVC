package by.potapenko.web.controllers;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.service.RentalService;
import by.potapenko.service.UserService;
import by.potapenko.web.util.AuthenticationUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CLIENT_ORDERS;
import static by.potapenko.web.util.PagesUtil.CLIENT_PROFILE;

@Controller
@RequestMapping("account")
@PreAuthorize(value = "hasAnyAuthority('ADMIN', 'USER')")
@RequiredArgsConstructor
public class AccountController {

    private final RentalService rentalService;
    private final UserService userService;

    @GetMapping("profile")
    public String getProfilePage(Model model) {
        if (AuthenticationUtil.getUserDetails() != null) {
            userService.getById(AuthenticationUtil.getUserDetails().getId())
                    .map(userDto -> model.addAttribute("uzer", userDto))
                    .orElse(model.addAttribute("error", true));
        }
        return CLIENT_PROFILE;
    }

    @GetMapping("orders")
    public String getOrdersPage(Model model) {
        List<RentalDto> rentals = rentalService.findAllOrdersOfUser(AuthenticationUtil
                .getUserDetails().getId());
        model.addAttribute("rentals", rentals);
        return CLIENT_ORDERS;
    }
}
