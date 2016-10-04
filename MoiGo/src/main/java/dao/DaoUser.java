package dao;

import java.security.Timestamp;
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
	
	public void insert(final User user) {
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
	
	public void update(User user) {
		jdbcTemplate.update("update USERINFO set username = ?, usernick = ?, userpw = ?, usergender = ?, useraddr = ?, userphone = ?, userbirth= ? "
				+ "where userid = ?", 
				user.getUserName(), user.getUserNick(), user.getUserPw(), user.getUserGender(), 
				user.getUserAddr(), user.getUserPhone(), user.getUserID(), user.getUserBirth());
	}
/*
	public Member selectByEmail(String email) {
		List<Member> results = jdbcTemplate.query(
				"select * from MEMBER where EMAIL = ?", 
				new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), 
						rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, email);
		return results.isEmpty() ? null : results.get(0);
	}
	public List<Member> selectByRegdate(Date from, Date to) {
		List<Member> results = jdbcTemplate.query(
			"select * from MEMBER where REGDATE between ? and ? "
			+ "order by REGDATE desc ", 
			new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), 
					rs.getString("PASSWORD"), rs.getString("NAME"),
					rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, from, to);
		return results;
	}
	public void update(Member member) {
		jdbcTemplate.update("update MEMBER set NAME = ?, PASSWORD = ? "
				+ "where EMAIL = ?", 
				member.getName(),
				member.getPassword(), member.getEmail());
	}
	public List<Member> selectAll() {
		System.out.print("----- selectAll ");
		int total = count();
		System.out.println("전체 데이터: " + total);
		List<Member> results = jdbcTemplate.query("select * from MEMBER", new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
						rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		});
		return results;
	}
	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBER", Integer.class);
		return count;
	}
	public void mDelete(Member member) {
		jdbcTemplate.update(
				"delete from MEMBER where EMAIL = ?", 
				member.getEmail());
	}
*/
}