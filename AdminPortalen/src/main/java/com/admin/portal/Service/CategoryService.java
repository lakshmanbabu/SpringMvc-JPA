package com.admin.portal.Service;

import java.util.List;

import com.admin.portal.Model.Category;

public interface CategoryService {

	public List<Category> getCategoryList();

	public Category getCategoryById(Integer cId);

	public void deleteCategoryById(Integer cId);

	public void saveCategory(Category category);

}
