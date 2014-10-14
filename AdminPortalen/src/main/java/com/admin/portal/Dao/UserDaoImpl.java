package com.admin.portal.Dao;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.admin.portal.Common.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@PersistenceContext
	protected EntityManager entityManager;

	@Override
	public List<UserDto> countNewRegisteredCustomersDaily() {
		
		String SQL_QUERY= "select count(user_id),createdDate from users group by DATE_FORMAT(createdDate,'%Y-%m-%d-')";
		
		Query sqlQuery =  (Query) entityManager.createNativeQuery(SQL_QUERY);
		
		@SuppressWarnings("unchecked")
		List<Object[]> params = sqlQuery.getResultList();
		List<UserDto> map = new ArrayList<UserDto>();
		
		for(Object[] object : params){
			System.err.println(object[0]+"    "+object[1]);
			UserDto pt=new UserDto();
			pt.setCustomers((BigInteger)object[0]);
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd"); 
			pt.setDate(dateFormat.format(object[1]));
			map.add(pt);
		}
		
		return map;
	}

	
	
	

}
