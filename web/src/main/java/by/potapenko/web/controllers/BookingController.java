package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarDto;
import by.potapenko.database.dto.ClientCreationDto;
import by.potapenko.database.dto.DocumentDto;
import by.potapenko.database.dto.RentalDto;
import by.potapenko.service.CarService;
import by.potapenko.service.ClientService;
import by.potapenko.service.RentalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Objects;

import static by.potapenko.web.util.PagesUtil.BOOKING;
import static by.potapenko.web.util.PagesUtil.CLIENT_ORDER;
import static by.potapenko.web.util.PagesUtil.ORDER;

@Controller
@SessionAttributes({"rental", "car"})
@RequiredArgsConstructor
public class BookingController {

    private final ClientService clientService;
    private final CarService carService;
    private final RentalService rentalService;

    @GetMapping("booking")
    public String getBookingPage(RentalDto rentalDto, Model model) {
        model.addAttribute("rental", rentalService
                .getCountDaysAndPriceRental(rentalDto,
                        (CarDto) Objects.requireNonNull(model.getAttribute("car"))));
        return BOOKING;
    }

    @PostMapping("booking")
    public String booking(ClientCreationDto clientDto, DocumentDto documentDto, Model model, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("create_rental", false);
        } else {
            RentalDto rental = (RentalDto) model.getAttribute("rental");
            Objects.requireNonNull(rental).setCarDto((CarDto) model.getAttribute("car"));
            rental.setClientDto(clientService.create(clientDto, documentDto));
            model.addAttribute("rental", rental);
            model.addAttribute(model.addAttribute("create_rental", true));
        }
        return CLIENT_ORDER;
    }

    @GetMapping("order/{id}")
    public String getOrderPage(@PathVariable Long id, Model model) {
        carService.getById(id).map(carDto -> model.addAttribute("car", carDto));
        return ORDER;
    }
}
