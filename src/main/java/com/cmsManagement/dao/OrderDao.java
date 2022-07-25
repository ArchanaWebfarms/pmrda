package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.Notices;

/**
 * @author ujwala_gawari
 *
 */
public interface OrderDao {

	List<Notices> getOrderList();

	int saveOrders(Notices notices);

	boolean updateOrders(Notices notices);

	Notices findOrderById(int noticeId);

	List<Notices> getOrdersListByStatus(String ordersStatus, String type);
	
	//New Addedd
	int saveHistoryOfPosting(Notices notices);
	boolean updateHistoryOfPosting(Notices notices);
	List<Notices> getHistoryOfPostingList();
	

}
