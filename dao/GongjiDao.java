package ssg.dao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import ssg.dto.GongjiDto;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GongjiDao {

	Connection conn=null;
	public GongjiDao() throws SQLException
	{
//		String db="jdbc:mysql://localhost:3306/ssg"; 
//		conn=DriverManager.getConnection(db,"root","1234");
		String db="jdbc:mysql://192.168.0.137/ssg"; 
		conn=DriverManager.getConnection(db,"admin","1234");
	}
	public void gongwrite_ok(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		String sql="insert into gongji (title,content,writeday) values (?,?,now())";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		response.sendRedirect("gonglist.jsp");	
	}
	public ArrayList<GongjiDto> gonglist(int index) throws SQLException
	{
		String sql="select * from gongji order by id desc limit ?, 10";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, index);
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<GongjiDto> glist=new ArrayList<GongjiDto>();
		while(rs.next())
		{
			GongjiDto gdto=new GongjiDto();
			gdto.setId(rs.getInt("id"));
			gdto.setTitle(rs.getString("title"));
			gdto.setContent(rs.getString("content").replace("\r\n", "<br>"));
			gdto.setWriteday(rs.getString("writeday"));
			glist.add(gdto);
		}
		return glist;
	}
	public GongjiDto gongupdate(HttpServletRequest request) throws SQLException
	{
		String id=request.getParameter("id");
		String sql="select * from gongji where id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		GongjiDto gdto=new GongjiDto();
		gdto.setId(rs.getInt("id"));
		gdto.setTitle(rs.getString("title"));
		gdto.setContent(rs.getString("content"));
		gdto.setWriteday(rs.getString("writeday"));
		return gdto;
	}
	public void gongupdate_ok(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		String sql="update gongji set title=?, content=? where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setString(3,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		response.sendRedirect("gonglist.jsp");	
	}
	public void gongdelete(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		
		String sql="delete from gongji where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		response.sendRedirect("gonglist.jsp");	
	}
	public int gong_cnt(HttpServletRequest request) throws SQLException
	{
		int cnt;
		String sql="select count(*) as cnt from gongji";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		rs.next();
		cnt=rs.getInt("cnt");
		return cnt;
	}
}

































