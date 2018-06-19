package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
//This can be made into an empty class
@JsonIgnoreProperties(ignoreUnknown = true)
public class Results {

	private String[] types;
	private String name;
	private Geometry geometry;

	public Results() {

	}

	public Results(String[] types, String name, Geometry geometry) {
		super();
		this.types = types;
		this.name = name;
		this.geometry = geometry;
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

	public Geometry getGeometry() {
		return geometry;
	}

	public void setGeometry(Geometry geometry) {
		this.geometry = geometry;
	}

	@Override
	public String toString() {
		return "Results [types=" + Arrays.toString(types) + ", name=" + name + ", geometry=" + geometry + "]";
	}

}
