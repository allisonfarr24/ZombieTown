package com.zombieproject.ZombieTown.userdata;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDataRepo extends JpaRepository<UserData, Integer> {
	
	List<UserData> findByType(String type);

}
