package com.admin.portal.Model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;


@Entity
@Table(name = "MESSAGE")
@Cacheable
public class Message implements Serializable {


	private static final long serialVersionUID = 1L;
	
	private Integer messageId;
	private String subject;
	private String body;
	private Date sentDateTime;
	private String senderEmail;
	private String receiverEmail;
	private Set<MessageFolder> messageFolders = new HashSet<MessageFolder>(0);

	public Message() {
	}

	public Message(String subject, String body, Date sentDateTime,
			Date readDateTime, String inReplyToMessageId,
			Set<MessageFolder> messageFolders,String senderEmail) {
		this.subject = subject;
		this.body = body;
		this.sentDateTime = sentDateTime;
		this.messageFolders = messageFolders;
		this.senderEmail=senderEmail;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Message_Id")
	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	@Column(name = "Subject")
	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(name = "Body")
	public String getBody() {
		return this.body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	
	@Column(name = "Sent_Date_Time")
	public Date getSentDateTime() {
		
		return this.sentDateTime;
	}

	public void setSentDateTime(Date sentDateTime) {
		this.sentDateTime = sentDateTime;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "message",cascade=CascadeType.ALL)
	public Set<MessageFolder> getMessageFolders() {
		return this.messageFolders;
	}

	public void setMessageFolders(Set<MessageFolder> messageFolders) {
		this.messageFolders = messageFolders;
	}
	
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	
	@Column(name = "SenderEmail")
	public String getSenderEmail() {
		return senderEmail;
	}

	@Transient
	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	
}
