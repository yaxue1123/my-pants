package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
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
			req.setAttribute("Users", this.list());
			req.getRequestDispatcher("/userList.jsp").forward(req, res);
		}
		
		//
		if (action != null && action.equals("login")){
			String loginName = req.getParameter("loginName");
			String password  = req.getParameter("password");

			if (loginName != null && password != null){
				if (!loginName.equals("") && !password.equals("")){
					try {
						if (login(loginName, password)){
							req.getSession().setAttribute("ISLOGIN", "1");
							req.getSession().setAttribute("loginName", loginName);
							if("admin".equals(loginName)){
								res.sendRedirect("backWelcome.jsp");
							}
							res.sendRedirect("mainPage.jsp");
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
		}
		
		if (action != null && action.equals("reg")){
			JavaBean.User item = this.getUser(req);
			if (item != null){
				this.Register(item);
				res.sendRedirect("mainPage.jsp");
			}
		}
		if (action != null && action.equals("add")){
			JavaBean.User item = this.getUser(req);
			if (item != null){
				this.Register(item);
				res.sendRedirect("User?action=list");
			}
		}
		if (action != null && action.equals("edit")){
			try {
				int id = Integer.parseInt(req.getParameter("UserId"));
				req.setAttribute("User", new User().findById(id));
				req.getRequestDispatcher("/userEdit.jsp").forward(req, res);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("del")){
			try {
				int id = Integer.parseInt(req.getParameter("UserId"));
				String ln = req.getParameter("longinName");
				new User().remove(id);
				res.sendRedirect("User?action=list");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("save")){
			JavaBean.User item = this.getUser(req);
			if (item != null){
				BussinessLogical.User svc = new BussinessLogical.User();
				try {
					svc.save(item);
					res.sendRedirect("User?action=list");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	private Boolean login(String loginName, String password) throws Exception {
		User svc = new User();
		return svc.login(loginName, password);
	}
	
	private void Register(JavaBean.User item){
		BussinessLogical.User svc = new BussinessLogical.User();
		try{
			svc.add(item);
			svc.addAcc(item);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<JavaBean.User> list(){
    	User svc = new User();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
    }
	
	private JavaBean.User getUser(HttpServletRequest req){
		String loginName = req.getParameter("loginName");
		if (loginName == null || loginName.equals(""))
			return null;
		String password  = req.getParameter("password");
		if (password == null || password.equals(""))
			return null;
		
		JavaBean.User item = new JavaBean.User();
		String fullName = req.getParameter("fullName");
		String gender  = req.getParameter("gender");
		String birthDate  = req.getParameter("birthDate");
		String id = req.getParameter("UserId");
		if (id != null && !id.equals(""))
			item.setId(Integer.parseInt(id));
		
		item.setLoginName(loginName);
		item.setPassword(password);
		item.setFullName(fullName);
		item.setGender(gender);
		item.setBirthDate(birthDate);
		
		return item;
    }
}	
	
