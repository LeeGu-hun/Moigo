package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.Group;
import group.GroupAddCommand;
import group.GroupCate;
import login.AuthInfo;

@Controller
public class controllerGroup {
	
	private DaoGroup daoGroup;
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	
	@RequestMapping("/group")
	public String groupSearch(){
		return "group/groupSearch";
	}
	@RequestMapping("/group/{grpName}")
	public String groupEach(@PathVariable String grpName, Model model, HttpSession session){
		Group grpInfo = daoGroup.getGroup(grpName);
		if((AuthInfo)session.getAttribute("authInfo")!=null){
			AuthInfo user = (AuthInfo)session.getAttribute("authInfo");
			boolean Joined = daoGroup.getJoinedGroup(grpName, user.getUserID());
			model.addAttribute("joined", Joined);
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
	public String add(GroupAddCommand groupAddCommand) {
		
		GroupAddCommand Edit = groupAddCommand;
		String editCate = daoGroup.getCateName(groupAddCommand.getCate());
		Edit.setCate(editCate);
		
		System.out.println("모임명:"+Edit.getGrpName());
		System.out.println("리더:"+Edit.getGrpLeader());
		System.out.println("오픈:"+Edit.getGrpOpen());
		System.out.println("카테:"+Edit.getCate());
		System.out.println("소개:"+Edit.getGrpIntro());
	
		daoGroup.addGroup(Edit);
		
		return "redirect:/main";
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
		
		System.out.println("모임명:"+Edit.getGrpName());
		System.out.println("리더:"+Edit.getGrpLeader());
		System.out.println("오픈:"+Edit.getGrpOpen());
		System.out.println("카테:"+Edit.getCate());
		System.out.println("소개:"+Edit.getGrpIntro());
	
		daoGroup.addGroup(Edit);
		
		return "redirect:/main";
	}

}
 */
