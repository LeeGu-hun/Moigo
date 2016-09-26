package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
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
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User(
					rs.getString("userName"), rs.getString("userNick"),
					rs.getString("userPw"), rs.getString("userGender"),
					rs.getString("userAddr"), rs.getString("userPhone"),
					rs.getTimestamp("userRegdate"), rs.getInt("userAge"));
				user.setUserID(rs.getString("userID"));
				return user;
			}
		}, userID);

		return results.isEmpty() ? null : results.get(0);
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

	public void insert(final Member member) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MEMBER (EMAIL, PASSWORD, NAME, REGDATE) " + "values (?, ?, ?, ?)",
						new String[] { "ID" });
				pstmt.setString(1, member.getEmail());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getName());
				pstmt.setTimestamp(4, new Timestamp(member.getRegisterDate().getTime()));
				return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		member.setId(keyValue.longValue());
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
