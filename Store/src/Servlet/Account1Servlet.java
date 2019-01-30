package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Account1;
import BussinessLogical.Order;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Account1")
public class Account1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  Account1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private JavaBean. Account1 getAccount1(HttpServletRequest req){
    	String accountId = req.getParameter("accountId");
    	String userName = req.getParameter("userName");
    	String money = req.getParameter("money");
    	
    	JavaBean.Account1 item = new JavaBean.Account1();
    	if (accountId == null || accountId.equals(""))
    		item.setAccountId(0);
    	else
    		item.setAccountId(Integer.parseInt(accountId));
    	item.setUserName(userName);
    	item.setMoney(Float.parseFloat(money));

    	return item;
    }
    private List<JavaBean.Account1> list(){
    	Account1 svc = new Account1();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
    private JavaBean.Account1 edit(int id){
    	Account1 svc = new Account1();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
	private void remove(int id){
		Account1 svc = new Account1();
		try {
			svc.remove(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void save(JavaBean.Account1 item){
		try {
			new Account1().save(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null && action.equals("list")){
			req.setAttribute("Account1s", this.list());
			req.getRequestDispatcher("/account1List.jsp").forward(req, res);
		}
		if (action != null && action.equals("inMo")){
			String un = req.getParameter("userName");
			float money = Float.parseFloat(req.getParameter("money"));
			try {
				new Account1().inMo(un, money);
				req.getRequestDispatcher("Order?action=view").forward(req, res);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if (action != null && action.equals("view")){
			String un = req.getParameter("userName");
			try {
				req.setAttribute("Account", new Account1().view(un));
				req.getRequestDispatcher("/accountView.jsp").forward(req, res);
			} 
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		//产品添加
		if (action != null && action.equals("add")){
			JavaBean.Account1 item = this.getAccount1(req);
			if (item != null){
				try {
					new Account1().add(item);
					req.getRequestDispatcher("Account1?action=list").forward(req, res);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//产品编辑
		if (action != null && action.equals("edit")){
			int id = Integer.parseInt(req.getParameter("accountId"));
			req.setAttribute("account", this.edit(id));
			req.getRequestDispatcher("account1Edit.jsp").forward(req, res);
		}
		
		//产品删除
		if (action != null && action.equals("del")){
			int id = Integer.parseInt(req.getParameter("accountId"));
			this.remove(id);
			req.getRequestDispatcher("Account1?action=list").forward(req, res);
		}
		
		//编辑后保存
		if (action != null && action.equals("save")){
			this.save(this.getAccount1(req));
			req.getRequestDispatcher("Account1?action=list").forward(req, res);
		}
		if (action != null && action.equals("pay")){
			String un=req.getParameter("username");			
			float pr=Float.parseFloat(req.getParameter("price"));
			Order svc=new Order();
			try {
				svc.calAccc(un,pr);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("paySuccess.jsp").forward(req, res);
		}
	}

}
