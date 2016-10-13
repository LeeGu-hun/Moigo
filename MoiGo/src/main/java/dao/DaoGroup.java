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

import group.Group;
import group.GroupAddCommand;
import group.GroupBoard;
import group.GroupCate;
import group.GroupDeleteCommand;
import group.GroupModifyCommand;
import group.GroupWriteCommand;

public class DaoGroup {
	private JdbcTemplate jdbcTemplate;

	public DaoGroup(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Group> getAllOpen() { // 공개그룹모두찾기
		List<Group> results = jdbcTemplate.query("select * from groupInfo where grpOpen='Y'", new RowMapper<Group>() {
			public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
				Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"),
						rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
				group.setGrpNum(groupUserCount(rs.getString("grpName")));
				return group;
			}
		});
		return results;
	}
	
	public List<Group> getRecomGrp() { // 추천그룹
		List<Group> results = jdbcTemplate.query("select * from (select i.grpname , i.grpLeader, i.grpOpen, i.grpcate, i.grpregdate, "
				+ "i.grpintro, i.GRPTHUMBNAIL, count(i.grpname) as grpnum from groupinfo i, groupjoin j where i.grpname = j.grpname "
				+ "and i.grpopen='Y' group by i.grpname , i.grpLeader, i.grpOpen, i.grpcate, i.grpregdate, i.grpintro, i.GRPTHUMBNAIL "
				+ "order by grpnum desc) where rownum<=3", 
			new RowMapper<Group>() {
			public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
				Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"),
						rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
				group.setGrpNum(groupUserCount(rs.getString("grpName")));
				return group;
			}
		});
		return results;	
	}
	
	public List<Group> getAll() { // 공개여부 상관없이 모두 찾기
		List<Group> results = jdbcTemplate.query("select * from groupInfo", new RowMapper<Group>() {
			public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
				Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"), rs.getString("grpOpen"),
						rs.getString("grpCate"), rs.getString("grpIntro"), rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
				group.setGrpNum(groupUserCount(rs.getString("grpName")));
				return group;
			}
		});
		return results;
	}

	public Group getGroup(String grpName) { // 이름으로 그룹찾기
		Group results = jdbcTemplate.queryForObject("select * from groupInfo where grpName = ?",
				new RowMapper<Group>() {
					public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
						Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"),
								rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"),
								rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
						group.setGrpNum(groupUserCount(rs.getString("grpName")));
						return group;
					}
				}, grpName);
		return results;
	}

	public List<GroupCate> groupCate() { // 그룹 카테고리 가져오기
		List<GroupCate> results = jdbcTemplate.query("select * from CATE", new RowMapper<GroupCate>() {
			public GroupCate mapRow(ResultSet rs, int rowNum) throws SQLException {
				GroupCate groupCate = new GroupCate(rs.getInt("CATEID"), rs.getString("CATENAME"));
				return groupCate;
			}
		});
		return results;
	}
	
	public List<Group> srchGroup(String srchTxt){ //검색하기
		List<Group> results = jdbcTemplate.query("select * from groupInfo where grpName like '%" + srchTxt + "%' or grpCate like '%" + srchTxt + "%' "
				+ "or grpLeader like '%" + srchTxt + "%' or grpIntro like '%" + srchTxt + "%'", new RowMapper<Group>() {
			public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
				Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"),
						rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"),
						rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
				group.setGrpNum(groupUserCount(rs.getString("grpName")));
				return group;
			}
		});
		return results;
	}

	public List<Group> getNewGrp() { // 개설된지 1주일 안의 그룹만 가져오기(신규그룹)
		List<Group> results = jdbcTemplate.query("select * from groupInfo where grpOpen='Y' and grpregdate>=sysdate-7 and rownum <= 3 order by grpregdate desc",
				new RowMapper<Group>() {
					public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
						Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"),
								rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"),
								rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
						group.setGrpNum(groupUserCount(rs.getString("grpName")));
						return group;
					}
				});
		return results;
	}

	public List<Group> getJoinGrp(String userNick) { // 특정 닉네임이 가입한 그룹만 가져오기
		List<Group> results = jdbcTemplate.query(
				"select * from groupjoin grpj, groupInfo grpi where grpj.grpname = grpi.grpname and userNick =? order by grpregdate desc",
				new RowMapper<Group>() {
					public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
						Group group = new Group(rs.getString("grpName"), rs.getString("grpLeader"),
								rs.getString("grpOpen"), rs.getString("grpCate"), rs.getString("grpIntro"),
								rs.getTimestamp("grpRegDate"), rs.getString("grpThumbnail"));
						group.setGrpNum(groupUserCount(rs.getString("grpName")));
						return group;
					}
				}, userNick);
		return results;
	}

	public void addGroup(final GroupAddCommand groupAddCommand) { // 그룹추가
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into groupinfo values(?, ?, ?, ?, sysdate, ?, ?)");

				pstmt.setString(1, groupAddCommand.getGrpName());
				pstmt.setString(2, groupAddCommand.getGrpLeader());
				pstmt.setString(3, groupAddCommand.getGrpOpen());
				pstmt.setString(4, groupAddCommand.getCate());
				pstmt.setString(5, groupAddCommand.getGrpIntro());
				pstmt.setString(6, groupAddCommand.getGrpThumbnail());

				return pstmt;
			}
		});
	}
	
	public String getCateName(String cateID){ /* 카테고리 불러오기 */
		String cate = jdbcTemplate.queryForObject("select cateName from cate where cateId=?", String.class,
				cateID);
		return cate;
	}

	public List getGrpBoard(String grpName) {
		return null;
	}
	
	public void joinGroup(final String userNick, final String grpName){ /* 그룹가입 */
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into groupjoin values(?, ?, sysdate)");
				pstmt.setString(1, userNick);
				pstmt.setString(2, grpName);
				return pstmt;
			}
		});
	}
	
	public boolean getJoinedGroup(String grpName, String userNick) { // 가입한 그룹인지 판별
		int grpJoined = jdbcTemplate.queryForObject("select count(*) from groupJoin where grpName = ? and userNick = ?",
				Integer.class, grpName, userNick);
		if (grpJoined == 0)
			return false;
		else
			return true;
	}

	public int groupUserCount(String grpName) { // 그룹에 가입한 인원수 표시 (그룹명)
		Integer count = jdbcTemplate.queryForObject("select count(*) from groupjoin where grpName=?", Integer.class,
				grpName);
		return count;
	}
	
	public void modifyGroup(final GroupModifyCommand groupModifyCommand) { //그룹수정
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
						"update GROUPINFO set grpintro=?, grpopen=? " + "where grpname=?" );
				pstmt.setString(1, groupModifyCommand.getGrpIntro());
				pstmt.setString(2, groupModifyCommand.getGrpOpen());
				pstmt.setString(3, groupModifyCommand.getGrpName());
				return pstmt;
			}
		});
	}
	
	public List<GroupBoard> getGrpGeul(String grpName) { // 그룹명으로 게시글정보 가져오기
		List<GroupBoard> grpGeul = jdbcTemplate.query("select * from groupBoard where grpName = ? " +" order by brdRegDate desc",
				new RowMapper<GroupBoard>() {
					public GroupBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
						GroupBoard groupBoard = new GroupBoard(rs.getString("brdWriter"),
								rs.getString("brdTitle"), rs.getString("brdContent"), rs.getString("brdThumbnail"), rs.getTimestamp("brdRegDate"));
						groupBoard.setBrdSeq(rs.getInt("brdSeq"));
						return groupBoard;
					}
				}, grpName);
		return grpGeul;
	}
	
	public void writeGroupBoard(final GroupWriteCommand groupWriteCommand, final String groupName) { // 그룹 게시글 추가
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into GROUPBOARD values(seq_board.nextval, ?, ?, ?, sysdate, ?, ?)");

				pstmt.setString(1, groupWriteCommand.getWriter());
				pstmt.setString(2, groupWriteCommand.getWriteTitle());
				pstmt.setString(3, groupWriteCommand.getWriteContent());
				pstmt.setString(4, groupName);
				pstmt.setString(5, groupWriteCommand.getWriteThumbnail());

				return pstmt;
			}
		});
	}
	
	public List<Group> myGroupThumbnail(String userNick) { // 그룹 안에서 가입한 그룹 보기(썸네일)
		List<Group> results = jdbcTemplate
				.query("select gj.grpname, gi.grpthumbnail from groupJoin gj join groupInfo gi "
					+ "on gj.grpname=gi.grpname where gj.usernick=? and rownum <= 6", new RowMapper<Group>() {
						public Group mapRow(ResultSet rs, int rowNum) throws SQLException {
							Group group = new Group(rs.getString("grpName"), rs.getString("grpThumbnail"));
							return group;
						}
					}, userNick);
		return results;
	}
	
	public void deleteGroupGeul(final GroupDeleteCommand grpDelCmd) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("delete from GROUPBOARD where brdseq = ? ");

				pstmt.setInt(1, grpDelCmd.getBrdSeq());

				return pstmt;
			}
		});
	}
	
}
