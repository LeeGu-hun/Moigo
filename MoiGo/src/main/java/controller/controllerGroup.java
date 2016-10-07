package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.Group;
import group.GroupAddCommand;
import group.GroupCate;
import group.GroupWriteCommand;
import group.GrpBoard;
import login.AuthInfo;

@Controller
public class controllerGroup {
	
	private DaoGroup daoGroup;
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	
	@RequestMapping("/group")
	public String groupSearch(HttpSession session, HttpServletRequest request){
		if(session.getAttribute("authInfo")!=null){
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			List<Group> joinGrp = daoGroup.getJoinGrp(authInfo.getUserNick());
			request.setAttribute("joinGrp", joinGrp);
		}
		return "group/myGroup";
	}
	@RequestMapping("/group/{grpName}")
	public String groupEach(@PathVariable String grpName, Model model, HttpSession session, HttpServletRequest request){
		Group grpInfo = daoGroup.getGroup(grpName);
		if((AuthInfo)session.getAttribute("authInfo")!=null){
			AuthInfo user = (AuthInfo)session.getAttribute("authInfo");
			boolean Joined = daoGroup.getJoinedGroup(grpName, user.getUserNick());
			model.addAttribute("joined", Joined);
			List<GrpBoard> geulInfo = daoGroup.getGrpGeul(grpName);
			model.addAttribute("geulInfo", geulInfo);
			model.addAttribute("grpInfo", grpInfo);
		}
		model.addAttribute("grpInfo", grpInfo);
		return "group/groupMain";
	}
	
	@RequestMapping("/addgroup")
	public String addGroup(Model model) {
		List<GroupCate> CATE = daoGroup.groupCate();
		model.addAttribute("CATE", CATE);
		return "group/groupAdd";
	}
	@RequestMapping("/add")
	public String add(GroupAddCommand groupAddCommand, HttpSession session) {
		AuthInfo userInfo = (AuthInfo)session.getAttribute("authInfo");
		GroupAddCommand Edit = groupAddCommand;
		String editCate = daoGroup.getCateName(groupAddCommand.getCate());
		Edit.setCate(editCate);
	
		daoGroup.addGroup(Edit);
		daoGroup.joinGroup(userInfo.getUserNick(), Edit.getGrpName());
		
		return "redirect:/";
	}
	@RequestMapping("/group/{grpName}/joingroup")
	 public String joinGroup(@PathVariable String grpName, HttpSession session) {
	 	System.out.println(grpName);
	 	AuthInfo userInfo = (AuthInfo) session.getAttribute("authInfo");
	 	daoGroup.joinGroup(userInfo.getUserNick(), grpName);
	 	System.out.println(userInfo.getUserNick());
	 	return "redirect:/";
	}
	@RequestMapping("/group/{grpName}/groupwrite")
	 public String groupWrite(@PathVariable String grpName, GroupWriteCommand groupWriteCommand, HttpSession session) throws UnsupportedEncodingException {
	 	System.out.println("들어오긴합니까?");
	 	String url = URLEncoder.encode(grpName, "UTF-8");
		System.out.println(grpName);
	 	return "redirect:/group/"+url;
	}
}

/*
package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.GroupAddCommand;
import group.GroupCate;

@Controller
public class controllerGroup {

	DaoGroup daoGroup;
	
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}

	@RequestMapping("/groupsearch")
	public String groupSearch(){
		return "group/groupSearch";
	}
	
	@RequestMapping("/addgroup")
	public String addGroup(Model model) {
		List<GroupCate> CATE = daoGroup.groupCate();
		model.addAttribute("CATE", CATE);
		return "group/groupAdd";
	}
	
	@RequestMapping("/add")
	public String add(GroupAddCommand groupAddCommand) {
		
		GroupAddCommand Edit = groupAddCommand;
		String editCate = daoGroup.getCateName(groupAddCommand.getCate());
		Edit.setCate(editCate);
		
		System.out.println("���Ӹ�:"+Edit.getGrpName());
		System.out.println("����:"+Edit.getGrpLeader());
		System.out.println("����:"+Edit.getGrpOpen());
		System.out.println("ī��:"+Edit.getCate());
		System.out.println("�Ұ�:"+Edit.getGrpIntro());
	
		daoGroup.addGroup(Edit);
		
		return "redirect:/main";
	}

}
 */
