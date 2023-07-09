package by.potapenko.service;

import by.potapenko.database.dto.CustomUserDetails;
import by.potapenko.database.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserDetailService implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByContactEmail(username)
                .map(user -> CustomUserDetails.builder()
                        .id(user.getId())
                        .fullName(user.getFullName())
                        .password(user.getPassword())
                        .username(user.getContact().getEmail())
                        .role(user.getRole())
                        .build())
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }
}
