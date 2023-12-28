package com.user.servlet;
import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.Database.DBConnect;
import com.entity.user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			
//			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			user us = new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			HttpSession session = req.getSession();

			if(check!=null) {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			boolean f2=dao.checkUser(email);
			
			if(f2) {
				boolean f = dao.userRegister(us);
				if(f) {
					
					session.setAttribute("succMsg", "Registered Successully..");
					resp.sendRedirect("register.jsp");
					//System.out.println("User Registered Successully");
				}else {
					session.setAttribute("failedMsg", "Something wrong on server..");
					resp.sendRedirect("register.jsp");
					//System.out.println("Something wrong on server..");
				}
			}else {
				session.setAttribute("failedMsg", "User Already Exist!! Try another Email");
				resp.sendRedirect("register.jsp");
			}
			}else {			
				//System.out.println("please check agree terms & condition");
				session.setAttribute("failedMsg", "Please check agree terms & condition");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
			

	}


