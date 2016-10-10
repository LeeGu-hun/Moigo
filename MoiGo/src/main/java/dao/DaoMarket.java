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

import group.GroupCate;
import market.Market;
import market.MarketAddProductCommand;
import user.User;

public class DaoMarket {
	private JdbcTemplate jdbcTemplate;
	
	public DaoMarket(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Market> getAllProduct(){ //모든 제품 가져오기
		List<Market> results = jdbcTemplate.query("select * from market order by MKTREGDATE desc", new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getString("mktCode"), rs.getString("mktSeller"), rs.getString("mktPrName"), rs.getString("mktPrice"), 
						rs.getString("mktContent"), rs.getString("grpName"), rs.getDate("mktRegDate"));
				return market;
			}
		});
		return results;
	}
	
	public Market getProduct(String prdName){ //이름으로 제품가져오기
		Market result = jdbcTemplate.queryForObject("select * from market where grpName = ?",
				new RowMapper<Market>() {
					public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
						Market market = new Market(rs.getString("mktCode"),rs.getString("mktSeller"), rs.getString("mktPrName"),
								rs.getString("mktPrice"),rs.getString("mktContent"),rs.getString("grpName"), rs.getDate("mktRegDate"));
						return market;
					}
				}, prdName);
		return result;
	}
	
	public List<GroupCate> getCate() { // 그룹 카테고리 가져오기
		List<GroupCate> results = jdbcTemplate.query("select * from CATE", new RowMapper<GroupCate>() {
			public GroupCate mapRow(ResultSet rs, int rowNum) throws SQLException {
				GroupCate groupCate = new GroupCate(rs.getInt("CATEID"), rs.getString("CATENAME"));
				return groupCate;
			}
		});
		return results;
	}
	public List<Market> srchMarket(String srchTxt){ //검색하기
		List<Market> results = jdbcTemplate.query("select * from market where mktSeller like '%" + srchTxt + "%' or mktPrName like '%" + srchTxt + "%' "
				+ "or mktContent like '%" + srchTxt + "%' or grpName like '%" + srchTxt + "%'", new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getString("mktCode"), rs.getString("mktSeller"),
						rs.getString("mktPrName"), rs.getString("mktPrice"), rs.getString("mktContent"),
						rs.getString("grpName"), rs.getTimestamp("mktRegDate"));
				return market;
			}
		});
		return results;
	}
	
	public void addProduct(final MarketAddProductCommand marketAddProductCommand) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MARKET (mktcode, mktseller, mktprname, mktprice, mktcontent, mktregdate, grpname) " 
						+ "values (seq_market.nextval, ?, ?, ?, ?, syadate, ? )");
				pstmt.setString(1, marketAddProductCommand.getProductName());
				pstmt.setString(2, marketAddProductCommand.getProductContent());
				pstmt.setString(3, marketAddProductCommand.getProductPrice());
				
				return pstmt;
			}
		});
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
}
