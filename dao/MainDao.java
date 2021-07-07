package ssg.dao;
import ssg.dto.ProductDto;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainDao {

	Connection conn=null;
	public MainDao() throws SQLException
	{
//		String db="jdbc:mysql://localhost:3306/ssg"; 
//		conn=DriverManager.getConnection(db,"root","1234");
		String db="jdbc:mysql://192.168.0.137/ssg"; 
		conn=DriverManager.getConnection(db,"admin","1234");
	}
	
	public ArrayList<ProductDto> mainul1() throws SQLException
	{
		String sql="select m1.id,p1.* from main1ul as m1,product as p1 where m1.prod_id=p1.prod_id";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setMain1ul(rs.getInt("id"));
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist.add(pdto);
		}
		return plist;
	}
	
	public ArrayList<ProductDto> mainul2() throws SQLException
	{
		String sql="select * from product order by prod_readnum desc limit 9";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist2=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist2.add(pdto);
		}
		return plist2;
	}
	
	public ArrayList<ProductDto> mainul3_1() throws SQLException
	{
		String sql="select * from product where prod_category='fruit' order by prod_readnum desc limit 5";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist3_1=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist3_1.add(pdto);
		}
		return plist3_1;
	}
	
	public ArrayList<ProductDto> mainul3_2() throws SQLException
	{
		String sql="select * from product where prod_category='vegetable' order by prod_readnum desc limit 5";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist3_2=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist3_2.add(pdto);
		}
		return plist3_2;
	}
	public ArrayList<ProductDto> mainul3_3() throws SQLException
	{
		String sql="select * from product where prod_category='fish' order by prod_readnum desc limit 5";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist3_3=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist3_3.add(pdto);
		}
		return plist3_3;
	}
	public ArrayList<ProductDto> mainul3_4() throws SQLException
	{
		String sql="select * from product where prod_category='pork' order by prod_readnum desc limit 5";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<ProductDto> plist3_4=new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto=new ProductDto();
			pdto.setProd_category(rs.getString("prod_category"));
			pdto.setProd_dcategory(rs.getString("prod_dcategory"));
			pdto.setProd_opt1(rs.getString("prod_opt1"));
			pdto.setProd_id(rs.getString("prod_id"));
			pdto.setProd_name(rs.getString("prod_name"));
			pdto.setProd_num(rs.getInt("prod_num"));
			pdto.setProd_opt2(rs.getString("prod_opt2"));
			pdto.setProd_price(rs.getInt("prod_price"));
			pdto.setProd_opt3(rs.getString("prod_opt3"));
			pdto.setProd_rate(rs.getFloat("prod_rate"));
			pdto.setProd_readnum(rs.getInt("prod_readnum"));
			pdto.setProd_opt4(rs.getString("prod_opt4"));
			pdto.setProd_writeday(rs.getString("prod_writeday"));
			
			plist3_4.add(pdto);
		}
		return plist3_4;
	}
	
	public void m1update_ok(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String prod_id=request.getParameter("prod_id");
		
		String sql="update main1ul set prod_id=? where id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, prod_id);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("ssgindex.jsp");
	}
	
	public ArrayList<ProductDto> ssgsearch(HttpServletRequest request,int index) throws UnsupportedEncodingException, SQLException
	{
		request.setCharacterEncoding("utf-8");
		String searchbar=request.getParameter("searchbar").toString().trim(); //공백제거 검색어 공백안넘어가게하는건 자바스크립트에서 안넘어가게 설정하기?
		int chk=Integer.parseInt(request.getParameter("chk").toString());
		String sql = null;
		String sql2 = null;
		ArrayList<ProductDto> pslist=new ArrayList<ProductDto>();
		if(searchbar.length()!=0)
		{
			if(chk==0)
			{
				sql="select * from product where prod_name like '%"+searchbar+"%' order by prod_rate desc limit "+index+", 20";
			}
			else if(chk==1)
			{
				sql="select * from product where prod_name like '%"+searchbar+"%' order by prod_price limit "+index+", 20";
			}
			else if(chk==2)
			{
				sql="select * from product where prod_name like '%"+searchbar+"%' order by prod_price desc limit "+index+", 20";
			}
			Statement stmt=conn.createStatement();		
			ResultSet rs=stmt.executeQuery(sql);
			
			
			while(rs.next())
			{
				ProductDto pdto=new ProductDto();
				pdto.setProd_category(rs.getString("prod_category"));
				pdto.setProd_dcategory(rs.getString("prod_dcategory"));
				pdto.setProd_opt1(rs.getString("prod_opt1"));
				pdto.setProd_id(rs.getString("prod_id"));
				pdto.setProd_name(rs.getString("prod_name"));
				pdto.setProd_num(rs.getInt("prod_num"));
				pdto.setProd_opt2(rs.getString("prod_opt2"));
				pdto.setProd_price(rs.getInt("prod_price"));
				pdto.setProd_opt3(rs.getString("prod_opt3"));
				pdto.setProd_rate(rs.getFloat("prod_rate"));
				pdto.setProd_readnum(rs.getInt("prod_readnum"));
				pdto.setProd_opt4(rs.getString("prod_opt4"));
				pdto.setProd_writeday(rs.getString("prod_writeday"));
				
				pslist.add(pdto);
			}
		}
		else
		{
			return pslist;
		}
		return pslist;
	}
	public int search_cnt(HttpServletRequest request) throws UnsupportedEncodingException, SQLException
	{
		request.setCharacterEncoding("utf-8");
		String searchbar=request.getParameter("searchbar").toString().trim(); //공백제거 검색어 공백안넘어가게하는건 자바스크립트에서 안넘어가게 설정하기?
		int cnt = 0;
		if(searchbar.length()!=0)
		{
			String sql2="select count(*) as cnt from product where prod_name like '%"+searchbar+"%'";
			Statement stmt2=conn.createStatement();
			ResultSet rs2=stmt2.executeQuery(sql2);
			rs2.next();
			cnt=rs2.getInt("cnt");
		}
		return cnt;
	}
}



























