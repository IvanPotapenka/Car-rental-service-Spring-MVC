package by.potapenko.web.controllers;

import by.potapenko.database.dto.UserPresentDto;
import by.potapenko.service.UserService;
import by.potapenko.web.util.PathUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.MANAGERS;
import static by.potapenko.web.util.PathUtil.ADMIN;

@Controller
@RequestMapping(ADMIN)
@PreAuthorize("hasAuthority('ADMIN')")
@RequiredArgsConstructor
public class ManagerController {

    private final UserService userService;

    @GetMapping(PathUtil.MANAGERS)
    public String getUsersPage(Model model) {
        List<UserPresentDto> managers = userService.getByRoleManager();
        model.addAttribute("managers", managers);
        return MANAGERS;
    }
}
