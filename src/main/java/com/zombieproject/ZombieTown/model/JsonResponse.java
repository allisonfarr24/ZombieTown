package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonResponse {
	
	private Results[] results;

	public JsonResponse() {
	}

	public Results[] getResults() {
		return results;
	}

	public void setResults(Results[] results) {
		this.results = results;
	}

	@Override
	public String toString() {
		return "JsonResponse [results=" + Arrays.toString(results) + "]";
	}
	
	

}
