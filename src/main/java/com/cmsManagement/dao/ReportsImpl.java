package com.cmsManagement.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.model.CmsReports;
import com.cmsManagement.model.Project;
import com.cmsManagement.service.projectService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
@SuppressWarnings("unchecked")
@Transactional
@Repository
public class ReportsImpl  extends AbstractDao<Integer, CmsReports> implements ReportsDao {
	
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDateTime now = LocalDateTime.now();
	String date =   dtf.format(now).toString();

	List<CmsReports> userIDlist= new ArrayList<CmsReports>();


	@Override
	public List<CmsReports> GetCmsReports(String Module, String Today,String startDate, String endDate, String user) throws ParseException  {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");

		/*Criteria crit = getSession().createCriteria(CmsReports.class);
		crit.add(Restrictions.eq(Constants.PUBLISH_STATUS, Constants.REPORT_TYPE_ALL));*/

		//IF SELECTION OF USERS IS ALL
		if(user.equals("All"))
		{
			//NEWS
			if(Module.equals("NEWS") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON = '"+date+"'  and Approved = 'Approved' and state = 'A' ").list();
			}
			if(Module.equals("NEWS") && startDate!=null && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON = '"+newstartDate+"' and Approved = 'Approved' and state = 'A' ").list();
			}
			if(Module.equals("NEWS") && startDate!=null && endDate!=null)
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and Approved = 'Approved' and state = 'A' ").list();
			} 
			if(Module.equals("NEWS"))
			{
				return (List<CmsReports>) getSession().createQuery("from News where  state = 'A' and Approved = 'Approved'   ").list();
			}

			//TENDERS
			if(Module.equals("TENDERS") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON = '"+date+"'  and  publishStatus = 'Approved' and state = 'A' ").list();
			}//and CreatedBy = '"+user+"'
			if(Module.equals("TENDERS") && startDate!=null  && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON = '"+newstartDate+"' and publishStatus = 'Approved'  and state = 'A' ").list();
			}
			if(Module.equals("TENDERS") && startDate!=null && endDate!=null)
			{
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and publishStatus = 'Approved' and state = 'A' ").list();
			} 
			if(Module.equals("TENDERS"))
			{
				return (List<CmsReports>) getSession().createQuery("from Tendors where publishStatus = 'Approved' and state = 'A' ").list();
			}
			//
			//NOTICES
			if(Module.equals("NOTICES") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_ON = '"+date+"'  and  publishStatus = 'Approved' and STATE = 'A' ").list();
			}//and CreatedBy = '"+user+"'
			if(Module.equals("NOTICES") && startDate!=null  && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_ON = '"+newstartDate+"' and publishStatus = 'Approved'  and STATE = 'A' ").list();
			}
			if(Module.equals("NOTICES") && startDate!=null && endDate!=null)
			{
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and publishStatus = 'Approved' and STATE = 'A' ").list();
			} 
			if(Module.equals("NOTICES"))
			{
				return (List<CmsReports>) getSession().createQuery("from Notices where publishStatus = 'Approved' and STATE = 'A' ").list();
			}


			
			//FILTER BY USER
		}
		else
		{
			if(Module.equals("NEWS") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON = '"+date+"' and CREATED_BY = '"+user+"'  and Approved = 'Approved' and state = 'A' ").list();
			}//and CreatedBy = '"+user+"'
			if(Module.equals("NEWS") && startDate!=null  && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON = '"+newstartDate+"' and CREATED_BY = '"+user+"' and Approved = 'Approved' and  state = 'A' ").list();
			}
			if(Module.equals("NEWS") && startDate!=null && endDate!=null)
			{
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and CREATED_BY = '"+user+"' and Approved = 'Approved' and state = 'A' ").list();
			}
			if(Module.equals("NEWS")  && startDate==null && endDate==null)
			{
				return (List<CmsReports>) getSession().createQuery("from News where CREATED_BY = '"+user+"' and Approved = 'Approved' and state = 'A' ").list();
			}

			if(Module.equals("NEWS"))
			{
				return (List<CmsReports>) getSession().createQuery("from News where Approved = 'Approved' and state = 'A' ").list();
			}
			//TENDERS
			if(Module.equals("TENDERS") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON = '"+date+"' and CREATED_BY = '"+user+"' and publishStatus = 'Approved' and state = 'A' ").list();
			}//and CreatedBy = '"+user+"'
			if(Module.equals("TENDERS") && startDate!=null  && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON = '"+newstartDate+"' and CREATED_BY = '"+user+"' and publishStatus = 'Approved' and  state = 'A' ").list();
			}
			if(Module.equals("TENDERS") && startDate!=null && endDate!=null)
			{
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and CREATED_BY = '"+user+"' and publishStatus = 'Approved' and state = 'A' ").list();
			} 
			if(Module.equals("TENDERS")  && startDate==null && endDate==null)
			{
				return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_ON = '"+user+"' and publishStatus = 'Approved' and state = 'A' ").list();
			}
			if(Module.equals("TENDERS"))
			{
				return (List<CmsReports>) getSession().createQuery("from Tendors where publishStatus = 'Approved' and  state = 'A' ").list();
			}

			//NOTICES
			if(Module.equals("NOTICES") && Today.equals("Today") )
			{
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_BY = '"+user+"' and date = '"+date+"'  and  publishStatus = 'Approved' and STATE = 'A' ").list();
			}//and CreatedBy = '"+user+"'
			if(Module.equals("NOTICES") && startDate!=null  && endDate.equals(""))
			{
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_ON = '"+newstartDate+"' and CREATED_BY = '"+user+"' and publishStatus = 'Approved' and  STATE = 'A' ").list();
			}
			if(Module.equals("NOTICES") && startDate!=null && endDate!=null)
			{
				Date date2 = format2.parse(endDate);
				String newEnddate = format1.format(date2);
				Date date1 = format2.parse(startDate);
				String newstartDate = format1.format(date1);
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_ON BETWEEN '"+newstartDate+"' AND '"+newEnddate+"' and CREATED_BY = '"+user+"' and publishStatus = 'Approved' and STATE = 'A' ").list();
			} 
			if(Module.equals("NOTICES")  && startDate==null && endDate==null)
			{
				return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_BY = '"+user+"' and publishStatus = 'Approved' and STATE = 'A' ").list();
			}
			if(Module.equals("NOTICES"))
			{
				return (List<CmsReports>) getSession().createQuery("from Notices where publishStatus = 'Approved' and  STATE = 'A' ").list();
			}

		}
		return (List<CmsReports>) getSession().createQuery("from abc where publishStatus = 'Approved' and  STATE = 'A' ").list();
	}





	@Override
	public List<CmsReports> GetUsersReportByRoleID(int roleID) {
		System.out.println("RoleID in IMPL=="+roleID);
		boolean x = true;

		return (List<CmsReports>) getSession().createQuery("from User where roleID = '"+roleID+"'").list();
	}











	@Override
	public List<CmsReports> GetUsersRportsByuserID(int userID) {
		System.out.println("RoleID in IMPL=="+userID);
		List<CmsReports> list= new ArrayList<CmsReports>();

		CmsReports CmsReports = new CmsReports();
		List<CmsReports> list1=getSession().createQuery("from Notices where CREATED_BY = '"+userID+"'").list();
		System.out.println(list1.toString());
		List<CmsReports> list2= getSession().createQuery("from News where CREATED_BY = '"+userID+"'").list();
		System.out.println(list2.toString());
		List<CmsReports> list3= getSession().createQuery("from Tendors where CREATED_BY = '"+userID+"'").list();
		System.out.println(list3.toString());
		list.addAll(list1);
		list.addAll(list2);
		list.addAll(list3);
		/*switch(userID)
		{
		case 1:return (List<CmsReports>) getSession().createQuery("from News where CREATED_BY = '"+userID+"'").list();
		case 2:return (List<CmsReports>) getSession().createQuery("from Tendors where CREATED_BY = '"+userID+"'").list();

		case 3:return (List<CmsReports>) getSession().createQuery("from Notices where CREATED_BY = '"+userID+"'").list();

		//break;  
		}*/

		return list;
	}






	@Override
	public List<CmsReports> getUserReportsByRole(int userID) {
		System.out.println(" I AM IN getUserReportsByRole"+userID);
		List<CmsReports> list= new ArrayList<CmsReports>();



		List<CmsReports> list1 = getSession().createQuery("from News where CREATED_BY = '"+userID+"'  ").list();
		List<CmsReports> list2 = getSession().createQuery("from Notices where CREATED_BY = '"+userID+"'  ").list();
		List<CmsReports> list3 = getSession().createQuery("from Tendors where CREATED_BY = '"+userID+"'  ").list();

		list.addAll(list1);
		list.addAll(list2);
		list.addAll(list3);
		System.out.println("LIST in impl=="+list.toString());
		return list;
	}





	@Override
	public List<CmsReports> GetCmsReportsOfProject(String Module, String Today,String startDate, String endDate, String user) throws ParseException {
		System.out.println(Module+" "+Today+" "+startDate+" "+endDate+" "+user);
			if(user.equals("All"))			
			{				
				if(Today.equals("Today"))
				{
					return (List<CmsReports>) getSession().createQuery("from Project where  status = 'A' and approvedStatus = 'Approved' and created_date='"+date+"'  ").list();					
				}				
				else if(startDate!=null && endDate.equals(""))
				{
					return (List<CmsReports>) getSession().createQuery("from Project where  status = 'A' and approvedStatus = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
				}
				else if( startDate!=null && endDate!=null)
				{
					return (List<CmsReports>) getSession().createQuery("from Project where  status = 'A' and approvedStatus = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
				}
				else
				{
					return (List<CmsReports>) getSession().createQuery("from Project where  status = 'A' and approvedStatus = 'Approved'").list();				
				}
			}else{
				if(Today.equals("Today"))
				{
					return (List<CmsReports>) getSession().createQuery("from Project where user.user_id="+user+" and status = 'A' and approvedStatus = 'Approved' and created_date='"+date+"'  ").list();					
				}				
				else if(startDate!=null && endDate.equals(""))
				{
					return (List<CmsReports>) getSession().createQuery("from Project where user.user_id="+user+" and status = 'A' and approvedStatus = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
				}
				else if( startDate!=null && endDate!=null)
				{
					return (List<CmsReports>) getSession().createQuery("from Project where user.user_id="+user+" and status = 'A' and approvedStatus = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
				}
				else
				{
					return (List<CmsReports>) getSession().createQuery("from Project where user.user_id="+user+" and status = 'A' and approvedStatus = 'Approved'").list();				
				}
			}
			
	}





	@Override
	public List<CmsReports> GetCmsReportsOfOpening(String Module, String Today,	String startDate, String endDate, String user) throws ParseException {
		System.out.println(Module+" "+Today+" "+startDate+" "+endDate+" "+user);
		if(user.equals("All"))			
		{				
			if(Today.equals("Today"))
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where  state = 'A' and approval_status = 'Approved' and created_date='"+date+"'  ").list();					
			}				
			else if(startDate!=null && endDate.equals(""))
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where  state = 'A' and approval_status = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
			}
			else if( startDate!=null && endDate!=null)
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where  state = 'A' and approval_status = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
			}
			else
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where  state = 'A' and approval_status = 'Approved'").list();				
			}
		}else{
			if(Today.equals("Today"))
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where user.user_id="+user+" and state = 'A' and approval_status = 'Approved' and created_date='"+date+"'  ").list();					
			}				
			else if(startDate!=null && endDate.equals(""))
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where user.user_id="+user+" and state = 'A' and approval_status = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
			}
			else if( startDate!=null && endDate!=null)
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where user.user_id="+user+" and state = 'A' and approval_status = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
			}
			else
			{
				return (List<CmsReports>) getSession().createQuery("from CurrentOpening where user.user_id="+user+" and state = 'A' and approval_status = 'Approved'").list();				
			}
		}
		
	}





	@Override
	public List<CmsReports> GetCmsReportsOfDepartment(String Module,String Today, String startDate, String endDate, String user) throws ParseException {
		System.out.println(Module+" "+Today+" "+startDate+" "+endDate+" "+user);
		if(user.equals("All"))			
		{				
			if(Today.equals("Today"))
			{
				return (List<CmsReports>) getSession().createQuery("from Department where  state = 'A' and create_approval_status = 'Approved' and created_date='"+date+"'  ").list();					
			}				
			else if(startDate!=null && endDate.equals(""))
			{
				return (List<CmsReports>) getSession().createQuery("from Department where  state = 'A' and create_approval_status = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
			}
			else if( startDate!=null && endDate!=null)
			{
				return (List<CmsReports>) getSession().createQuery("from Department where  state = 'A' and create_approval_status = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
			}
			else
			{
				return (List<CmsReports>) getSession().createQuery("from Department where  state = 'A' and create_approval_status = 'Approved'").list();				
			}
		}else{
			if(Today.equals("Today"))
			{
				return (List<CmsReports>) getSession().createQuery("from Department where user.user_id="+user+" and state = 'A' and create_approval_status = 'Approved' and created_date='"+date+"'  ").list();					
			}				
			else if(startDate!=null && endDate.equals(""))
			{
				return (List<CmsReports>) getSession().createQuery("from Department where user.user_id="+user+" and state = 'A' and create_approval_status = 'Approved' and created_date='"+MethodsHelper.convertDate(startDate)+"'  ").list();					
			}
			else if( startDate!=null && endDate!=null)
			{
				return (List<CmsReports>) getSession().createQuery("from Department where user.user_id="+user+" and state = 'A' and create_approval_status = 'Approved' and created_date between '"+MethodsHelper.convertDate(startDate)+"' and '"+MethodsHelper.convertDate(endDate)+"' ").list();					
			}
			else
			{
				return (List<CmsReports>) getSession().createQuery("from Department where user.user_id="+user+" and state = 'A' and create_approval_status = 'Approved'").list();				
			}
		}
		
	}







}





/*
	/*@Override
	public List<News> GetNewsReport(String Module, String Today,String startDate, String endDate, String user) {
		System.out.println("IMPL");

		System.out.println("IMPL Today"+Today+" startDate "+startDate+" endDate "+endDate+" user "+user);



		if(Module.equals("NEWS") && Today.equals("Today") && user.equals("All") )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate = '"+date+"'  and state = 'A' ").list();
		}//and CreatedBy = '"+user+"'
		if(Module.equals("NEWS") && startDate!=null  && endDate.equals("") && user.equals("All") )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate = '"+startDate+"' and  state = 'A' ").list();
		}
		if(Module.equals("NEWS") && startDate!=null && endDate!=null && user.equals("All") )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate BETWEEN '"+startDate+"' AND '"+endDate+"' and state = 'A' ").list();
		} 
		if(Module.equals("NEWS") && Today.equals("All") && user.equals("All") )
		{
		return (List<News>) getSession().createQuery("from News where  state = 'A' ").list();
		}




		if(Module.equals("NEWS") && Today.equals("Today") )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate = '"+date+"' and CreatedBy = '"+user+"'  and  state = 'A' ").list();
		}//and CreatedBy = '"+user+"'
		if(Module.equals("NEWS") && startDate!=null  && endDate.equals("")  )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate = '"+startDate+"' and CreatedBy = '"+user+"'  and  state = 'A' ").list();
		}
		if(Module.equals("NEWS") && startDate!=null && endDate!=null  )
		{
		return (List<News>) getSession().createQuery("from News where PublishDate BETWEEN '"+startDate+"' AND '"+endDate+"' and CreatedBy = '"+user+"' and state = 'A' ").list();
		} 
		if(Module.equals("NEWS") && Today.equals("All")  )
		{
		return (List<News>) getSession().createQuery("from News where  state = 'A' and CreatedBy = '"+user+"'  ").list();
		}

		return (List<News>) getSession().createQuery("from XXX where  state = 'A' ").list();
		}
 */


/*@Override
	public List<Tendors> GetTendorsReport(String Module, String Today,
			String startDate, String endDate, String user) {
		if(Module.equals("TENDERS") && Today.equals("Today") && user.equals("All") )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date = '"+date+"'  and state = 'A' ").list();
		}//and CreatedBy = '"+user+"'
		if(Module.equals("TENDERS") && startDate!=null  && endDate.equals("") && user.equals("All") )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date = '"+startDate+"' and  state = 'A' ").list();
		}
		if(Module.equals("TENDERS") && startDate!=null && endDate!=null && user.equals("All") )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date BETWEEN '"+startDate+"' AND '"+endDate+"' and state = 'A' ").list();
		} 
		if(Module.equals("TENDERS") && Today.equals("All") && user.equals("All") )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where  state = 'A' ").list();
		}




		if(Module.equals("TENDERS") && Today.equals("Today") )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date = '"+date+"' and CREATED_BY = '"+user+"'  and  state = 'A' ").list();
		}//and CreatedBy = '"+user+"'
		if(Module.equals("TENDERS") && startDate!=null  && endDate.equals("")  )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date = '"+startDate+"' and CREATED_BY = '"+user+"'  and  state = 'A' ").list();
		}
		if(Module.equals("TENDERS") && startDate!=null && endDate!=null  )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where publish_date BETWEEN '"+startDate+"' AND '"+endDate+"' and CREATED_BY = '"+user+"' and state = 'A' ").list();
		} 
		if(Module.equals("TENDERS") && Today.equals("All")  )
		{
		return (List<Tendors>) getSession().createQuery("from Tendors where  state = 'A' and CREATED_BY = '"+user+"'  ").list();
		}

		return (List<Tendors>) getSession().createQuery("from XXX where  state = 'A' ").list();
		}
 */
//return (List<CmsReports>) getSession().createQuery("from xx where state = 'A'").list();
