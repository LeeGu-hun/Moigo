package controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoGroup;
import group.Group;
import group.GroupAddCommand;
import group.GroupCate;
import group.GroupModifyCommand;
import group.GroupWriteCommand;
import group.GrpBoard;
import login.AuthInfo;

@Controller
public class controllerGroup {

	private DaoGroup daoGroup;

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
	public String groupEach(@PathVariable String grpName, Model model, HttpSession session) {
		Group grpInfo = daoGroup.getGroup(grpName);
		if ((AuthInfo) session.getAttribute("authInfo") != null) {
			AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
			boolean Joined = daoGroup.getJoinedGroup(grpName, user.getUserNick());
			model.addAttribute("joined", Joined);
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

	@RequestMapping("/add") /* 그룹개설 */
	public String add(GroupAddCommand groupAddCommand, HttpSession session) {
		AuthInfo userInfo = (AuthInfo) session.getAttribute("authInfo");
		GroupAddCommand Edit = groupAddCommand;
		String editCate = daoGroup.getCateName(groupAddCommand.getCate());
		Edit.setCate(editCate);

		daoGroup.addGroup(Edit);
		daoGroup.joinGroup(userInfo.getUserNick(), Edit.getGrpName());

		return "redirect:/";
	}

	@RequestMapping("/group/{grpName}/groupwrite")
	public String groupWrite(@PathVariable String grpName, GroupWriteCommand groupWriteCommand, HttpSession session) throws UnsupportedEncodingException {
		System.out.println("들어오긴합니까?");
		String url = URLEncoder.encode(grpName, "UTF-8");
		System.out.println(grpName);
		return "redirect:/group/"+url;
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
		model.addAttribute("grpCate", groupModifyCommand);
		return "group/modifyGroup";
	}

	@RequestMapping("/modifyGroup") /* 그룹정보수정 */
	public String modifyGroup(HttpSession session, Model model) {
		// 수정해서 값 보내기~

		return "group/modifyGroup";
	}

}