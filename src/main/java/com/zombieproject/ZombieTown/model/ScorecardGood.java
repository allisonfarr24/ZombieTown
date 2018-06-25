package com.zombieproject.ZombieTown.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ScorecardGood {

	@JsonProperty("gas_station")
	private String gasStations;
	private String pharmacy;
	private String police;
	private String prison;

	public ScorecardGood() {

	}

	public ScorecardGood(String gasStations, String pharmacy, String police, String prison) {
		super();
		this.gasStations = gasStations;
		this.pharmacy = pharmacy;
		this.police = police;
		this.prison = prison;
	}

	public String getGasStations() {
		return gasStations;
	}

	public void setGasStations(String gasStations) {
		this.gasStations = gasStations;
	}

	public String getPharmacy() {
		return pharmacy;
	}

	public void setPharmacy(String pharmacy) {
		this.pharmacy = pharmacy;
	}

	public String getPolice() {
		return police;
	}

	public void setPolice(String police) {
		this.police = police;
	}

	public String getPrison() {
		return prison;
	}

	public void setPrison(String prison) {
		this.prison = prison;
	}

	@Override
	public String toString() {
		return "ScorecardGood [gasStations=" + gasStations + ", pharmacy=" + pharmacy + ", police=" + police
				+ ", prison=" + prison + "]";
	}

}
