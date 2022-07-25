package com.cmsManagement.dao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.RTIApplications;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.util.Constants;
import com.mysql.cj.protocol.x.Notice;

/**
 * @author ujwala_gawari
 *
 */
@Repository()
@Transactional
public class NoticesDaoImpl extends AbstractDao<Integer, Tendors> implements NoticesDao {
	@Autowired
	FinancialYearDao financialYearDao;
	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getNoticesList() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		/*Criteria cr = getSession().createCriteria(Notices.class)
				.add(Restrictions.eq("financialYear.financialId",financialId))
				.add(Restrictions.eq("state", Constants.ACTIVE_STATE))
				.add(Restrictions.eq("category", "NOTICE"))
				.addOrder(Order.desc(Constants.CREATED_DATE));
		return cr.list();*/
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='NOTICE' and delete_approval_status='Active' ORDER BY noticeID DESC").list();
	}

	@Override
	public int saveNotices(Notices notices) {
		return (int) getSession().save(notices);
	}

	@Override
	public Notices findNoticesById(int noticeID) {
		return (Notices) getSession().createQuery("from Notices where noticeID = :noticeID").setParameter("noticeID", noticeID).uniqueResult();
	}

	@Override
	public boolean deleteNotices(int noticeID) {
		try {
			getSession().createQuery("update Notices set state = 'D' where noticeID = :noticeID")
			.setInteger( "noticeID", noticeID)
			.executeUpdate();
			return true;

		} catch (Exception exception) {
			return false;
		}	
	}

	@Override
	public boolean updateNotices(Notices notices) {
		try {
			getSession().update(notices);
			return true;

		} catch (Exception exception) {
			return false;
		}	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getNoticesListByStatus(String noticesStatus, String type) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		//System.out.println("financialId="+financialId);
		if(noticesStatus.equals("All") && type.equals("All")){
			//System.out.println("in if");
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and   category = 'NOTICE' and financialYear.financialId = '"+financialId+"' order by noticeID desc ").list();
		}
		else if(!noticesStatus.equals("All") &&  !type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and publishStatus = '"+noticesStatus+"' and   type= '"+type+"' and   category = 'NOTICE' and financialYear.financialId = '"+financialId+"' order by noticeID desc").list();
		}
		else if(noticesStatus.equals("All") &&  !type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A'  and   type= '"+type+"' and   category = 'NOTICE' and financialYear.financialId = '"+financialId+"' order by noticeID desc ").list();
		}
		else if(!noticesStatus.equals("All") &&  type.equals("All")){
			return (List<Notices>) getSession().createQuery("from Notices where STATE=  'A' and publishStatus = '"+noticesStatus+"'  and     category = 'NOTICE' and financialYear.financialId = '"+financialId+"' order by noticeID desc ").list();
		}
		else{
			return null;
		}

	}


	public boolean changeNoticesStaus(int noticeID, String comment, String status, String approvalBy, String date) {
		System.out.println("NoticeID=="+noticeID);
		try {
			getSession().createQuery("update Notices set approvalBy = '"+approvalBy+"', comment = '"+comment+"',"
					+ " approveddate = '"+date+"', publishStatus = '"+status+"'  where noticeID = :noticeID")
					.setInteger( "noticeID", noticeID).executeUpdate();
			return true;
		} catch (Exception exception) {
			return false;
		}	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> searchNoticesByDepartment(int deptID, String noticeType, String category,int year) {
		System.out.println("IN DEPARTMENT");
		Criteria crit = getSession().createCriteria(Notices.class);
		crit.add(Restrictions.eq(Constants.PUBLISH_STATUS, Constants.APPROVED_STATUS));
		crit.add(Restrictions.eq(Constants.CATEGORY, category));
		crit .add(Restrictions.eq("state",Constants.ACTIVE_STATE));
		crit .add(Restrictions.eq("publishStatus",Constants.APPROVED_STATUS));
		crit.add(Restrictions.eq("financialYear.financialId", year));
		if(deptID==0){
			if(noticeType!="" &&  !noticeType.equals("HISTORY OF POSTING")){
				System.out.println("IN ONE");
				Criteria cr = getSession().createCriteria(Notices.class)
						.add(Restrictions.eq("type",noticeType))

						.add(Restrictions.eq("state",Constants.ACTIVE_STATE))
						.add(Restrictions.eq("category",category))
						.add(Restrictions.eq("publishStatus",Constants.APPROVED_STATUS))
						.add(Restrictions.eq("financialYear.financialId", year))
						.setProjection(Projections.projectionList()
								.add(Projections.property("financialYear"),"financialYear")
								.add(Projections.property("approvalBy"), "ApprovalBy")
								.add(Projections.property("publishStatus"), "publishStatus")
								.add(Projections.property("attachment"), "attachment")
								.add(Projections.property("department"), "department")
								.add(Projections.property("tags"), "tags")
								.add(Projections.property("description"), "description")
								.add(Projections.property("publish_date"), "publish_date")
								.add(Projections.property("title"), "title")

								.add(Projections.property("title_h"), "title_h"))
								.setResultTransformer(Transformers.aliasToBean(Notices.class));
				return (List<Notices>)cr.list();
			}
		}else{
			if(noticeType!=""){	
				return (List<Notices>) getSession().createQuery("from Notices where publishStatus='Approved' and category  = '"+category+"' and   type='"+noticeType+"' and department_ID='"+deptID+"'").list();
			}	
		}
		if(deptID==0){
			if(noticeType!="" &&  noticeType.equals("HISTORY OF POSTING")){
				return (List<Notices>) getSession().createQuery("from Notices where publishStatus='Approved' and category  = '"+category+"'  and   type='"+noticeType+"'  ORDER BY des.sequence").list();
			}
			if(deptID>0)
			{
				if(noticeType!="" && noticeType.equals("HISTORY OF POSTING")){
					return (List<Notices>) getSession().createQuery("from Notices where department_ID ='"+deptID+"' and  publishStatus='Approved' and category  = '"+category+"'  and   type='"+noticeType+"'   ORDER BY des.sequence ").list();
				}
			}
		}/*else{
			crit.add(Restrictions.eq("department.deptId", deptID));
		    if(noticeType!=""){	
			crit.add(Restrictions.eq(Constants.TYPE, noticeType));
		    }	
	        }*/
		return (List<Notices>)crit.list();





	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> searchNoticesByFinancialYear(int financialId, String noticeType,String category) {

		if(financialId==0)
		{
			return (List<Notices>) getSession().createQuery("from Notices where publishStatus='Approved' and category  = '"+category+"'  and   type='"+noticeType+"' ORDER BY des.sequence  ").list();
		}
		if(!noticeType.equals("HISTORY OF POSTING"))
		{
			Criteria cr = getSession().createCriteria(Notices.class)
					.add(Restrictions.eq("financialYear.financialId",financialId))
					.add(Restrictions.eq("type",noticeType))
					.add(Restrictions.eq("category",category))
					.add(Restrictions.eq("state",Constants.ACTIVE_STATE))
					.setProjection(Projections.projectionList()
							.add(Projections.property("financialYear"),"financialYear")
							.add(Projections.property("approvalBy"), "ApprovalBy")
							.add(Projections.property("publishStatus"), "publishStatus")
							.add(Projections.property("attachment"), "attachment")
							.add(Projections.property("department"), "department")
							.add(Projections.property("category"), "category")
							.add(Projections.property("tags"), "tags")
							.add(Projections.property("type"), "type")
							.add(Projections.property("description"), "description")
							.add(Projections.property("date"), "date")
							.add(Projections.property("title"), "title")
							.add(Projections.property("title_h"), "title_h"))
							.setResultTransformer(Transformers.aliasToBean(Notices.class));
			return (List<Notices>)cr.list();
		}
		Criteria crit = null;
		if(noticeType.equals("HISTORY OF POSTING"))
		{
			crit = getSession().createCriteria(Notices.class);
			crit.add(Restrictions.eq(Constants.CATEGORY, category));
			crit.add(Restrictions.eq(Constants.PUBLISH_STATUS, Constants.APPROVED_STATUS));
			crit.addOrder(Order.desc(Constants.CREATED_DATE));

			if(financialId==0){
				if(noticeType!=""){
					crit.add(Restrictions.eq(Constants.TYPE, noticeType));
				}
			}else{
				crit.add(Restrictions.eq("financialYear.financialId", financialId));
				if(noticeType!=""){	
					crit.add(Restrictions.eq(Constants.TYPE, noticeType));
				}	
			}
		}
		return (List<Notices>)crit.list();	



	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EntryLogModel> GetData() {

		Criteria cr = getSession().createCriteria(EntryLogModel.class)
				.add(Restrictions.eq("status",Constants.ACTIVE_STATE))
				.addOrder(Order.asc("id"));

		return cr.list();
	}



	@Override
	public List<Notices> getApprovedNoticesList() {
		int financialId=	financialYearDao.getCurrentActiveFinancialYear().getFinancialId();
		/*Criteria cr = getSession().createCriteria(Notices.class)
				.add(Restrictions.eq("financialYear.financialId",financialId))
				.add(Restrictions.eq("state", Constants.ACTIVE_STATE))
				.add(Restrictions.eq("category", "NOTICE"))
				.addOrder(Order.desc(Constants.CREATED_DATE));
		return cr.list();*/
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='NOTICE' and publishStatus = 'Approved'  ORDER BY created_date DESC").list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getApprovedNoticesListBetweenDates(String date1,String date2,String type) {
		String query2=" from Notices where state='A' and publishStatus = 'Approved' and  type='"+type+"'  and  date BETWEEN '"+date1+"' and '"+date2+"' ";
		Query query3=getSession().createQuery(query2);	
		return query3.list();

	}

	@Override
	public List<Notices> getApprovedNoticesbyType(String type) {

		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='NOTICE' and publishStatus = 'Approved' and type='"+type+"'  ORDER BY noticeID DESC").list();

	}



	@Override
	public ArrayList<Notices> SearchNoticesByKeyWord(String str) {
		Query qry =getSession().createQuery("From Notices   where state='A' and   publishStatus = 'Approved' and  ( title    like ? or description like ?  )   ");
		qry.setString(0, "%"+str+"%");
		qry.setString(1, "%"+str+"%");
		return (ArrayList<Notices>) qry.list();
	}

	@Override
	public Attachment findAttachmentById(Attachment attachment_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notices> GetNoticesByDates(String date1, String date2,String type) {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and type='"+type+"' and publishStatus = 'Approved' and publish_date BETWEEN '"+date1+"' and '"+date2+"'   ORDER BY created_date DESC").list();
	}

	@Override
	public void changeNoticeStatus1(int id, String string, String Date,
			String string2) {
		getSession().createQuery("update Notices set comment = '"+string+"',"
				+ " approveddate = '"+Date+"', publishStatus = '"+string2+"'  where id = :id")
				.setInteger( "id", id)
				.executeUpdate();

	}

	@Override
	public List<Notices> getAllNotice() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and financialYear.financialId = '"+financialId+"' ORDER BY created_date DESC").list();

	}

	@Override
	public List<Notices> getNoticesByStatus(String status,String type) {
		// TODO Auto-generated method stub
		return (List<Notices>)getSession().createQuery("from Notices where state='A' and type='"+type+"' and publishStatus = '"+status+"' ORDER BY created_date DESC").list();



	}


	@Override
	public List<Notices> searchNoticeByDepartment(int deptId, String status) {
		if(deptId==0){
			return (List<Notices>) getSession().createQuery("from Notices where  state='A' and publishStatus='Archive'  ORDER BY created_date DESC").list();
		}else{
			return (List<Notices>) getSession().createQuery("from Notices where state='A' and  publishStatus='Archive'   and department_ID='"+deptId+"' ORDER BY created_date DESC").list();
		}	
	}

	@Override
	public List<Notices> getArchieveNoticesByDates(String date1, String date2,String type) {
		System.out.println(date1+"=="+date2+"=="+type);
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and type='"+type+"' and publishStatus = 'Archive' and date BETWEEN '"+date1+"' and '"+date2+"'   ORDER BY created_date DESC").list();

	}

	@Override
	public List<Notices> getActDocument() {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='NOTICE' and publishStatus = 'Approved' and (type='STATE GOV GR' or type='CENTRAL GOV GR')  ORDER BY noticeID DESC").list();

	}

	@Override
	public List<Notices> searchNoticesByDepartment(String noticeType,String category) {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and type='"+noticeType+"' and publishStatus = 'Approved' ORDER BY id DESC").list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> searchNoticesByDepartment(int deptID,String noticeType, String category) {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and type='"+noticeType+"' and publishStatus = 'Approved' and (department_ID="+deptID+") ORDER BY id DESC").list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getApprovedNoticesbyStatus(String status) {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and publishStatus = '"+status+"' ORDER BY id DESC").list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getAllPendingDeactiveNotices(String status) {
		return (List<Notices>) getSession().createQuery("from Notices where  publishStatus = 'Approved' and delete_approval_status='"+status+"' ORDER BY id DESC").list();

	}

	@Override
	public EntryLogModel GetAllData() {
		return (EntryLogModel) getSession().createQuery("from EntryLogModel ORDER BY id DESC").list().get(0);

	}

	@Override
	public List<RTIApplications> getRTIApplications() {
		return (List<RTIApplications>) getSession().createQuery("from RTIApplications ORDER BY id DESC").list();

	}

	@Override
	public void saveRtiApplications(RTIApplications rti) {
		getSession().save(rti);
	}

	@Override
	public void deleteRTIApllication(int id) {
		getSession().createQuery("delete from RTIApplications where id="+id+"").executeUpdate();
	}




}
