package com.cmsManagement.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;



















































import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.News;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;
/**
 * 
 * @author Akshay Khatu
 *
 */
@Component
@Controller
public class NewsController extends AbstractControllerHelper{


	@RequestMapping(value = "/newsDashboard" )
	public String newsDashboard(ModelMap model) {
		return "news/newsDashboard";
	}
	
	@RequestMapping(value = "/newsList",method=RequestMethod.GET)
	public ModelAndView newsDashboard(ModelAndView newsDashboardModel, SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				newsDashboardModel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_NEWS) || role.equals(GrantedPermission.VIEW_NEWS) || role.equals(GrantedPermission.UPDATE_NEWS) || role.equals(GrantedPermission.DELETE_NEWS))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							List<News> newslist = newsservice.GetActiveNews();
							List<News> newslist1 = new ArrayList<News>();
							for(News n:newslist){
								n.setPublish_date(MethodsHelper.convertDate1(n.getPublish_date()));							
								newslist1.add(n);
							}
							newsDashboardModel.addObject("newslist", newslist1);
							newsDashboardModel.setViewName("news/newsList");							
							newsDashboardModel.addObject("user", LoginController.getPrincipal());
						} catch (Exception e) {
							e.printStackTrace();
							newsDashboardModel.setViewName("redirect:/errors");
						}
					}
				}
			}
		} catch (Exception e1) {
			//System.out.println("in catch");
			newsDashboardModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}


		return newsDashboardModel;
	}

	@RequestMapping(value = "/newNews", method = RequestMethod.GET)
	public ModelAndView NewNewsRegistration(HttpServletRequest req,ModelAndView NewNewsRegistrationModel,@ModelAttribute("news") News news  ,BindingResult result, HttpSession session, SecurityContextHolder auth) {
		//String token = new HttpSessionCsrfTokenRepository().loadToken(req).toString();
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewNewsRegistrationModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_NEWS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							NewNewsRegistrationModel.addObject("news", news);
							session.setAttribute("action", "newNews");
							NewNewsRegistrationModel.setViewName("news/newNews");
						} catch (Exception e) {									
							e.printStackTrace();
							NewNewsRegistrationModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewNewsRegistrationModel.setViewName(Constants.HOME);	
			}else{
				NewNewsRegistrationModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			NewNewsRegistrationModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return NewNewsRegistrationModel;
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/save_news",method=RequestMethod.POST)
	public ModelAndView saveNews(HttpServletRequest request,@ModelAttribute("news") @Valid News news,BindingResult result,	@RequestParam("english") List<MultipartFile> english,@RequestParam("marathi") List<MultipartFile> marathi,ModelAndView saveNewsModel, HttpServletRequest req,SecurityContextHolder auth, HttpSession session) throws IOException, ParseException {

		if (result.hasErrors()) {
			saveNewsModel.addObject("news", news);
			saveNewsModel.setViewName("news/newNews");
			return saveNewsModel;
		}
		else
		{
			try {
				/*Prevent News from XSS attack  */
				news=PreventionFromXSSAttack.preventNews(news);
				
				news.setPublish_date(MethodsHelper.convertDate(news.getPublish_date()));
				
				news.setDescription(news.getDescription().replaceAll("<[^>]*>", ""));
				news.setDescription_h(news.getDescription_h().replaceAll("<[^>]*>", ""));

				String title[]=req.getParameterValues("atitle");
				String mtitle[]=req.getParameterValues("mtitle");

				String RealPath = req.getServletContext().getRealPath("/staticResources/News/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");

				if (news.getNewsid() == 0) {
					int newsID = newsservice.AddNews(news);
					if (newsID > 0) {
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if (!english.get(j).isEmpty()) {
								attachmentservice.saveattachment(path, english.get(j),"english",newsID,"NEWS",atitle);
							}
						}
						for(int j=0;j<marathi.size();j++)
						{
							String mrtitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(mtitle[j]));
							if (!marathi.get(j).isEmpty()) {
								attachmentservice.saveattachment(path, marathi.get(j),"marathi",newsID,"NEWS",mrtitle);
							}
						}
					}
				} else {
					int noticeId = Integer.parseInt(request.getParameter("newsid"));
					boolean b = newsservice.NewsUpdate(news);System.out.println("b=="+b);

					if (b == true) {System.out.println("english.size() :"+english.size());
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if (!english.get(j).isEmpty()) {
								attachmentservice.saveattachment(path, english.get(j), "english",noticeId,"NEWS",atitle);
							}
						}
						for(int j=0;j<marathi.size();j++)
						{
							String mrtitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(mtitle[j]));
							if (!marathi.get(j).isEmpty()) {
								attachmentservice.saveattachment(path, marathi.get(j), "marathi",noticeId,"NEWS",mrtitle);
							}
						}
					}

				}
				saveNewsModel.setViewName("redirect:/newsList");
			} catch (Exception e) {				
				e.printStackTrace();
				saveNewsModel.setViewName("redirect:/errors");
			}
		}
		
		return saveNewsModel;
	}
	/**
	 * 
	 * @ delete  News Id
	 *
	 */
	@RequestMapping(value = "/deletenews",method=RequestMethod.POST)
	public ModelAndView deleteNews(HttpServletRequest req,ModelAndView deleteNewsModel,News news,Attachment attachment,HttpSession session, ModelAndView modelAndView, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){		
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((role.equals(GrantedPermission.DELETE_NEWS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){	          
						try {
							int id = Integer.parseInt(req.getParameter("id"));
							newsservice.deleteNews(Integer.parseInt(req.getParameter("id")));
							deleteNewsModel.setViewName("redirect:/newsList");
						} catch (Exception e) {
							e.printStackTrace();
							deleteNewsModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteNewsModel.setViewName(Constants.HOME);	
			}else{
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteNewsModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return deleteNewsModel;
	}
	/**
	 * 
	 * @throws ParseException 
	 * @To View  News By Id
	 *
	 */
	
	@RequestMapping(value = "/view_News",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView viewNews(HttpServletRequest req,ModelAndView viewNewsModel,News news,Attachment attachment, SecurityContextHolder auth,HttpSession session ) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				viewNewsModel.setViewName(Constants.ACCESS_DENIED);
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((role.equals(GrantedPermission.VIEW_NEWS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)	
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){		          
						int id=0;
						try {
							 id=Integer.parseInt(req.getParameter("id"));
							 session.setAttribute("newsID1", id);
						} catch (Exception e) {
							id=(int) session.getAttribute("newsID1");
						}finally{
							try {
								news =newsservice.ViewNews(id);
								news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
								news.setCreated_date(MethodsHelper.convertDate1(news.getCreated_date()));
								news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));

								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(news.getNewsid(),"NEWS");
								viewNewsModel.addObject("attachmentlist", attachmentlist);
								viewNewsModel.addObject("News", news);
								viewNewsModel.setViewName("news/viewNews");
							} catch (Exception e) {
								e.printStackTrace();
								viewNewsModel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				viewNewsModel.setViewName(Constants.HOME);	
			}else{
				viewNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			viewNewsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewNewsModel;
	}

	@RequestMapping(value = "/editNews",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView EditNews(HttpServletRequest req,ModelAndView EditNewsModel,News  news,Attachment attachment,BindingResult result, ModelAndView modelAndView, HttpSession session, SecurityContextHolder auth) throws ParseException {
		
		try {
			String login=(String) session.getAttribute("login");
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				EditNewsModel.setViewName(Constants.ACCESS_DENIED);
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((role.equals(GrantedPermission.UPDATE_NEWS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)		
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){		          
						
						int id=0;
						try {
							id=Integer.parseInt(req.getParameter("id"));
							session.setAttribute("newsID2", id);
						} catch (Exception e) {
							id=(int) session.getAttribute("newsID2");
						}finally{
							try {
								news =newsservice.ViewNews(id);
								news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
								news.setDescription(news.getDescription().replaceAll("<[^>]*>", ""));
								news.setDescription_h(news.getDescription_h().replaceAll("<[^>]*>", ""));
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(news.getNewsid(),"NEWS");
								EditNewsModel.addObject("attachmentlist", attachmentlist);
								for(int x=0;x<attachmentlist.size();x++)
								{
									session.setAttribute("module",  attachmentlist.get(x).getModule_type());
								}
								session.setAttribute("size",  attachmentlist.size());
								session.setAttribute("action","editNews");
								EditNewsModel.addObject("news", news);
								EditNewsModel.addObject("attachmentlist", attachmentlist);

								EditNewsModel.setViewName("news/newNews");
							} catch (Exception e) {
								e.printStackTrace();
								EditNewsModel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				EditNewsModel.setViewName(Constants.HOME);	
			}else{
				EditNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			EditNewsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return EditNewsModel;
	}

	@RequestMapping(value="/attachmentNewsDownload")
	public ModelAndView downloadFile(HttpServletResponse resonse,ModelAndView modelAndView,HttpServletRequest req) throws IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			Attachment attachment=attachmentservice.getAttachmentById(id);
			File file = new File(attachment.getPath());
			if(file.exists()){
				BufferedOutputStream outStream = null;
				BufferedInputStream inStrem = null;
				try{
					resonse.setContentType("application/pdf");
					resonse.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
					inStrem= new BufferedInputStream(new FileInputStream(file));

					outStream= new BufferedOutputStream(resonse.getOutputStream());
				}catch(Exception e){

				}

				byte[] buffer = new byte[1024];
				int bytesRead = 0;
				while ((bytesRead = inStrem.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				outStream.flush();
				outStream.close(); 
				inStrem.close(); 
				//modelAndView.setViewName("static/home/courtnoticeList");
				modelAndView.addObject("user", LoginController.getPrincipal());
				
			}else{
				modelAndView.setViewName("Exception/AttachmentException");
				modelAndView.addObject("user", LoginController.getPrincipal());				
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("redirect:/errors");
		}
		return modelAndView;

	}
	/**
	 * 
	 * @To Delete  News Attachment
	 *
	 */
	@RequestMapping(value = "removeNewsAttachment")
	public ModelAndView RemoveNewsAttachment(HttpServletRequest req,Attachment attachment,News news,ModelAndView RemoveNewsAttachment,ModelAndView modelAndView) {
		attachment.setAttachmentID(0);
		//  news.setAttachment(attachment);
		newsservice.DeleteAttachmentById(Integer.parseInt(req.getParameter("attachmentID")));
		return RemoveNewsAttachment;
	}


	/**
	 * 
	 * @return All active  News 
	 *
	 */	
	@RequestMapping(value ="adminNewsList",method=RequestMethod.GET)
	public ModelAndView AdminNewList(ModelAndView  model,@ModelAttribute("news") News news,BindingResult result,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");
			if(login.equals("login")){				
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) 
						|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					try {
						model.addObject("news", news);
						List<News> adminTenderList = newsservice.GetNewsListByStatus("All");
						model.addObject("adminTenderList", adminTenderList);
						model.setViewName("news/adminNewsList");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}
	/**
	 * 
	 * @throws ParseException 
	 * @Admin View News By Id
	 *
	 */
	@RequestMapping(value ="adminviewNews",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView AdminViewNews(ModelAndView AdminViewNewsModel,HttpServletRequest req,@ModelAttribute("news") News news,BindingResult result, Attachment attachment,HttpSession session) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				AdminViewNewsModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("newsID4", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("newsID4");
					}finally{
						try {
							news =newsservice.ViewNews(id);
							news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
							news.setCreated_date(MethodsHelper.convertDate1(news.getCreated_date()));							
							AdminViewNewsModel.addObject("news", news);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(news.getNewsid(),"NEWS");
							AdminViewNewsModel.addObject("attachment", attachmentlist);
							AdminViewNewsModel.setViewName("news/adminViewNews");
							AdminViewNewsModel.addObject("newsId",id);
							req.getSession().setAttribute("newsId", id);
						} catch (Exception e) {
							e.printStackTrace();
							AdminViewNewsModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				AdminViewNewsModel.setViewName(Constants.HOME);	
			}else{
				AdminViewNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			AdminViewNewsModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return AdminViewNewsModel;
	}

	/**
	 * 
	 * @Admin ViewList News By Status
	 *
	 *


	 *//**
	 * 
	 * @Admin Update  News  Status
	 *
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value ="NewsStatus",method=RequestMethod.POST)
	public ModelAndView UpdateNewsStatus(HttpSession session,@ModelAttribute("news") @Valid News news,BindingResult result,ModelAndView UpdateNewsStatus,HttpServletRequest req, Attachment Attachment) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				UpdateNewsStatus.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					try {
						news.setNewsid(Integer.parseInt(req.getParameter("id")));
						String Approved = req.getParameter("Approved");
						news.setStatus(Approved);						
						
						int newsId=(int) (req.getSession().getAttribute("newsId"));
						news.setNewsid(newsId);
						newsservice.UpdateStatus(news);

						List<News> newslist = newsservice.GetActiveNews();
						UpdateNewsStatus.addObject("news", news);
						UpdateNewsStatus.addObject("newslist", newslist);
						UpdateNewsStatus.setViewName("redirect:adminNewsList");
					} catch (Exception e) {
						e.printStackTrace();
						UpdateNewsStatus.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				UpdateNewsStatus.setViewName(Constants.HOME);	
			}else{
				UpdateNewsStatus.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			UpdateNewsStatus.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return UpdateNewsStatus;
	}


	@ExceptionHandler(value=NullPointerException.class)
	public static String HandleNullPoiterException(){

		return "redirect:login";
	}


	@RequestMapping(value = "/deleteApprovedNews",method=RequestMethod.POST)
	public ModelAndView deleteApprovedNews(HttpServletRequest req,ModelAndView deleteNewsModel,News news,Attachment attachment, ModelAndView modelAndView,HttpSession session, SecurityContextHolder auth) {	
		try
		{
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){	
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if((role.equals(GrantedPermission.DELETE_NEWS) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){	          
						try {
							int id = Integer.parseInt(req.getParameter("id"));
							newsservice.deleteApprovedNews(Integer.parseInt(req.getParameter("id")));
							deleteNewsModel.setViewName("redirect:/newsList");
						} catch (Exception e) {
							e.printStackTrace();
							deleteNewsModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteNewsModel.setViewName(Constants.HOME);	
			}else{
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteNewsModel.setViewName("redirect:/logout");
		}
		return deleteNewsModel;
	}


	@RequestMapping(value = "/adminNewsDashboard", method = RequestMethod.GET)
	public ModelAndView adminNewsDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE) )){						
					try {
						List<News> newslist=newsservice.getAllPendingDeactiveNews("Pending");
						model.addObject("deleteCount", newslist.size());

						List<News> list=newsservice.GetNewsListByStatus("Pending");
						model.addObject("createCount", list.size());
						model.setViewName("news/AdminNewsDashboard");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value ="adminDeleteNewsList",method=RequestMethod.GET)
	public ModelAndView adminDeleteNewsList(ModelAndView  model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE) )){
					try {
						model.setViewName("news/AdminDeleteNewsList");
					} catch (Exception e) {
						e.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@ResponseBody
	@RequestMapping(value ="getNewsByDeleteStatus",method=RequestMethod.GET)
	public List<News> getNewsByDeleteStatus(ModelAndView model,HttpServletRequest req) throws ParseException {
		@SuppressWarnings("deprecation")
		String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
		List<News> newsList=newsservice.getAllPendingDeactiveNews(status);
		for(News n:newsList){
			n.setPublish_date(MethodsHelper.convertStringToDateTime(n.getPublish_date()));
		}
		return newsList;
	}

	@RequestMapping(value = "/adminDeleteViewNews",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminDeleteViewNews(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("newsID3", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("newsID3");
					}finally{
						try {
							News news=newsservice.ViewNews(id);
							news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
							news.setCreated_date(MethodsHelper.convertDate1(news.getCreated_date()));
							model.addObject("news", news);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(news.getNewsid(),"NEWS");
							model.addObject("attachment", attachmentlist);
							model.setViewName("news/AdminDeleteViewNews");
						} catch (Exception e) {
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/DeleteNewsStatus",method=RequestMethod.POST)
	public ModelAndView DeleteNewsStatus(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					try {
						String approvedStatus=req.getParameter("approvedStatus");
						String comment=req.getParameter("comment");
						int id=Integer.parseInt(req.getParameter("id"));

						newsservice.deleteNewsStatus(approvedStatus,comment,id);
						model.setViewName("redirect:/adminDeleteNewsList");

					} catch (Exception e1) {
						e1.printStackTrace();
						model.setViewName("redirect:/errors");
					}
				}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
					model.setViewName(Constants.HOME);	
				}else{
					model.setViewName(Constants.ACCESS_DENIED);		
				}
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/ViewDeactivatedNews",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ViewDeactivatedOpening(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser()!=null && (LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE))){
					int id=0;
					try {
						id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("newsID5", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("newsID5");
					}finally{
						try {
							News news=newsservice.ViewNews(id);
							news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
							news.setCreated_date(MethodsHelper.convertDate1(news.getCreated_date()));
							model.addObject("news", news);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(news.getNewsid(),"NEWS");
							model.addObject("attachment", attachmentlist);

							model.setViewName("news/DeactivatedNews");
						} catch (Exception e) {
							e.printStackTrace();
							model.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				model.setViewName(Constants.HOME);	
			}else{
				model.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			model.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return model;
	}
	
	

}
