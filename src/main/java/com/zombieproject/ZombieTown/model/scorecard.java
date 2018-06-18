package com.zombieproject.ZombieTown.model;

public class scorecard {

	
	private int hospitals;
	private int gasStations;
	private int prison;
	private int pharmacies;
	private int police;
	
	public scorecard() {
		
	}

	public scorecard(int hospitals, int gasStations, int prison, int pharmacies, int police) {
		super();
		this.hospitals = hospitals;
		this.gasStations = gasStations;
		this.prison = prison;
		this.pharmacies = pharmacies;
		this.police = police;
	}

	public int getHospitals() {
		return hospitals;
	}

	public void setHospitals(int hospitals) {
		this.hospitals = hospitals;
	}

	public int getGasStations() {
		return gasStations;
	}

	public void setGasStations(int gasStations) {
		this.gasStations = gasStations;
	}

	public int getPrison() {
		return prison;
	}

	public void setPrison(int prison) {
		this.prison = prison;
	}

	public int getPharmacies() {
		return pharmacies;
	}

	public void setPharmacies(int pharmacies) {
		this.pharmacies = pharmacies;
	}

	public int getPolice() {
		return police;
	}

	public void setPolice(int police) {
		this.police = police;
	}

	@Override
	public String toString() {
		return "scorecard hospitals=" + hospitals + ", gasStations=" + gasStations + ", prison=" + prison
				+ ", pharmacies=" + pharmacies + ", police=" + police;
	}
	
	
}
