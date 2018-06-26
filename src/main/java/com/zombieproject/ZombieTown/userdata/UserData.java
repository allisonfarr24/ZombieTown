package com.zombieproject.ZombieTown.userdata;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="locations")
public class UserData {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	private String type;
	private String name;
	private String lat;
	private String lng;
	private String distance;
	
	public UserData() {
	}
	
	

	public UserData(String type, String name, String lat, String lng, String distance) {
		super();
		this.type = type;
		this.name = name;
		this.lat = lat;
		this.lng = lng;
		this.distance = distance;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}



	@Override
	public String toString() {
		return "UserData [id=" + id + ", type=" + type + ", name=" + name + ", lat=" + lat + ", lng=" + lng
				+ ", distance=" + distance + "]";
	}
	
	
	

}
