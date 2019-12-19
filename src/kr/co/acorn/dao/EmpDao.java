package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.EmpDto;
import kr.co.acorn.util.ConnLocator;

public class EmpDao {
	private static EmpDao single;

	private EmpDao()
	{
	}

public static EmpDao getInstance() {
	if (single == null) {
		single = new EmpDao();
	}
	return single;
}

public boolean insert(EmpDto dto) {
	boolean isSuccess = false;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try {
		con = ConnLocator.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("");
		sql.append("");
		sql.append("");
		
		
		pstmt = con.prepareStatement(sql.toString());
		int index = 0;
		//copy해서써
		pstmt.setInt(++index, );
		pstmt.setString(++index, );
		
		pstmt.executeUpdate();
		isSuccess = true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e2) {
			// TODO: handle exception
		}
	}
	return isSuccess;
}



public ArrayList<EmpDto> select(){
	ArrayList<EmpDto> list = new ArrayList<EmpDto>();
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = ConnLocator.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("");
		sql.append("");
		sql.append("");
		sql.append("");
		pstmt = con.prepareStatement(sql.toString());
		int index = 0;
		pstmt.setInt(++index, );
		pstmt.setString(++index, );
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
			index = 0;
			int x = rs.getInt(++index);
			String y= rs.getString(++index);
			list.add(new ???Dto(x,y));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e2) {
			// TODO: handle exception
		}
	}
	return list;
}


public EmpDto select(int no) {
	EmpDto dto= null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("");
			sql.append("");
			sql.append("" );
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index, ?);
			pstmt.setString(++index,?);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 0;
				
				int x = rs.getInt(++index);
				String y = rs.getString(++index);
				String loc = rs.getString(++index);
				dto=new EmpDto(x,y);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return dto;
}
}