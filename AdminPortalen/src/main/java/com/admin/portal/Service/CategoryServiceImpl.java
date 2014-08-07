package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Category;
import com.admin.portal.Repository.CategoryRepository;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;

	@Override
	public List<Category> getCategoryList() {
		return categoryRepository.findAll();
	}

	@Override
	public Category getCategoryById(Integer cId) {
		return categoryRepository.findOne(cId);
	}

	@Override
	public void deleteCategoryById(Integer cId) {
		categoryRepository.delete(cId);
	}

	@Override
	public void saveCategory(Category category) {
		categoryRepository.save(category);		
	}
	
}
