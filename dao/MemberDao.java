package ssg.dao;

import java.io.UnsupportedEncodingException;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import ssg.dto.MemberDto;
import ssg.dto.ProductDto;

public class MemberDao {

	Connection conn;
	public MemberDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
   	    String db="jdbc:mysql://192.168.0.137/ssg";
   	    conn=DriverManager.getConnection(db,"admin","1234");
//  	    String db="jdbc:mysql://localhost:3306/ssg"; 
//   	    conn=DriverManager.getConnection(db,"root","1234"); //=> 집에서
	}
	
	//회원가입
    public void member_ok(HttpServletRequest request,HttpServletResponse response) throws Exception
    {
       request.setCharacterEncoding("utf-8");
       String userid=request.getParameter("userid");
       String pwd=request.getParameter("pwd");
       String name=request.getParameter("name");
       String phone=request.getParameter("phone");
       String email=request.getParameter("email");
       String zip = request.getParameter("zip");
	   String address1 = request.getParameter("juso");
	   String address2 = request.getParameter("juso_etc");
	   String address = "["+zip+"] "+address1+" "+address2;
       
       
       String sql="insert into member(userid,pwd,name,phone,email,writeday,state, point)"
             + "values(?,?,?,?,?,now(),0, 5000)";
       PreparedStatement pstmt=conn.prepareStatement(sql);
       pstmt.setString(1, userid);
       pstmt.setString(2, pwd);
       pstmt.setString(3, name);
       pstmt.setString(4, phone);
       pstmt.setString(5, email);
       pstmt.executeUpdate();
       pstmt.close();
       
       String sql2 = "insert into mem_address(userid, address, address_name, address_phone)";
       sql2 = sql2 + " values (?, ?, ?, ?)";
       PreparedStatement pstmt2=conn.prepareStatement(sql2);
       pstmt2.setString(1, userid);
       pstmt2.setString(2, address);
       pstmt2.setString(3, name);
       pstmt2.setString(4, phone);
       pstmt2.executeUpdate();
       pstmt2.close();
       conn.close();
    }
	
	public int login_ok(HttpServletRequest request,HttpSession session) throws Exception
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		String sql="select * from member where userid=? and pwd=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		
		ResultSet rs=pstmt.executeQuery();
		int chk=0;
		if(rs.next())  // 로그인 성공 =>  ../main/index.jsp이동
		{
			session.setAttribute("userid",rs.getString("userid"));
			session.setAttribute("name",rs.getString("name"));
			session.setAttribute("state", rs.getInt("state"));
		}
		else  // 로그인 실패 => login.jsp로 다시 이동
		{
			chk=1;
		}
		
		return chk;
	}
	
	
	
	//아이디찾기
		public void userid_search_ok(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session) throws Exception
		{
			request.setCharacterEncoding("utf-8");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			String sql="select userid from member where name=? and phone=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			ResultSet rs=pstmt.executeQuery();
			int chk=0;
			if(rs.next())
			{
				session.setAttribute("imsi", rs.getString("userid"));
				chk=1;
			}

			
			response.sendRedirect("userid_search.jsp?chk="+chk);
		}
		
		//비밀번호 찾기
		public void pwd_search_ok(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session) throws Exception
		{
			request.setCharacterEncoding("utf-8");
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			String sql="select pwd from member where userid=? and name=? and phone=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			ResultSet rs=pstmt.executeQuery();
			int chk=0;
			if(rs.next())
			{
				session.setAttribute("imsi",rs.getString("pwd"));
				chk=1;
			}
			
			response.sendRedirect("pwd_search.jsp?chk="+chk);
		}
		
		public void userid_check(HttpServletRequest request,JspWriter out) throws Exception
		{
			String userid=request.getParameter("userid");
			
			String sql="select * from member where userid=?";
		
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			  out.print("1"); // 사용불가능 아이디
			else
			  out.print("0"); // 사용가능 아이디
		}
		
		public void nonuser_login_ok(HttpServletRequest request,HttpServletResponse response) throws Exception
		{
			request.setCharacterEncoding("utf-8");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			
			String sql="insert into member(name,phone,email,address,writeday) values(?,?,?,?,now())";
					
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			response.sendRedirect("../main/index.jsp");
		}
		
		public void update_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
		{
			request.setCharacterEncoding("utf-8");
			String userid=session.getAttribute("userid").toString();
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String id=request.getParameter("id");
			
			String sql="update member inner join mem_address on member.userid=? and mem_address.userid=?"
					+" set member.phone=?, member.email=?, mem_address.address=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userid);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
			response.sendRedirect("myssg.jsp");
		}
		
		public MemberDto mem_content(HttpServletRequest request, HttpSession session) throws Exception
        {
           String userid = session.getAttribute("userid").toString();
           String sql = "select * from member where userid=?";
           PreparedStatement pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, userid);
           ResultSet rs = pstmt.executeQuery();
           rs.next();
           MemberDto mdto = new MemberDto();
           mdto.setId(rs.getInt("id"));
           mdto.setName(rs.getString("name"));
           mdto.setPhone(rs.getString("phone"));
           mdto.setEmail(rs.getString("email"));
           mdto.setPoint(rs.getInt("point"));
           mdto.setWriteday(rs.getString("writeday"));
           
           return mdto;
        }
		
		public int delete_ok(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception
		{
			String userid = session.getAttribute("userid").toString();
			String pwd=request.getParameter("pwd");
			String sql = "select pwd from member where userid=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			PreparedStatement pstmt,pstmt2;
			int chk;
			if(pwd.equals(rs.getString("pwd"))) {
				String sql2="delete from member where userid=?";
				pstmt=conn.prepareStatement(sql2);
				pstmt.setString(1, userid);
				pstmt.executeUpdate();
				String sql3 ="delete from mem_address where userid=?";
				pstmt2=conn.prepareStatement(sql3);				
				pstmt2.setString(1, userid);
				pstmt2.executeUpdate();
				
				pstmt.close();
				pstmt2.close();
				session.invalidate();
				chk=0;
			}
			else
				chk = 1;
			
			stmt.close();
			conn.close();
			
			return chk;
		}	
}
