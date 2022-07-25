package com.cmsManagement.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Notices;

/**
 * @author ujwala_gawari
 *
 */
public interface OrderService {

	/**
	 * returns list of all the Orders available.
	 * @return
	 *//*
	List<Notices> getOrderList();

	*//**
	 * Adds a new Orders in Notice Table and attachment of it in Attachment-table return inserted ID
	 * @param notices
	 * @param file
	 *//*
	int saveOrders(Notices notices, MultipartFile file, HttpSession session);

	*//**
	 * update Orders and attachment if required return boolean value 
	 * @param financialYear
	 * @param file
	 *//*
	boolean updateOrders(Notices notices, MultipartFile file, HttpSession session);

	*//**
	 * returns the Orders with a specific id.
	 * @param noticeId
	 * @return
	 *//*
	Notices findOrderById(int noticeId);

	*//**
	 * Deactivate Orders with a specific id.
	 * @param noticeId
	 *//*
	boolean deleteOrders(int noticeId);

	*//**
	 * returns list of all the Orders available for given Order type and orders status.
	 * @return
	 *//*
	List<Notices> getOrdersListByStatus(String ordersStatus, String type);
////
	*//**
	 * Adds a new History Of Posting in Notice Table and attachment of it in Attachment-table return inserted ID
	 * @param notices
	 * @param file
	 *//*
	int saveHistoryOfPosting(Notices historyOfPosting, MultipartFile file, HttpSession session,int designation);
	
	*//**
	 * returns list of all the Orders available for  Order 'History Of Posting' 
	 * @param file
	 *//*
	List<Notices> getHistoryOfPostingList();
	*//**
	 * update Orders and attachment if required return boolean value 
	 * @param financialYear
	 * @param file
	 *//*
	boolean updateHistoryOfPosting(Notices notices, MultipartFile file, HttpSession session,int designation);*/
}
