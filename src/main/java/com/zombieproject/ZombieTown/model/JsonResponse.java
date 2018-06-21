package com.zombieproject.ZombieTown.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class JsonResponse {

	@JsonProperty("next_page_token")
	private String nextPageToken;
	private Results[] results;

	public JsonResponse() {

	}

	public JsonResponse(String nextPageToken, Results[] results) {
		super();
		this.nextPageToken = nextPageToken;
		this.results = results;
	}

	public Results[] getResults() {
		return results;
	}

	public void setResults(Results[] results) {
		this.results = results;
	}

	public String getNextPageToken() {
		return nextPageToken;
	}

	public void setNextPageToken(String nextPageToken) {
		this.nextPageToken = nextPageToken;
	}

	@Override
	public String toString() {
		return "JsonResponse [nextPageToken=" + nextPageToken + ", results=" + Arrays.toString(results) + "]";
	}

}
