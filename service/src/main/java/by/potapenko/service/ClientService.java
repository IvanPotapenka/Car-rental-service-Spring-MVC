package by.potapenko.service;

import by.potapenko.database.dto.ClientCreationDto;
import by.potapenko.database.dto.ClientDto;
import by.potapenko.database.dto.ClientUpdateDto;
import by.potapenko.database.dto.DocumentDto;
import by.potapenko.database.entity.ClientEntity;
import by.potapenko.database.entity.DocumentEntity;
import by.potapenko.database.repository.ClientRepository;
import by.potapenko.database.repository.RentalRepository;
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
public class ClientService {
    private final ClientRepository clientRepository;
    private final RentalRepository rentalRepository;
    private final ModelMapper modelMapper;

    @Transactional
    public ClientDto create(ClientCreationDto clientDto, DocumentDto documentDto) {
        ClientEntity newClient = convertToClientEntity(clientDto);
        newClient.setDocument(modelMapper.map(documentDto, DocumentEntity.class));
        newClient.setDateOfCreation(LocalDateTime.now());
        ClientEntity save = clientRepository.save(newClient);
        return convertToClientDto(save);
    }

    public List<ClientDto> getAll() {
        return clientRepository.findAll()
                .stream()
                .map(this::convertToClientDto)
                .toList();
    }

    public Optional<ClientDto> getById(Long id) {
        return clientRepository.findById(id)
                .map(this::convertToClientDto);
    }

    @Transactional
    public Optional<ClientDto> update(Long id, ClientUpdateDto update) {
        Optional<ClientEntity> existedClient = clientRepository.findById(id);
        if (existedClient.isPresent()) {
            ClientEntity client = existedClient.get();
            modelMapper.map(update, client);
            return Optional.of(convertToClientDto(clientRepository.save(client)));
        }
        return Optional.empty();
    }

    @Transactional
    public void deleteById(Long id) {
        clientRepository.findById(id)
                .ifPresent(clientRepository::delete);
    }

    public Integer getCount(Double limit) {
        return (Integer) (int) Math.ceil(clientRepository.count() / limit);
    }

    private ClientDto convertToClientDto(ClientEntity client) {
        return modelMapper.map(client, ClientDto.class);
    }

    private ClientEntity convertToClientEntity(ClientCreationDto client) {
        return modelMapper.map(client, ClientEntity.class);
    }
}

