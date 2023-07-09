package by.potapenko.database.repository;

import by.potapenko.database.config.DataBaseConfig;
import by.potapenko.database.entity.ClientEntity;
import by.potapenko.database.entity.ContactClient;
import by.potapenko.database.entity.DocumentEntity;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = DataBaseConfig.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Sql("classpath:insert-data-client.sql")
class ClientRepositoryTest {
    @Autowired
    private ClientRepository clientRepository;

    @Test
    @Order(1)
    void whenFindAllInvoked_ThenAllTheClientsAreReturned() {
        String[] actual = clientRepository.findAll()
                .stream()
                .map(ClientEntity::getFirstName)
                .toArray(String[]::new);
        String[] expected = List.of("Ivan", "Anna", "Egor")
                .toArray(String[]::new);
        assertArrayEquals(expected, actual);
    }

    @Test
    @Order(2)
    void whenFindById_ThenAllTheFilteredReturnsValidClient() {
        Long id = 2L;
        Optional<ClientEntity> actual = clientRepository.findById(id);
        assertTrue(actual.isPresent());
        assertEquals("Ivan", actual.get().getFirstName());
    }

    @Test
    @Order(3)
    void whenCreatedInvokedWithClient_ThenClientIsSaved() {
        var clientTest = ClientEntity.builder()
                .firstName("Maksim")
                .lastName("Grishaev")
                .dateOfBirthday(LocalDate.parse("1981-12-02"))
                .contact(ContactClient.builder()
                        .phone("+375297659812")
                        .address("Gomel, Minskaia 18")
                        .build())
                .document(DocumentEntity.builder()
                        .passport("67547")
                        .driverLicense("347679")
                        .build())
                .build();
        clientRepository.save(clientTest);
        List<String> allName = clientRepository.findAll().stream()
                .map(ClientEntity::getFirstName)
                .toList();
        assertTrue(allName.contains(clientTest.getFirstName()));
    }

    @Test
    @Order(4)
    void whenDeleteById_ThenNotFindById() {
        Long id = 2L;
        Optional<ClientEntity> client = clientRepository.findById(id);
        clientRepository.deleteById(client.get().getId());
        Optional<ClientEntity> clientDeleted = clientRepository.findById(client.get().getId());
        assertTrue(clientDeleted.isEmpty());
    }

    @Test
    @Order(5)
    void whenUpdateById_ThenSavedClientUpdate() {
        Long id = 2L;
        Optional<ClientEntity> client = clientRepository.findById(id);
        client.get()
                .getContact()
                .setAddress("Gomel, Markelova, 26");
        clientRepository.save(client.get());
        assertEquals("Gomel, Markelova, 26", client.get().getContact().getAddress());
    }
}