package twoline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OnelineDAO { // Data Access Object
	private String url = "jdbc:mysql://localhost/testsql?characterEncoding=UTF-8&serverTimezone=UTC";
	private String user = "root";
	private String passwd = "1234";
	
	/*
	public OnelineDAO() {
		this.url = "jdbc:mysql://localhost/testsql?characterEncoding=UTF-8&serverTimezone=UTC";
		this.user = "root";
		this.passwd = "1234";
	}
	*/
	
	private Connection connect() {	// JDBC 연결 메소드
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, passwd);
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return con;		// 연결한 객체를 반환
	}
	
	// 리스트형식의 DTO 제네릭을 반환할 메소드 : DB의 row를 담고 있는 DTO의 ArrayList를 생성할 메소드
	public ArrayList<OnelineDTO> getList() { 
		Connection con = null;		// DB와 연결된 객체를 받을 변수
		String sql = "select * from oneline order by no desc";  // no기준 내림차순 정렬
		ResultSet rs = null;			// 결과 리스트를 받을 ResultSet
		PreparedStatement pstmt = null;	// 준비된 문장으로 쿼리를 수행할 객체 생성
		
		ArrayList<OnelineDTO> dtos = new ArrayList<OnelineDTO>();	// OnelineDTO 객체를 저장할 ArrayList
		con = connect();			// JDBC와 연결된 객체 생성
		
		try {
			pstmt = con.prepareStatement(sql);		// 쿼리 실행
			rs = pstmt.executeQuery(); // select
			
			while(rs.next()) {				// 객체가 존재하면
				int no = rs.getInt("no");
				String memo = rs.getString("memo");
				String wdate = rs.getString("wdate");
				
				OnelineDTO dto = new OnelineDTO(no, memo, wdate); // DB 내용을 dto에 저장
				dtos.add(dto);	// dto를 ArrayList에 저장
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {	// 작업이 끝난 메모리 생성 역순으로 해제
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		return dtos;
	}
	
	public void insert(OnelineDTO dto) {
		Connection con = null;
		String sql = "insert into oneline(memo) values(?)";
		PreparedStatement pstmt = null;
		
		con = connect();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMemo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void delete(OnelineDTO dto) {
		Connection con = connect();
		String sql = "delete from oneline where no="+dto.getNo();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	public void delete(int no) {
		Connection con = connect();
		String sql = "delete from oneline where no="+no;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
