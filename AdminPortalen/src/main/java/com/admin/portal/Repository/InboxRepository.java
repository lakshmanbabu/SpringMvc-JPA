package com.admin.portal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.admin.portal.Model.Message;

public interface InboxRepository extends JpaRepository<Message, Integer>{

}
