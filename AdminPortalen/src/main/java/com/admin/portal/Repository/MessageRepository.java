package com.admin.portal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.admin.portal.Model.Message;

public interface MessageRepository  extends JpaRepository<Message, Integer>{
	/*
	 @Query("SELECT p FROM Message p  WHERE p.messageFolders.id =:id")
	public  Message findByMessageFolderId(@Param("id") Integer id) ;*/

}
