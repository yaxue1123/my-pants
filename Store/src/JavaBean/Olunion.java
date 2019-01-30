package JavaBean;

public class Olunion{
	private int id;
	int orderId;
	int logisticId;
	String desitination;
	
	public Olunion(){}
	public int getId() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public int getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(int logisticId) {
		this.logisticId = logisticId;
	}
	public String getDesitination() {
		return desitination;
	}
	public void setDesitination(String desitination) {
		this.desitination = desitination;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
}