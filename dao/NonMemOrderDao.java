package ssg.dao;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import ssg.dto.CartDto;
import ssg.dto.NonMemOrderDto;

public class NonMemOrderDao {
	Connection conn;
	public NonMemOrderDao() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://192.168.0.137/ssg";
		conn=DriverManager.getConnection(db,"admin","1234");
	}
	
	public void nmem_order_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		int nmem_order_quantity = Integer.parseInt(request.getParameter("order_quantity"));
		String prod_id = request.getParameter("prod_id");
		String nmem_pay_method = request.getParameter("pay_method");
		String nmem_order_delivery_method = request.getParameter("delivery_method");
		int nmem_order_price = Integer.parseInt(request.getParameter("order_price"));
		String nmem_order_publicdoor_method = request.getParameter("public_door");
		String nmem_order_jik = request.getParameter("jik");
		String nmem_order_request = request.getParameter("order_request");
		String nmem_order_location = request.getParameter("accept");
		String nmem_order_phone = request.getParameter("order_phone");
		String nmem_order_name = request.getParameter("order_name");
		String nmem_order_address = request.getParameter("order_address");
		String prod_name = request.getParameter("prod_name");
		
		String sql = "insert into nmem_order_pay (nmem_order_quantity, prod_id, nmem_order_price, nmem_order_pay_method, nmem_order_delivery_method, userid, nmem_order_publicdoor_method, nmem_order_jik, nmem_order_request, nmem_order_location, nmem_order_writeday, nmem_order_phone, nmem_order_name, nmem_order_address, prod_name ) ";
		sql = sql + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareCall(sql);
		pstmt.setInt(1, nmem_order_quantity);
		pstmt.setString(2, prod_id);
		pstmt.setInt(3, nmem_order_price);
		pstmt.setString(4, nmem_pay_method);
		pstmt.setString(5, nmem_order_delivery_method);
		pstmt.setString(6, userid);
		pstmt.setString(7, nmem_order_publicdoor_method);
		pstmt.setString(8, nmem_order_jik);
		pstmt.setString(9, nmem_order_request);
		pstmt.setString(10, nmem_order_location);
		pstmt.setString(11, nmem_order_phone);
		pstmt.setString(12, nmem_order_name);
		pstmt.setString(13, nmem_order_address);
		pstmt.setString(14, prod_name);
		pstmt.executeUpdate();
		pstmt.close();
		
		String sql2 = "update nmem_order_pay set nmem_order_state=1";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql2);
		stmt.close();
		conn.close();
	}
	
	public ArrayList<NonMemOrderDto> nmem_order_list(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from nmem_order_pay where userid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ArrayList<NonMemOrderDto> nmolist = new ArrayList<NonMemOrderDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			NonMemOrderDto nmodto = new NonMemOrderDto();
			nmodto.setNmem_order_id(rs.getInt("nmem_order_id"));
			nmodto.setNmem_order_writeday(rs.getString("nmem_order_writeday"));
			nmodto.setNmem_order_quantity(rs.getInt("nmem_order_quantity"));
			nmodto.setProd_id(rs.getString("prod_id"));
			nmodto.setNmem_order_price(rs.getInt("nmem_order_price"));
			nmodto.setNmem_order_pay_method(rs.getString("nmem_order_pay_method"));
			nmodto.setNmem_order_delivery_method(rs.getString("nmem_order_delivery_method"));
			nmodto.setUserid(rs.getString("userid"));
			nmodto.setNmem_order_publicdoor_method(rs.getString("nmem_order_publicdoor_method"));
			nmodto.setNmem_order_jik(rs.getString("nmem_order_jik"));
			nmodto.setNmem_order_request(rs.getString("nmem_order_request"));
			nmodto.setNmem_order_location(rs.getString("nmem_order_location"));
			nmodto.setNmem_order_phone(rs.getString("nmem_order_phone"));
			nmodto.setNmem_order_name(rs.getString("nmem_order_name"));
			nmodto.setNmem_order_address(rs.getString("nmem_order_address"));
			nmodto.setNmem_order_state(rs.getInt("nmem_order_state"));
			nmodto.setProd_name(rs.getString("prod_name"));
			nmolist.add(nmodto);
		}
		return nmolist;
	}
	
	public NonMemOrderDto nmem_order_delivery(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from nmem_order_pay where userid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		NonMemOrderDto nmodto = new NonMemOrderDto();
		nmodto.setNmem_order_id(rs.getInt("nmem_order_id"));
		nmodto.setNmem_order_pay_method(rs.getString("nmem_order_pay_method"));
		nmodto.setNmem_order_delivery_method(rs.getString("nmem_order_delivery_method"));
		nmodto.setUserid(rs.getString("userid"));
		nmodto.setNmem_order_publicdoor_method(rs.getString("nmem_order_publicdoor_method"));
		nmodto.setNmem_order_jik(rs.getString("nmem_order_jik"));
		nmodto.setNmem_order_request(rs.getString("nmem_order_request"));
		nmodto.setNmem_order_location(rs.getString("nmem_order_location"));
		nmodto.setNmem_order_phone(rs.getString("nmem_order_phone"));
		nmodto.setNmem_order_name(rs.getString("nmem_order_name"));
		nmodto.setNmem_order_address(rs.getString("nmem_order_address"));
		nmodto.setNmem_order_state(rs.getInt("nmem_order_state"));
		return nmodto;
	}
	
	public ResultSet cart_quantity(HttpSession session) throws Exception
	{
		String userid = session.getAttribute("userid").toString();
		String sql = "select count(*) as cnt from product as p, cart as c where p.prod_id = c.prod_id and c.m_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	
	public ResultSet cart_total_price(HttpSession session) throws Exception
	{
		String userid = session.getAttribute("userid").toString();
		String sql = "select sum(c.cart_quantity*p.prod_price) as total from product as p, cart as c where p.prod_id = c.prod_id and c.m_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	
	public void nmem_order_cart_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		PreparedStatement pstmt = null;
		String nmem_order_pay_method = request.getParameter("pay_method");
		String nmem_order_delivery_method = request.getParameter("delivery_method");
		String nmem_order_publicdoor_method = request.getParameter("public_door");
		String nmem_order_jik = request.getParameter("jik");
		String nmem_order_request = request.getParameter("order_request");
		String nmem_order_location = request.getParameter("accept");
		String nmem_order_phone = request.getParameter("order_phone");
		String nmem_order_name = request.getParameter("order_name");
		String nmem_order_address = request.getParameter("order_address");
		for(int i=0; i<cart_quantity; i++) {
			int nmem_order_quantity = Integer.parseInt(request.getParameterValues("order_quantity")[i]);
			String prod_id = request.getParameterValues("prod_id")[i];
			int nmem_order_price = Integer.parseInt(request.getParameterValues("order_price")[i]);
			String prod_name = request.getParameterValues("prod_name")[i];
			String sql = "insert into nmem_order_pay (nmem_order_quantity, prod_id, nmem_order_price, nmem_order_pay_method, prod_name, userid, nmem_order_delivery_method, nmem_order_publicdoor_method, nmem_order_jik, nmem_order_request, nmem_order_location, nmem_order_writeday, nmem_order_phone, nmem_order_name, nmem_order_address ) ";
			sql = sql + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nmem_order_quantity);
			pstmt.setString(2, prod_id);
			pstmt.setInt(3, nmem_order_price);
			pstmt.setString(4, nmem_order_pay_method);
			pstmt.setString(5, prod_name);
			pstmt.setString(6, userid);
			pstmt.setString(7, nmem_order_delivery_method);
			pstmt.setString(8, nmem_order_publicdoor_method);
			pstmt.setString(9, nmem_order_jik);
			pstmt.setString(10, nmem_order_request);
			pstmt.setString(11, nmem_order_location);
			pstmt.setString(12, nmem_order_phone);
			pstmt.setString(13, nmem_order_name);
			pstmt.setString(14, nmem_order_address);
			pstmt.executeUpdate();
		}
		pstmt.close();
		
		String sql2 = "update nmem_order_pay set nmem_order_state=1";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql2);
		stmt.close();
		conn.close();
	}
}
