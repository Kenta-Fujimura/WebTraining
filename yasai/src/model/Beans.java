package model;

public class Beans {
	private String name;
	private String price;
	private String total;
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public Beans() {

	}
	public String getName() {
		return name;
	}
	public Beans(String name, String price) {
		super();
		this.name = name;
		this.price = price;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}

}
