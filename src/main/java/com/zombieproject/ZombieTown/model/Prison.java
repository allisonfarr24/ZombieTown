package com.zombieproject.ZombieTown.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Prison {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String latitude;
	private String longitude;
	
	public Prison() {
		
	}

	public Prison(int id, String latitude, String longitude) {
		super();
		this.id = id;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "Prison [id=" + id + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
	

}
