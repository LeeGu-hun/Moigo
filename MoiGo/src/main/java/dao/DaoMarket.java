package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import group.Group;
import group.GroupCate;
import market.Market;

public class DaoMarket {
	private JdbcTemplate jdbcTemplate;
	
	public DaoMarket(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Market> getAllProduct(){
		List<Market> results = jdbcTemplate.query("select * from market order by MKTREGDATE desc", new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getString("mktCode"), rs.getString("mktSeller"), rs.getString("mktPrName"), rs.getString("mktPrice"), 
						rs.getString("mktContent"), rs.getString("grpName"), rs.getDate("mktRegDate"));
				return market;
			}
		});
		return results;
	}
	
	public Market getProduct(String prdName){
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

}
