package ssg.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ssg.dto.NonMemberDto;

public class NonMemberDao {
	
	Connection conn;
	public NonMemberDao() throws Exception
	{
			Class.forName("com.mysql.jdbc.Driver");
	   	    String db="jdbc:mysql://192.168.0.137/ssg";
	   	    conn=DriverManager.getConnection(db,"admin","1234");
//   	      	 String db="jdbc:mysql://localhost:3306/ssg"; 
//   	         conn=DriverManager.getConnection(db,"root","1234"); //=> 집에서
	}
	
	public void nonmember_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String zip = request.getParameter("zip");
		String address1 = request.getParameter("juso");
		String address2 = request.getParameter("juso_etc");
		String address = "["+zip+"] "+address1+" "+address2;
		Random ran=new Random();
		String userid="p"+Long.toString(System.currentTimeMillis())+Integer.toString(ran.nextInt(1000));
		String sql="insert into non_member(name,phone,email,address,userid,state)"
				+" values(?,?,?,?,?,1)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, email);
		pstmt.setString(4, address);
		pstmt.setString(5, userid);
		pstmt.executeUpdate();
		session.setAttribute("userid",userid);
		session.setAttribute("name", name);
		session.setAttribute("state", "1");
		session.setAttribute("phone", phone);
		pstmt.close();
		conn.close();
		
		response.sendRedirect("../main/ssgindex.jsp");
	}
	
	public NonMemberDto nmem_content(HttpServletRequest request, HttpSession session) throws Exception
    {
       String userid = session.getAttribute("userid").toString();
       String sql = "select * from non_member where userid=?";
       PreparedStatement pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, userid);
       ResultSet rs = pstmt.executeQuery();
       rs.next();
       NonMemberDto nmdto = new NonMemberDto();
       nmdto.setName(rs.getString("name"));
       nmdto.setPhone(rs.getString("phone"));
       nmdto.setEmail(rs.getString("email"));
       nmdto.setAddress(rs.getString("address"));
       
       return nmdto;
    }
	
	public int nonmember_login_ok(HttpServletRequest request, HttpSession session) throws Exception
	{
		String phone=session.getAttribute("phone").toString();
		String sql="select * from non_member where phone=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		ResultSet rs=pstmt.executeQuery();
		String sql2="select * from nmem_order_pay where nmem_order_phone=?";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, phone);
		ResultSet rs2 = pstmt2.executeQuery();
		int chk=0;
		if(rs.next())  
		{
			if(rs2.next()) {
				session.setAttribute("userid",rs.getString("userid"));
				session.setAttribute("name",rs.getString("name"));
				session.setAttribute("state", rs.getInt("state"));
			} else {
				chk=2;
			}
		}
		else  
		{
			chk=1;
		}
		
		
		return chk;
	}
	
	
			
}
