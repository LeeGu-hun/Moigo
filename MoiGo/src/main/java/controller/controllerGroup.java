package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.Group;
import login.AuthInfo;

@Controller
@RequestMapping("/group")
public class controllerGroup {
	
	private DaoGroup daoGroup;
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	
	@RequestMapping("/")
	public String groupSearch(){
		return "group/groupSearch";
	}
	@RequestMapping("/{grpName}")
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
	
}
