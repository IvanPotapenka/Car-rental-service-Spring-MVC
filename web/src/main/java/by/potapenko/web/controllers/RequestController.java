package by.potapenko.web.controllers;

import by.potapenko.database.dto.RequestDto;
import by.potapenko.database.entity.enam.RequestStatus;
import by.potapenko.service.RequestService;
import by.potapenko.web.util.PathUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static by.potapenko.web.util.PagesUtil.REQUESTS;
import static by.potapenko.web.util.PagesUtil.REQUEST_PROCESSING;

@Controller
@RequestMapping(PathUtil.ADMIN)
@PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
@RequiredArgsConstructor
public class RequestController {

    private final RequestService requestService;

    @GetMapping(PathUtil.REQUESTS)
    public String getRequestsPage(Model model) {
        List<RequestDto> requests = requestService.getAllSortByDate();
        model.addAttribute("requests", requests);
        return REQUESTS;
    }

    @GetMapping("requests/request-processing/{id}")
    public String getRequestProcessingPage(@PathVariable Long id, Model model) {
        if (id == null) {
            model.addAttribute("request_not_found", true);
        } else {
            requestService.getById(id).ifPresentOrElse(requestDto -> {
                        if (requestDto.getStatus() == RequestStatus.OPEN) {
                            requestDto.setStatus(RequestStatus.PROCESSING);
                            requestService.update(requestDto);
                        }
                        model.addAttribute("request", requestDto);
                    },
                    () -> model.addAttribute("request_not_found", true));
        }
        return REQUEST_PROCESSING;
    }

    @GetMapping("requests/request/delete_request/{id}")
    public String getDeleteRequestPage(@PathVariable Long id, Model model) {
        requestService.deleteById(id);
        model.addAttribute("request_delete_success", true);
        return REQUESTS;
    }

    @GetMapping("requests/request-processing/close/{id}")
    public String getRequestClosePage(@PathVariable Long id, Model model) {
        if (id == null) {
            model.addAttribute("request_not_found", true);
        } else {
            requestService.getById(id).ifPresentOrElse(requestDto -> {
                        if (requestDto.getStatus() == RequestStatus.PROCESSING) {
                            requestDto.setStatus(RequestStatus.CLOSED);
                            requestService.update(requestDto);
                        }
                        model.addAttribute("request", requestDto);
                    },
                    () -> model.addAttribute("request_not_found", true));
        }
        return REQUEST_PROCESSING;
    }

}
