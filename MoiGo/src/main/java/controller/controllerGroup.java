package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DaoGroup;
import dao.DaoMarket;
import group.Group;
import group.GroupAddCommand;
import group.GroupBoard;
import group.GroupCate;
import group.GroupDeleteCommand;
import group.GroupModifyCommand;
import group.GroupWriteCommand;
import login.AuthInfo;
import market.Market;

@Controller
public class controllerGroup {

	private DaoGroup daoGroup;
	private DaoMarket daoMarket;
	
	public void setDaoMarket(DaoMarket daoMarket) {
		this.daoMarket = daoMarket;
	}

	public void setDaoGroup(DaoGroup daoGroup) {
		this.daoGroup = daoGroup;
	}

	@RequestMapping("/group") /* 내가 가입한 그룹 */
	public String groupSearch(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("authInfo") != null) {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			List<Group> joinGrp = daoGroup.getJoinGrp(authInfo.getUserNick());
			request.setAttribute("joinGrp", joinGrp);
		}
		return "group/myGroup";
	}

	@RequestMapping("/group/{grpName}") /* 해당 그룹 페이지(가입여부/가입버튼 등) */
	public String groupEach(@PathVariable String grpName, Model model, HttpSession session, HttpServletRequest request) {
		Group grpInfo = daoGroup.getGroup(grpName);
		if ((AuthInfo) session.getAttribute("authInfo")!=null) {
			AuthInfo user = (AuthInfo)session.getAttribute("authInfo");
			boolean Joined = daoGroup.getJoinedGroup(grpName, user.getUserNick());
			List<GroupBoard> geulInfo = daoGroup.getGrpGeul(grpName);
			List<Group> thumbnailGrp = daoGroup.myGroupThumbnail(user.getUserNick());
			request.setAttribute("myGrp", thumbnailGrp);
			request.setAttribute("geulInfo", geulInfo);
			List<Market> grpPrd = daoMarket.getProduct(grpName);
			model.addAttribute("grpPrd", grpPrd);
			model.addAttribute("joined", Joined);
			model.addAttribute("geulInfo", geulInfo);
			model.addAttribute("grpInfo", grpInfo);
		}
		model.addAttribute("grpInfo", grpInfo);
		return "group/groupMain";
	}

	@RequestMapping("/addgroup") /* 그룹개설 시 필요한 카테고리 */
	public String addGroup(Model model) {
		List<GroupCate> CATE = daoGroup.groupCate();
		model.addAttribute("CATE", CATE);
		return "group/groupAdd";
	}
	
	@RequestMapping("/grpNameConfirm") /* 그룹명 중복확인 */
	public String addGroupNameConfirm(HttpServletRequest request, Model model) {
		String str = request.getParameter("grpNameConfirm");
		int result = daoGroup.getGrpNameConfirm(str);
		model.addAttribute("result", result);
		return "group/groupAddResult";
	}
	

	@RequestMapping("/add") /* 그룹개설 */
	public String add(GroupAddCommand groupAddCommand, HttpSession session, HttpServletRequest request) {
		String upload = "file";
		ServletContext sc = request.getServletContext();
		String uploadPath = sc.getRealPath("/") + upload;
		System.out.println(uploadPath);
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());
			groupAddCommand.setCate(multi.getParameter("cate"));
			groupAddCommand.setGrpIntro(multi.getParameter("grpIntro"));
			groupAddCommand.setGrpLeader(multi.getParameter("grpLeader"));
			groupAddCommand.setGrpName(multi.getParameter("grpName"));
			groupAddCommand.setGrpOpen(multi.getParameter("grpOpen"));
			groupAddCommand.setGrpThumbnail(multi.getFilesystemName((String)multi.getFileNames().nextElement()));			
		} catch(Exception e) {
			e.printStackTrace();
		}
		AuthInfo userInfo = (AuthInfo) session.getAttribute("authInfo");
		GroupAddCommand Edit = groupAddCommand;
		String editCate = daoGroup.getCateName(groupAddCommand.getCate());
		Edit.setCate(editCate);

		daoGroup.addGroup(Edit);
		daoGroup.joinGroup(userInfo.getUserNick(), Edit.getGrpName());

		return "redirect:/group";
	}

	@RequestMapping("/group/{grpName}/joingroup") /* 그룹가입 */
	public String joinGroup(@PathVariable String grpName, HttpSession session) {
		System.out.println(grpName);
		AuthInfo userInfo = (AuthInfo) session.getAttribute("authInfo");
		daoGroup.joinGroup(userInfo.getUserNick(), grpName);
		System.out.println(userInfo.getUserNick());

		return "redirect:/group";
	}

	@RequestMapping("/modifyGroupInfo") /* 그룹정보수정으로 가는 컨트롤러 */
	public String modifyGroupInfo(GroupModifyCommand groupModifyCommand, Model model) {
		model.addAttribute("groupModifyCommand", groupModifyCommand);
		return "group/modifyGroup";
	}

	@RequestMapping("/modifyGroup") /* 그룹정보수정 */
	public String modifyGroup(GroupModifyCommand groupModifyCommand) {
		daoGroup.modifyGroup(groupModifyCommand);
		
		return "redirect:/group";
	}
	
	@RequestMapping("/group/{grpName}/groupwrite") // 그룹게시판 글등록
	public String groupWrite(@PathVariable String grpName, GroupWriteCommand groupWriteCommand, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String url = URLEncoder.encode(grpName, "UTF-8");
		String upload = "file";
		ServletContext sc = request.getServletContext();
		String uploadPath = sc.getRealPath("/") + upload;
		System.out.println(uploadPath);
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			groupWriteCommand.setWriter(multi.getParameter("writer"));
			groupWriteCommand.setWriteTitle(multi.getParameter("writeTitle"));
			groupWriteCommand.setWriteContent(multi.getParameter("writeContent"));
			groupWriteCommand.setWriteThumbnail(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			daoGroup.writeGroupBoard(groupWriteCommand, grpName);
			System.out.println("게시글 등록완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/group/"+url;
	}
	
	@RequestMapping("/group/{grpName}/delete") // 그룹게시판 글 삭제하기
	public String groupBoardDelte(@PathVariable String grpName, GroupDeleteCommand grpDelCmd, HttpSession session) throws UnsupportedEncodingException {
		String url = URLEncoder.encode(grpName, "UTF-8");	
		System.out.println("게시글 삭제 진입");
		System.out.println("글번호 : " + grpDelCmd.getBrdSeq());
		daoGroup.deleteGroupGeul(grpDelCmd);
		System.out.println("게시글 삭제 성공");
		return "redirect:/group/"+url;
	}
}