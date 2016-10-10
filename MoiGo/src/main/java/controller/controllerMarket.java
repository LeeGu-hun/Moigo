package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoMarket;
import dao.DaoUser;
import group.GroupCate;
import login.AuthInfo;
import market.Market;
import market.MarketAddProductCommand;
import user.User;

@Controller
public class controllerMarket {
	DaoMarket daoMarket;
	DaoUser daoUser;
	
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	public void setDaoUser(DaoUser daoUser) {
		this.daoUser = daoUser;
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
	
	@RequestMapping(value="/market/addProduct")
	public String addProduct(MarketAddProductCommand marketAddProductCommand, HttpSession session, Model model) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		User seller = daoUser.selectById(user.getUserID());
		
		return "redirect:/market";	
	}
}
