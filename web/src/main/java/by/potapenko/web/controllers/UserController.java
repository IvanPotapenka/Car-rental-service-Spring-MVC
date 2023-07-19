package by.potapenko.web.controllers;

import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.service.UserService;
import by.potapenko.web.util.PathUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CREATE_USER;
import static by.potapenko.web.util.PagesUtil.UPDATE_USER;
import static by.potapenko.web.util.PagesUtil.USERS;
import static by.potapenko.web.util.PagesUtil.USER_ADMIN;

@Controller
@RequestMapping(PathUtil.ADMIN)
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping(PathUtil.USERS)
    public String getUsersPage(Model model) {
        List<UserDto> users = userService.getByRoleUser();
        model.addAttribute("users", users);
        return USERS;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping("users/user/{id}")
    public String getUserPage(@PathVariable Long id, Model model) {
        userService.getById(id)
                .map(user -> model.addAttribute("uzer", user));
        return USER_ADMIN;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping("users/create_user")
    public String getCreateUserPage() {
        return CREATE_USER;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @PostMapping("users/create_user")
    public String createUser(UserCreationDto user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("create_user", false);
            return CREATE_USER;
        } else {
            userService.create(user);
            model.addAttribute("create_user", true);
            model.addAttribute("uzer", user);
            return USER_ADMIN;
        }
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @GetMapping("users/user/update_user/{id}")
    public String getUpdateUserPage(@PathVariable Long id, Model model) {
        return userService.getById(id)
                .map(user -> {
                    model.addAttribute("uzer", user);
                    return UPDATE_USER;
                })
                .orElse("redirect:/user/update_user?update_user=false");
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    @PostMapping("users/user/update_user/{id}")
    public String updateUser(@PathVariable Long id, UserDto user, Authentication authentication, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("update_user", false);
        } else {
            model.addAttribute("update_user", true);
//            model.addAttribute("user", userService.update(authentication, user).get());
        }
        return UPDATE_USER;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("users/user/delete_user/{id}")
    public String deleteUser(@PathVariable Long id, Model model) {
        model.addAttribute("user_delete_success", true);
        userService.deleteById(id);
        return USERS;
    }
}
