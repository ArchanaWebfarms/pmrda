package com.cmsManagement.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NoticesDao;
import com.cmsManagement.dao.OrderDao;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Designation;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;


/**
 * @author ujwala_gawari
 *
 */
@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;
	Attachment attachment;
	
	@Autowired
	FinancialYearDao financialYearDao;
	@Autowired
	NoticesDao noticesDao;
	
	/*@Override
	public List<Notices> getOrderList() {
		return orderDao.getOrderList();
	}

	@Override
	public int saveOrders(Notices orders, MultipartFile file, HttpSession session) {
		try {
			orders.setCategory(Constants.ORDER_CATEGORY);
			orders.setState(Constants.ACTIVE_STATE);
			attachment=new Attachment();
			attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
			attachment.setModule_type(Constants.ORDER_MODULE);
			attachment.setState(Constants.ACTIVE_STATE);
			  FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
	    		attachment.setFinancialYear(financialYear);
      		String path=session.getServletContext().getRealPath("/Notice/"); 
      		
   		    String a =  file.getOriginalFilename();
         	String totalPath = path+a;
         	totalPath=totalPath.replace("\\", "/");
         	file.transferTo(new File(totalPath));
			attachment.setAttachmnt_name(a);
			attachment.setPath(totalPath);
			
       //FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
	       orders.setFinancialYear(financialYear);
	       orders.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
	       orders.setPublishStatus(Constants.PENDING_STATUS);
	       orders.setCreated_date(MethodsHelper.getCurrentDateAndTime());
	       orders.setAttachment(attachment);
		} catch (Exception e) {e.printStackTrace();} 
		return orderDao.saveOrders(orders);
	}

	@Override
	public boolean updateOrders(Notices orders, MultipartFile file, HttpSession session) {
		Notices order=noticesDao.findNoticesById(orders.getNoticeID());
		try {
			if(orders.getAttachment().getAttachmentID()==0){
				attachment=new Attachment();
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type(Constants.ORDER_MODULE);
				attachment.setState(Constants.ACTIVE_STATE);
				attachment.setAttachmentID(orders.getAttachment().getAttachmentID());
				  FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		    		attachment.setFinancialYear(financialYear);
				String path=session.getServletContext().getRealPath("/Notice/"); 
		   		 String a =  file.getOriginalFilename();
		         	String totalPath = path+a;
		         	totalPath=totalPath.replace("\\", "/");
					attachment.setAttachmnt_name(a);
			      attachment.setPath(totalPath);
			  	file.transferTo(new File(totalPath));
			      order.setAttachment(attachment);
			} 
			  order.setTitle(orders.getTitle());
			  order.setDescription(orders.getDescription());
			 
			  order.setPublish_date(order.getPublish_date());
			  order.setType(orders.getType());
			  order.setTags(orders.getTags());
			  order.setDepartment(orders.getDepartment());
		      order.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		      order.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		} catch (Exception e) {e.printStackTrace();} 
		return orderDao.updateOrders(order);
	}

	@Override
	public Notices findOrderById(int noticeId) {
		return orderDao.findOrderById(noticeId);
	}

	@Override
	public boolean deleteOrders(int noticeId) {
		return false;
	}

	@Override
	public List<Notices> getOrdersListByStatus(String ordersStatus, String type) {
		return orderDao.getOrdersListByStatus(ordersStatus, type);
	}

	@Override
	public int saveHistoryOfPosting(Notices historyOfPosting, MultipartFile file,HttpSession session,int designation) {
	
		try {
			historyOfPosting.setCategory(Constants.ORDER_CATEGORY);
			historyOfPosting.setState(Constants.ACTIVE_STATE);
			historyOfPosting.setType("HISTORY OF POSTING");
			attachment=new Attachment();
			attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
			attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
			attachment.setModule_type(Constants.ORDER_MODULE);
			attachment.setState(Constants.ACTIVE_STATE);
		
      		String path=session.getServletContext().getRealPath("/Notice/"); 
   		    String a =  file.getOriginalFilename();
         	String totalPath = path+a;
         	totalPath=totalPath.replace("\\", "/");
			attachment.setAttachmnt_name(a);
			attachment.setPath(totalPath);
			  FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
	    		attachment.setFinancialYear(financialYear);
			file.transferTo(new File(totalPath));
			historyOfPosting.setAttachment(attachment);
			Designation d = new Designation();
			d.setDesignationId(designation);
			
			historyOfPosting.setDes(d);
     //  FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
    //   historyOfPosting.setDesignationId(designation);
       historyOfPosting.setFinancialYear(financialYear);
       historyOfPosting.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
       historyOfPosting.setPublishStatus(Constants.PENDING_STATUS);
       historyOfPosting.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		} catch (Exception e) {e.printStackTrace();} 
		return orderDao.saveHistoryOfPosting(historyOfPosting);
	}

	@Override
	public List<Notices> getHistoryOfPostingList() {
		// TODO Auto-generated method stub
		return orderDao.getHistoryOfPostingList();
	}

	@Override
	public boolean updateHistoryOfPosting(Notices orders, MultipartFile file,HttpSession session,int designation) {
		Notices order=noticesDao.findNoticesById(orders.getNoticeID());
		try {
			if(orders.getAttachment().getAttachmentID()==0){
				attachment=new Attachment();
				attachment.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
				attachment.setCreated_date(MethodsHelper.getCurrentDateAndTime());
				attachment.setModule_type(Constants.ORDER_MODULE);
				attachment.setState(Constants.ACTIVE_STATE);
				attachment.setAttachmentID(orders.getAttachment().getAttachmentID());
				  FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();
		    		attachment.setFinancialYear(financialYear);
		      	String path=session.getServletContext().getRealPath("/Notice/"); 
		   		 String a =  file.getOriginalFilename();
		         	String totalPath = path+a;
		         	totalPath=totalPath.replace("\\", "/");
					attachment.setAttachmnt_name(a);
			      attachment.setPath(totalPath);
			  	file.transferTo(new File(totalPath));
			      order.setAttachment(attachment);
			} 

		
		//	order.setDesignationId(designation);
			  order.setTitle(orders.getTitle());
			  order.setDescription(orders.getDescription());
			  
			  order.setPublish_date(order.getPublish_date());
			  order.setType("HISTORY OF POSTING");
			 
			  order.setDes(order.getDes());
			   order.setTags(orders.getTags());
			  order.setDepartment(orders.getDepartment());
		      order.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		      order.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		} catch (Exception e) {e.printStackTrace();} 
		return orderDao.updateHistoryOfPosting(order);
	}

	*/

}
