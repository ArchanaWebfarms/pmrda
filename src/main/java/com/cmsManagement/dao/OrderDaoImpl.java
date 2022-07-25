package com.cmsManagement.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.CmsReports;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;


/**
 * @author ujwala_gawari
 *
 */
@Repository
public class OrderDaoImpl extends AbstractDao<Integer, Notices> implements OrderDao {
	@Autowired
	FinancialYearDao financialYearDao;
	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getOrderList() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='ORDER' and type != 'HISTORY OF POSTING' and financialYear.financialId = '"+financialId+"'   ORDER BY created_date DESC ").list();
	}

	@Override
	public int saveOrders(Notices orders) {
	return (int) getSession().save(orders);
	}

	@Override
	public boolean updateOrders(Notices orders) {
	try {
	getSession().update(orders);
	return true;
	} catch (Exception exception) {
	return false;
	}
	}

	@Override
	public Notices findOrderById(int noticeId) {
	return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getOrdersListByStatus(String ordersStatus, String type) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		System.out.println("financialId="+financialId);
		if(ordersStatus.equals("All") && type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and category = 'ORDER' and financialYear.financialId = '"+financialId+"' group by type,title ").list();
	      }
		if(!ordersStatus.equals("All") &&  !type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and publishStatus = '"+ordersStatus+"' and   type= '"+type+"' and   category = 'ORDER' and financialYear.financialId = '"+financialId+"' group by type,title ").list();
	      }
		if(ordersStatus.equals("All") &&  !type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A'  and   type= '"+type+"' and   category = 'ORDER' and financialYear.financialId = '"+financialId+"' group by type,title ").list();
	      }
		if(!ordersStatus.equals("All") &&  type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and publishStatus = '"+ordersStatus+"'  and     category = 'ORDER' and financialYear.financialId = '"+financialId+"' group by type,title ").list();
	      }
		
		return null;
	
		/*FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		if(ordersStatus.equals("All")){
		return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and category = 'ORDER' and financialYear.financialId = '"+financialId+"' group by type,title ").list();
        }
		if(ordersStatus.equals("All")){
	    if(type!=null){
		return (List<Notices>) getSession().createQuery("from Notices where type= '"+type+"' and STATE=  'A' and category = 'ORDER' and financialYear.financialId = '"+financialId+"' order by CREATED_ON desc").list();
        }
		}
		if(!ordersStatus.equals("All")){
		if(type!=null){
		return (List<Notices>) getSession().createQuery("from Notices where type= '"+type+"' and STATE=  'A' and category = 'ORDER'and financialYear.financialId = '"+financialId+"' and publishStatus= '"+ordersStatus+"' order by CREATED_ON desc").list();
        }
		}
		return (List<Notices>) getSession().createQuery("from Notices where type= '"+type+"' and STATE=  'A' and category = 'ORDER' and financialYear.financialId = '"+financialId+"' and publishStatus= '"+ordersStatus+"' order by CREATED_ON desc").list();
*/
			
	}

	@Override
	public int saveHistoryOfPosting(Notices historyOfPosting) {
		return (int) getSession().save(historyOfPosting);
	}

	@Override
	public List<Notices> getHistoryOfPostingList() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
	return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='ORDER' and type = 'HISTORY OF POSTING' and financialYear.financialId = '"+financialId+"' ORDER BY created_date DESC ").list();
    }

	@Override
	public boolean updateHistoryOfPosting(Notices notices) {
	try {
	getSession().update(notices);
	return true;
	} catch (Exception exception) {
	return false;
	}
	}

}
