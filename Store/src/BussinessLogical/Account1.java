package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Account1 {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shop";
    private DbHelper dbHelper;
    public Account1(){
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
    
	public int add(JavaBean.Account1 item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO account1(UserName,Money) VALUES(?,?)",
				item.getUserName(),
				item.getMoney());
	}
	public JavaBean.Account1 view(String un) throws Exception {
		
			String sql = "SELECT * FROM account1 where userName=?";
			ResultSet rs = dbHelper.findById(sql, un);
			if (rs.next()){
				JavaBean.Account1 item = new JavaBean.Account1();
				item.setAccountId(rs.getInt(1));
				item.setUserName(rs.getString(2));
				item.setMoney(rs.getFloat(3));
			return item;
			}	
			else 
				return null;
		}
	
	public int save(JavaBean.Account1 item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE account1 SET UserName=?, Money=? WHERE AccountId=?",
				item.getUserName(),
				item.getMoney(),
				item.getAccountId());
	}
	
	public JavaBean.Account1 findById(int id) throws Exception{
		String sql = "SELECT * FROM account1 WHERE AccountId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			JavaBean.Account1 item = new JavaBean.Account1();
			item.setAccountId(rs.getInt(1));
			item.setUserName(rs.getString(2));
			item.setMoney(rs.getFloat(3));
			return item;
		}
		else
			return null;
	}
	
	public List<JavaBean.Account1> findAll() throws Exception{
		String sql = "SELECT * FROM account1";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Account1> items = new ArrayList<JavaBean.Account1>();
		while (rs.next()){
			JavaBean.Account1 item = new JavaBean.Account1();
			item.setAccountId(rs.getInt(1));
			item.setUserName(rs.getString(2));
			item.setMoney(rs.getFloat(3));
			items.add(item);
		}
		
		return items;
	}
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM account1 WHERE AccountId=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	public void inMo(String un,float money) throws Exception{	
		String sql = "SELECT * FROM account1 where userName=?";
		ResultSet rs = dbHelper.findById(sql, un);
		if (rs.next()){
			dbHelper.updatePrepareSQL("UPDATE account1 SET money=? WHERE UserName=?",
			rs.getFloat(3)+money,
			un);
			}
	}
}
