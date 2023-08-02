package by.potapenko.service;

import by.potapenko.database.dto.RequestDto;
import by.potapenko.database.entity.RequestEntity;
import by.potapenko.database.repository.RequestRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class RequestService {

    private final RequestRepository requestRepository;

    private final ModelMapper modelMapper;


    public Long create(RequestDto requestDto) {
        return requestRepository.save(modelMapper.map(requestDto, RequestEntity.class)).getId();
    }

    @Transactional(readOnly = true)
    public Optional<RequestDto> getByPhone(String phone) {
        return requestRepository.findByPhone(phone)
                .map(this::convertToRequestDto);
    }

    @Transactional(readOnly = true)
    public List<RequestDto> getAllSortById() {
        return requestRepository.findAll(Sort.by(Sort.Direction.ASC, "id"))
                .stream()
                .map(this::convertToRequestDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<RequestDto> getAllSortByDate() {
        return requestRepository.findAll(Sort.by(Sort.Direction.ASC, "dateOfCreation"))
                .stream()
                .map(this::convertToRequestDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public Optional<RequestDto> getById(Long id) {
        return requestRepository.findById(id)
                .map(this::convertToRequestDto);
    }

    public Optional<RequestDto> update(RequestDto update) {
        return Optional.of(convertToRequestDto(requestRepository
                .save(modelMapper.map(update, RequestEntity.class))));
    }

    public void deleteById(Long id) {
        requestRepository.findById(id)
                .ifPresent(requestRepository::delete);
    }

    private RequestDto convertToRequestDto(RequestEntity request) {
        return modelMapper.map(request, RequestDto.class);
    }
}
