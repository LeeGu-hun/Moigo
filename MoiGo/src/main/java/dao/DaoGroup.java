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
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			});
		return results;
	}
	
	public List<Group> getAll(){
		List<Group> results = jdbcTemplate.query(
			"select * from groupInfo", new RowMapper<Group>() {
				public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			});
		return results;
	}

	public Group getGroup(String grpName){
		Group results = jdbcTemplate.queryForObject(
			"select * from groupInfo where grpName = ?", new RowMapper<Group>() {
				public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			}, grpName);
		return results;
	}
	
	public List<Group> getNewGrp(){
		List<Group> results = jdbcTemplate.query(
			"select * from groupInfo where grpOpen='Y' and grpregdate>=sysdate-7", new RowMapper<Group>() {
				public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			});
		return results;
	}
	public List<Group> getJoinGrp(String userID){
		List<Group> results = jdbcTemplate.query(
			"select * from groupjoin grpj, groupInfo grpi where grpj.grpname = grpi.grpname and userID =?", new RowMapper<Group>() {
				public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
					Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"));
					group.setGrpNum(groupCount(rs.getString("grpName")));
					return group;
				}
			}, userID);
		return results;
	}
	public List getGrpBoard(String grpName){
		return null;
	}
//	public List<String> getJoinGrpName(String userID){
//		List<String> results = jdbcTemplate.query(
//			"select * from groupInfo where userID=?", new RowMapper<String>() {
//				public String mapRow(ResultSet rs, int rowNum) throws SQLException {
//					String grpName = rs.getString("grpName");
//					return grpName;
//				}
//			}, userID);
//		return results;
//	}
	
	public int groupCount(String grpName){
		Integer count = jdbcTemplate.queryForObject("select count(*) from groupjoin where grpName=?", Integer.class, grpName);
		return count;
	}
}
