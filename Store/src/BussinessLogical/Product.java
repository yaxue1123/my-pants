package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Product {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shop";
    private DbHelper dbHelper;
    public Product(){
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
    
	public int add(JavaBean.Product item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO Product(ProductName, Category, Price, Memo, Sex, Size,  Color, Stock) VALUES(?,?,?,?,?,?,?,?)",
				item.getProductName(),
				item.getCategory(),
				item.getPrice(),
				item.getMemo(),
				item.getSex(),
				item.getSize(),
				item.getColor(),
				item.getStock()
				);
	}
	
	public int save(JavaBean.Product item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE Product SET ProductName=?, Category=?, Price=?, Memo=?, Sex=?, Size=?, Color=?, Stock=?, WHERE ProductId=?",
				item.getProductName(),
				item.getCategory(),
				item.getPrice(),
				item.getMemo(),
				item.getSex(),
				item.getSize(),
				item.getColor(),
				item.getStock(),
				item.getProductId());
	}
	
	public JavaBean.Product findById(int id) throws Exception{
		String sql = "SELECT * FROM Product WHERE ProductId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
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
			return item;
		}
		else
			return null;
	}
	public List<JavaBean.Product> findBySex(String sex) throws Exception{
		String sql = "SELECT * FROM Product WHERE Sex=?";
		ResultSet rs = dbHelper.query(sql, sex);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()){
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
	public List<JavaBean.Product> findByName(String name) throws Exception{
		String sql = "SELECT * FROM Product WHERE ProductName=?";
		ResultSet rs = dbHelper.query(sql, name);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()){
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
	
	public String[] findColorByName(String name) throws Exception{
		String sql = "SELECT DISTINCT Color FROM Product WHERE ProductName=?";
		ResultSet rs = dbHelper.query(sql, name);
		String[] c = new String[10];
		int i=0;
		while (rs.next()){
			c[i]=rs.getString(1);
			i=i+1;
		}
			return c;
	}
	
	public int findBySCP(String size,String color,String productName) throws Exception {
		String sql = "SELECT ProductId FROM Product WHERE Size=? AND Color=? AND ProductName=?";
		ResultSet rs = dbHelper.query(sql,size,color,productName);
		int id = 0;
		if(rs.next()){
		id=rs.getInt(1);
		}
		return id;
	}
	public List<JavaBean.Product> findByCategory(String category) throws Exception{
		String sql = "SELECT * FROM Product WHERE Category=?";
		ResultSet rs = dbHelper.query(sql, category);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()){
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
	
	public List<JavaBean.Product> findAll() throws Exception{
		String sql = "SELECT * FROM Product";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()){
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
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM Product WHERE ProductId=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
}
