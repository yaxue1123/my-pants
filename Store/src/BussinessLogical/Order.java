package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Order {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shop";
    private DbHelper dbHelper;
    private DbHelper dbHelper1;
    public Order(){
		try {
	        connectionProvider = new JdbcProvider(
	                "com.mysql.jdbc.Driver",
	                "jdbc:mysql://127.0.0.1:3306/",
	                "root","");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
		dbHelper = new DbHelper(connectionProvider, sourceName);
		dbHelper1 = new DbHelper(connectionProvider, sourceName);
    }
    
	public int add(JavaBean.Order item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO oorder(Price, UserName, Address, Consignee, Tele) VALUES(?,?,?,?,?)",
				item.getPrice(),
				item.getUserName(),
				item.getAddress(),
				item.getConsignee(),
				item.getTele());
	}
	
	public void calAccc(String un,float pr) throws SQLException {
		
		try{
		String sql = "SELECT * FROM account1 where userName=?";
		ResultSet rs = dbHelper.findById(sql, un);
		if (rs.next()){
			dbHelper.updatePrepareSQL("UPDATE account1 SET money=? WHERE UserName=?",
			rs.getFloat(3)-pr,
			un);
			}
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int save(JavaBean.Order item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE oorder SET Price=?, UserName=?, Address=?, Consignee=?, Tele=? WHERE OrderId=?",
				item.getPrice(),
				item.getUserName(),
				item.getAddress(),
				item.getConsignee(),
				item.getTele(),
				item.getOrderId());
	}
	
	public JavaBean.Order findById(int id) throws Exception{
		String sql = "SELECT * FROM oorder WHERE OrderId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderId(rs.getInt(1));
			item.setPrice(rs.getFloat(2));
			item.setUserName(rs.getString(3));
			item.setAddress(rs.getString(4));
			item.setConsignee(rs.getString(5));
			item.setTele(rs.getString(6));
			return item;
		}
		else
			return null;
	}
	
	public List<JavaBean.Order> findAll() throws Exception{
		String sql = "SELECT * FROM oorder";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while (rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderId(rs.getInt(1));
			item.setPrice(rs.getFloat(2));
			item.setUserName(rs.getString(3));
			item.setAddress(rs.getString(4));
			item.setConsignee(rs.getString(5));
			item.setTele(rs.getString(6));	
			items.add(item);
		}
		
		return items;
	}
	public List<JavaBean.Order> views(String userName) throws Exception{
		String sql = "SELECT * FROM oorder WHERE UserName=?";
		ResultSet rs = dbHelper.query(sql,userName);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while(rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderId(rs.getInt(1));
			item.setPrice(rs.getFloat(2));
			item.setUserName(rs.getString(3));
			item.setAddress(rs.getString(4));
			item.setConsignee(rs.getString(5));
			item.setTele(rs.getString(6));	
			items.add(item);
		}
		return items;
	}
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM oorder WHERE OrderId=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	public void delAll() throws Exception{
		String sql = "DELETE FROM cart";
		dbHelper.updatePrepareSQL(sql);
	}

	public int getId(JavaBean.Order item) throws Exception {
		String sql = "SELECT OderId FROM oorder where Price=? and UserName=? and Address=? and Consignee=? and Tele=?";
		ResultSet rs = dbHelper.query(sql,item.getPrice(),item.getUserName(),item.getAddress(),item.getConsignee(),item.getTele());
		int id=0;
		while (rs.next()){
			id=rs.getInt(1);
		}
		return id;

	}

	public void setOP(int id) throws Exception {
		
		String sql = "SELECT ProductId,Amount FROM cart";
		ResultSet rs = dbHelper.query(sql);
		while (rs.next()){
			String sql1 = "INSERT INTO opunion(OrderId,ProductId,Number) VALUES(?,?,?)";
			dbHelper1.updatePrepareSQL(sql1,id,rs.getInt(1),rs.getInt(2));
			String sql2 = "UPDATE product SET Stock=Stock-"+rs.getInt(2)+" WHERE ProductId=?";
			dbHelper1.updatePrepareSQL(sql2,rs.getInt(1));
		}
		
	}
	public int logisticAdd(int id) throws Exception {
		String sql = "INSERT INTO logistic(Complete, OrderId) VALUES(?,?)";
		dbHelper.updatePrepareSQL(sql, "no",id);
		String sql1 = "SELECT LogisticId FROM logistic WHERE OrderId=?";
		ResultSet rs = dbHelper.query(sql1,id);
		int lid=0;
		while (rs.next()){
			lid=rs.getInt(1);
		}
		return lid;
	}
	public void setOL(int getId, int logisticAdd) throws SQLException {
		String sql1 = "INSERT INTO olunion(orderId,logisticId,desitination) VALUES(?,?,?)";
		dbHelper.updatePrepareSQL(sql1,getId,logisticAdd,"warehouse");
	}

	public List<JavaBean.Product> orderPro(String orderId) throws Exception {
		String sql = "SELECT * FROM Product WHERE ProductId IN (SELECT ProductId FROM opunion WHERE OrderId='" + orderId + "')";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while(rs.next()){
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getInt(1));
			item.setProductName(rs.getString(2));
			item.setCategory(rs.getString(3));
			item.setPrice(rs.getDouble(4));
			item.setMemo(rs.getString(5));
			item.setSex(rs.getString(6));
			item.setSize(rs.getString(7));
			item.setColor(rs.getString(8));
			item.setStock(rs.getInt(9));
			items.add(item);
		}
		return items;
	}
}
