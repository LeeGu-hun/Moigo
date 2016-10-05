package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import market.Market;

public class DaoMarket {
	private JdbcTemplate jdbcTemplate;
	
	public DaoMarket(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Market> getAllProduct(){
		List<Market> results = jdbcTemplate.query("select * from market order by MKTREGDATE desc", new RowMapper<Market>() {
			public Market mapRow(ResultSet rs, int rowNum) throws SQLException {
				Market market = new Market(rs.getInt("mktCode"), rs.getString("mktSeller"), rs.getString("mktPrName"), rs.getString("mktPrice"), 
						rs.getString("mktContent"), rs.getString("grpName"), rs.getDate("mktRegDate"));
				return market;
			}
		});
		return results;
	}
}
