package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DaoGroup;
import dao.DaoMarket;
import dao.DaoUser;
import group.Group;
import group.GroupCate;
import login.AuthInfo;
import market.Market;
import market.MarketAddProductCommand;
import market.MarketDeleteProductCommand;


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
	public String market(HttpSession session, Model model, HttpServletRequest request) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		if (user!=null) {
			List<Group> groupName = daoGroup.getJoinGrp(user.getUserNick());
			model.addAttribute("groupName", groupName);			
		}
		List<Market> allProducts = daoMarket.getAllProduct();
		List<GroupCate> cates = daoMarket.getCate();
		model.addAttribute("cates", cates);
		request.setAttribute("allProducts", allProducts);
		model.addAttribute("allProducts", allProducts);
		return "market/marketMain";
	}
	
	@RequestMapping(value="/market/addProduct")
	public String addProduct(MarketAddProductCommand marketAddProductCommand, HttpSession session, HttpServletRequest request) {
		String upload = "file";
		ServletContext sc = request.getServletContext();
		String uploadPath = sc.getRealPath("/") + upload;
		System.out.println(uploadPath);
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			marketAddProductCommand.setGrpName(multi.getParameter("grpName"));
			marketAddProductCommand.setProductName(multi.getParameter("productName"));
			marketAddProductCommand.setProductPrice(multi.getParameter("productPrice"));
			marketAddProductCommand.setProductContent(multi.getParameter("productContent"));
			marketAddProductCommand.setMktSeller(multi.getParameter("mktSeller"));
			marketAddProductCommand.setProductThumbnail(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			daoMarket.addProduct(marketAddProductCommand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/market";	
	}

	@RequestMapping(value="/market/deleteProduct")
	public String deleteProduct(MarketDeleteProductCommand mktDelProCmd, HttpSession session) {
		System.out.println("상품삭제 진입");
		System.out.println("상품코드 : " + mktDelProCmd.getMktCode());
		daoMarket.deleteProduct(mktDelProCmd);
		System.out.println("상품삭제 성공");
		return "redirect:/market";
	}

	@RequestMapping(value="/market/Product/{mktCode}")
	public String buyProduct(@PathVariable String mktCode, Model model){
		Market prod = daoMarket.getMarket(mktCode);
		model.addAttribute("prod" , prod);
		return "market/marketBuyPage";
	}
}
