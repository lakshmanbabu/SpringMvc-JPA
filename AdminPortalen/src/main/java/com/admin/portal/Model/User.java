package com.admin.portal.Model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="users")
public class User implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String email;
	private String contactno;
	private String gender;
	private boolean enabled;
	private String city;
	private String country;
	private String state;
	private Date createdDate;
	private String userRole;
	private String category;
	private String imagePath;
	
	private Set<UserRoles> userRoles = new HashSet<UserRoles>(0);
	private Set<Notifications> notificationses = new HashSet<Notifications>(0);
	private Set<Article> articles = new HashSet<Article>(0);
	private Set<Promotions> promotions = new HashSet<Promotions>(0);
	private Set<MessageFolder> messageFolders = new HashSet<MessageFolder>(0);
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="userId")
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	@Column(name="Username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="Password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="Firstname")
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	@Column(name="Lastname")
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	@Column(name="email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="contactNo")
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	
	@Column(name="gender")
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Column(name="enabled")
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	@Column(name="city")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Column(name="country")
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	@Column(name="state")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Column(name="createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Column(name="userRole")
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user",cascade=CascadeType.ALL)
	public Set<UserRoles> getUserRoles() {
	return userRoles;
   }
	
	public void setUserRoles(Set<UserRoles> role) {
		this.userRoles = (Set<UserRoles>) role;
	}
	
	@Column(name="category")
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name="imagePath")
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Notifications> getNotificationses() {
		return this.notificationses;
	}

	public void setNotificationses(Set<Notifications> notificationses) {
		this.notificationses = notificationses;
	}
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Article> getArticles() {
		return articles;
	}
	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Promotions> getPromotions() {
		return promotions;
	}
	public void setPromotions(Set<Promotions> promotions) {
		this.promotions = promotions;
	}
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<MessageFolder> getMessageFolders() {
		return messageFolders;
	}
	public void setMessageFolders(Set<MessageFolder> messageFolders) {
		this.messageFolders = messageFolders;
	}
	
	
}
