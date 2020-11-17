
package com.thuy.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.thuy.springboot.pojo.User;


public interface UserRepository extends JpaRepository<User, Long> {	
	
}

