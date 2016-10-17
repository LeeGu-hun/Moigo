package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoGroup;
import dao.DaoMarket;
import group.Group;
import market.Market;

@Controller
public class controllerXml {
	DaoGroup daoGroup;
	DaoMarket daoMarket;
	
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	@RequestMapping("/xml")
	public String xmlResult(HttpServletRequest request, Model model){
//		String SrchTxt = request.getParameter("srchTxt");
		List<Group> srchGroup = daoGroup.srchGroup("");
		List<Market> srchMarket = daoMarket.srchMarket("");
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "xml/xml";
	}
/*	@RequestMapping("/xml/{searchTxt}")
	public String xmlResult2(@PathVariable String searchTxt, Model model){
		List<Group> srchGroup = daoGroup.srchGroup(searchTxt);
		List<Market> srchMarket = daoMarket.srchMarket(searchTxt);
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "xml";
	}*/
}
