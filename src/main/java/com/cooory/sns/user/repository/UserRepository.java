package com.cooory.sns.user.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cooory.sns.user.domain.User;

public interface UserRepository extends JpaRepository<User,Integer> {
	
	// 

	// SELECT count(1) .... WHERE `email` = #{loginId};
	public int countByEmail(String email);
	
	// WHERE `loginId` == ?? AND `password` == ??
	public Optional <User> findByEmailAndPassword(String email, String password);
}
