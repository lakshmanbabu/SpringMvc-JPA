package com.admin.portal.Service;

import java.util.List;

import com.admin.portal.Model.Message;
import com.admin.portal.Model.MessageFolder;

public interface InboxService {

	public void saveMessage(Message localMessage);

	public List<MessageFolder> getMessageFolderList(Integer userId, String email);

	public MessageFolder getMessageFolderDetail(Integer messageId);

	//public void saveMessageFolder(MessageFolder folders);

	public List<MessageFolder> getMessageFolderListSize(Integer userId, String email);

	public List<MessageFolder> getSendItems(Integer userId, String email);

}
