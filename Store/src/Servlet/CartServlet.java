package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Cart;
import BussinessLogical.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private JavaBean.Cart getCart(HttpServletRequest req){
    	
    	String pName = req.getParameter("productName");
    	String pId = req.getParameter("productId");
    	String price = req.getParameter("price");
    	String amount = req.getParameter("amount");
    	String sum = String.valueOf(Float.parseFloat(price)*Integer.parseInt(amount));
    	
    	JavaBean.Cart item = new JavaBean.Cart();
    	
     	item.setProductName(pName);
    	item.setProductId(Integer.parseInt(pId));
    	item.setPrice(Float.parseFloat(price));
    	item.setAmount(Integer.parseInt(amount));
    	item.setSum(Float.parseFloat(sum));	
    	return item;
    }
    private List<JavaBean.Cart> list(){
    	Cart svc = new Cart();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
    private JavaBean.Cart edit(int id){
    	Cart svc = new Cart();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
	private void remove(int id){
		Cart svc = new Cart();
		try {
			svc.remove(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void save(JavaBean.Cart item){
		try {
			new Cart().save(item);
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
			req.setAttribute("Carts", this.list());
			req.getRequestDispatcher("/cartList.jsp").forward(req, res);
		}
		if (action != null && action.equals("view")){
			req.setAttribute("Carts", this.list());
			req.getRequestDispatcher("/cartsView.jsp").forward(req, res);
		}
		//产品添加
		if (action != null && action.equals("add")){
			String size=req.getParameter("size");
			String color=req.getParameter("color");
			String productName=req.getParameter("productName");
			String price = req.getParameter("price");
			int num=Integer.parseInt(req.getParameter("amount"));
			int pro=0;
			try {
				pro = new Product().findBySCP(size,color,productName);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String sum = String.valueOf(Float.parseFloat(price)*num);
	    	
	    	JavaBean.Cart item = new JavaBean.Cart();
	     	item.setProductName(productName);
	    	item.setProductId(pro);
	    	item.setPrice(Float.parseFloat(price));
	    	item.setAmount(num);
	    	item.setSum(Float.parseFloat(sum));	
	    	item.setSize(size);
	    	item.setColor(color);
			if (item != null){
				try {
					
					if(new Cart().findByPId(pro)==pro){
					new Cart().addSum(pro,num);}
					else{
					new Cart().add(item);}
					req.getRequestDispatcher("/cartSuccess.jsp").forward(req, res);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//产品编辑
		if (action != null && action.equals("edit")){
			int id = Integer.parseInt(req.getParameter("id"));
			req.setAttribute("cart", this.edit(id));
			req.getRequestDispatcher("productEdit.jsp").forward(req, res);
		}
		
		//产品删除
		if (action != null && action.equals("del")){
			int id = Integer.parseInt(req.getParameter("id"));
			this.remove(id);
			req.getRequestDispatcher("Cart?action=view").forward(req, res);
		}
		if (action != null && action.equals("delAll")){
			try{
				new Cart().delAll();
				req.getRequestDispatcher("Cart?action=view").forward(req, res);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//编辑后保存
		if (action != null && action.equals("save")){
			this.save(this.getCart(req));
			req.getRequestDispatcher("Cart?action=list").forward(req, res);
		}
	}

}