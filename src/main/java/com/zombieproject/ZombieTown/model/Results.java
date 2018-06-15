package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Results {

	private String[] type;
	private String name;
	private Location location;

	public Results() {

	}

	public Results(String[] type, String name, Location location) {
		super();
		this.type = type;
		this.name = name;
		this.location = location;
	}

	public String[] getType() {
		return type;
	}

	public void setType(String[] type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Results [type=" + Arrays.toString(type) + ", name=" + name + ", location=" + location + "]";
	}

}
