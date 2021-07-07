package ssg.dao;

import java.sql.*;
import java.util.ArrayList;
import ssg.dto.CartDto;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CartDao {
	Connection conn=null;
	public CartDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost:3306/ssg"; // ?userSSL=false
		conn=DriverManager.getConnection(db,"admin","1234");
		// String db="jdbc:mysql://192.168.0.137/ssg";
		// conn=DriverManager.getConnection(db,"admin","1234");
	}
	public void cart_ok(HttpServletRequest request,HttpSession session) throws Exception
	{
		PreparedStatement pstmt;
		String prod_id = request.getParameter("prod_id");
		String m_id = session.getAttribute("userid").toString();
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		String sql1 = "select prod_id from cart where prod_id = ? and m_id = ?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, prod_id);
		pstmt1.setString(2, m_id);	
		ResultSet rs = pstmt1.executeQuery();		 
		if (rs.next())
		{
			String sql2 = "update cart set cart_quantity = cart_quantity + "+cart_quantity+" where prod_id = ? and m_id = ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, prod_id);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
		}
		else
		{
			String sql3 = "insert into cart(prod_id, m_id, cart_quantity) values(?,?,?)";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, prod_id);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, cart_quantity);
			pstmt.executeUpdate();
		}
		pstmt1.close();
		pstmt.close();
		conn.close();
	}
	public ArrayList<CartDto> cart_list(HttpSession session) throws Exception
	{
		String userid = session.getAttribute("userid").toString();
		String sql = "select c.*, p.prod_name, p.prod_price, (c.cart_quantity * p.prod_price) as hap from product as p, cart as c where p.prod_id = c.prod_id and c.m_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CartDto> list = new ArrayList<CartDto>();
		while(rs.next())
		{
			CartDto cdto = new CartDto();
			cdto.setCart_id(rs.getInt("cart_id"));
			cdto.setHap(rs.getInt("hap"));
			cdto.setM_id(rs.getString("m_id"));
			cdto.setProd_id(rs.getString("prod_id"));
			cdto.setCart_quantity(rs.getInt("cart_quantity"));
			cdto.setProd_name(rs.getString("prod_name"));
			cdto.setProd_price(rs.getInt("prod_price"));
			
			list.add(cdto);
		}
		return list;
	}
	public void cart_delete(HttpServletRequest request) throws Exception
	{
		String cart_id = request.getParameter("cart_id");
		String sql = "delete from cart where cart_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cart_id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public int cart_hap(HttpSession session) throws Exception
	{
		String m_id = session.getAttribute("userid").toString();
		String sql = "select sum(c.cart_quantity * p.prod_price) as hap from cart as c, product as p";
		sql = sql + " where c.prod_id = p.prod_id and c.m_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int hap = rs.getInt("hap");
		return hap;
	}
	public void cart_quantity_minus(HttpServletRequest request) throws Exception
	{
		String cart_id = request.getParameter("cart_id");
		String sql = "update cart set cart_quantity = cart_quantity - 1 where cart_id="+cart_id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}
	public void cart_quantity_plus(HttpServletRequest request) throws Exception
	{
		String cart_id = request.getParameter("cart_id");
		String sql = "update cart set cart_quantity = cart_quantity + 1 where cart_id="+cart_id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}
	public void cart_delete_all(HttpSession session) throws Exception
	{
		String m_id = session.getAttribute("userid").toString();
		String sql = "delete from cart where m_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
}
