 package com.cooory.sns.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cooory.sns.common.EncryptUtils;
import com.cooory.sns.user.domain.User;
import com.cooory.sns.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	public User getUser(String email, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = userRepository.findByEmailAndPassword(email, encryptPassword).orElse(null);
		
		return user;
	}
	
	
	public boolean isDuplicatedEmail(String email) {
		
		int count = userRepository.countByEmail(email);
		
		if (count == 0) {
			
			return false;
		} else {
			
			return true;
		}
	}
	

	public User addUser(
			String email
			, String password
			, String name
			, String userName
			, String phoneNumber
			, String gender
			, String birth
			, String introduce) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.email(email)
						.password(encryptPassword)
						.name(name)
						.userName(userName)
						.phoneNumber(phoneNumber)
						.gender(gender)
						.birth(birth)
						.introduce(introduce)
						.build();
		
		return userRepository.save(user);
		
	}
}
