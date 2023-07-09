package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarDto;
import by.potapenko.service.CarService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CARS;
import static by.potapenko.web.util.PagesUtil.CAR_ADMIN;
import static by.potapenko.web.util.PagesUtil.CREATE_CAR;
import static by.potapenko.web.util.PagesUtil.UPDATE_CAR;

@Controller
@RequestMapping("admin/cars")
@RequiredArgsConstructor
public class CarController {

    private final CarService carService;

    @GetMapping
    public String getCarsPage(Model model) {
        List<CarDto> cars = carService.getAll();
        if (cars.isEmpty()) {
            model.addAttribute("find_car_error", true);
            return CAR_ADMIN;
        } else {
            model.addAttribute("cars", cars);
            return CARS;
        }
    }

    @GetMapping("car/{id}")
    public String getCarPage(@PathVariable Long id, Model model) {
        return carService.getById(id).
                map(car -> {
                    model.addAttribute("car", car);
                    model.addAttribute("car_id", true);
                    return CAR_ADMIN;
                }).orElse("redirect:/car");
    }

    @GetMapping("create_car")
    public String getCreateCarPage() {
        return CREATE_CAR;
    }

    @PostMapping("create_car")
    public String createCar(CarDto car, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("create_car", false);
            return CREATE_CAR;
        } else {
            model.addAttribute("create_car", true);
            model.addAttribute("car", car);
            car.setId(carService.create(car));
            return CAR_ADMIN;
        }
    }

    @GetMapping("car/update_car/{id}")
    public String getUpdateCarPage(@PathVariable Long id, Model model) {
        return carService.getById(id)
                .map(car -> {
                    model.addAttribute("car", car);
                    return UPDATE_CAR;
                })
                .orElse("redirect:/car/update_car?error=false");
    }

    @PostMapping("car/update_car/{id}")
    public String updateCar(@PathVariable Long id, CarDto car, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("update_car", false);
        } else {
            model.addAttribute("update_car", true);
            model.addAttribute("car", car);
            carService.update(id, car);
        }
        return UPDATE_CAR;
    }

    @GetMapping("car/delete_car/{id}")
    public String deleteCarPage(@PathVariable Long id, Model model) {
        model.addAttribute("car_delete_success", true);
        carService.deleteById(id);
        return CARS;
    }
}

