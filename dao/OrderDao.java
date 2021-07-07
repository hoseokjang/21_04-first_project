package ssg.dao;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import ssg.dto.CartDto;
import ssg.dto.OrderDto;

public class OrderDao {
	Connection conn;
	public OrderDao() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://192.168.0.137/ssg";
		conn=DriverManager.getConnection(db,"admin","1234");
	}
	
	public String order_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		int order_quantity = Integer.parseInt(request.getParameter("order_quantity").toString());
		String prod_id = request.getParameter("prod_id");
		String pay_method = request.getParameter("pay_method");
		String order_delivery_method = request.getParameter("delivery_method");
		int order_price = Integer.parseInt(request.getParameter("order_price").toString());
		int user_point = Integer.parseInt(request.getParameter("user_point").toString());
		int point = Integer.parseInt(request.getParameter("used_point").toString());
		int remain_point = user_point - point;
		Random ran=new Random();
		String order_no="o"+Long.toString(System.currentTimeMillis())+Integer.toString(ran.nextInt(1000));
		String order_publicdoor_method = request.getParameter("public_door");
		String order_jik = request.getParameter("jik");
		String order_request = request.getParameter("order_request");
		String order_location = request.getParameter("accept");
		String order_phone = request.getParameter("order_phone");
		String order_name = request.getParameter("order_name");
		String order_address = request.getParameter("order_address");
		String prod_name = request.getParameter("prod_name");
		
		String sql = "insert into order_pay (order_quantity, prod_id, order_price, order_pay_method, order_delivery_method, point, userid, order_publicdoor_method, order_jik, order_request, order_location, order_writeday, order_phone, order_name, order_address, prod_name, order_no ) ";
		sql = sql + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareCall(sql);
		pstmt.setInt(1, order_quantity);
		pstmt.setString(2, prod_id);
		pstmt.setInt(3, order_price);
		pstmt.setString(4, pay_method);
		pstmt.setString(5, order_delivery_method);
		pstmt.setInt(6, point);
		pstmt.setString(7, userid);
		pstmt.setString(8, order_publicdoor_method);
		pstmt.setString(9, order_jik);
		pstmt.setString(10, order_request);
		pstmt.setString(11, order_location);
		pstmt.setString(12, order_phone);
		pstmt.setString(13, order_name);
		pstmt.setString(14, order_address);
		pstmt.setString(15, prod_name);
		pstmt.setString(16, order_no);
		pstmt.executeUpdate();
		pstmt.close();
		
		String sql2 = "update order_pay set order_state=1";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql2);
		stmt.close();
		
		String sql3 = "update member set point=? where userid=?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql3);
		pstmt1.setInt(1, remain_point);
		pstmt1.setString(2, userid);
		pstmt1.executeUpdate();
		pstmt1.close();
		
		conn.close();
		
		return order_no;
	}
	
	public ArrayList<OrderDto> order_list(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String order_no = request.getParameter("order_no");
		String sql = "select * from order_pay where userid=? and order_no=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, order_no);
		ArrayList<OrderDto> olist = new ArrayList<OrderDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderDto odto = new OrderDto();
			odto.setOrder_id(rs.getInt("order_id"));
			odto.setWriteday(rs.getString("order_writeday"));
			odto.setOrder_quantity(rs.getInt("order_quantity"));
			odto.setProd_id(rs.getString("prod_id"));
			odto.setOrder_price(rs.getInt("order_price"));
			odto.setOrder_pay_method(rs.getString("order_pay_method"));
			odto.setOrder_delivery_method(rs.getString("order_delivery_method"));
			odto.setPoint(rs.getInt("point"));
			odto.setUserid(rs.getString("userid"));
			odto.setOrder_publicdoor_method(rs.getString("order_publicdoor_method"));
			odto.setOrder_jik(rs.getString("order_jik"));
			odto.setOrder_request(rs.getString("order_request"));
			odto.setOrder_location(rs.getString("order_location"));
			odto.setOrder_phone(rs.getString("order_phone"));
			odto.setOrder_name(rs.getString("order_name"));
			odto.setOrder_address(rs.getString("order_address"));
			odto.setOrder_state(rs.getInt("order_state"));
			odto.setProd_name(rs.getString("prod_name"));
			odto.setOrder_no(rs.getString("order_no"));
			olist.add(odto);
		}
		return olist;
	}
	
	public ArrayList<OrderDto> order_list_all(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from order_pay where userid=? order by order_id desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ArrayList<OrderDto> olist = new ArrayList<OrderDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderDto odto = new OrderDto();
			odto.setOrder_id(rs.getInt("order_id"));
			odto.setWriteday(rs.getString("order_writeday"));
			odto.setOrder_quantity(rs.getInt("order_quantity"));
			odto.setProd_id(rs.getString("prod_id"));
			odto.setOrder_price(rs.getInt("order_price"));
			odto.setOrder_pay_method(rs.getString("order_pay_method"));
			odto.setOrder_delivery_method(rs.getString("order_delivery_method"));
			odto.setPoint(rs.getInt("point"));
			odto.setUserid(rs.getString("userid"));
			odto.setOrder_publicdoor_method(rs.getString("order_publicdoor_method"));
			odto.setOrder_jik(rs.getString("order_jik"));
			odto.setOrder_request(rs.getString("order_request"));
			odto.setOrder_location(rs.getString("order_location"));
			odto.setOrder_phone(rs.getString("order_phone"));
			odto.setOrder_name(rs.getString("order_name"));
			odto.setOrder_address(rs.getString("order_address"));
			odto.setOrder_state(rs.getInt("order_state"));
			odto.setProd_name(rs.getString("prod_name"));
			odto.setOrder_no(rs.getString("order_no"));
			olist.add(odto);
		}
		return olist;
	}
	
	public OrderDto order_delivery(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from order_pay where userid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		OrderDto odto = new OrderDto();
		odto.setOrder_id(rs.getInt("order_id"));
		odto.setOrder_pay_method(rs.getString("order_pay_method"));
		odto.setOrder_delivery_method(rs.getString("order_delivery_method"));
		odto.setUserid(rs.getString("userid"));
		odto.setOrder_publicdoor_method(rs.getString("order_publicdoor_method"));
		odto.setOrder_jik(rs.getString("order_jik"));
		odto.setOrder_request(rs.getString("order_request"));
		odto.setOrder_location(rs.getString("order_location"));
		odto.setOrder_phone(rs.getString("order_phone"));
		odto.setOrder_name(rs.getString("order_name"));
		odto.setOrder_address(rs.getString("order_address"));
		odto.setOrder_state(rs.getInt("order_state"));
		odto.setOrder_no(rs.getString("order_no"));
		return odto;
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
	
	public String order_cart_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity").toString());
		PreparedStatement pstmt = null;
		int user_point = Integer.parseInt(request.getParameter("user_point").toString());
		int point = Integer.parseInt(request.getParameter("used_point").toString());
		int remain_point = user_point - point;
		String pay_method = request.getParameter("pay_method");
		String order_delivery_method = request.getParameter("delivery_method");
		String order_publicdoor_method = request.getParameter("public_door");
		String order_jik = request.getParameter("jik");
		String order_request = request.getParameter("order_request");
		String order_location = request.getParameter("accept");
		String order_phone = request.getParameter("order_phone");
		String order_name = request.getParameter("order_name");
		String order_address = request.getParameter("order_address");
		Random ran=new Random();
		String order_no="o"+Long.toString(System.currentTimeMillis())+Integer.toString(ran.nextInt(1000));
		for(int i=0; i<cart_quantity; i++) {
			int order_quantity = Integer.parseInt(request.getParameterValues("order_quantity")[i].toString());
			String prod_id = request.getParameterValues("prod_id")[i];
			int order_price = Integer.parseInt(request.getParameterValues("order_price")[i].toString());
			String prod_name = request.getParameterValues("prod_name")[i];
			String sql = "insert into order_pay (order_quantity, prod_id, order_price, order_pay_method, point, prod_name, userid, order_delivery_method, order_publicdoor_method, order_jik, order_request, order_location, order_writeday, order_phone, order_name, order_address, order_no ) ";
			sql = sql + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_quantity);
			pstmt.setString(2, prod_id);
			pstmt.setInt(3, order_price);
			pstmt.setString(4, pay_method);
			pstmt.setInt(5, point);
			pstmt.setString(6, prod_name);
			pstmt.setString(7, userid);
			pstmt.setString(8, order_delivery_method);
			pstmt.setString(9, order_publicdoor_method);
			pstmt.setString(10, order_jik);
			pstmt.setString(11, order_request);
			pstmt.setString(12, order_location);
			pstmt.setString(13, order_phone);
			pstmt.setString(14, order_name);
			pstmt.setString(15, order_address);
			pstmt.setString(16, order_no);
			pstmt.executeUpdate();
		}
		pstmt.close();
		
		String sql2 = "update order_pay set order_state=1";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql2);
		stmt.close();
		
		String sql3 = "update member set point=? where userid=?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql3);
		pstmt1.setInt(1, remain_point);
		pstmt1.setString(2, userid);
		pstmt1.executeUpdate();
		pstmt1.close();
		
		conn.close();
		return order_no;
	}
}
