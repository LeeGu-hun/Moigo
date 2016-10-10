package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import user.User;

public class DaoUser {
	private JdbcTemplate jdbcTemplate;

	public DaoUser(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public User selectById(String userID) {
		List<User> results = jdbcTemplate.query(
				"select * from userinfo where userID = ?", 
				new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				User user = new User(
						rs.getString("userName"), rs.getString("userNick"),
						rs.getString("userPw"), rs.getString("userGender"),
						rs.getString("userAddr"), rs.getString("userPhone"),
						rs.getTimestamp("userRegdate"), rs.getString("userBirth"));
				user.setUserID(rs.getString("userID"));
				return user;
			}
		}, userID);

		return results.isEmpty() ? null : results.get(0);
	}
	
	public void insert(final User user) { // 회원가입
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into USERINFO (userid, username, usernick, userpw, userregdate, usergender, useraddr, userphone, userbirth) " 
						+ "values (?, ?, ?, ?, sysdate, ?, ?, ?, ?)");
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserName());
				pstmt.setString(3, user.getUserNick());
				pstmt.setString(4, user.getUserPw());
				pstmt.setString(5, user.getUserGender());
				pstmt.setString(6, user.getUserAddr());
				pstmt.setString(7, user.getUserPhone());
				pstmt.setString(8, user.getUserBirth());
				return pstmt;
			}
		});
	}
	
	public void update(User user) { // 회원정보수정
		jdbcTemplate.update("update USERINFO set username = ?, userpw = ?, useraddr = ?, userphone = ? "
				+ "where userid = ?", 
				user.getUserName(), user.getUserPw(), user.getUserAddr(),
				user.getUserPhone(), user.getUserID());
	}
}