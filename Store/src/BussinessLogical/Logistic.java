package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JavaBean.Comment;
import JavaBean.Olunion;
import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Logistic {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shop";
    private DbHelper dbHelper;
    public Logistic(){
		try {
	        connectionProvider = new JdbcProvider(
	                "com.mysql.jdbc.Driver",
	                "jdbc:mysql://127.0.0.1:3306/",
	                "root","");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
		dbHelper = new DbHelper(connectionProvider, sourceName);
    }
	public String list(String orderId) throws Exception {
		String sql = "SELECT Complete FROM logistic WHERE OrderId=?";
		ResultSet rs = dbHelper.query(sql, orderId);
		String s;
		while(rs.next()){
			s=rs.getString(1);
			return s;
		}
			return null;
	}
	public List<JavaBean.Olunion> destination(String orderId) throws Exception {
		String sql = "SELECT * FROM olunion WHERE OrderId=?";
		ResultSet rs = dbHelper.query(sql, orderId);
		List<JavaBean.Olunion> items = new ArrayList<JavaBean.Olunion>();
		while(rs.next()){
			JavaBean.Olunion item = new JavaBean.Olunion();
			item.setid(rs.getInt(1));
			item.setOrderId(rs.getInt(2));
			item.setLogisticId(rs.getInt(3));
			item.setDesitination(rs.getString(4));
			items.add(item);
		}
		return items;
	}
	public void saveCm(Comment item) throws Exception {
		String sql1 = "INSERT INTO Comment(ProductId,UserName,Grade,Content) VALUES(?,?,?,?)";
		dbHelper.updatePrepareSQL(sql1,item.getProductId(),item.getUserName(),item.getGrade(),item.getContent());
	}
	public List<JavaBean.Comment> findByPid(int productId) throws Exception {
		String sql = "SELECT * FROM comment WHERE ProductId=?";
		ResultSet rs = dbHelper.query(sql, productId);
		List<JavaBean.Comment> items = new ArrayList<JavaBean.Comment>();
		while(rs.next()){
			JavaBean.Comment item = new JavaBean.Comment();
			item.setId(rs.getInt(1));
			item.setProductId(rs.getInt(2));
			item.setUserName(rs.getString(4));
			item.setGrade(rs.getInt(5));
			item.setContent(rs.getString(6));
			items.add(item);
		}
		return items;
	}
	public int add(Olunion item) throws Exception {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO olunion(desitination,orderId) VALUES(?,?)",
				item.getDesitination(),
				item.getOrderId());
		
	}
}
