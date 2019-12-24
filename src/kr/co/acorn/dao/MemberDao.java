package kr.co.acorn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.acorn.dto.DeptDto;
import kr.co.acorn.dto.MemberDto;
import kr.co.acorn.util.ConnLocator;

public class MemberDao {
	private static MemberDao single;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (single == null) {
			single = new MemberDao();
		}
		return single;
	}
	
	public boolean isEmail(String email) {
		boolean isSuccess = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_email ");
			sql.append("FROM member ");
			sql.append("WHERE m_email = ?");
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setString(++index, email );
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 0;
				isSuccess = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return isSuccess;
	}
	public int getTotalRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(email) ");
			sql.append("FROM member ");
	
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 0;
				count = rs.getInt(++index);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return count;
	}
	
	public boolean insert(MemberDto dto) {
		boolean isSuccess = false;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO member(m_email,m_name,m_pwd,m_phone,m_regdate) VALUES(?,?,?,?,?)");

			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			
			pstmt.setString(++index, dto.getEmail());
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getPassword());
			pstmt.setString(++index, dto.getPhone());
			pstmt.setString(++index, dto.getRegdate());
			

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
	
	public MemberDto select(int no) {
		MemberDto dto= null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = ConnLocator.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT m_email,m_name,m_pwd,m_phone,m_regdate ");
		sql.append("FROM member ");
		sql.append("WHERE email = ? " );
		
		pstmt = con.prepareStatement(sql.toString());
		int index = 0;
		pstmt.setInt(++index, no);
	

		rs = pstmt.executeQuery();
		if(rs.next()) {
			index = 0;
			no = rs.getInt(++index);
			String email = rs.getString(++index);
			String name = rs.getString(++index);
			String password = rs.getString(++index);
			String phone = rs.getString(++index);
			String regdate = rs.getString(++index);
			dto=new MemberDto(email,name,password,phone,regdate);
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

	public ArrayList<MemberDto> select(int start, int len) {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_email,m_name,m_pwd,m_phone,m_regdate ");
			sql.append("FROM member ");
			sql.append("LIMIT ?,? ");
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, len);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 0;
				int no = rs.getInt(++index);
				
				
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String password = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				list.add(new MemberDto(email, name, password,phone,regdate));
			}

		} catch (SQLException e) {
			// TODO Auto-gen520.0erated catch block
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
	
	public boolean update(MemberDto dto) {
		boolean isSuccess= false;
		Connection con =null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE member SET  m_email=?,m_name=?,m_pwd=?,m_phone=?,m_regdate=? WHERE email =?" );

			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setString(++index, dto.getEmail());
			pstmt.setString(++index, dto.getName());
			pstmt.setString(++index, dto.getPassword());
			pstmt.setString(++index, dto.getPhone());
			pstmt.setString(++index, dto.getRegdate());
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
	
	public boolean delete(int no) {
		boolean isSuccess= false;
		Connection con =null;
		PreparedStatement pstmt = null;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM Member WHERE email=? " );

			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			pstmt.setInt(++index, no);

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
	
	
	public MemberDto getMember(MemberDto dto) {
			MemberDto memberDto =null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = ConnLocator.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT m_email,m_name,m_phone,date_format(m_regdate,'%Y/%m/%d') "); 
			
				sql.append("FROM member" );
				sql.append("WHERE m_email =? AND  m_pwd= PASSWORD(?)" );
				
				pstmt = con.prepareStatement(sql.toString());
				int index = 0;
				pstmt.setString(++index, dto.getEmail());
				pstmt.setString(++index,dto.getPassword());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					index = 0;
					String email = rs.getString(++index);
					String name = rs.getString(++index);
					String phone = rs.getString(++index);
					String regdate = rs.getString(++index);
					memberDto = new MemberDto(email,name,null,phone,regdate);
					
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
			return memberDto;
	}
	

}








