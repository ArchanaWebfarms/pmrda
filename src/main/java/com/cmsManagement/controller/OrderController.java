/*package com.cmsManagement.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.Designation;
import com.cmsManagement.model.Notices;
import com.cmsManagement.service.DesignationService;
import com.cmsManagement.util.Constants;

*//**
 * @author ujwala_gawari
 *
 *//*
@Controller
public class OrderController extends AbstractControllerHelper{
	@Autowired
	DesignationService designationservice;
	
	
	private static final Logger logger = Logger.getLogger(OrderController.class);
	
	*//**
	 * @return List of Notices based on state.
	 * 
	 *//*
	@RequestMapping(value = "/ordersList")
	public ModelAndView orderList(ModelAndView orderListModel){
		logger.debug("Inside orderList Method  of OrderController "); 
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		orderListModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.CREATE_ORDERS) || role.equals(GrantedPermission.VIEW_ORDERS) || role.equals(GrantedPermission.UPDATE_ORDERS) || 
	        		role.equals(GrantedPermission.DELETE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				List<Notices> orderList = orderService.getOrderList();
				logger.debug("Inside orderList Method  of OrderController order List isEmpty "+orderList.isEmpty()); 
				orderListModel.addObject("orderList", orderList);
				orderListModel.setViewName("orders/ordersList");
	        }               
	    } 
		orderListModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed orderList Method of OrderController"); 
		return orderListModel;
	}
	
	*//**
	 * page to create Notices.
	 * 
	 * @return
	 *//*
	@RequestMapping(value = "/newOrders")
	public ModelAndView newOrders(HttpSession session, ModelAndView newOrderModel) {
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		logger.debug("Inside newOrder Method  of OrderController "); 
		newOrderModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.CREATE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
	        	
				Notices orders=new Notices();
				newOrderModel.addObject("orders", orders);
				List<Department> departments=departmentService.getDepartment();
				logger.debug("Inside newOrder Method  of OrderController Tendors Department isEmpty "+departments.isEmpty()); 
				newOrderModel.addObject("departments", departments);
				session.setAttribute("action", "newNotices");
				newOrderModel.setViewName("orders/newOrders");
	        }
	       }
		newOrderModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed newOrder Method  of OrderController "); 
		return newOrderModel;
	}
	
	*//**
	 * Register Or Update Notices based on Notices Id.
	 * @param tendors
	 * @return
	 *//*
	@RequestMapping(value = "/saveOrders")
	public ModelAndView saveOrders(@ModelAttribute("orders") @Valid Notices orders, BindingResult result, ModelAndView model,
			@RequestParam MultipartFile file, HttpSession session){
		if (result.hasErrors()) {
			System.out.println("Has Errors");
			System.out.println(result);
			List<Department> departments=departmentService.getDepartment();
			model.addObject("departments", departments);
			model.setViewName("orders/newOrders");
		 return model;
		}
		else
		{
			
		
		Long x = file.getSize();
		System.out.println("x=="+x);
		logger.debug("Inside saveNotices Method  of OrderController before saving notice- Notice ID "+orders.getNoticeID()); 
		if(orders.getNoticeID()==0){
			int id=orderService.saveOrders(orders, file, session);
			logger.debug("Inside saveNotices Method  of OrderController after saving notice- Notice ID "+id);
		}else{
			logger.debug("Inside saveNotices Method  of OrderController attachment Id "+orders.getAttachment());
			boolean results=orderService.updateOrders(orders, file, session);
			logger.debug("Inside saveNotices Method  of OrderController is order update = "+results);
		}
		
		model.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed saveNotices Method  of OrderController ");
	//	return "redirect:/ordersList";
		model.setViewName("redirect:/ordersList");
		}
		return model;
	}
	
	*//**
	 * @return Notices by id to Show Notices Information
	 *//*
	@RequestMapping(value = "/viewOrders" , method = RequestMethod.GET)
	public ModelAndView viewOrders(HttpServletRequest request, ModelAndView viewNoticesModel) {
		logger.debug("Inside viewOrders Method  of NoticesController");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		viewNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.VIEW_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				Notices orders=noticesService.findNoticesById(noticeId);
				viewNoticesModel.addObject("orders", orders);
			viewNoticesModel.setViewName("orders/viewOrders");
	        }
	       }
		viewNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed viewOrders Method  of OrderController ");
		return viewNoticesModel;
	}
	
	*//**
	 * page to update Notices.
	 * @return
	 *//*
	@RequestMapping(value = "/editOrders" , method = RequestMethod.GET)
	public ModelAndView editOrders(@ModelAttribute("orders") Notices orders, BindingResult result,HttpServletRequest request, HttpSession session, ModelAndView editNoticesModel) {
		System.out.println("EDIT");
		logger.debug("Inside editOrders Method  of OrderController.");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		editNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.UPDATE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				 orders=noticesService.findNoticesById(noticeId);
				if(orders.getDepartment().getDeptId()>0){
					TendorsDepartment tendorsDepartment=tenderService.findTenderDepartmentId(orders.getDepartment().getDeptId());
					logger.debug("Inside viewNotices Method  of OrderController Tendors Department "+tendorsDepartment.toString());
					editNoticesModel.addObject("tendorsDepartment", tendorsDepartment.getDepartmentName());
				}
				List<Department> departments=departmentService.getDepartment();
				logger.debug("Inside viewNotices Method  of OrderController Tendors Department "+departments.toString());
				editNoticesModel.addObject("departments", departments);
				logger.debug("Inside editOrders Method  of OrderController- orders "+orders.toString());
				editNoticesModel.addObject("orders", orders);
				session.setAttribute("action", "editOrder");
				editNoticesModel.setViewName("orders/newOrders");
	        }
	       }	
		editNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed editOrders Method  of OrderController");
		return editNoticesModel;
	}	
	
	*//**
	 * Deactivate state of Notices By Notices Id.
	 * @return
	 *//*
	@RequestMapping(value = "/deleteOrders" , method = RequestMethod.GET)
	public ModelAndView deleteOrders(HttpServletRequest request, ModelAndView deleteNoticesModel) {	
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();	
		logger.debug("Inside deleteOrders Method  of OrderController");
		deleteNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.DELETE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				boolean result=noticesService.deleteNotices(noticeId);
				logger.debug("Inside deleteOrders Method  of OrderController- is Order deleted "+result);
				deleteNoticesModel.setViewName("redirect:/ordersList");
		    }
		   }	
		deleteNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed deleteOrders Method  of OrderController ");
		return deleteNoticesModel;
	}
	
	*//**
	 * page to List of Orders at admin side
	 * 
	 *//*
	@RequestMapping(value = "/adminOrdersList")
	public ModelAndView adminOrdersList(ModelAndView adminNoticesListModel){
		adminNoticesListModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			adminNoticesListModel.setViewName("orders/adminOrdersList");
		}adminNoticesListModel.addObject(Constants.USER, LoginController.getPrincipal());
		return adminNoticesListModel;
	}
	
	*//**
	 * @return List Of Notices in JSON format based on Order Type And Notice Status(eg. Pending)
	 *//*
	@ResponseBody
	@RequestMapping(value = "/getOrdersListByStatus")
	public List<Notices> getOrdersListByStatus(HttpServletRequest request, ModelMap model) {
		 logger.debug("Inside getOrdersListByStatus Method  of OrderController");
			String ordersStatus = request.getParameter("ordersStatus");
			String type = request.getParameter("Ordertype");
			System.out.println("type="+type);
			System.out.println("ordersStatus="+ordersStatus);
			List<Notices> list=orderService.getOrdersListByStatus(ordersStatus, type);
			logger.debug("Inside getOrdersListByStatus Method  of OrderController - Notices list is Empty = "+list.isEmpty());
			model.addAttribute(Constants.USER, LoginController.getPrincipal());
		  logger.debug("Completed getOrdersListByStatus Method  of OrderController.");	
		return list;
	}
	
	*//**
	 * @return Notice by id to Show Orders Information and update status
	 *//*
	@RequestMapping(value = "/adminOrdersView" , method = RequestMethod.GET)
	public ModelAndView adminOrdersView(HttpServletRequest request, ModelAndView adminTendorViewModel) {
		adminTendorViewModel.setViewName(Constants.ACCESS_DENIED);
		logger.debug("Inside adminOrdersView Method  of OrderController.");
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			Notices orders=noticesService.findNoticesById(noticeId);
			adminTendorViewModel.addObject("orders", orders);
			adminTendorViewModel.addObject("noticeId",noticeId);
			request.getSession().setAttribute("noticeId", noticeId);
			adminTendorViewModel.setViewName("orders/adminOrdersView");
		}adminTendorViewModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed adminOrdersView Method  of OrderController.");
		return adminTendorViewModel;
	}
	
	*//**
	 * Change/Update Notice Status by Id.
	 * @return
	 *//*
	@RequestMapping(value = "/changeOrdersStaus")
	public ModelAndView changeNoticesStaus(@ModelAttribute("orders") @Valid Notices orders, BindingResult result,HttpServletRequest request, ModelAndView model) {
		 logger.debug("Inside changeOrdersStaus Method  of OrderController");
		 if(result.hasErrors() )
		   {
			 int noticeId=(int) (request.getSession().getAttribute("noticeId"));
			 model.addObject("noticeId",noticeId);
				System.out.println("noticeId"+noticeId);
			 System.out.println(result.toString());
			   System.out.println("Errors");
			   model.setViewName("orders/adminOrdersView");
			   return model;
		   }
		int noticeID = Integer.parseInt(request.getParameter("noticeId"));
		 int noticeId=(int) (request.getSession().getAttribute("noticeId"));
		 System.out.println("noticeId=="+noticeId);
		  String Approved = request.getParameter("Approved");
		  orders.setPublishStatus(Approved);
			boolean id=noticesService.changeNoticesStaus(noticeId, orders.getComment(), Approved);
		logger.debug("Completed changeOrdersStaus Method  of OrderController is Notice Status Changed= "+id);	
		
		model.addObject(Constants.USER, LoginController.getPrincipal());
		model.setViewName("redirect:/adminOrdersList");
		return model;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////
	*//**
	 * page to create Notices.
	 * 
	 * @return
	 *//*
	@RequestMapping(value = "/NewDashboard")
	public ModelAndView TonewDashboard(HttpSession session, ModelAndView TonewDashboardModel) {
		TonewDashboardModel.setViewName("orders/OrderNewDashboard");
	    TonewDashboardModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed newOrder Method  of OrderController "); 
		return TonewDashboardModel;
	}
	
	*//**
	 * @return List of Notices based on state.
	 * 
	 *//*
	@RequestMapping(value = "/HistoryOfPostingList")
	public ModelAndView HistoryOfPostingList(ModelAndView orderListModel){
		logger.debug("Inside orderList Method  of OrderController "); 
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		orderListModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.CREATE_ORDERS) || role.equals(GrantedPermission.VIEW_ORDERS) || role.equals(GrantedPermission.UPDATE_ORDERS) || 
	        		role.equals(GrantedPermission.DELETE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				List<Notices> orderList = orderService.getHistoryOfPostingList();
				logger.debug("Inside orderList Method  of OrderController order List isEmpty "+orderList.isEmpty()); 
				orderListModel.addObject("orderList", orderList);
				orderListModel.setViewName("historyOfPosting/HistoryOfPostingList");
	        }               
	    } 
		orderListModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed orderList Method of OrderController"); 
		return orderListModel;
	}
	
	*//**
	 * page to create Notices.
	 * 
	 * @return
	 *//*
	@RequestMapping(value = "/newHistoryOfPosting")
	public ModelAndView newHistoryOfPosting(HttpSession session, ModelAndView newOrderModel) {
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		logger.debug("Inside newOrder Method  of OrderController "); 
		newOrderModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.CREATE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
	        	
				Notices orders=new Notices();
				newOrderModel.addObject("orders", orders);
				List<Department> departments=departmentService.getDepartment();
				List<Designation> designationlist = designationservice.getDesignationList();
				logger.debug("Inside newOrder Method  of OrderController Tendors Department isEmpty "+departments.isEmpty()); 
				
				newOrderModel.addObject("departments", departments);
				newOrderModel.addObject("designationlist", designationlist);
				session.setAttribute("action", "newNotices");
				newOrderModel.setViewName("historyOfPosting/newHistoryOfPosting");
	        }
	       }
		newOrderModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed newOrder Method  of OrderController "); 
		return newOrderModel;
	}
	
	
	
	*//**
	 * Register Or Update History Of Postinng based on Notices Id.
	 * @param tendors
	 * @return
	 *//*
	@RequestMapping(value = "/saveHistoryOfPosting")
	public String saveHistoryOfPosting(@ModelAttribute("orders") Notices orders, BindingResult result, ModelMap model,
			@RequestParam MultipartFile file, HttpSession session,HttpServletRequest req ){
		logger.debug("Inside saveNotices Method  of OrderController before saving notice- Notice ID "+orders.getNoticeID()); 
		if(orders.getNoticeID()==0){
			int designation = Integer.parseInt(req.getParameter("designation"));
			int id=orderService.saveHistoryOfPosting(orders, file, session,designation);
			logger.debug("Inside saveHistoryOfPosting Method  of OrderController after saving notice- Notice ID "+id);
		}else{
			logger.debug("Inside updateHistoryOfPosting Method  of OrderController attachment Id "+orders.getAttachment());
		
			
			int designation = Integer.parseInt(req.getParameter("designation"));
			boolean results=orderService.updateHistoryOfPosting(orders, file, session,designation);
			//orderService.
			logger.debug("Inside saveNotices Method  of OrderController is order update = "+results);
		}
		model.addAttribute(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed saveNotices Method  of OrderController ");
		return "redirect:/HistoryOfPostingList";
	}
	*//**
	 * @return Notices by id to Show History Of Posting Information
	 *//*
	@RequestMapping(value = "/viewPostingHistory" , method = RequestMethod.GET)
	public ModelAndView viewPostingHistory(HttpServletRequest request, ModelAndView viewNoticesModel) {
		logger.debug("Inside viewOrders Method  of NoticesController");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		viewNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.VIEW_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){	
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				Notices orders=noticesService.findNoticesById(noticeId);
				viewNoticesModel.addObject("orders", orders);
			viewNoticesModel.setViewName("historyOfPosting/viewHistoryOfPosting");
	        }
	       }
		viewNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed viewOrders Method  of OrderController ");
		return viewNoticesModel;
	}
	*//**
	 * page to update Notices.
	 * @return
	 *//*
	@RequestMapping(value = "/editPostingHistory" , method = RequestMethod.GET)
	public ModelAndView editPostingHistory(HttpServletRequest request, HttpSession session, ModelAndView editNoticesModel) {
		logger.debug("Inside editOrders Method  of OrderController.");
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();		
		editNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.UPDATE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				Notices orders=noticesService.findNoticesById(noticeId);
				if(orders.getDepartment().getDeptId()>0){
					TendorsDepartment tendorsDepartment=tenderService.findTenderDepartmentId(orders.getDepartment().getDeptId());
					logger.debug("Inside viewNotices Method  of OrderController Tendors Department "+tendorsDepartment.toString());
					editNoticesModel.addObject("tendorsDepartment", tendorsDepartment.getDepartmentName());
				}
				List<Department> departments=departmentService.getDepartment();
				List<Designation> designationlist = designationservice.getDesignationList();
				logger.debug("Inside viewNotices Method  of OrderController Tendors Department "+departments.toString());
				editNoticesModel.addObject("departments", departments);
				editNoticesModel.addObject("designationlist", designationlist);
				logger.debug("Inside editOrders Method  of OrderController- orders "+orders.toString());
				editNoticesModel.addObject("orders", orders);
				editNoticesModel.setViewName("historyOfPosting/newHistoryOfPosting");
				session.setAttribute("action", "editNotices");
	        }
	       }	
		editNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed editOrders Method  of OrderController");
		return editNoticesModel;
	}	
	*//**
	 * Deactivate state of Notices By Notices Id.
	 * @return
	 *//*
	@RequestMapping(value = "/deletePostingHistory" , method = RequestMethod.GET)
	public ModelAndView deletePostingHistory(HttpServletRequest request, ModelAndView deleteNoticesModel) {	
		List<GrantedAuthority> granted = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();	
		logger.debug("Inside deleteOrders Method  of OrderController");
		deleteNoticesModel.setViewName(Constants.ACCESS_DENIED);
		for(int i=0; i<granted.size(); i++){
	       String role = granted.toArray()[i] + "";
	        if(LoginController.getCurrentLoggedInUser()!=null && (role.equals(GrantedPermission.DELETE_ORDERS) || LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE))){
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				boolean result=noticesService.deleteNotices(noticeId);
				
				logger.debug("Inside deleteOrders Method  of OrderController- is Order deleted "+result);
				deleteNoticesModel.setViewName("redirect:/ordersList");
		    }
		   }	
		deleteNoticesModel.addObject(Constants.USER, LoginController.getPrincipal());
		logger.debug("Completed deleteOrders Method  of OrderController ");
		return deleteNoticesModel;
	}
}
*/