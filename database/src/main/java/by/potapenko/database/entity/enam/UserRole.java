package by.potapenko.database.entity.enam;

import org.springframework.security.core.GrantedAuthority;

public enum UserRole implements GrantedAuthority {
    ADMIN, USER, GUEST, MANAGER;

    @Override
    public String getAuthority() {
        return name();
    }
}
