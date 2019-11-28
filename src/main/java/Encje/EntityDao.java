package Encje;

import org.hibernate.Session;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import java.util.Collection;

public class EntityDao<T> {
    @PersistenceContext
    private EntityManager entityManager;
    private Class<T> clazz;

    public EntityDao(Class<T> clazz) {
        this.clazz = clazz;
    }

    @Transactional
    public void save(T entity){
        entityManager.persist(entity);
    }
    @Transactional
    public void delete(T entity){
        entity = entityManager.merge(entity);
        entityManager.remove(entity);
    }
    @Transactional
    public void upgrade(T entity){
        entityManager.merge(entity);
    }
    public T findById(int id){
        return entityManager.find(clazz,id);
    }





    public Collection<T> findAll(){
        Session session = entityManager.unwrap(Session.class);
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> rootEntry = cq.from(clazz);
        CriteriaQuery<T> all = cq.select(rootEntry);
        TypedQuery<T> allQuery = session.createQuery(all);
        return allQuery.getResultList();
    }

}
