package by.potapenko.web.controllers;

import by.potapenko.database.dto.UserDto;
import by.potapenko.service.RentalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static by.potapenko.web.util.PagesUtil.CLIENT_ORDERS;
import static by.potapenko.web.util.PagesUtil.CLIENT_PROFILE;

@Controller
@RequestMapping("account")
@RequiredArgsConstructor
public class AccountController {

    private final RentalService rentalService;

    @GetMapping("profile")
    public String getProfilePage(Model model) {
        UserDto user = (UserDto) model.getAttribute("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return CLIENT_PROFILE;
    }

    @GetMapping("orders")
    public String getOrdersPage(Model model) {
        UserDto user = (UserDto) model.getAttribute("user");
        if (user != null) {
            model.addAttribute("rentals", rentalService.findAllOrdersOfClient(user.getId()));
        }
        return CLIENT_ORDERS;
    }
}
