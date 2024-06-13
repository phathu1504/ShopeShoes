package dao;

import java.util.List;
import javax.persistence.TypedQuery;
import model.Product;
import utils.JpaUtil;

public class ProductDao {

    public List<Product> findAll() {
        TypedQuery<Product> query = JpaUtil.getEntityManager().createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }

    public List<Product> findAllByMadm(String madm) {
        TypedQuery<Product> query = JpaUtil.getEntityManager().createQuery("SELECT p FROM Product p WHERE p.danhmuc.madm = :madm", Product.class);
        query.setParameter("madm", madm);
        return query.getResultList();
    }

    public Product findByMaSP(String maSP) {
        TypedQuery<Product> query = JpaUtil.getEntityManager().createQuery("SELECT p FROM Product p WHERE p.masp = :maSP", Product.class);
        query.setParameter("maSP", maSP);
        List<Product> result = query.getResultList();
        return result.isEmpty() ? null : result.get(0);
    }
    
    
    
}
