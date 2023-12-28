package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;
import com.Database.DBConnect;
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {

	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cidParam = req.getParameter("cid");
		String bidParam = req.getParameter("bid");
	    String uidParam = req.getParameter("uid");
	    

	    // Perform null checks before accessing and trimming the parameter values
	    int cid = (cidParam != null) ? Integer.parseInt(cidParam.trim()) : 0;
	    int bid = (bidParam != null) ? Integer.parseInt(bidParam.trim()) : 0;
	    int uid = (uidParam != null) ? Integer.parseInt(uidParam.trim()) : 0;
	    

	    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
	    boolean f = dao.delete_Book(cid);
	    HttpSession session = req.getSession();

	    if (f) {
	        session.setAttribute("succMsg", "Remove Successfully from cart");
	        resp.sendRedirect("checkout.jsp");
	    } else {
	        session.setAttribute("failedMsg", "Something Wrong on Server");
	        resp.sendRedirect("checkout.jsp");
	    }
	}


	
}
