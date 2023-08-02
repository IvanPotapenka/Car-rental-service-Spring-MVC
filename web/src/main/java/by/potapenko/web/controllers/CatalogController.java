package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarDto;
import by.potapenko.database.dto.CarFilter;
import by.potapenko.service.CarService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CAR_USER;
import static by.potapenko.web.util.PagesUtil.CATALOG;

@Controller
@RequestMapping("catalog")
@RequiredArgsConstructor
public class CatalogController {

    private final CarService carService;

    @GetMapping()
    public String getCatalogPage(Model model, String sort, CarFilter filter) {
        List<CarDto> cars = "ASC".equals(sort) ? carService.getAllSortByPriceAsc() : carService.getAllSortByPriceDesc();
        if (filter.getType() != null || filter.getFuelType() != null || filter.getBrand() != null || filter.getTransmission() != null) {
            cars = carService.getByFilter(filter);
        }
        model.addAttribute("cars", cars);
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
}
