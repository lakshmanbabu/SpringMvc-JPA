package com.admin.portal.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Message;
import com.admin.portal.Repository.InboxRepository;

@Service
@Transactional
public class InboxServiceImpl implements InboxService {


	@Autowired
	InboxRepository inboxRepository;
	
	@Override
	public void saveMessage(Message localMessage) {
		inboxRepository.save(localMessage);
		
	}

}
