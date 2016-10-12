package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import dao.DaoMarket;
import group.Group;
import market.Market;

@Controller
public class controllerSearch {
	DaoGroup daoGroup;
	DaoMarket daoMarket;

	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	
	@RequestMapping("/search")
	public String srchResult(HttpServletRequest request, Model model){
		String SrchTxt = request.getParameter("srchTxt");
		List<Group> srchGroup = daoGroup.srchGroup(SrchTxt);
		List<Market> srchMarket = daoMarket.srchMarket(SrchTxt);
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "search/searchResult";
	}
	@RequestMapping("/search/{searchTxt}")
	public String srchResult2(@PathVariable String searchTxt, Model model){
		List<Group> srchGroup = daoGroup.srchGroup(searchTxt);
		List<Market> srchMarket = daoMarket.srchMarket(searchTxt);
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "search/searchResult";
	}
}
