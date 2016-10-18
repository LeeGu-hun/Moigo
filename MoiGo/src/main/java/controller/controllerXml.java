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
public class controllerXml {
	DaoGroup daoGroup;
	DaoMarket daoMarket;
	
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	@RequestMapping("/xml/{keyWord}")
	public String xmlResult(@PathVariable String keyWord, HttpServletRequest request, Model model){
		List<Group> srchGroup = daoGroup.srchGroup(keyWord);
		List<Market> srchMarket = daoMarket.srchMarket(keyWord);
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "xml/xml";
	}
	@RequestMapping("/xml")
	public String xmlResult(HttpServletRequest request, Model model){
		List<Group> srchGroup = daoGroup.srchGroup("");
		List<Market> srchMarket = daoMarket.srchMarket("");
		model.addAttribute("srchGroup", srchGroup);
		model.addAttribute("srchMarket", srchMarket);
		return "xml/xml";
	}

}
