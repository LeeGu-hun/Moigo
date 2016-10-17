package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

import group.GroupCate;
import market.Market;
import market.MarketAddProductCommand;
import market.MarketDeleteProductCommand;

public class DaoMarket {
	private JdbcTemplate jdbcTemplate;
	
	public DaoMarket(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Market getMarket(String mktCode) { // 이름으로 그룹찾기
		Market result = jdbcTemplate.queryForObject("select * from market where mktCode = ?",
			new RowMapper<Market>() {
				public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
					Market prod = new Market(rs.getString("mktCode"), rs.getString("mktSeller"), rs.getString("mktPrName"), 
						rs.getString("mktPrice"), rs.getString("mktContent"), rs.getString("grpName"), rs.getString("mktThumbnail"),
						rs.getDate("mktRegDate"));
					return prod;
				}
			}, mktCode);
		return result;
	}
	
	public List<Market> getAllProduct(){ // 마켓의 모든 상품 불러오기
		List<Market> results = jdbcTemplate.query("select * from market order by MKTREGDATE desc", new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getString("mktCode"), rs.getString("mktSeller"), rs.getString("mktPrName"), rs.getString("mktPrice"), 
						rs.getString("mktContent"), rs.getString("grpName"), rs.getString("mktThumbnail"), rs.getDate("mktRegDate") );
				return market;
			}
		});
		return results;
	}
	
	public List<Market> getProduct(String grpName){ //그룹이 보유한 판매목록 가져오기
		List<Market> result = jdbcTemplate.query("select * from market where grpName = ? order by MKTREGDATE desc",
				new RowMapper<Market>() {
					public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
						Market market = new Market(rs.getString("mktCode"),rs.getString("mktSeller"), rs.getString("mktPrName"),
								rs.getString("mktPrice"),rs.getString("mktContent"),rs.getString("grpName"), rs.getString("mktThumbnail"), 
								rs.getDate("mktRegDate"));
						return market;
					}
				}, grpName);
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
		List<Market> results = jdbcTemplate.query("select * from (select mk.*, gi.grpcate from market mk, groupinfo gi "
				+ "where mk.grpname = gi.grpname) where mktCode like '%" + srchTxt + "%' or mktSeller like '%" + srchTxt + "%' or mktPrName like '%" + srchTxt + "%' "
				+ "or mktContent like '%" + srchTxt + "%' or grpName like '%" + srchTxt + "%' or grpCate like '%" + srchTxt + "%'", 
				new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getString("mktCode"), rs.getString("mktSeller"),
						rs.getString("mktPrName"), rs.getString("mktPrice"), rs.getString("mktContent"),
						rs.getString("grpName"), rs.getString("mktThumbnail"), rs.getTimestamp("mktRegDate"));
				return market;
			}
		});
		return results;
	}
	
	public void addProduct(final MarketAddProductCommand marketAddProductCommand) {  // 상품등록
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"insert into MARKET (mktcode, mktseller, mktprname, mktprice, mktcontent, mktregdate, grpname, mktthumbnail) " 
						+ "values (seq_market.nextval, ?, ?, ?, ?, sysdate, ?, ? )");
				pstmt.setString(1, marketAddProductCommand.getMktSeller());
				pstmt.setString(2, marketAddProductCommand.getProductName());
				pstmt.setString(3, marketAddProductCommand.getProductPrice());
				pstmt.setString(4, marketAddProductCommand.getProductContent());
				pstmt.setString(5, marketAddProductCommand.getGrpName());
				pstmt.setString(6, marketAddProductCommand.getProductThumbnail());
				
				return pstmt;
			}
		});
	}
	
	public void deleteProduct(final MarketDeleteProductCommand mktDelProCmd) { // 상품삭제
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("delete from MARKET where mktcode = ? ");

				pstmt.setInt(1, mktDelProCmd.getMktCode());

				return pstmt;
			}
		});		
	}
	
}
