package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.Group;

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
	public String groupEach(@PathVariable String grpName, Model model){
		Group grpInfo = daoGroup.getGroup(grpName);
		model.addAttribute("grpInfo", grpInfo);
		return "group/groupMain";
	}
	
}
