package ssg.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.*;

import ssg.dto.AddressDto;

public class AddressDao {
	Connection conn;
	public AddressDao() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://192.168.0.137/ssg";
		conn=DriverManager.getConnection(db,"admin","1234");
	}
	
	public ResultSet a_list(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from mem_address where userid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	
	public ResultSet a_list_one(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select * from mem_address where userid=? order by address_id limit 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	
	public int a_list_count(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String sql = "select count(*) as cnt from mem_address where userid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt("cnt");
		return cnt;
	}
	
	public void a_write_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String tel = request.getParameter("tel");
		String zip = request.getParameter("zip");
		String address1 = request.getParameter("juso");
		String address2 = request.getParameter("juso_etc");
		String address = "["+zip+"] "+address1+" "+address2;
		
		String sql = "insert into mem_address (userid, address, address_nickname, address_name, address_phone, address_tel )";
		sql = sql + " values (?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, address);
		pstmt.setString(3, nickname);
		pstmt.setString(4, name);
		pstmt.setString(5, phone);
		pstmt.setString(6, tel);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	public ResultSet a_update(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String id = request.getParameter("address_id");
		
		String sql = "select * from mem_address where userid=? and address_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, id);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	
	public void a_update_ok(HttpServletRequest request, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = session.getAttribute("userid").toString();
		String id = request.getParameter("address_id");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		String sql = "update mem_address set address_nickname=?, address_name=?, address_phone=?, address_tel=?, address=? ";
		sql = sql + " where userid=? and address_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);
		pstmt.setString(4, tel);
		pstmt.setString(5, address);
		pstmt.setString(6, userid);
		pstmt.setString(7, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
}
