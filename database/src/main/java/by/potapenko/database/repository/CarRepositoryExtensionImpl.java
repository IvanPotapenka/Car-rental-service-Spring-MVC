package by.potapenko.database.repository;

import by.potapenko.database.dto.CarFilter;
import by.potapenko.database.entity.CarEntity;
import by.potapenko.database.entity.CarEntity_;
import by.potapenko.database.entity.EngineCar_;
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
public class CarRepositoryExtensionImpl implements CarRepositoryExtension {
    @PersistenceContext
    private final EntityManager entityManager;

    public List<CarEntity> findByFilter(CarFilter filter) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<CarEntity> query = builder.createQuery(CarEntity.class);
        Root<CarEntity> carRoot = query.from(CarEntity.class);
        query.select(carRoot);
        query.where(collectPredicates(filter, builder, carRoot).toArray(Predicate[]::new));
        return entityManager.createQuery(query)
                .setMaxResults(filter.getLimit())
                .setFirstResult(filter.getPage())
                .getResultList();
    }

    private static List<Predicate> collectPredicates(CarFilter filter, CriteriaBuilder builder, Root<CarEntity> carRoot) {
        List<Predicate> predicates = new ArrayList<>();
        if (filter.getBrand() != null) {
            predicates.add(builder.equal(carRoot.get(CarEntity_.BRAND), filter.getBrand()));
        }
        if (filter.getType() != null) {
            predicates.add(builder.equal(carRoot.get(CarEntity_.TYPE), filter.getType()));
        }
        if (filter.getFuelType() != null) {
            predicates.add(builder.equal(carRoot.get(CarEntity_.ENGINE).get(EngineCar_.FUEL_TYPE), filter.getFuelType()));
        }
        if (filter.getTransmission() != null) {
            predicates.add(builder.equal(carRoot.get(CarEntity_.ENGINE).get(EngineCar_.TRANSMISSION), filter.getTransmission()));
        }
        return predicates;
    }
}
