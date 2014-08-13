package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Message;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Model.User;
import com.admin.portal.Repository.InboxRepository;
import com.admin.portal.Repository.MessageFolderRepository;

@Service
@Transactional
public class InboxServiceImpl implements InboxService {


	@Autowired
	InboxRepository inboxRepository;
	
	@Autowired
	MessageFolderRepository  messageFolderRepository;
	
	@Override
	public void saveMessage(Message localMessage) {
		inboxRepository.save(localMessage);
		
	}

	@Override
	public List<MessageFolder> getMessageFolderList(Integer userId,String email) {
		return messageFolderRepository.findByUserId(userId,email);
	}

	@Override
	public MessageFolder getMessageFolderDetail(Integer messageId) {
		return messageFolderRepository.findOne(messageId);
	}


	@Override
	public List<MessageFolder> getMessageFolderListSize(Integer userId,String email) {
		return messageFolderRepository.findByUserIdStatusZero(userId,email);
	}

}
