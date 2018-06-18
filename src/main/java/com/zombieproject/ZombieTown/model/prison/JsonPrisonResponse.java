package com.zombieproject.ZombieTown.model.prison;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonPrisonResponse {

	@JsonProperty("Locations")
	private Prison[] locations;

	public JsonPrisonResponse() {

	}

	public JsonPrisonResponse(Prison[] locations) {
		super();
		this.locations = locations;
	}

	public Prison[] getLocations() {
		return locations;
	}

	public void setLocations(Prison[] locations) {
		this.locations = locations;
	}

	@Override
	public String toString() {
		return "JsonPrisonResponse [locations=" + Arrays.toString(locations) + "]";
	}

}
