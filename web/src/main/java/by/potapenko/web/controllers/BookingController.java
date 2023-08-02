package by.potapenko.web.controllers;

import by.potapenko.database.dto.RentalDto;
import by.potapenko.database.dto.RequestDto;
import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.database.entity.enam.CarStatus;
import by.potapenko.database.entity.enam.OrderState;
import by.potapenko.database.entity.enam.UserRole;
import by.potapenko.service.CarService;
import by.potapenko.service.RentalService;
import by.potapenko.service.RequestService;
import by.potapenko.service.UserService;
import by.potapenko.web.util.AuthenticationUtil;
import by.potapenko.web.util.PagesUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import static by.potapenko.web.util.PagesUtil.BOOKING;
import static by.potapenko.web.util.PagesUtil.CLIENT_ORDER;
import static by.potapenko.web.util.PagesUtil.ORDER;
import static by.potapenko.web.util.PathUtil.BOOKING_ERROR;

@Controller
@SessionAttributes("rental")
@RequiredArgsConstructor
public class BookingController {

    private final UserService userService;
    private final CarService carService;
    private final RentalService rentalService;

    private final RequestService requestService;

    @GetMapping("booking")
    public String getBookingPage(Long carId, RentalDto rentalDto, Model model, Authentication authentication) {
        carService.getById(carId).ifPresentOrElse(car -> {
                    if (car.getStatus() == CarStatus.FREE) {
                        rentalDto.setCarDto(car);
                        model.addAttribute("rental", rentalService.getCountDaysAndPriceRental(rentalDto));
                    } else {
                        model.addAttribute("car_status_error", true);
                    }
                    model.addAttribute("car", car);
                },
                () -> model.addAttribute("car_not_found", true));
        if (authentication != null) {
            userService.getById(AuthenticationUtil.getUserDetails()
                    .getId()).ifPresent(user -> model.addAttribute("uzer", user));
        }
        return BOOKING;
    }

    @PostMapping("booking")
    public String booking(UserDto userDto, UserCreationDto userCreationDto,
                          Model model, Authentication authentication) {
        RentalDto rental = (RentalDto) model.getAttribute("rental");
        if (rental == null) {
            model.addAttribute("create_rental", false);
        } else {
            if (authentication != null) {
                userService.update(AuthenticationUtil.getUserDetails().getId(), userDto)
                        .ifPresent(rental::setUserDto);
                rental.setCreator(AuthenticationUtil.getUserDetails().getRole().name());
            } else if (userService.getByEmail(userDto.getEmail()).isPresent()) {
                return "redirect:" + BOOKING_ERROR;
            } else {
                userService.create(userCreationDto).ifPresent(rental::setUserDto);
                rental.setCreator(UserRole.GUEST.name());
            }
            rental.setState(OrderState.PASSIVE);
            rental.getCarDto().setStatus(CarStatus.BOOKED);
            carService.update(rental.getCarDto().getId(), rental.getCarDto());
            rental.setId(rentalService.create(rental));
            model.addAttribute("rental", rental);
            model.addAttribute(model.addAttribute("create_rental", true));
        }
        return CLIENT_ORDER;
    }

    @GetMapping("order/{id}")
    public String getOrderPage(@PathVariable Long id, Model model) {
        carService.getById(id).ifPresentOrElse(carDto -> model.addAttribute("car", carDto),
                () -> model.addAttribute("car_not_found", true));
        return ORDER;
    }

    @PostMapping("quickly-order")
    public String getQuicklyOrderPage(RequestDto requestDto) {
        if (requestService.getByPhone(requestDto.getPhone()).isEmpty()) {
            requestService.create(requestDto);
            return "redirect:/catalog#true";
        } else {
            return "redirect:/catalog#false";
        }
    }

    @GetMapping("booking/error")
    public String getBookingErrorPage() {
        return PagesUtil.BOOKING_ERROR;
    }
}
