package dao;

import java.util.List;

import javax.persistence.TypedQuery;

import model.Category;

public class CategoryDao extends ConnectDao {

    public List<Category> findAll() {
        try {
            String sql = "SELECT o FROM Category o";
            TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
            return query.getResultList();
        } catch (Exception e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
            return null;
        }
    }

    public Category findByMaDM(String maDM) {
        try {
            String sql = "SELECT o FROM Category o WHERE o.madm = :maDM";
            TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
            query.setParameter("maDM", maDM);
            List<Category> result = query.getResultList();
            return result.isEmpty() ? null : result.get(0);
        } catch (Exception e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
            return null;
        }
    }
}
