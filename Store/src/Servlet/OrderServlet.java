package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Account1;
import BussinessLogical.Logistic;
import BussinessLogical.Order;


/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private JavaBean.Order getOrder(HttpServletRequest req){
    	String orderId = req.getParameter("orderId");
    	String price = req.getParameter("price");
    	String userName = req.getParameter("userName");
    	String address = req.getParameter("address");
    	String consignee = req.getParameter("consignee");
    	String tele = req.getParameter("tele");
    	
    	JavaBean.Order item = new JavaBean.Order();
    	if (orderId == null || orderId.equals(""))
    		item.setOrderId(0);
    	else
    		item.setOrderId(Integer.parseInt(orderId));
    	item.setPrice(Float.parseFloat(price));
    	item.setUserName(userName);
    	item.setAddress(address);
    	item.setConsignee(consignee);
    	item.setTele(tele);
    	
    	return item;
    }
    private List<JavaBean.Order> list(){
    	Order svc = new Order();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
    private JavaBean.Order edit(int id){
    	Order svc = new Order();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
	private void remove(int id){
		Order svc = new Order();
		try {
			svc.remove(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void save(JavaBean.Order item){
		try {
			new Order().save(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private List<JavaBean.Order> view(String userName) {
		Order svc = new Order();
		try {
			return svc.views(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
			req.setAttribute("Orders", this.list());
			req.getRequestDispatcher("/orderList.jsp").forward(req, res);
		}
		if (action != null && action.equals("view")){
			String userName=req.getParameter("userName");
			try {
				List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
				items=this.view(userName);
				req.setAttribute("asds", items);
				req.setAttribute("Account", new Account1().view(userName));
				req.getRequestDispatcher("/ordersView.jsp").forward(req, res);
			} 
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//产品添加
		if (action != null && action.equals("add")){
			JavaBean.Order item = this.getOrder(req);
			int id;
			if (item != null){
				try {	
					Order svc=new Order();
					svc.add(item);
					id=svc.getId(item);
					svc.setOL(id,svc.logisticAdd(id));
					svc.setOP(id);
					svc.delAll();
					req.getRequestDispatcher("orderSuccess.jsp").forward(req, res);									
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (action != null && action.equals("aadd")){
			JavaBean.Order item = this.getOrder(req);
			if (item != null){
				try {
					new Order().add(item);		
					req.getRequestDispatcher("Order?action=list").forward(req, res);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//产品编辑
		if (action != null && action.equals("edit")){
			int id = Integer.parseInt(req.getParameter("orderId"));
			req.setAttribute("OOrder", this.edit(id));
			req.getRequestDispatcher("orderEdit.jsp").forward(req, res);
		}
		
		//产品删除
		if (action != null && action.equals("del")){
			int id = Integer.parseInt(req.getParameter("orderId"));
			this.remove(id);
			req.getRequestDispatcher("Order?action=list").forward(req, res);
		}
		
		//编辑后保存
		if (action != null && action.equals("save")){
			this.save(this.getOrder(req));
			req.getRequestDispatcher("Order?action=list").forward(req, res);
		}
		if (action != null && action.equals("detailShow")){
			String orderId = req.getParameter("orderId");
			Logistic svc=new Logistic();
			Order svo=new Order();
			try {
				req.setAttribute("orderPro", svo.orderPro(orderId));
				req.setAttribute("logisticDetail", svc.destination(orderId));
				req.getRequestDispatcher("logisticDetail.jsp").forward(req, res);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (action != null && action.equals("detailShow1")){
			String orderId = req.getParameter("orderId");
			Logistic svc=new Logistic();
			Order svo=new Order();
			try {
				req.setAttribute("orderPro1", svo.orderPro(orderId));
				req.setAttribute("logisticDetail1", svc.destination(orderId));
				req.getRequestDispatcher("orderDetail.jsp").forward(req, res);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
	}

	

}
