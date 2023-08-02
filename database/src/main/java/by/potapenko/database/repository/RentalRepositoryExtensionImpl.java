package by.potapenko.database.repository;

import by.potapenko.database.dto.RentalFilter;
import by.potapenko.database.entity.RentalEntity;
import by.potapenko.database.entity.RentalEntity_;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class RentalRepositoryExtensionImpl implements RentalRepositoryExtension {

    @PersistenceContext
    private final EntityManager entityManager;

    public List<RentalEntity> findByFilter(RentalFilter filter) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<RentalEntity> query = builder.createQuery(RentalEntity.class);
        Root<RentalEntity> rentalRoot = query.from(RentalEntity.class);
        query.select(rentalRoot);
        query.where(collectPredicates(filter, builder, rentalRoot).toArray(Predicate[]::new));
        return entityManager.createQuery(query)
                .setMaxResults(filter.getLimit())
                .setFirstResult(filter.getPage())
                .getResultList();
    }

    private static List<Predicate> collectPredicates(RentalFilter filter, CriteriaBuilder builder, Root<RentalEntity> rentalRoot) {
        List<Predicate> predicates = new ArrayList<>();
        if (filter.getStatus() != null) {
            predicates.add(builder.equal(rentalRoot.get(RentalEntity_.STATUS), filter.getStatus()));
        }
        if (filter.getState() != null) {
            predicates.add(builder.equal(rentalRoot.get(RentalEntity_.STATE), filter.getState()));
        }
        if (filter.getDateOfCreation() != null) {
            predicates.add(builder.equal(rentalRoot.get(RentalEntity_.DATE_OF_CREATION), filter.getDateOfCreation()));
        }
        return predicates;
    }
}
