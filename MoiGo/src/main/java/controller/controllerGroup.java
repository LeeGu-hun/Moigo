package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controllerGroup {
	@RequestMapping("/groupsearch")
	public String groupSearch(){
		return "group/groupSearch";
	}
	@RequestMapping("/group/{grpName}")
	public String groupEach(@PathVariable String grpName){
		return "group/groupMain";
	}
}
