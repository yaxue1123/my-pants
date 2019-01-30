package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Cart {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shop";
    private DbHelper dbHelper;
    public Cart(){
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
    
	public int add(JavaBean.Cart item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO Cart(ProductName,ProductId, Price, Amount,Sum,Size,Color) VALUES(?,?,?,?,?,?,?)",
				item.getProductName(),
				item.getProductId(),
				item.getPrice(),
				item.getAmount(),
				item.getSum(),
				item.getSize(),
				item.getColor());

	}
	
	public int save(JavaBean.Cart item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE cart SET ProductName=?, ProductId=?, Price=?, Amount=?, Sum=? WHERE Id=?",
				item.getProductName(),
				item.getProductId(),
				item.getPrice(),
				item.getAmount(),
				item.getSum(),
				item.getId());

	}
	
	public JavaBean.Cart findById(int id) throws Exception{
		String sql = "SELECT * FROM Cart WHERE Id=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			JavaBean.Cart item = new JavaBean.Cart();
			item.setId(rs.getInt(1));
			item.setProductName(rs.getString(2));
			item.setProductId(rs.getInt(3));
			item.setPrice(rs.getFloat(4));
			item.setAmount(rs.getInt(5));
			item.setSum(rs.getFloat(6));
			item.setSize(rs.getString(7));
			item.setColor(rs.getString(8));
			return item;
		}
		else
			return null;
	}
	public int findByPId(int id) throws Exception{
		String sql = "SELECT * FROM Cart WHERE productId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			return rs.getInt(3);
		}
		else
			return 0;
	}
	public void addSum(int id,int amount) throws Exception{
		String sql = "SELECT * FROM Cart WHERE ProductId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			dbHelper.updatePrepareSQL("UPDATE cart SET Amount=?, Sum=? WHERE Id=?",
			rs.getInt(5)+amount,
			rs.getFloat(4)*amount+rs.getFloat(6),
			rs.getInt(1));
		}
	}
	
	public List<JavaBean.Cart> findAll() throws Exception{
		String sql = "SELECT * FROM Cart";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Cart> items = new ArrayList<JavaBean.Cart>();
		while (rs.next()){
			JavaBean.Cart item = new JavaBean.Cart();
			item.setId(rs.getInt(1));
			item.setProductName(rs.getString(2));
			item.setProductId(rs.getInt(3));
			item.setPrice(rs.getFloat(4));
			item.setAmount(rs.getInt(5));	
			item.setSum(rs.getFloat(6));
			item.setSize(rs.getString(7));
			item.setColor(rs.getString(8));
			items.add(item);
		}
		
		return items;
	}
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM Cart WHERE Id=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	public void delAll() throws Exception{
		String sql = "DELETE FROM Cart";
		dbHelper.updatePrepareSQL(sql);
	}
}
