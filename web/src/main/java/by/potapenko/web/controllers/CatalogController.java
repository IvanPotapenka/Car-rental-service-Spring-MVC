package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarDto;
import by.potapenko.database.dto.CarFilter;
import by.potapenko.service.CarService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CAR_USER;
import static by.potapenko.web.util.PagesUtil.CATALOG;
import static by.potapenko.web.util.PagesUtil.CATALOG_FILTER;

@Controller
@RequestMapping("catalog")
@SessionAttributes("car")
@RequiredArgsConstructor
public class CatalogController {

    private final CarService carService;

    @GetMapping
    public String getCatalogPage(Model model) {
        List<CarDto> cars = carService.getAll();
        if (cars.isEmpty()) {
            model.addAttribute("find_car_error", true);
        } else {
            model.addAttribute("find_car_error", false);
            model.addAttribute("cars", cars);
        }
        return CATALOG;
    }

    @GetMapping("car/{id}")
    public String getCarPage(@PathVariable Long id, Model model) {
        return carService.getById(id).
                map(car -> {
                    model.addAttribute("car", car);
                    return CAR_USER;
                }).orElse("redirect:/car");
    }

    @GetMapping("filter")
    public String getFilterCarPage(Model model, CarFilter filter, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("find_car_error", true);
        } else {
            model.addAttribute("cars", carService.getByFilter(filter));
            model.addAttribute("find_car_error", false);
        }
        return CATALOG_FILTER;
    }
}
