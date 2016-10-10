package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import dao.DaoMarket;
import dao.DaoUser;
import group.Group;
import group.GroupCate;
import login.AuthInfo;
import market.Market;
import market.MarketAddProductCommand;
import user.User;

@Controller
public class controllerMarket {
	DaoMarket daoMarket;
	DaoGroup daoGroup;
	DaoUser daoUser;
	
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}
	
	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}

	@RequestMapping(value="/market")
	public String market(HttpSession session, Model model) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		List<Market> allProducts = daoMarket.getAllProduct();
		List<GroupCate> cates = daoMarket.getCate();
		List<Group> groupName = daoGroup.getJoinGrp(user.getUserNick());
		model.addAttribute("cates", cates);
		model.addAttribute("allProducts", allProducts);
		model.addAttribute("groupName", groupName);
		return "market/marketMain";
	}
	
	@RequestMapping(value="/market/addProduct")
	public String addProduct(MarketAddProductCommand marketAddProductCommand, HttpSession session, Model model) {
/*		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		User seller = daoUser.selectById(user.getUserID());*/
		System.out.println(marketAddProductCommand.getMktSeller());
		System.out.println(marketAddProductCommand.getGrpName());
		System.out.println(marketAddProductCommand.getProductName());
		System.out.println(marketAddProductCommand.getProductContent());
		System.out.println(marketAddProductCommand.getProductPrice());
		daoMarket.addProduct(marketAddProductCommand);
		return "redirect:/market";	
	}
}
