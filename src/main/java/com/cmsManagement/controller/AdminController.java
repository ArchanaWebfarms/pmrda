package com.cmsManagement.controller;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

















import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.ValidateInput;

/**
 * @author ujwala_gawari
 *
 */
@Controller
public class AdminController extends AbstractControllerHelper {

	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	LocalDateTime now = LocalDateTime.now();
	/**
	 * Page to admin dash-board
	 * @Return 
	 *
	 */
	@RequestMapping(value ="adminDashboard", method = RequestMethod.GET)
	public ModelAndView mainDashboard(ModelAndView mainDashboardModel,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				mainDashboardModel.setViewName(Constants.ACCESS_DENIED);				
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						mainDashboardModel.setViewName("adminDashboard");	
					} catch (Exception e) {
						e.printStackTrace();
						mainDashboardModel.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			mainDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return mainDashboardModel;
	}

	/**
	 * 
	 * @throws ParseException 
	 * @Return TenderList
	 *
	 */
	@RequestMapping(value = "/adminTenderList",method=RequestMethod.GET)
	public ModelAndView adminTenderList(ModelAndView adminTenderListModel,HttpSession session) throws ParseException{
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				adminTenderListModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						//List<Tendors> adminTenderList = tenderService.adminTenderList();
						List<Tendors> adminTenderList = tenderService.getTendorListByStatus("All");
						List<Tendors> adminTenderList1 = new ArrayList<Tendors>();
						for(Tendors t:adminTenderList){
							t.setPublish_date(MethodsHelper.convertDate1(t.getPublish_date()));
							t.setPublish_time(MethodsHelper.convertTimein12hr(t.getPublish_time()));
							t.setClosing_time(MethodsHelper.convertTimein12hr(t.getClosing_time()));
							t.setOpening_time(MethodsHelper.convertTimein12hr(t.getOpening_time()));
							adminTenderList1.add(t);
						}
						adminTenderListModel.addObject("adminTenderList", adminTenderList1);
						adminTenderListModel.setViewName("tender/adminTenderList");
					}catch (Exception e) {			
						e.printStackTrace();
						adminTenderListModel.setViewName("redirect:/errors");
					} 
				}
			}
		} catch (Exception e1) {			
			adminTenderListModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTenderListModel;
	}

	/**
	 * 
	 * @throws ParseException 
	 * @Admin View tender By Id
	 *
	 */
	@RequestMapping(value = "/adminTendorView",method=RequestMethod.POST)
	public ModelAndView adminTendorView(HttpServletRequest request, ModelAndView adminTendorViewModel,HttpSession session) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				adminTendorViewModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int tenderId = 0;
					try {
						tenderId = Integer.parseInt(request.getParameter("tenderId"));
						session.setAttribute("tenderID5", tenderId);
					} catch (Exception e1) {
						tenderId=(int) session.getAttribute("tenderID5");
					}finally{
					try {
						if(tenderId>0 ){
							Tendors tendors=tenderService.findTenderById(tenderId);
							tendors.setPublish_date(MethodsHelper.convertDate1(tendors.getPublish_date()));
							adminTendorViewModel.addObject("tendors", tendors);
							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(tendors.getId(),"TENDER");
							adminTendorViewModel.addObject("attachmentlist", attachmentlist);
							if(tendors.getTendorsDepartment().getDept_id()>0){
								TendorsDepartment tendorsDepartment = tenderService.findTenderDepartmentId(tendors.getTendorsDepartment().getDept_id());
								adminTendorViewModel.addObject("tendorsDepartment", tendorsDepartment);
							}
						}
						adminTendorViewModel.addObject("tenderId",tenderId);
						request.getSession().setAttribute("tenderId", tenderId);
						adminTendorViewModel.setViewName("tender/adminTendorView");
					} catch (Exception e) {
						e.printStackTrace();
						adminTendorViewModel.setViewName("redirect:/errors");
					}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				adminTendorViewModel.setViewName(Constants.HOME);	
			}else{
				adminTendorViewModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			adminTendorViewModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return adminTendorViewModel;
	}

	/**
	 * 
	 * @Admin Update Tender Status
	 *
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/tenderStatus1",method=RequestMethod.POST)
	public ModelAndView changeTendorStaus(@ModelAttribute("tendors")  @Valid Tendors tendors, BindingResult result,HttpServletRequest request, ModelAndView changeTendorStausModel) {
		//changeTendorStausModel.setViewName(Constants.ACCESS_DENIED);
		/*if(result.hasErrors()){
			int tenderId=(int) (request.getSession().getAttribute("tenderId"));
			changeTendorStausModel.addObject("tenderId",tenderId);
		 	List<TendorsDepartment>	departments=tenderService.getTenderDepartment();

			changeTendorStausModel.addObject("departments", departments);
			changeTendorStausModel.setViewName("tender/adminTendorView");
		}
		else

		{
		 */

		/*if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){

*/

			try {
				int tenderId = Integer.parseInt(request.getParameter("tenderId"));
				//String comment = request.getParameter("comment");
				String Approved = request.getParameter("Approved");
				tendors.setPublishStatus(Approved);


				tenderService.changeTendorStaus(tenderId, ValidateInput.replaceAll(StringEscapeUtils.escapeHtml4(tendors.getComment())), Approved);
				changeTendorStausModel.setViewName("redirect:/adminTenderList");
			} catch (Exception e) {
				e.printStackTrace();
				changeTendorStausModel.setViewName("redirect:/errors");
			}
	//	}

		//}
		return changeTendorStausModel;	
	}

	/**
	 * 
	 * @Admin return  TenderList By  Status
	 *
	 */

	@RequestMapping(value = "/getTendorListByStatus",method=RequestMethod.GET)
	public List<Tendors> getTendorListByStatus(HttpServletRequest request) {
		List<Tendors> tendors=null;
		try {
			tendors= tenderService.getTendorListByStatus(request.getParameter("tendorStatus"));
		} catch (Exception e) {
		}
		return tendors;
	}






}
