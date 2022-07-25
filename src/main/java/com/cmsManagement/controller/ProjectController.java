package com.cmsManagement.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.project_features;
import com.cmsManagement.service.AttachmentService;
import com.cmsManagement.service.projectService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;


@Controller
public class ProjectController extends AbstractControllerHelper {

	@Autowired
	projectService projectService;

	@Autowired
	AttachmentService attachmentService;


	@RequestMapping(value="/projectlist",method=RequestMethod.GET)
	public ModelAndView  projectList(ModelAndView projectmodel,HttpSession session,SecurityContextHolder auth) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){ 
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();
				projectmodel.setViewName(Constants.ACCESS_DENIED);
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";
					if(((role.equals(GrantedPermission.CREATE_PROJECT) || role.equals(GrantedPermission.VIEW_PROJECT) || role.equals(GrantedPermission.UPDATE_PROJECT) || role.equals(GrantedPermission.DELETE_PROJECT))
							&& LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) )
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)
							|| LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							projectmodel.addObject("projectList",projectService.getAllProjectList());
							projectmodel.setViewName("project/projectlist");
						}catch (Exception e) {			
							e.printStackTrace();
							projectmodel.setViewName("redirect:/errors");
						}
					} //departmentListModel.addObject(Constants.USER, LoginController.getPrincipal());	
				}
			}		
		} catch (Exception e1) {			
			projectmodel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return projectmodel;
	}// projectListmethod

	@RequestMapping(value = "/newProject",method=RequestMethod.GET)
	public ModelAndView newProject(ModelAndView newprojmodel,@ModelAttribute("project") Project project  ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				newprojmodel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.CREATE_PROJECT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							//newprojmodel.addObject("action", "newProject");
							newprojmodel.addObject("action", "newProject");
							newprojmodel.setViewName("project/newCProject");
							//newprojmodel.setViewName("project/newproject");
						} catch (Exception e) {									
							e.printStackTrace();
							newprojmodel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				newprojmodel.setViewName(Constants.HOME);	
			}else{
				newprojmodel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			newprojmodel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return newprojmodel;
	}//newproj method


	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/saveProject",method=RequestMethod.POST)
	public ModelAndView saveProject(ModelAndView saveprojmodel,@ModelAttribute("project") @Valid Project project ,BindingResult result, HttpSession session, SecurityContextHolder auth,HttpServletRequest request,@RequestParam("english") List<MultipartFile> english){

		/*if(project.getContact().isEmpty()){
			System.err.println("heyyy");
			List<FieldError> errorsToKeep = result.getFieldErrors().stream()
	                .filter(fer -> !fer.getField().equals("contact"))
	                .filter(fer -> !fer.getField().equals("contact_h"))
	                .collect(Collectors.toList());

			result = new BeanPropertyBindingResult(project, "project");

	        for (FieldError fieldError : errorsToKeep) {
	            result.addError(fieldError);
	        }

		}*/
		/*if(project.getEmail().isEmpty()){
			List<FieldError> errorsToKeep = result.getFieldErrors().stream()
	                .filter(fer -> !fer.getField().equals("email"))
	                .collect(Collectors.toList());

			result = new BeanPropertyBindingResult(project, "project");

	        for (FieldError fieldError : errorsToKeep) {
	            result.addError(fieldError);
	        }
		}*/

		try {
			if (result.hasErrors()) {
				saveprojmodel.addObject("action", "newProject");
				saveprojmodel.addObject("project", project);
				saveprojmodel.setViewName("project/newCProject");

			}
			else
			{
				/*Prevent Project from XSS attack*/
				project=PreventionFromXSSAttack.preventProject(project);
				
				String title[]=request.getParameterValues("atitle");
				String RealPath = request.getServletContext().getRealPath("/staticResources/Project/");
				File f = new File(RealPath);
				if (!f.exists()) {
					f.mkdirs();
				}
				String path = RealPath.replace("\\", "/");
				if (project.getId() == 0) {
					int projectID = projectService.saveProject(project);
					if (projectID > 0) {
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if(!english.get(j).isEmpty()){
								int attach_id=attachmentService.saveattachment1(path, english.get(j), "english",projectID,"Project",atitle);
							}
						}//for eng

					}//inner if
				} //outer if
				else {
					int projectId = Integer.parseInt(request.getParameter("id"));

					boolean b = projectService.projectUpdate(project);
					if (b == true) {
						for(int j=0;j<english.size();j++)
						{
							String atitle=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(title[j]));
							if(!english.get(j).isEmpty()){
								int attach_id=attachmentService.saveattachment1(path, english.get(j), "english",projectId,"Project",atitle);
							}
						}//rng for
					}//if
				}//inner else
				saveprojmodel.setViewName("redirect:/projectlist");
			}//main else

		} catch (Exception e) {
			e.printStackTrace();
			saveprojmodel.setViewName("redirect:/errors");
		}
		return saveprojmodel;
	}//


	@RequestMapping(value="editproject",method=RequestMethod.POST)
	public ModelAndView editproject( HttpServletRequest request,ModelAndView projectmodel,@ModelAttribute("project") Project project   ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				projectmodel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.UPDATE_PROJECT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						int id = 0;
						try {
							id = Integer.parseInt(request.getParameter("id"));
							session.setAttribute("projectID1", id);
						} catch (Exception e1) {
							id=(int) session.getAttribute("projectID1");
						}finally{
							try {
								//int id=Integer.parseInt(request.getParameter("id"));
								//project=projectService.getProjectById(id);
								project=projectService.getProjectById(id);
								projectmodel.addObject("project", project);
								//projectmodel.addObject("project",projectService.getProjectById(Integer.parseInt(request.getParameter("id"))));

								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(project.getId(),"Project");
								projectmodel.addObject("attachmentlist", attachmentlist);
								for(int x=0;x<attachmentlist.size();x++)
								{
									session.setAttribute("module",  attachmentlist.get(x).getModule_type());
								}
								session.setAttribute("size",  attachmentlist.size());
								projectmodel.addObject("project", project);
								projectmodel.addObject("attachmentlist", attachmentlist);
								projectmodel.addObject("action", "editProject");
								projectmodel.setViewName("project/newCProject");
							} catch (Exception e) {									
								e.printStackTrace();
								projectmodel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				projectmodel.setViewName(Constants.HOME);	
			}else{
				projectmodel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			projectmodel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return projectmodel;
	}


	@RequestMapping(value="view_project",method=RequestMethod.POST)
	public ModelAndView view_project( HttpServletRequest request,ModelAndView projectmodel,@ModelAttribute("project") Project project    ,BindingResult result, HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				projectmodel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.VIEW_PROJECT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          

						int id = 0;
						try {
							id = Integer.parseInt(request.getParameter("id"));
							session.setAttribute("projectID2", id);
						} catch (Exception e1) {
							id=(int) session.getAttribute("projectID2");
						}finally{
							try {

								project=projectService.getProjectById(id);
								projectmodel.addObject("project", project);
								List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(project.getId(),"Project");
								projectmodel.addObject("attachmentlist", attachmentlist);
								projectmodel.setViewName("project/viewproject");
							} catch (Exception e) {									
								e.printStackTrace();
								projectmodel.setViewName("redirect:/errors");
							}
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				projectmodel.setViewName(Constants.HOME);	
			}else{
				projectmodel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			projectmodel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return projectmodel;
	}



	@RequestMapping(value="deleteproject",method=RequestMethod.POST)
	public ModelAndView deleteproject(ModelAndView deleteProjectModel, HttpServletRequest request,HttpSession session, SecurityContextHolder auth){
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteProjectModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_PROJECT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							boolean id1=projectService.deleteProjectById(Integer.parseInt(request.getParameter("id")));
							deleteProjectModel.setViewName("redirect:/projectlist");
						} catch (Exception e) {									
							e.printStackTrace();
							deleteProjectModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				deleteProjectModel.setViewName(Constants.HOME);	
			}else{
				deleteProjectModel.setViewName(Constants.ACCESS_DENIED);		
			}
		}
		catch(Exception s)
		{
			deleteProjectModel.setViewName("redirect:/logout");
			s.printStackTrace();
		}
		return deleteProjectModel;
	}


	@RequestMapping(value="/add_feature",method=RequestMethod.GET)
	public ModelAndView  add_Feature(ModelAndView featuremodel,HttpServletRequest request,HttpSession session) {
		try {
			project_features features=new project_features();
			featuremodel.addObject("project_id", Integer.parseInt(request.getParameter("id")));
			featuremodel.addObject("features", features);
			featuremodel.setViewName("project/project_scope");
			//featuremodel.setViewName("project/newProjectFeature");
		} catch (Exception e) {
			e.printStackTrace();
			featuremodel.setViewName("redirect:/errors");
		}
		return featuremodel;
	}


	@RequestMapping(value="/saveProject_features",method=RequestMethod.POST)
	public  ModelAndView  saveProjFeatures(ModelAndView savefeaturemodel,@ModelAttribute("features") project_features features,HttpServletRequest request,HttpSession session) {
		try {
			String feature1[]= request.getParameterValues("feature");
			String feature_h[]= request.getParameterValues("feature_h");


			features.setProject_id(Integer.parseInt(request.getParameter("project_id")));
			//features.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUsername());

			features.setCreated_on(MethodsHelper.getCurrentDate());

			features.setStatus(Constants.ACTIVE_STATE);

			for(int j=0;j<feature1.length;j++){

				String feature2=feature1[j];
				String feature_h1=feature_h[j];
				features.setFeature(feature2);
				features.setFeature_h(feature_h1);

				int id=projectService.saveProject_Feature(features);

			}//for
			savefeaturemodel.addObject("id", features.getProject_id());
			savefeaturemodel.setViewName("redirect:/add_feature");
		} catch (Exception e) {
			e.printStackTrace();
			savefeaturemodel.setViewName("redirect:/errors");
		}
		return savefeaturemodel;
	}//method



	@RequestMapping(value="/adminProjectList",method=RequestMethod.GET)
	public ModelAndView  adminProjectList(ModelAndView model,@ModelAttribute("project") Project project,BindingResult result,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");		 
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						model.addObject("project", project);
						//	 List<Project> adminprojectList = projectService.getProjectListByStatus("All");
						List<Project> adminprojectList = projectService.getAllAdminActiveProject();
						model.addObject("adminprojectList", adminprojectList);
						model.setViewName("project/adminProjectList");
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


	@RequestMapping(value ="/adminviewProject",method=RequestMethod.POST)
	public ModelAndView AdminViewNews(ModelAndView AdminViewProjectModel,HttpServletRequest req,@ModelAttribute("project") Project project,BindingResult result, Attachment attachment,HttpSession session) throws ParseException {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				AdminViewProjectModel.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("projectID3", id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("projectID3");
					}finally{
						try {
							project =projectService.getProjectById(id);
							//    news.setPublish_date(MethodsHelper.convertDate1(news.getPublish_date()));
							//	    news.setCreated_date(MethodsHelper.convertDate1(news.getCreated_date()));
							//int projectId = Integer.parseInt(req.getParameter("id"));
							AdminViewProjectModel.addObject("project", project);
							List<Attachment> attachmentlist = attachmentService.getAttachmentByModuleID(project.getId(),"Project");
							AdminViewProjectModel.addObject("attachment", attachmentlist);
							AdminViewProjectModel.setViewName("project/AdminViewProject");
							AdminViewProjectModel.addObject("projectId",id);
							req.getSession().setAttribute("projectId", id);
						} catch (Exception e) {
							e.printStackTrace();
							AdminViewProjectModel.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				AdminViewProjectModel.setViewName(Constants.HOME);	
			}else{
				AdminViewProjectModel.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			AdminViewProjectModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return AdminViewProjectModel;
	}

	//ProjectStatus

	@RequestMapping(value ="/ProjectStatus",method=RequestMethod.POST)
	public ModelAndView UpdateNewsStatus(HttpSession session,Project project,ModelAndView UpdateProjectStatus,HttpServletRequest req, Attachment Attachment) {
		try{
			project.setId(Integer.parseInt(req.getParameter("id")));
			String Approved = req.getParameter("Approved");
			int projectId=(int) (req.getSession().getAttribute("projectId"));

			project.setApprovedStatus((Approved));
			project.setId(projectId);

			projectService.updateStatus(project);
			List<Project> projectlist =projectService.getActiveProject();

			UpdateProjectStatus.addObject("project", project);
			UpdateProjectStatus.addObject("projectlist", projectlist);
			UpdateProjectStatus.setViewName("redirect:adminProjectList");			
		}
		catch(Exception e){
			e.printStackTrace();
			UpdateProjectStatus.setViewName("redirect:/errors");
		}
		return UpdateProjectStatus;
	}//method


	@ResponseBody
	@RequestMapping(value="/GetProjectbyStatus",method=RequestMethod.GET)
	public  List<Project>  getProjectbyStatus(ModelAndView statusmodel,HttpServletRequest request,HttpSession session) {
		List<Project> projectList=null;
		try{
			@SuppressWarnings("deprecation")
			String tendorStatus=StringEscapeUtils.escapeHtml4(request.getParameter("tendorStatus"));
			projectList=projectService.getProjectListByStatus(tendorStatus);
			statusmodel.addObject("projectList", projectList);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return projectList;
	}//method




	@RequestMapping(value="/attachmentProjectDownload")
	public ModelAndView downloadFile(@RequestParam("path") String path, HttpServletResponse resonse,ModelAndView modelAndView) throws IOException {

		try {
			File file = new File(path);
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
				modelAndView.setViewName("project/viewproject");
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
	}//method 

	@ResponseBody
	@RequestMapping(value="/GetProjectScope",method=RequestMethod.POST)
	public List<project_features>  GetProjectScope(ModelAndView projectmodel,HttpServletRequest request) {		
		List<project_features> scopeList = null;
		try {
			int id=Integer.parseInt(request.getParameter("project_id"));
			scopeList = projectService.getProjectFeaturesById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scopeList;
	} 

	@RequestMapping(value="/deleteProjectScope",method=RequestMethod.POST)
	public ModelAndView deleteProjectScope(ModelAndView projectmodel,HttpServletRequest request) {		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			int project_id=Integer.parseInt(request.getParameter("project_id"));
			projectService.deleteProjectScope(id);
			projectmodel.addObject("id", project_id);
			projectmodel.setViewName("redirect:/add_feature");
		} catch (Exception e) {
			e.printStackTrace();
			projectmodel.setViewName("redirect:/errors");
		}
		return projectmodel;		
	}

	@RequestMapping(value = "/deleteApprovedProject",method=RequestMethod.POST)
	public ModelAndView deleteApprovedProject(HttpServletRequest req,ModelAndView deleteNewsModel,HttpSession session, SecurityContextHolder auth) {
		try
		{
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				deleteNewsModel.setViewName(Constants.ACCESS_DENIED);				
				List<GrantedAuthority> granted = (List<GrantedAuthority>) auth.getContext().getAuthentication().getAuthorities();					
				for(int i=0; i<granted.size(); i++){
					String role = granted.toArray()[i] + "";					
					if((role.equals(GrantedPermission.DELETE_PROJECT) && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.USER_ROLE) ) ||  
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) || 
							LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){		          
						try {
							projectService.deleteApprovedProject(Integer.parseInt(req.getParameter("id")));
							deleteNewsModel.setViewName("redirect:/projectlist");
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

	@RequestMapping(value = "/adminProjectDashboard",method=RequestMethod.GET)
	public ModelAndView adminNewsDashboard(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");		 
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						List<Project> projectDList=projectService.getAllPendingProject("Pending");
						model.addObject("deleteCount", projectDList.size());

						List<Project> projectList=projectService.getProjectListByStatus("Pending");
						model.addObject("createCount", projectList.size());
						model.setViewName("project/AdminProjectDashboard");
					}catch (Exception e) {			
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

	@RequestMapping(value ="adminDeleteProjectList",method=RequestMethod.GET)
	public ModelAndView adminDeleteNewsList(ModelAndView  model,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");		 
			if(login.equals("login")){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {	
						model.setViewName("project/AdminDeleteProjectList");
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

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value ="getProjectByDeleteStatus",method=RequestMethod.GET)
	public List<Project> getNewsByDeleteStatus(ModelAndView model,HttpServletRequest req) throws ParseException {
		List<Project> list = null;
		try {
			String status=StringEscapeUtils.escapeHtml4(req.getParameter("tendorStatus"));		
			list = projectService.getAllPendingProject(status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "/adminDeleteViewProject",method=RequestMethod.POST)
	public ModelAndView adminDeleteViewNews(ModelAndView model,HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("projectID4",id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("projectID4");
					}finally{					
						try {
							Project project=projectService.getProjectById(id);
							model.addObject("project", project);

							List<Attachment> attachmentlist = attachmentService.getAttachmentByModuleID(project.getId(),"Project");
							model.addObject("attachment", attachmentlist);
							model.setViewName("project/AdminDeleteViewProject");
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

	@RequestMapping(value = "/DeleteProjectStatus",method=RequestMethod.POST)
	public ModelAndView DeleteProjectStatus(ModelAndView model,HttpServletRequest req) {
		try {
			String approvedStatus=req.getParameter("approvedStatus");
			String comment=req.getParameter("comment");
			int id=Integer.parseInt(req.getParameter("id"));

			projectService.deleteProjectStatus(approvedStatus,comment,id);

			model.setViewName("redirect:/adminDeleteProjectList");

		} catch (Exception e1) {	
			e1.printStackTrace();
			model.setViewName("redirect:/errors");
		}
		return model;
	}

	@RequestMapping(value = "/viewDeactivatedProject",method=RequestMethod.POST)
	public ModelAndView ViewDeactivatedOpening(ModelAndView model,HttpServletRequest req,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				model.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id = 0;
					try {
						id = Integer.parseInt(req.getParameter("id"));
						session.setAttribute("projectID5",id);
					} catch (Exception e1) {
						id=(int) session.getAttribute("projectID5");
					}finally{
						try {
							Project project=projectService.getProjectById(id);
							model.addObject("project", project);

							List<Attachment> attachmentlist = attachmentservice.getAttachmentByModuleID(project.getId(),"Project");
							model.addObject("attachment", attachmentlist);

							model.setViewName("project/ViewDeactivatedProject");
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

}//class
