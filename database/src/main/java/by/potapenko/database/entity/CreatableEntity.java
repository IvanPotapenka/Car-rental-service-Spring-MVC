package by.potapenko.database.entity;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@MappedSuperclass
public abstract class CreatableEntity<T extends Serializable> implements BaseIdEntity<T> {
    @CreationTimestamp
    @Column(name = "date_of_creation", nullable = false)
    private LocalDateTime dateOfCreation;
}
