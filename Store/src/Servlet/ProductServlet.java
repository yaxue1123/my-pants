package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Product;
import BussinessLogical.Logistic;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private JavaBean.Product getProduct(HttpServletRequest req){
    	String pId = req.getParameter("productId");
    	String pName = req.getParameter("productName");
    	String category = req.getParameter("category");
    	String price = req.getParameter("price");
    	String memo = req.getParameter("memo");
    	String sex = req.getParameter("sex");
    	String size = req.getParameter("size");
    	String color = req.getParameter("color");
    	String stock = req.getParameter("stock");
    	
    	if (price == null || price.equals(""))
    		return null;
    	
    	JavaBean.Product item = new JavaBean.Product();
    	if (pId == null || pId.equals(""))
    		item.setProductId(0);
    	else
    		item.setProductId(Integer.parseInt(pId));

    	item.setProductName(pName);
    	item.setCategory(category);
    	item.setPrice(Double.parseDouble(price));
    	item.setMemo(memo);
    	item.setSex(sex);
    	item.setSize(size);
    	item.setColor(color);
    	item.setStock(Integer.parseInt(stock));
    	
    	return item;
    }
    private List<JavaBean.Product> list(){
    	Product svc = new Product();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
    private JavaBean.Product edit(int id){
    	Product svc = new Product();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
	private void remove(int id){
		Product svc = new Product();
		try {
			svc.remove(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void save(JavaBean.Product item){
		try {
			new Product().save(item);
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
			req.setAttribute("Products", this.list());
			req.getRequestDispatcher("/productList.jsp").forward(req, res);
		}
		if (action != null && action.equals("view")){
			String kind = req.getParameter("kind");
			Product svc = new Product();
			if(kind.equals("f") || kind.equals("m")){
			try {
				req.setAttribute("Products", svc.findBySex(kind));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			else if(kind.equals("xx") || kind.equals("nz")){
				try {
					req.setAttribute("Products", svc.findByCategory(kind));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(kind.equals("all")){
				req.setAttribute("Products", this.list());
			}
			req.getRequestDispatcher("/productsView.jsp").forward(req, res);
		}
		//产品添加
		if (action != null && action.equals("add")){
			JavaBean.Product item = this.getProduct(req);
			if (item != null){
				try {
					new Product().add(item);
					req.getRequestDispatcher("Product?action=list").forward(req, res);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//产品编辑
		if (action != null && action.equals("edit")){
			int id = Integer.parseInt(req.getParameter("productId"));
			req.setAttribute("product", this.edit(id));
			req.getRequestDispatcher("productEdit.jsp").forward(req, res);
		}
		
		//产品删除
		if (action != null && action.equals("del")){
			int id = Integer.parseInt(req.getParameter("productId"));
			this.remove(id);
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}
		
		//编辑后保存
		if (action != null && action.equals("save")){
			JavaBean.Product item = this.getProduct(req);
			try {
				new Product().save(item);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}
				
		if (action != null && action.equals("productDetail")){
			String productName = req.getParameter("productName");
			String productId = req.getParameter("productId");
			String color = req.getParameter("color");
			Product svc = new Product();
			Logistic svl= new Logistic();
			try {
				req.setAttribute("Product1", svc.findById(Integer.parseInt(productId)));
				req.setAttribute("Product2", svc.findByName(productName));
				req.setAttribute("Colors",svc.findColorByName(productName));
				req.setAttribute("ColorNow",color);
				req.setAttribute("Comments", svl.findByPid(Integer.parseInt(productId)));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("/productDetail1.jsp").forward(req, res);
		}	
		if (action != null && action.equals("changeP")){
			String productName = req.getParameter("productName");
			String color = req.getParameter("color");
			String size = "s";
			int productId;
			Product svc = new Product();
			Logistic svl= new Logistic();
			try {
				productId = new Product().findBySCP(size,color,productName);
				req.setAttribute("Product1", svc.findById(productId));
				req.setAttribute("Product2", svc.findByName(productName));
				req.setAttribute("Colors",svc.findColorByName(productName));
				req.setAttribute("ColorNow",color);
				req.setAttribute("Comments", svl.findByPid(productId));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("/productDetail1.jsp").forward(req, res);
		}	
		
	}

}
