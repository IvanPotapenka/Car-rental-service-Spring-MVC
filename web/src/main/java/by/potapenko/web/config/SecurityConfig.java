package by.potapenko.web.config;

import by.potapenko.database.entity.enam.UserRole;
import by.potapenko.service.UserDetailService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

import static by.potapenko.web.util.PathUtil.ADMIN;
import static by.potapenko.web.util.PathUtil.ADMIN_ALL;
import static by.potapenko.web.util.PathUtil.ADMIN_LOGIN;
import static by.potapenko.web.util.PathUtil.BOOKING;
import static by.potapenko.web.util.PathUtil.BOOKING_ERROR;
import static by.potapenko.web.util.PathUtil.CATALOG;
import static by.potapenko.web.util.PathUtil.HOME;
import static by.potapenko.web.util.PathUtil.LOGIN;
import static by.potapenko.web.util.PathUtil.LOGIN_ADMIN_ERROR;
import static by.potapenko.web.util.PathUtil.LOGIN_ERROR;
import static by.potapenko.web.util.PathUtil.LOGIN_POST;
import static by.potapenko.web.util.PathUtil.LOGIN_POST_ADMIN;
import static by.potapenko.web.util.PathUtil.LOGOUT;
import static by.potapenko.web.util.PathUtil.ORDER;
import static by.potapenko.web.util.PathUtil.PREFIX;
import static by.potapenko.web.util.PathUtil.QUICKLY_ORDER;
import static by.potapenko.web.util.PathUtil.RECOVER;
import static by.potapenko.web.util.PathUtil.REGISTRATION;
import static by.potapenko.web.util.PathUtil.RESET_PASSWORD;
import static by.potapenko.web.util.PathUtil.USER_ALL;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final UserDetailService userDetailService;

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailService);
        return authProvider;
    }

    @Bean
    public SecurityFilterChain filterChainUser(HttpSecurity http) throws Exception {
        return http.csrf(AbstractHttpConfigurer::disable)
                .securityMatcher(USER_ALL)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(PREFIX, LOGIN, HOME, CATALOG,
                                ORDER, BOOKING, BOOKING_ERROR, RESET_PASSWORD, QUICKLY_ORDER, REGISTRATION, RECOVER)
                        .permitAll()
                        .anyRequest()
                        .authenticated())

                .formLogin(login -> login.loginPage(LOGIN)
                        .loginProcessingUrl(LOGIN_POST)
                        .defaultSuccessUrl(HOME, true)
                        .failureUrl(LOGIN_ERROR))

                .logout(logout -> logout
                        .logoutUrl(LOGOUT)
                        .logoutSuccessUrl(LOGIN))

                .build();
    }

    @Configuration
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public static class SecurityConfigAdmin {
        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
            return http.csrf(AbstractHttpConfigurer::disable)
                    .securityMatcher(ADMIN_ALL)
                    .authorizeHttpRequests(auth -> auth
                            .requestMatchers(PREFIX, ADMIN_LOGIN).permitAll()
                            .anyRequest().hasAnyAuthority(UserRole.ADMIN.getAuthority(),
                            UserRole.MANAGER.getAuthority()))

                    .formLogin(login -> login.loginPage(ADMIN_LOGIN)
                            .loginProcessingUrl(LOGIN_POST_ADMIN)
                            .defaultSuccessUrl(ADMIN)
                            .failureUrl(LOGIN_ADMIN_ERROR))

                    .exceptionHandling(ex -> ex.accessDeniedPage(ADMIN))

                    .logout(logout -> logout
                            .logoutUrl(LOGOUT)
                            .logoutSuccessUrl(ADMIN_LOGIN)).build();
        }
    }

    @Bean
    public HandlerMappingIntrospector mvcHandlerMappingIntrospector() {
        return new HandlerMappingIntrospector();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}

