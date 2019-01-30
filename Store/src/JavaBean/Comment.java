package JavaBean;

public class Comment {

		int id;
		int productId;
		int orderId;
		int userId;
		String content;
		int grade;
		String userName;

		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public int getOrderId() {
			return orderId;
		}
		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getGrade() {
			return grade;
		}
		public void setGrade(int grade) {
			this.grade = grade;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}

}
