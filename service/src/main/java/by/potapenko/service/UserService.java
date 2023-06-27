package by.potapenko.service;

import by.potapenko.database.dto.LoginAdminDto;
import by.potapenko.database.dto.LoginDto;
import by.potapenko.database.dto.UserCreationDto;
import by.potapenko.database.dto.UserDto;
import by.potapenko.database.dto.UserUpdateDto;
import by.potapenko.database.entity.UserEntity;
import by.potapenko.database.entity.enam.UserRole;
import by.potapenko.database.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    @Transactional
    public Optional<UserCreationDto> create(UserCreationDto user) {
        UserEntity newUser = modelMapper.map(user, UserEntity.class);
        newUser.setRole(UserRole.USER);
        newUser.setDateOfCreation(LocalDateTime.now());
        newUser.setId(userRepository.save(newUser).getId());
        return Optional.of(user);
    }

    @Transactional
    public Optional<UserDto> update(Long id, UserUpdateDto update) {
        Optional<UserEntity> existUser = userRepository.findById(id);
        if (existUser.isPresent()) {
            UserEntity user = existUser.get();
            modelMapper.map(update, user);
            return Optional.of(convertToUserDto(userRepository.save(user)));
        }
        return Optional.empty();
    }

    public List<UserDto> getAll() {
        return userRepository.findAll()
                .stream()
                .map(this::convertToUserDto)
                .toList();
    }

    @Transactional
    public void deleteById(Long id) {
        userRepository.findById(id).ifPresent(userRepository::delete);
    }

    public Optional<UserDto> getById(Long id) {
        return userRepository.findById(id)
                .map(this::convertToUserDto);
    }

    public Optional<UserDto> findByEmail(String email) {
        Optional<UserEntity> user = userRepository.findByEmail(email);
        if (user.isPresent()) {
            UserEntity userEntity = user.get();
            return Optional.of(convertToUserDto(userEntity));
        }
        return Optional.empty();
    }

    public Optional<UserDto> findByEmailAndPassword(LoginDto login) {
        Optional<UserEntity> user = userRepository.findByEmailAndPassword(login.email(), login.password());
        if (user.isPresent()) {
            UserEntity userEntity = user.get();
            return Optional.of(convertToUserDto(userEntity));
        }
        return Optional.empty();
    }

    public Optional<UserEntity> findByLoginAndPassword(LoginAdminDto loginAdmin) {
        return userRepository.findByLoginAndPassword(loginAdmin.login(), loginAdmin.password());
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(userRepository.count() / limit);
    }

    private UserDto convertToUserDto(UserEntity user) {
        return modelMapper.map(user, UserDto.class);
    }
}

