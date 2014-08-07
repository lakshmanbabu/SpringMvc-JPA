package com.admin.portal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.admin.portal.Model.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
