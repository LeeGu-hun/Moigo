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
import market.MarketModifyProductCommand;


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
	
	public void setDaoUser(DaoUser daoUser) {
		this.daoUser = daoUser;
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
	
	@RequestMapping("/admin") /* 관리자 페이지 */
	public String admin(HttpServletRequest request, Model model, HttpSession session){
		String searchTxt = request.getParameter("txt");
		String type = request.getParameter("type");
		if (type!=null) {
			List<?> results = null;
			if (type.equals("userInfo")) {
				results = daoUser.findUser(searchTxt);
			} else if(type.equals("group")){
				results = daoGroup.srchGroup(searchTxt);
			} else if(type.equals("market")){
				results = daoMarket.srchMarket(searchTxt);
			}
			model.addAttribute("results", results);
			model.addAttribute("txt", searchTxt);
			model.addAttribute("type", type);
		}
		return "admin";
	}
	
	@RequestMapping(value="/market/modify")
	public String modiProductForm(MarketDeleteProductCommand mktDelProCmd, Model model, HttpSession session){
		Market Proinfo = daoMarket.getProInfo(mktDelProCmd);
		model.addAttribute("Proinfo" , Proinfo);
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		if (user!=null) {
			List<Group> groupName = daoGroup.getJoinGrp(user.getUserNick());
			model.addAttribute("groupName", groupName);
		}
		return "market/marketProductModify";
	}
	
	@RequestMapping(value="/market/modiProduct")
	public String modifyProduct(MarketModifyProductCommand mktModiProCmd, HttpServletRequest request){
		String upload = "file";
		ServletContext sc = request.getServletContext();
		String uploadPath = sc.getRealPath("/") + upload;
		System.out.println(uploadPath);
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			mktModiProCmd.setModiProName(multi.getParameter("modiProName"));
			mktModiProCmd.setModiProPrice(multi.getParameter("modiProPrice"));
			mktModiProCmd.setModiProContent(multi.getParameter("modiProContent"));
			mktModiProCmd.setGrpName(multi.getParameter("grpName"));
			mktModiProCmd.setModiProThumbnail(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			mktModiProCmd.setMktcode(Integer.parseInt(multi.getParameter("mktCode")));
			daoMarket.modifyProduct(mktModiProCmd);
			System.out.println("게시글 수정 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/market";
	}
	
}
