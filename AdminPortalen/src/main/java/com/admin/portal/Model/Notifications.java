package com.admin.portal.Model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "NOTIFICATIONS")
public class Notifications implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private Integer ntId;
	private User user;
	private String notifactionMsg;
	private Date ntDate;
	
	private String senderEmail;
	private String receiverEmail;
	private String checkMsg;
	
	public Notifications() {
	}

	public Notifications(User user, String notifactionMsg, Date ntDate) {
		this.user = user;
		this.notifactionMsg = notifactionMsg;
		this.ntDate = ntDate;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NT_ID")
	public Integer getNtId() {
		return this.ntId;
	}

	public void setNtId(Integer ntId) {
		this.ntId = ntId;
	}
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "NOTIFACTION_MSG")
	public String getNotifactionMsg() {
		return this.notifactionMsg;
	}

	public void setNotifactionMsg(String notifactionMsg) {
		this.notifactionMsg = notifactionMsg;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "NT_DATE")
	public Date getNtDate() {
		return this.ntDate;
	}

	public void setNtDate(Date ntDate) {
		this.ntDate = ntDate;
	}
	@Column(name = "senderEmail")
	public String getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	@Column(name = "receiverEmail")
	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	@Column(name="checkMsg")
	public String getCheckMsg() {
		return checkMsg;
	}
	public void setCheckMsg(String checkMsg) {
		this.checkMsg = checkMsg;
	}
}
