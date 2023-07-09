package by.potapenko.web.controllers;

import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.dto.ClientDto;
import by.potapenko.database.dto.ClientUpdateDto;
import by.potapenko.service.ClientService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.CLIENTS;
import static by.potapenko.web.util.PagesUtil.CLIENT_ADMIN;
import static by.potapenko.web.util.PagesUtil.UPDATE_CLIENT;

@Controller
@RequestMapping("admin/clients")
@RequiredArgsConstructor
public class ClientController {
    private final ClientService clientService;

    @GetMapping
    public String getClientsPage(Model model) {
        CarFilter filter = CarFilter.builder().build();
        model.addAttribute("limit", filter.getLimit());
        model.addAttribute("page", filter.getPage());
        model.addAttribute("count", clientService.getCount(Double.valueOf(filter.getLimit())));
        List<ClientDto> client = clientService.getAll();
        model.addAttribute("clients", client);
        return CLIENTS;
    }

    @GetMapping("client/{id}")
    public String getClientPage(@PathVariable Long id, Model model) {
        model.addAttribute("client", clientService.getById(id).get());
        return CLIENT_ADMIN;
    }

    @GetMapping("client/update_client/{id}")
    public String getUpdateClientPage(@PathVariable Long id, Model model) {
        return clientService.getById(id)
                .map(client -> {
                    model.addAttribute("client", client);
                    return UPDATE_CLIENT;
                })
                .orElse("redirect:/client/update_client?error=false");
    }

    @GetMapping("client/delete_client/{id}")
    public String getDeleteClientPage(@PathVariable Long id, Model model) {
        model.addAttribute("client_delete_success", true);
        clientService.deleteById(id);
        return CLIENTS;
    }

    @PostMapping("client/update_client/{id}")
    public String updateClient(@PathVariable Long id, ClientUpdateDto client, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("update_client", false);
        } else {
            model.addAttribute("update_client", true);
            model.addAttribute("client", clientService.update(id, client).get());
        }
        return UPDATE_CLIENT;
    }
}
