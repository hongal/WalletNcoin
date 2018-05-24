package com.geopia.wallet_ncoin.dto;

public class RankingDto {

	private int rank;
	private String icon;
	private String name;
	private double total_volume;
	private double daily_volume;
	private String Symbol;

	public int getRank() {
		return rank;
	}
	
	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getTotal_volume() {
		return total_volume;
	}

	public void setTotal_volume(double total_volume) {
		this.total_volume = total_volume;
	}

	public double getDaily_volume() {
		return daily_volume;
	}

	public void setDaily_volume(double daily_volume) {
		this.daily_volume = daily_volume;
	}

	public String getSymbol() {
		return Symbol;
	}

	public void setSymbol(String symbol) {
		Symbol = symbol;
	}

}
