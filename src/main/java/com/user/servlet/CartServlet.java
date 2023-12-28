package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.Database.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		    int bid = Integer.parseInt(req.getParameter("bid").trim());
		    int uid = Integer.parseInt(req.getParameter("uid").trim());

		    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		    BookDtls b = dao.getBookById(bid);

		    Cart c = new Cart();
		    c.setBid(bid);
		    c.setUserId(uid);
		    c.setBookName(b.getBookname());
		    c.setAuthor(b.getAuthor());

		    // Check if the price is a valid numeric value
		    try {
		        double price = Double.parseDouble(b.getPrice());
		        c.setPrice(price);
		        c.setTotalPrice(price);
		    } catch (NumberFormatException e) {
		        // Handle the case when the price is not a valid numeric value
		        e.printStackTrace();
		        HttpSession session = req.getSession();
		        session.setAttribute("failed", "Invalid price");
		        resp.sendRedirect("error.jsp");
		        return;
		    }

		    CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
		    boolean f = dao2.addCart(c);

		    HttpSession session = req.getSession();

		    if (f) {
		        session.setAttribute("addCart", "Book Added To Cart");
		        resp.sendRedirect("all_new_book.jsp");
		    } else {
		       
		        session.setAttribute("failed", "Something went wrong");
		        resp.sendRedirect("all_new_book.jsp");
		    }

		} catch (NumberFormatException e) {
		    e.printStackTrace();
		    HttpSession session = req.getSession();
		    session.setAttribute("failed", "Invalid bid or uid");
		    resp.sendRedirect("error.jsp");
		}

	}

	

}
