package by.potapenko.web.controllers;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.service.RentalService;
import by.potapenko.service.UserService;
import by.potapenko.web.util.AuthenticationUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CANCEL_ORDER;
import static by.potapenko.web.util.PagesUtil.CLIENT_ORDERS;
import static by.potapenko.web.util.PagesUtil.CLIENT_PROFILE;
import static by.potapenko.web.util.PagesUtil.EDIT_USER_PROFILE;

@Controller
@RequestMapping("account")
@PreAuthorize(value = "hasAuthority('USER')")
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

    @GetMapping("profile/edit/{id}")
    public String getProfileEditPage(@PathVariable Long id, Model model) {
        if (id != null) {
            userService.getById(id).ifPresentOrElse(user ->
                            model.addAttribute("uzer", user),
                    () -> model.addAttribute("user_not_found", true));
        }
        return EDIT_USER_PROFILE;
    }

    @PostMapping("profile/edit/{userId}")
    public String profileEditPage(@PathVariable Long userId, UserDto userDto, Model model) {
        if (userId != null) {
            userService.update(userId, userDto).ifPresentOrElse(user ->
                            model.addAttribute("uzer", user),
                    () -> model.addAttribute("user_not_found", true));
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

    @GetMapping("orders/order/{id}")
    public String getCancelOrderPage(@PathVariable Long id, Model model) {
        if (id != null) {
            rentalService.cancelOrderUser(id).ifPresentOrElse(rentalDto ->
                            model.addAttribute("rental", rentalDto),
                    () -> model.addAttribute("rental_not_found", true));
        }
        return CANCEL_ORDER;
    }
}
