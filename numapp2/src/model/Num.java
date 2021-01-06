package model;

import java.io.Serializable;

public class Num implements Serializable{
	private String org;
	private double ans;
	public Num(){}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public double getAns() {
		return ans;
	}
	public void setAns(double ans) {
		this.ans = ans;
	}

}