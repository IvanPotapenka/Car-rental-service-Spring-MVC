package by.potapenko.web.util;

import by.potapenko.database.dto.CustomUserDetails;
import lombok.experimental.UtilityClass;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

@UtilityClass
public class AuthenticationUtil {

    public CustomUserDetails getUserDetails() {
        return (CustomUserDetails) Optional.ofNullable(SecurityContextHolder
                        .getContext().getAuthentication())
                .map(Authentication::getPrincipal)
                .filter(principal -> (principal instanceof CustomUserDetails))
                .orElse(null);
    }
}
