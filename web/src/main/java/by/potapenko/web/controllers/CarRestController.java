package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarDto;
import by.potapenko.service.CarService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static by.potapenko.web.util.PathUtil.API_CAR;

@RestController
@PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
@RequestMapping(API_CAR)
@RequiredArgsConstructor
public class CarRestController {

    private final CarService carService;

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping
    public ResponseEntity<List<CarDto>> getAll() {
        return ResponseEntity.ok(carService.getAll());
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping("{id}")
    public ResponseEntity<CarDto> getCar(@PathVariable Long id) {
        return carService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @PostMapping
    public ResponseEntity<Long> create(@RequestBody CarDto newCar) {
        return ResponseEntity.ok(carService.create(newCar));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @PutMapping("{id}")
    public ResponseEntity<CarDto> update(@PathVariable Long id, @RequestBody CarDto newCar) {
        return carService.update(id, newCar)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PreAuthorize(value = "hasAuthority('ADMIN')")
    @DeleteMapping("{id}")
    public ResponseEntity<Object> delete(@PathVariable Long id) {
        carService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
