package com.zombieproject.ZombieTown.model;

public class scorecardbad {

	private String hospitals;
	private String casinos;
	private String stadiums;
	private String shoppingMalls;
	public scorecardbad() {
		// TODO Auto-generated constructor stub
	}
	public scorecardbad(String hospitals, String casinos, String stadiums, String shoppingMalls) {
		super();
		this.hospitals = hospitals;
		this.casinos = casinos;
		this.stadiums = stadiums;
		this.shoppingMalls = shoppingMalls;
	}
	public String getHospitals() {
		return hospitals;
	}
	public void setHospitals(String hospitals) {
		this.hospitals = hospitals;
	}
	public String getCasinos() {
		return casinos;
	}
	public void setCasinos(String casinos) {
		this.casinos = casinos;
	}
	public String getStadiums() {
		return stadiums;
	}
	public void setStadiums(String stadiums) {
		this.stadiums = stadiums;
	}
	public String getShoppingMalls() {
		return shoppingMalls;
	}
	public void setShoppingMalls(String shoppingMalls) {
		this.shoppingMalls = shoppingMalls;
	}
	@Override
	public String toString() {
		return "scorecardbad [hospitals=" + hospitals + ", casinos=" + casinos + ", stadiums=" + stadiums
				+ ", shoppingMalls=" + shoppingMalls + "]";
	}
	
	
	
	
	
}
