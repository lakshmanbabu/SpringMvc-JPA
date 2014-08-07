package com.admin.portal.Dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{

	@PersistenceContext
	protected EntityManager entityManager;

	
	
	

}
