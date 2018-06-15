package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Results {

	private String[] types;
	private String name;
	private Location location;

	public Results() {

	}

	public Results(String[] types, String name, Location location) {
		super();
		this.types = types;
		this.name = name;
		this.location = location;
	}

	public String[] getTypes() {
		return types;
	}

	public void setType(String[] types) {
		this.types = types;
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
		return "Results [types=" + Arrays.toString(types) + ", name=" + name + ", location=" + location + "]";
	}

}
