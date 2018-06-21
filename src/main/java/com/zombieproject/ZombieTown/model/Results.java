package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

//This can be made into an empty class
@JsonIgnoreProperties(ignoreUnknown = true)
public class Results {

	private String[] types;
	private String name;
	private Geometry geometry;
	@JsonProperty("place_id")
	private String placeId;

	public Results() {

	}

	public Results(String[] types, String name, Geometry geometry, String placeId) {
		super();
		this.types = types;
		this.name = name;
		this.geometry = geometry;
		this.placeId = placeId;
	}

	public String[] getTypes() {
		return types;
	}

	public void setTypes(String[] types) {
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

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	@Override
	public String toString() {
		return "Results [types=" + Arrays.toString(types) + ", name=" + name + ", geometry=" + geometry + ", placeId="
				+ placeId + "]";
	}

}
