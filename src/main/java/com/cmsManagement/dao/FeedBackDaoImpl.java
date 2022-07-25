package com.cmsManagement.dao;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Repository
public class FeedBackDaoImpl extends AbstractDao<Serializable, FeedBack> implements FeedBackDao {

	
	@Override
	public int saveComplaint(FeedBack feedBack) {
		return (int)getSession().save(feedBack);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FeedBack> getFeedbackReport(String reportType, String startDate, String endDate) {
		Criteria crit = getSession().createCriteria(FeedBack.class);
			   if(reportType.equals(Constants.REPORT_TYPE_ALL)){
				   crit.addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_TODAY)){
					crit.add(Restrictions.eq(Constants.CREATED_DATE, MethodsHelper.getCurrentDate())).
					addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_DATEWISE)){
					System.err.println(startDate);
					crit.add(Restrictions.eq(Constants.CREATED_DATE,startDate)).
					addOrder(Order.desc(Constants.CREATED_DATE));
				}else if(reportType.equals(Constants.REPORT_TYPE_BETWEENDATES)){
					/*crit.add(Restrictions.eq(Constants.CREATED_DATE, startDate))
					.addOrder(Order.desc(Constants.CREATED_DATE));*/
					crit.add(Restrictions.between(Constants.CREATED_DATE, startDate, endDate))
					.addOrder(Order.desc(Constants.CREATED_DATE));
				}
		return crit.list();
	}

	@Override
	public FeedBack viewFeedBackDetails(int feedBackID) {
		Criteria crit = getSession().createCriteria(FeedBack.class);
		crit.add(Restrictions.eq("feedBackID", feedBackID));
		return (FeedBack) crit.uniqueResult();
	}

	@Override
	public void saveEnquiry(Enquiry info) {
		getSession().save(info);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Enquiry> getEnquirykReport(String reportType, String startDate,
			String endDate) {
		Criteria crit = getSession().createCriteria(Enquiry.class);
		System.out.println(reportType+" "+startDate+" "+endDate);
		   if(reportType.equals(Constants.REPORT_TYPE_ALL)){
			   crit.addOrder(Order.desc("id"));
			}else if(reportType.equals(Constants.REPORT_TYPE_TODAY)){
				crit.add(Restrictions.eq("created_date", MethodsHelper.getCurrentDate())).
				addOrder(Order.desc("id"));
			}else if(reportType.equals(Constants.REPORT_TYPE_DATEWISE)){				
				crit.add(Restrictions.eq("created_date",startDate)).
				addOrder(Order.desc("id"));
			}else if(reportType.equals(Constants.REPORT_TYPE_BETWEENDATES)){				
				crit.add(Restrictions.between("created_date", startDate, endDate))
				.addOrder(Order.desc("id"));
			}
	return crit.list();
	}

	@Override
	public Enquiry viewEnquiry(int id) {
		Criteria crit = getSession().createCriteria(Enquiry.class);
		crit.add(Restrictions.eq("id", id));
		return (Enquiry) crit.uniqueResult();
	}

	
	
}
