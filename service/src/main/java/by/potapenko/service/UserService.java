package by.potapenko.service;

import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.database.dto.UserPresentDto;
import by.potapenko.database.entity.UserEntity;
import by.potapenko.database.entity.enam.UserRole;
import by.potapenko.database.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;

    public Optional<UserDto> create(UserCreationDto user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        UserEntity newUser = modelMapper.map(user, UserEntity.class);
        return Optional.of(convertToUserDto(userRepository.save(newUser)));
    }


    public Optional<UserDto> update(Long id, UserDto update) {
        Optional<UserEntity> existUser = userRepository.findById(id);
        if (existUser.isPresent()) {
            UserEntity user = existUser.get();
            modelMapper.map(update, user);
            return Optional.of(convertToUserDto(userRepository.save(user)));
        }
        return Optional.empty();
    }

    @Transactional(readOnly = true)
    public List<UserPresentDto> getByRoleUser() {
        return userRepository.findByRole(UserRole.USER)
                .stream()
                .map(this::convertToUserPresentDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<UserPresentDto> getByRoleManager() {
        return userRepository.findByRole(UserRole.MANAGER)
                .stream()
                .map(this::convertToUserPresentDto)
                .toList();
    }

    @PreAuthorize("hasAnyAuthority('ADMIN', 'MANAGER')")
    public void deleteById(Long id) {
        userRepository.findById(id).ifPresent(userRepository::delete);
    }

    @Transactional(readOnly = true)
    public Optional<UserPresentDto> getById(Long id) {
        return userRepository.findById(id)
                .map(this::convertToUserPresentDto);
    }

    @Transactional(readOnly = true)
    public Optional<UserPresentDto> getByEmail(String email) {
        Optional<UserEntity> user = userRepository.findByContactEmail(email);
        if (user.isPresent()) {
            UserEntity userEntity = user.get();
            return Optional.of(convertToUserPresentDto(userEntity));
        }
        return Optional.empty();
    }

    public void updateResetPasswordToken(String token, String email) {
        Optional<UserEntity> user = userRepository.findByContactEmail(email);
        if (user.isPresent()) {
            UserEntity userEntity = user.get();
            userEntity.setResetPasswordToken(token);
            userRepository.save(userEntity);
        }
    }

    @Transactional(readOnly = true)
    public List<UserEntity> getByResetPasswordToken(String token) {
        return userRepository.findByResetPasswordToken(token);
    }

    public void updatePassword(String password, String token) {
        UserEntity user = userRepository.findByResetPasswordToken(token).stream().findFirst().get();
        user.setPassword(passwordEncoder.encode(password));
        user.setResetPasswordToken(null);
        userRepository.save(user);
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(userRepository.count() / limit);
    }

    private UserPresentDto convertToUserPresentDto(UserEntity user) {
        return modelMapper.map(user, UserPresentDto.class);
    }

    private UserDto convertToUserDto(UserEntity user) {
        return modelMapper.map(user, UserDto.class);
    }
}

