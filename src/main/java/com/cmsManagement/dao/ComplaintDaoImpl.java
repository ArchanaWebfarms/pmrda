package com.cmsManagement.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Repository()
public class ComplaintDaoImpl extends AbstractDao<Integer, Complaint> implements ComplaintDao {
	@Autowired
	FinancialYearDao financialYearDao;
	@Override
	public int saveComplaint(Complaint complaint) {
		return (int) getSession().save(complaint);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Complaint> getComplaintReport(String reportType, String startDate, String endDate, String status) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria crit = getSession().createCriteria(Complaint.class)
				  .add(Restrictions.eq("financialYear.financialId",financialId));
		 if(status.equals(Constants.REPORT_TYPE_ALL)){
			  if(reportType.equals(Constants.REPORT_TYPE_ALL)){
				  	crit.addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_TODAY)){
					crit.add(Restrictions.eq(Constants.CREATED_DATE, MethodsHelper.getCurrentDate())).
					addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_DATEWISE)){
					crit.add(Restrictions.eq(Constants.CREATED_DATE, startDate)).
					addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_BETWEENDATES)){
					crit.add(Restrictions.between(Constants.CREATED_DATE, startDate, endDate))
					.addOrder(Order.desc(Constants.CREATED_DATE));
				}
		  }else{
			  if(reportType.equals(Constants.REPORT_TYPE_ALL)){
				   crit.add(Restrictions.eq(Constants.COMPLAINT_STATUS, status))
				   .addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_TODAY)){
					crit.add(Restrictions.eq(Constants.CREATED_DATE, MethodsHelper.getCurrentDate()));
					crit.add(Restrictions.eq(Constants.COMPLAINT_STATUS, status))
					.addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_DATEWISE)){
					crit.add(Restrictions.eq(Constants.CREATED_DATE, startDate))
					.addOrder(Order.desc(Constants.CREATED_DATE));
					crit.add(Restrictions.eq(Constants.COMPLAINT_STATUS, status))
					.addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_BETWEENDATES)){
					crit.add(Restrictions.between(Constants.CREATED_DATE, startDate, endDate));
					crit.add(Restrictions.eq(Constants.COMPLAINT_STATUS, status))
					.addOrder(Order.desc(Constants.CREATED_DATE));
				}		
		  }
		
		/*if(status.equals("All")){
			if(reportType.equals("All")){
				
			}else if(reportType.equals("Today")){
				 crit.add(Restrictions.eq("created_date", status))
				   .addOrder(Order.desc(Constants.CREATED_DATE));
			}else if(reportType.equals("Datewise")){
				
			}else if(reportType.equals("BetweenDates")){
				
			}
			
		}else if(status.equals("Solved")){
			if(reportType.equals("All")){
				
			}else if(reportType.equals("Today")){
				
			}else if(reportType.equals("Datewise")){
				
			}else if(reportType.equals("BetweenDates")){
				
			}
		}else if(status.equals("Pending")){
			if(reportType.equals("All")){
				
			}else if(reportType.equals("Today")){
				
			}else if(reportType.equals("Datewise")){
				
			}else if(reportType.equals("BetweenDates")){
				
			}
		}*/
			   
		return crit.list();
	}

	@Override
	public Complaint viewComplaintDetails(int complaintID) {
		Criteria crit = getSession().createCriteria(Complaint.class);
		crit.add(Restrictions.eq("complaintID", complaintID));
		return (Complaint) crit.uniqueResult();
	}

	@Override
	public Complaint addComplaintDptComments(int complaintID, Complaint complaint) {
		getSession().update(complaint);
		return viewComplaintDetails(complaintID);
	}

	
	
}
