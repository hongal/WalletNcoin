package com.geopia.wallet_ncoin.dto;

public class BalanceDto {
	
	private String name;
	private String icon;
	private String symbol;
	private double possession_rate;
	private double possession_volume;
	private int evaluated_price;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public double getPossession_volume() {
		return possession_volume;
	}

	public void setPossession_volume(double possession_volume) {
		this.possession_volume = possession_volume;
	}

	public double getPossession_rate() {
		return possession_rate;
	}

	public void setPossession_rate(double possession_rate) {
		this.possession_rate = possession_rate;
	}

	public int getEvaluated_price() {
		return evaluated_price;
	}

	public void setEvaluated_price(int evaluated_price) {
		this.evaluated_price = evaluated_price;
	}

}