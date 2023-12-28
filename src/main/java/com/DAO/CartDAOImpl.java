package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import com.entity.*;

public class CartDAOImpl implements CartDAO {
     private Connection conn;
     

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}


	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into cart(cid, bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getCid());
			ps.setInt(2, c.getBid());
			ps.setInt(3, c.getUserId());
			ps.setString(4, c.getBookName());
			ps.setString(5, c.getAuthor());
			ps.setDouble(6, c.getPrice());
			ps.setDouble(7, c.getTotalPrice());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart>list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				c=new Cart();
			    c.setCid(rs.getInt(1));
			    c.setBid(rs.getInt(2));
			    c.setUserId(rs.getInt(3));
			    c.setBookName(rs.getString(4));
			    c.setAuthor(rs.getString(5));
			    c.setPrice(rs.getDouble(6));
			     
			    totalPrice=totalPrice+rs.getDouble(7);
			    c.setTotalPrice(totalPrice);
			    list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean delete_Book(int cid) {
		boolean f=false;
		
		try {
			String sql="delete from cart where cid=?";
			 
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
		
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
	        // Log or display the specific exception message
	        System.err.println("An error occurred while deleting the book from the cart: " + e.getMessage());
	        e.printStackTrace();
	    }

	
		return f;
	}

}
