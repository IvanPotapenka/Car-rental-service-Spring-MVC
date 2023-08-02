package by.potapenko.web.controllers;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.dto.RentalFilter;
import by.potapenko.database.entity.enam.OrderStatus;
import by.potapenko.service.RentalService;
import by.potapenko.web.util.AuthenticationUtil;
import by.potapenko.web.util.PathUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CAR_ORDERS_ADMIN;
import static by.potapenko.web.util.PagesUtil.CLIENT_ADMIN;
import static by.potapenko.web.util.PagesUtil.CLIENT_ORDERS_ADMIN;
import static by.potapenko.web.util.PagesUtil.ORDER_PROCESSING;
import static by.potapenko.web.util.PagesUtil.RENTALS;
import static by.potapenko.web.util.PagesUtil.RENTAL_ADMIN;
import static by.potapenko.web.util.PagesUtil.UPDATE_RENTAL;

@Controller
@RequestMapping(PathUtil.ADMIN)
@PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
@SessionAttributes("user")
@RequiredArgsConstructor
public class RentalController {
    private final RentalService rentalService;

    @GetMapping(PathUtil.RENTALS)
    public String getRentalsPage(Model model, String sort, RentalFilter filter) {
        List<RentalDto> rentals = sort == null || "ASC".equals(sort)
                ?  rentalService.getAllSortById() : rentalService.getAllSortByDate();
        if (filter.getState() != null
                || filter.getStatus() != null
                || filter.getDateOfCreation() != null
                || filter.getCreator() != null) {
            rentals = rentalService.getByFilter(filter);
        }
        model.addAttribute("rentals", rentals);
        return RENTALS;
    }

    @GetMapping("rentals/rental/{id}")
    public String getRentalPage(@PathVariable Long id, Model model) {
        rentalService.getById(id).ifPresentOrElse(rentalDto -> model.addAttribute("rental", rentalDto),
                () -> model.addAttribute("rental_not_found", true));
        return RENTAL_ADMIN;
    }

    @GetMapping("rentals/rental/delete_rental/{id}")
    public String deleteRental(@PathVariable Long id, Model model) {
        if (id == null) {
            return CLIENT_ADMIN;
        } else {
            model.addAttribute("rental_delete_success", true);
            rentalService.deleteById(id);
            return RENTALS;
        }
    }

    @GetMapping("orders/car/{id}")
    public String deleteCar(@PathVariable Long id, Model model) {
        model.addAttribute("rentals", rentalService.getAllOrdersOfCar(id));
        return CAR_ORDERS_ADMIN;
    }

    @GetMapping("orders/user/{id}")
    public String getOrdersPage(@PathVariable Long id, Model model) {
        model.addAttribute("rentals", rentalService.findAllOrdersOfUser(id));
        return CLIENT_ORDERS_ADMIN;
    }

    @GetMapping("rentals/rental/update_rental/{id}")
    public String getUpdateRentalPage(@PathVariable Long id, Model model) {
        return rentalService.getById(id)
                .map(rental -> {
                    model.addAttribute("rental", rental);
                    return UPDATE_RENTAL;
                })
                .orElse("redirect:/rental/update_rental?error=false");
    }
    @PostMapping("rentals/rental/update_rental/{id}")
    public String updateRental(@PathVariable Long id, RentalDto rental, Model model) {
        if (id != null) {
            rental.setCreator(AuthenticationUtil.getUserDetails().getRole()
                    + " " + AuthenticationUtil.getUserDetails().getFullName());
            rentalService.update(id, rental).ifPresentOrElse(rentalDto -> {
                        model.addAttribute("rental", rentalDto);
                        model.addAttribute("update_rental", true);
                    },
                    () -> model.addAttribute("update_rental", false));
        }
        return UPDATE_RENTAL;
    }

    @GetMapping("rentals/order-processing/{id}")
    public String getOrderProcessingPage(@PathVariable Long id, Model model) {
        if (id == null) {
            model.addAttribute("order_not_found", true);
        } else {
            rentalService.getById(id).ifPresentOrElse(rentalDto -> {
                        if (rentalDto.getStatus() == OrderStatus.CHECK) {
                            rentalDto.setStatus(OrderStatus.PROCESSING);
                            rentalService.update(rentalDto);
                        }
                        model.addAttribute("rental", rentalDto);
                    },
                    () -> model.addAttribute("order_not_found", true));
        }
        return ORDER_PROCESSING;
    }
}
