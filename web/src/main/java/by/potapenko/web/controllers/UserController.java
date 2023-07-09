package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.database.dto.UserUpdateDto;
import by.potapenko.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.ADMIN;
import static by.potapenko.web.util.PagesUtil.CREATE_USER;
import static by.potapenko.web.util.PagesUtil.UPDATE_USER;
import static by.potapenko.web.util.PagesUtil.USERS;
import static by.potapenko.web.util.PagesUtil.USER_ADMIN;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping
    public String getAdminPage() {
        return ADMIN;
    }

    @GetMapping("users")
    public String getUsersPage(Model model) {
        CarFilter filter = CarFilter.builder().build();
        model.addAttribute("limit", filter.getLimit());
        model.addAttribute("page", filter.getPage());
        model.addAttribute("count", userService.getCount(Double.valueOf(filter.getLimit())));

        List<UserDto> users = userService.getAll();
        model.addAttribute("users", users);
        return USERS;
    }

    @GetMapping("users/user/{id}")
    public String getUserPage(@PathVariable Long id, Model model) {
        userService.getById(id)
                .map(user -> model.addAttribute("user", user));
        return USER_ADMIN;
    }

    @GetMapping("users/create_user")
    public String getCreateUserPage() {
        return CREATE_USER;
    }

    @PostMapping("users/create_user")
    public String createCar(UserCreationDto user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("create_user", false);
            return CREATE_USER;
        } else {
            model.addAttribute("create_user", true);
            model.addAttribute("user", user);
            userService.create(user);
            return USER_ADMIN;
        }
    }

    @GetMapping("users/user/update_user/{id}")
    public String getUpdateUserPage(@PathVariable Long id, Model model) {
        return userService.getById(id)
                .map(user -> {
                    model.addAttribute("user", user);
                    return UPDATE_USER;
                })
                .orElse("redirect:/user/update_user?update_user=false");
    }

    @PostMapping("users/user/update_user/{id}")
    public String updateUser(@PathVariable Long id, UserUpdateDto user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("update_user", false);
        } else {
            model.addAttribute("update_user", true);
            model.addAttribute("user", userService.update(id, user).get());
        }
        return UPDATE_USER;
    }

    @GetMapping("users/user/delete_user/{id}")
    public String deleteUser(@PathVariable Long id, Model model) {
        model.addAttribute("user_delete_success", true);
        userService.deleteById(id);
        return USERS;
    }

}
