package com.cmsManagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;




import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dto.AttachmentDto;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;




@Transactional
@Repository()
@SuppressWarnings("unchecked")
public class NewsDaoImpl extends AbstractDao<Integer, News>  implements NewsDao{

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	FinancialYearDao financialYearDao;

	int id;




	@Override
	public List<News>  GetActiveNews() {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria cr = getSession().createCriteria(News.class)
				/*.add(Restrictions.eq("financialYear.financialId",financialId))*/
				.add(Restrictions.eq("activestatus",Constants.ACTIVE_STATE))
				.add(Restrictions.eq("delete_approval_status", "Active"))
				.addOrder(Order.desc("newsid"));

		return cr.list();

	}
	@Override
	public int AddNews(News News) {
		return (int) getSession().save(News);
	}

	@Override
	public void deleteNews(int id) {

		getSession().createQuery("update News set state = 'D' where NewsID = :NewsID").setInteger( "NewsID", id).executeUpdate();
	}

	@Override
	public News ViewNews(int id) {
		//log.info("View News Current Logged In user is="+LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		return getByKey(id);
	}

	@Override
	public void NewsUpdate(News News) {

		//log.info("News Has Been updated By ="+News.getT);

		getSession().update(News);
	}

	@Override
	public void DeleteAttachmentById(int attachmentID) {

		getSession().createQuery("delete from  Attachment  where attachment_id = :attachment_id").setInteger( "attachment_id", attachmentID).executeUpdate();

	}
	@Override
	public void UpdateStatus (News News) {
		int id = News.getNewsid();
		//getSession().createQuery("update News set ApprovalBy =  '"+News.getApprovalBy()+"',Approved = '"+News.getStatus()+"',comment='"+News.getComment()+"',ApprovedDate='"+News.getApproveddate()+"' where NewsID = :NewsID").setInteger( "NewsID", id).executeUpdate();
		getSession().createQuery("update News set ApprovalBy = :ApprovalBy,Approved =:Approved,comment=:comment,ApprovedDate=:ApprovedDate where NewsID = :NewsID")
		.setParameter("ApprovalBy", News.getApprovalBy())
		.setParameter("Approved", News.getStatus())
		.setParameter("comment", News.getComment())
		.setParameter("ApprovedDate", News.getApproveddate())
		.setParameter( "NewsID", id)
		.executeUpdate();


	}

	@Override
	public List<News> GetNewsListByStatus(String status) {
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria cr = getSession().createCriteria(News.class)
				/*.add(Restrictions.eq("financialYear.financialId",financialId))*/
				.add(Restrictions.eq("activestatus",Constants.ACTIVE_STATE)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				/*.add(Restrictions.disjunction().add(Restrictions.eq("delete_approval_status", "Active"))
						.add(Restrictions.eq("delete_approval_status", "Pending")))*/
						.addOrder(Order.desc("newsid"));

		if(status.equals("All")){
			List<News> GetNews = cr.list();
			return GetNews;
		}else{
			cr.add(Restrictions.eq("status",status));
			return (List<News>)cr.list();
		}
	}



	@Override
	public List<News> GetApprovedNews() {
		System.out.println("GetApprovedNews dao");
		FinancialYear f = 	financialYearDao.getCurrentActiveFinancialYear();
		int financialId=f.getFinancialId();
		Criteria cr = getSession().createCriteria(News.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				/*.add(Restrictions.eq("financialYear.financialId",financialId))*/
				.add(Restrictions.eq("activestatus",Constants.ACTIVE_STATE))
				.add(Restrictions.eq("status", "Approved"))
				.addOrder(Order.desc("newsid"));

		return cr.list();

		/*String query2=" from News where state='A' and  status = 'Approved' and publish_date BETWEEN '"+date1+"' and '"+date2+"' ";
		Query query3=getSession().createQuery(query2);	
	   return query3.list();*/


	}
	@Override
	public List<News> GetdNewsByDates(String date1, String date2) {
		String query2=" from News where state='A' and  status = 'Approved' and publish_date BETWEEN '"+date1+"' and '"+date2+"' order by newsid desc ";
		Query query3=getSession().createQuery(query2);	
		return query3.list();
	}
	@Override
	public ArrayList<News> SearchByKeyWord(String str) {
		System.out.println(str);
		/*Criteria query = getSession().createCriteria(News.class);//.add(Restrictions.eq("Approved", "Approved"))
		Criterion description = Restrictions.like("description", str);
		Criterion name = Restrictions.like("title", str);
		LogicalExpression orExp = Restrictions.or(description, name);
		query.add(orExp);
		return (ArrayList<News>) query.list();
		String query2=" from News where state='A' and  status = 'Approved'  and    title LIKE  '%d' ";
		Query query3=getSession().createQuery(query2);	
		//String query2=" from News where state='A' and  status = 'Approved'  and    title LIKE  '"+str+"'  ";

		return null;
		 */


		/*Criteria query = getSession().createCriteria(News.class);
		query.add(Restrictions.like("title", str));

		return (ArrayList<News>) query.list();*/
		Query qry =getSession().createQuery("From News   where state='A' and  status = 'Approved'  and   ( title    like ? or description like ?  ) ");
		qry.setString(0, "%"+str+"%");
		qry.setString(1, "%"+str+"%");
		return (ArrayList<News>) qry.list();

	}
	@Override
	public int AddNewsStoreProcedure(News News) {
		//itle,Subtitle,Description,PublishDate,Tags,CREATED_BY,CREATED_ON,Approved,state,title_h,NewsPaper,FinancialYear,newspaper_h,url,type
		System.out.println("I AM IN SP"+News);
		Query query = getSession().createSQLQuery("CALL ADD_NEWS(:Title,:Subtitle,:Description,:PublishDate,:Tags,:CREATED_BY,:CREATED_ON,:Approved,:state,:title_h,:NewsPaper,:FinancialYear,:newspaper_h,:url,:type)").addEntity(News.class).
				setParameter("Title",News.getTitle()).
				setParameter("Subtitle",News.getSubtitle()).

				setParameter("Description",News.getDescription()).
				setParameter("PublishDate",News.getPublish_date()).
				setParameter("Tags",News.getTag()).
				setParameter("CREATED_BY", News.getCreatedby()).
				setParameter("CREATED_ON",News.getCreated_date()). 
				setParameter("Approved",News.getStatus()).
				setParameter("state",News.getActivestatus()).  
				setParameter("title_h",News.getTitle_h()).
				setParameter("NewsPaper",News.getNewspaper()).

				setParameter("FinancialYear",News.getFinancialYear().getFinancialId()).
				setParameter("newspaper_h",News.getNewspaper_h()).
				setParameter("url",News.getUrl())  .
				setParameter("type",News.getType())  ;
		return query.executeUpdate();
	}
	@Override
	public int GetLastInsertedID() {

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pmrda?" + "user=root&password=Webfarms@123");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select max(NewsID) from tbl_news");
			if(rs.next()){ id=rs.getInt(1); }

		}
		catch(Exception e1){e1.printStackTrace(); }
		return id;
	}
	@Override
	public void UpdateNewsStoreProcedure(News News) {
		// NewsID ,  Title, Subtitle ,Description , PublishDate ,Tags ,MODIFIED_BY ,  MODIFIED_ON ,title_h, NewsPaper, newspaper_h		
		Query query = getSession().createSQLQuery("CALL UPDATE_NEWS(:Title,:Subtitle,:Description,:PublishDate,:Tags,:MODIFIED_BY,:MODIFIED_ON,:title_h,:NewsPaper,:newspaper_h,:NewsID)").addEntity(News.class).

				setParameter("Title",News.getTitle()).
				setParameter("Subtitle",News.getSubtitle()).

				setParameter("Description",News.getDescription()).
				setParameter("PublishDate",News.getPublish_date()).
				setParameter("Tags",News.getTag()).
				setParameter("MODIFIED_BY", News.getUpdatedby()).
				setParameter("MODIFIED_ON",News.getUpdationdate()). 
				setParameter("title_h",News.getTitle_h()).
				setParameter("NewsPaper",News.getNewspaper()).
				setParameter("newspaper_h",News.getNewspaper_h()) .
				setParameter("NewsID",News.getNewsid());
		;


	}
	@Override
	public boolean UpdateNews(News News) {

		try {
			getSession().update(News);
			return true;

		} catch (Exception exception) {
			return false;
		}

	}
	@Override
	public ArrayList<AttachmentDto> attachmentList() {
		Query qry =getSession().createSQLQuery("select tbl_news.NewsID,tbl_news.Title,tbl_news.Title_h,tbl_news.PublishDate,tbl_news.NewsPaper,tbl_news.NewsPaper_h ,tbl_attachment.attachment_id,tbl_attachment.module_id,tbl_attachment.module_type,tbl_attachment.attachment_name,tbl_attachment.path  from tbl_news  INNER JOIN  tbl_attachment ON tbl_attachment.module_id = tbl_news.NewsID where tbl_news.state='A' and  tbl_news.Approved = 'Approved'");

		return (ArrayList<AttachmentDto>) qry.list();
	}
	@Override
	public List<AttachmentDto> GetAttachmentDto() {
		Query qry =getSession().createSQLQuery("select tbl_news.NewsID,tbl_news.Title,tbl_news.Title_h,tbl_news.PublishDate,tbl_news.NewsPaper,tbl_news.NewsPaper_h ,tbl_attachment.attachment_id,tbl_attachment.module_id,tbl_attachment.module_type,tbl_attachment.attachment_name,tbl_attachment.path  from tbl_news  INNER JOIN  tbl_attachment ON tbl_attachment.module_id = tbl_news.NewsID where tbl_news.state='A' and  tbl_news.Approved = 'Approved'").addEntity(AttachmentDto.class);
		return  qry.list();
	}
	@Override
	public List<AttachmentDto> getNewsAttachmentList() {
		ArrayList<AttachmentDto> list=new ArrayList<AttachmentDto>();
		AttachmentDto attachment=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pmrda?" + "user=root&password=Webfarms@123");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select   tbl_news.NewsID,tbl_news.Title,tbl_news.Title_h,tbl_news.PublishDate,tbl_news.NewsPaper,tbl_news.NewsPaper_h ,tbl_attachment.module_id,tbl_attachment.module_type,tbl_attachment.attachment_name,tbl_attachment.path  from tbl_news  INNER JOIN  tbl_attachment ON tbl_attachment.module_id = tbl_news.NewsID  GROUP BY `Title` ");
			while(rs.next())   { 
				//News
				attachment = new AttachmentDto();
				attachment.setNewsid(rs.getInt(1));
				attachment.setTitle(rs.getString(2));
				attachment.setTitle_h(rs.getString(3));
				attachment.setPublishdate(rs.getString(4));
				attachment.setNewspaper(rs.getString(5));
				attachment.setNewspaper_h(rs.getString(6)); 
				//attachment.setAttachmentid(rs.getInt(7));
				attachment.setModuleid(rs.getInt(7));
				attachment.setModuletype(rs.getString(8));
				//Attachment
				attachment.setAttachmentName(rs.getString(9));
				attachment.setPath(rs.getString(10));
				list.add(attachment);


			}

		}
		catch(Exception e1){e1.printStackTrace(); }
		return list;
	}
	/*@Override
	public List<AttachmentDto> getNewsAttachmentList() {
        Query query = getSession().createSQLQuery("CALL GETALL()");
System.out.println("check==="+query.list());
		return query.list();
	}*/
	@Override
	public void changeNewsStaus1(int id, String string, String date, String string2) {

		getSession().createQuery("update News  set comment = '"+string+"',"
				+ " approveddate = '"+date+"', publishStatus = '"+string2+"'  where id = :id")
				.setInteger( "id", id)
				.executeUpdate();

	}
	@Override
	public List<News> getAllPendingDeactiveNews(String status) {
		Criteria cr = getSession().createCriteria(News.class)
				.add(Restrictions.eq("status","Approved"))
				.add(Restrictions.eq("delete_approval_status",status))
				.addOrder(Order.desc("newsid"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);			
		return (List<News>)cr.list();

	}
	@Override
	public List<News> GetApprovedActiveNews() {
		Criteria cr = getSession().createCriteria(News.class)
				.add(Restrictions.eq("activestatus","A"))
				.add(Restrictions.eq("status","Approved"))
				.addOrder(Order.desc("newsid"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);			
		return (List<News>)cr.list();
	}






}
