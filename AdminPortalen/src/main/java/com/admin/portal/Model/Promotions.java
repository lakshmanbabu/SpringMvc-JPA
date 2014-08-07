package com.admin.portal.Model;


import java.io.File;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="Promotions")
public class Promotions  implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer promotionId;
	private String title;
	private String type;
	private String promotValue;
	private String adLogoPath;
	private byte[] protomoteLogo;
	private Date createdDate;
	private User user;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="promotionId")
	public Integer getPromotionId() {
		return promotionId;
	}
	public void setPromotionId(Integer promotionId) {
		this.promotionId = promotionId;
	}
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name="promotValue")
	public String getPromotValue() {
		return promotValue;
	}
	public void setPromotValue(String promotValue) {
		this.promotValue = promotValue;
	}
	@Column(name="adLogoPath")
	public String getAdLogoPath() {
		return adLogoPath;
	}
	public void setAdLogoPath(String adLogoPath) {
		this.adLogoPath = adLogoPath;
	}
	@Lob
	@Column(name="protomoteLogo")
	public byte[] getProtomoteLogo() {
		return protomoteLogo;
	}
	public void setProtomoteLogo(byte[] protomoteLogo) {
		this.protomoteLogo = protomoteLogo;
	}
	@Column(name="createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	private File photo;
    @Transient
	public File getPhoto() {
		return photo;
	}
	public void setPhoto(File photo) {
		this.photo = photo;
	}
	
	
	
	
	
}
