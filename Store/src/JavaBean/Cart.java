package JavaBean;

public class Cart {
	private int id;
	String productName;
	int productId;
	float price;
	int amount;
	float sum;
	String size;
	String color;

	
	public Cart(){}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public 	int getProductId() {
		return productId;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPrice() {
		return price;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getAmount() {
		return amount;
	}
	public void setSum(float sum) {
		this.sum = sum;
	}
	public float getSum() {
		return sum;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getSize() {
		return size;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getColor() {
		return color;
	}

}