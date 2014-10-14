package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Message;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Repository.InboxRepository;
import com.admin.portal.Repository.MessageFolderRepository;
import com.admin.portal.Repository.MessageRepository;

@Service
@Transactional
public class InboxServiceImpl implements InboxService {


	@Autowired
	InboxRepository inboxRepository;
	
	@Autowired
	MessageFolderRepository  messageFolderRepository;
	
	@Autowired
	MessageRepository  messageRepository;
	
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

	@Override
	public List<MessageFolder> getSendItems(Integer userId, String email) {
		// TODO Auto-generated method stub
		return messageFolderRepository.findByIdSendItems(userId,email);
	}

	/*@Override
	public Message getMessageDetails(Integer id) {
		// TODO Auto-generated method stub
		return messageRepository.findByMessageFolderId(id);
	}*/

}
