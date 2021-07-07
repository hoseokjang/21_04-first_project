package ssg.dao;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ssg.dto.ProductDto;
public class ProductDao {
	Connection conn;
	public ProductDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/ssg?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(db,"admin","1234");
	}
	public ResultSet prod_category_get(HttpServletRequest request) throws Exception
	{
		String prod_category = request.getParameter("prod_category");
		String prod_dcategory = request.getParameter("prod_dcategory");
		String sql = null;
		if (prod_dcategory == null)
			sql = "select prod_category from product where prod_category='"+prod_category+"'";
		else if (prod_category == null)
			sql = "select prod_category from product where prod_dcategory='"+prod_dcategory+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		return rs;
	}
	public ResultSet prod_dcategory_get(HttpServletRequest request) throws Exception
	{	
		String prod_category = request.getParameter("prod_category");
		String prod_dcategory = request.getParameter("prod_dcategory");
		String sql = null;
		if (prod_dcategory == null)
			sql = "select distinct prod_dcategory from product where prod_category='"+prod_category+"'";
		else if (prod_category == null)
		{
			sql = "select distinct prod_dcategory from product where prod_category=(select distinct prod_category from product where prod_dcategory='"+prod_dcategory+"')";
		}
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}
	public ArrayList<ProductDto> prod_list(HttpServletRequest request, int index) throws Exception
	{	
		String sql = null;
		PreparedStatement pstmt = null;
		String prod_category = request.getParameter("prod_category");
		int min_price,max_price;
		String prod_min_price = request.getParameter("min_prod_price");
		String prod_max_price = request.getParameter("max_prod_price");
		if (prod_min_price == null)
			min_price = 0;
		else
			min_price = Integer.parseInt(prod_min_price);
		if (prod_max_price == null)
			max_price = 300000;
		else
			max_price = Integer.parseInt(prod_max_price);
		String ord = request.getParameter("ord");
		int p_ord;
		if (ord == null)
			p_ord = 0;
		else
			p_ord = Integer.parseInt(ord);
		if (p_ord == 1)
		{
			sql = "select * from product where prod_category=? order by prod_rate desc limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_category);
			pstmt.setInt(2, index);
		}
		else if (p_ord == 2)
		{
			sql = "select * from product where prod_category=? order by prod_price limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_category);
			pstmt.setInt(2, index);
		}
		else if (p_ord == 3)
		{
			sql = "select * from product where prod_category=? order by prod_price desc limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_category);
			pstmt.setInt(2, index);
		}
		else
		{
			sql = "select * from product where prod_category=? and prod_price > ? and prod_price < ? limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_category);
			pstmt.setInt(2, min_price);
			pstmt.setInt(3, max_price);
			pstmt.setInt(4, index);
		}
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto = new ProductDto();
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
			
			list.add(pdto);
		}
		return list;
	}
	public ResultSet prod_cate_num(HttpServletRequest request) throws Exception
	{
		String prod_category = request.getParameter("prod_category");
		String sql = "select count(*) as cnt from product where prod_category = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	public ArrayList<ProductDto> prod_dlist(HttpServletRequest request, int index) throws Exception
	{
		String sql = null;
		PreparedStatement pstmt = null;
		String prod_dcategory = request.getParameter("prod_dcategory");
		int min_price,max_price;
		String prod_min_price = request.getParameter("min_prod_price");
		String prod_max_price = request.getParameter("max_prod_price");
		if (prod_min_price == null)
			min_price = 0;
		else
			min_price = Integer.parseInt(prod_min_price);
		if (prod_max_price == null)
			max_price = 300000;
		else
			max_price = Integer.parseInt(prod_max_price);
		String ord = request.getParameter("ord");
		int p_ord;
		if (ord == null)
			p_ord = 0;
		else
			p_ord = Integer.parseInt(ord);
		if (p_ord == 1)
		{
			sql = "select * from product where prod_dcategory=? order by prod_rate desc limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_dcategory);
			pstmt.setInt(2, index);
		}
		else if (p_ord == 2)
		{
			sql = "select * from product where prod_dcategory=? order by prod_price limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_dcategory);
			pstmt.setInt(2, index);
		}
		else if (p_ord == 3)
		{
			sql = "select * from product where prod_dcategory=? order by prod_price desc limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_dcategory);
			pstmt.setInt(2, index);
		}
		else
		{
			sql = "select * from product where prod_dcategory=? and prod_price > ? and prod_price < ? limit ?, 20";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_dcategory);
			pstmt.setInt(2, min_price);
			pstmt.setInt(3, max_price);
			pstmt.setInt(4, index);
		}
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		while(rs.next())
		{
			ProductDto pdto = new ProductDto();
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
			
			list.add(pdto);
		}
		return list;
	}
	public ResultSet prod_dcate_num(HttpServletRequest request) throws Exception
	{
		String prod_dcategory = request.getParameter("prod_dcategory");
		String sql = "select count(*) as cnt from product where prod_dcategory = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_dcategory);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		return rs;
	}
	public void prod_readnum(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String prod_id = request.getParameter("prod_id");
		String sql = "update product set prod_readnum = prod_readnum+1 where prod_id= '"+prod_id+"'";
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		response.sendRedirect("prod_content.jsp?prod_id="+prod_id);
	}
	public ProductDto prod_content(HttpServletRequest request) throws Exception
	{
		String prod_id = request.getParameter("prod_id");
		String sql = "select * from product where prod_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ProductDto pdto = new ProductDto();
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
		
		return pdto;
	}
	public Integer prod_cnt(HttpServletRequest request,String prod_category) throws Exception
	{
		int min_price = 0,max_price = 300000;
		String prod_min_price = request.getParameter("min_prod_price");
		String prod_max_price = request.getParameter("max_prod_price");
		if (prod_min_price == null)
			min_price = 0;
		if (prod_max_price == null)
			max_price = 300000;
		String sql = "select count(*) as cnt from product where prod_category=? and prod_price > ? and prod_price < ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prod_category);
		pstmt.setInt(2, min_price);
		pstmt.setInt(3, max_price);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt("cnt");
		return cnt;
	}
	public Integer prod_dcnt(HttpServletRequest request,String prod_dcategory) throws Exception
	{
		String sql = "select count(*) as cnt from product where prod_dcategory='"+prod_dcategory+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt("cnt");
		return cnt;
	}
}
