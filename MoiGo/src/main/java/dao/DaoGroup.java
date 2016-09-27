package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import group.Group;

public class DaoGroup {
	private JdbcTemplate jdbcTemplate;

	public DaoGroup(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Group> getAllOpen(){
		List<Group> results = jdbcTemplate.query(
			"select * from groupInfo where grpOpen='Y'", new RowMapper<Group>() {
				public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			});
		return results;
	}
	public int groupCount(String grpName){
		Integer count = jdbcTemplate.queryForObject("select count(*) from groupjoin where grpName=?", Integer.class, grpName);
		return count;
	}
}
