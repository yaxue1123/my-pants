package JavaBean;

public class Logistic{
	private int logisticId;
	String complete;
	int orderId;

	
	public Logistic(){}
	public int getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(int logisticId) {
		this.logisticId = logisticId;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
}