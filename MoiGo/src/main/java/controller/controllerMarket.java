package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoMarket;
import group.GroupCate;
import login.AuthInfo;
import market.Market;

@Controller
public class controllerMarket {
	DaoMarket daoMarket;
	
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	
	@RequestMapping(value="/market")
	public String market(HttpSession session, Model model){
		AuthInfo user = (AuthInfo)session.getAttribute("authInfo");
		List<Market> allProducts = daoMarket.getAllProduct();
		List<GroupCate> cates = daoMarket.getCate();
		model.addAttribute("cates", cates);
		model.addAttribute("allProducts", allProducts);
		return "market/marketMain";
	}
}
