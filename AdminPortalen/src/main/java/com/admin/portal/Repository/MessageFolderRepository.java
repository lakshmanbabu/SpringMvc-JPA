package com.admin.portal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.admin.portal.Model.MessageFolder;

public interface MessageFolderRepository extends JpaRepository<MessageFolder, Integer> {

	@Query("SELECT p FROM MessageFolder p  WHERE p.user.userId =:userId and p.receiverEmail=:email")
	public List<MessageFolder> findByUserId(@Param("userId")Integer userId,@Param("email") String email);

	@Query("SELECT p FROM MessageFolder p  WHERE p.user.userId =:userId and ( p.status=0 and  p.receiverEmail=:email )")
	public List<MessageFolder> findByUserIdStatusZero(@Param("userId")Integer userId,@Param("email") String email);
	
	@Query("SELECT p FROM MessageFolder p  WHERE p.user.userId =:userId and p.senderEmail=:email")
	public List<MessageFolder> findByIdSendItems(@Param("userId")Integer userId,@Param("email") String email);

}
