package com.admin.servlet;

import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.Database.DBConnect;
import com.entity.*;
@WebServlet("/add_books")
@MultipartConfig

public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname=req.getParameter("bookName");
			String author=req.getParameter("authorName");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");
			String status=req.getParameter("bookStatus");
			Part part=req.getPart("photo");
			String filename=part.getSubmittedFileName();
			
			
			BookDtls b= new BookDtls(bookname,author,price,categories,status,filename,"admin");
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			
			
			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			if (f) {
			    String path = getServletContext().getRealPath("") + "book";
			    File file = new File(path);
			    part.write(path + File.separator + filename);

			    session.setAttribute("succ", "Book added successfully");
			    resp.sendRedirect("admin/add_books.jsp");
			} else {
			    session.setAttribute("fail", "Something went wrong");
			    resp.sendRedirect("admin/add_books.jsp");
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	

}
