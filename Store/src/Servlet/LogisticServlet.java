package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Logistic;
import BussinessLogical.Order;
import JavaBean.Olunion;
/**
 * Servlet implementation class LogisticServlet
 */
@WebServlet("/Logistic")
public class LogisticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogisticServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action != null && action.equals("addCom")){
			int productId = Integer.parseInt(req.getParameter("productId"));
			String userName = req.getParameter("userName");
			String content = req.getParameter("content");
			int grade = Integer.parseInt(req.getParameter("grade"));
			JavaBean.Comment item = new JavaBean.Comment();
			item.setContent(content);
			item.setGrade(grade);
			item.setProductId(productId);
			item.setUserName(userName);
			try {
				new Logistic().saveCm(item);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("Order?action=view&userName="+userName).forward(req, res);
		}	
			if (action != null && action.equals("abcd")){
			String orderId = req.getParameter("orderId");
			String desitination = req.getParameter("desitination");
			JavaBean.Olunion item = new JavaBean.Olunion();
			item.setDesitination(desitination);
			item.setOrderId(Integer.parseInt(orderId));
			try {
				new Logistic().add(item);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("Order?action=detailShow1&orderId="+orderId).forward(req, res);
		}	

}
		
		
		
}

	

	
