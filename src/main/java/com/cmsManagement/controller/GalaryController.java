package com.cmsManagement.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.GalaryCategory;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Video;
import com.cmsManagement.service.AttachmentService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.ValidateInput;

@Controller
public class GalaryController {
	@Autowired
	AttachmentService attachmentservice;
	@Autowired
	FinancialYearDao financialYearDao;

	@RequestMapping(value = "/NewImages", method = RequestMethod.GET)
	public ModelAndView Images(ModelAndView NewImage,@ModelAttribute("attachment") Attachment attachment,BindingResult result, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						NewImage.setViewName("Galary/newPhotoCategory");
						List<GalaryCategory> GalaryCategoryList = attachmentservice.getGalaryCategoryList();
						NewImage.addObject("GalaryCategoryList",GalaryCategoryList);
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}

	@ResponseBody
	@RequestMapping(value = "AddPhotoCategory")
	public List<GalaryCategory> AddImages(HttpServletRequest req,ModelAndView DesignationRegistrationModel, Attachment attachment,BindingResult result) {
		GalaryCategory galarycategory = new GalaryCategory();
		String Photocategory = req.getParameter("Photocategory");
		String type = req.getParameter("type");
		galarycategory.setType(type);
		galarycategory.setGalary_cate_name(Photocategory);
		attachmentservice.SaveGalaryCategory(galarycategory);
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();

		// List<GalaryCategory> GalaryCategoryList = attachmentservice.getGalaryCategoryListByFinancialID(financialYear);
		List<GalaryCategory> GalaryCategoryList = attachmentservice.getGalaryCategoryList();
		DesignationRegistrationModel.addObject("GalaryCategoryList",GalaryCategoryList);
		DesignationRegistrationModel.setViewName("Galary/newPhotoCategory");
		return GalaryCategoryList;
	}

	@ResponseBody
	@RequestMapping(value = "GalaryCategoryList")
	public List<GalaryCategory> GalaryCategoryList(HttpServletRequest req,ModelAndView DesignationRegistrationModel, Attachment attachment,BindingResult result) {
		FinancialYear financialYear= financialYearDao.getCurrentActiveFinancialYear();

		// List<GalaryCategory> GalaryCategoryList = attachmentservice.getGalaryCategoryList();
		List<GalaryCategory> GalaryCategoryList = attachmentservice.getGalaryCategoryListByFinancialID(financialYear.getFinancialId());
		DesignationRegistrationModel.addObject("GalaryCategoryList",GalaryCategoryList);
		return GalaryCategoryList;
	}

	@RequestMapping(value = "/AddImagesInCategory")
	public ModelAndView EditNews(@ModelAttribute("galarycategory") GalaryCategory galarycategory,HttpServletRequest req, ModelAndView ImageCateModel, News news,Attachment attachment, BindingResult result, HttpSession session,SecurityContextHolder auth) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				ImageCateModel.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						int id = Integer.parseInt(req.getParameter("id"));
						ImageCateModel.setViewName("Galary/addImages");
						session.setAttribute("galarycategoryID", id);
						GalaryCategory a = attachmentservice.viewImages(id);
						String Categoryname = a.getGalary_cate_name();
						session.setAttribute("Categoryname", Categoryname);
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}
			}
		} catch (Exception e1) {			
			ImageCateModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return ImageCateModel;

	}

	@RequestMapping(value = "/upload")
	public String singleFileUpload(@RequestParam("attachment") List<MultipartFile> attachment,HttpServletRequest req,ModelAndView uploadModel) {
		uploadModel.setViewName(Constants.ACCESS_DENIED);
		if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){

			int id = Integer.parseInt(req.getParameter("galarycategoryID"));
			GalaryCategory galarycategory = attachmentservice.viewImages(id);


			String type = galarycategory.getGalary_cate_name();

			String RealPath1 = req.getServletContext().getRealPath("/staticResources/galary");

			String RealPath = req.getServletContext().getRealPath("/staticResources/galary/"+File.separator+type+"/");

			File f = new File(RealPath);
			if (!f.exists()) {f.mkdirs();}
			String path = RealPath.replace("\\", "/");
			attachmentservice.SaveAttachment(attachment, id, path);
		}
		return "Galary/newPhotoCategory";

	}


	@RequestMapping(value = "/ViewImagesByCategory")
	public ModelAndView ViewImagesByCategory(@ModelAttribute("galarycategory") GalaryCategory galarycategory,HttpServletRequest req, ModelAndView viewImageModel, News news,Attachment attachment, BindingResult result,ModelAndView modelAndView, HttpSession session,SecurityContextHolder auth) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				viewImageModel.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						int id = Integer.parseInt(req.getParameter("id"));
						List<Attachment> getAttachmentListByGalaryCateID = attachmentservice.getAttachmentListByGalaryCateID(id);
						GalaryCategory a = attachmentservice.viewImages(id);
						String Categoryname = a.getGalary_cate_name();
						viewImageModel.addObject("getAttachmentListByGalaryCateID",getAttachmentListByGalaryCateID);
						viewImageModel.setViewName("Galary/viewImagesByCategory");
						viewImageModel.addObject("galarycategoryID", id);
						session.setAttribute("Categoryname", Categoryname);
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}
			}
		} catch (Exception e1) {			
			viewImageModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return viewImageModel;

	}

	@RequestMapping(value = "/DeleteCategory")
	public ModelAndView deleteNews(HttpServletRequest req,ModelAndView deleteModel, News news, Attachment attachment,ModelAndView modelAndView, SecurityContextHolder auth,HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");			
			if(login.equals("login")){
				deleteModel.setViewName(Constants.ACCESS_DENIED);
				try {
					if(LoginController.getCurrentLoggedInUser()!=null && LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE)){
						int id = Integer.parseInt(req.getParameter("id"));
						attachmentservice.deleteAttachmentByGalaryCateID(id);
						attachmentservice.deleteGalaryCateID(id);
						deleteModel.setViewName("redirect:GalaryCategoryList");
					}
				} catch (Exception e) {			
					e.printStackTrace();
				}
			}
		} catch (Exception e1) {			
			deleteModel.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return deleteModel;
	}


	/********************Photo Gallary*****************************************************/

	@RequestMapping(value = "/photoGallaryList", method = RequestMethod.GET)
	public ModelAndView photoGallaryList(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Attachment> list=attachmentservice.getAttachmentByModuleType("GALLARY");
						NewImage.addObject("list", list);
						NewImage.setViewName("masters/PhotoGallaryList");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}

	@RequestMapping(value = "/photogallary", method = RequestMethod.GET)
	public ModelAndView photogallay(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						NewImage.setViewName("masters/photoGallary");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}	

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/uploadPhotoGallary",method=RequestMethod.POST)
	public ModelAndView uploadPhotoGallary(@RequestParam("attachment") MultipartFile attachment,HttpServletRequest req,ModelAndView uploadModel) {

		try {
			String title=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("title")));
			String titleh=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("title_h")));

			String RealPath = req.getServletContext().getRealPath("/staticResources/galary/");

			File f = new File(RealPath);
			if (!f.exists()) {f.mkdirs();}
			String path = RealPath.replace("\\", "/");
			attachmentservice.SaveAttachment(attachment,path,title,titleh,"GALLARY");
			uploadModel.setViewName("redirect:/photoGallaryList");
		} catch (Exception e) {
			e.printStackTrace();
			uploadModel.setViewName("redirect:/errors");
		}

		return uploadModel;

	}

	@ResponseBody
	@RequestMapping(value = "/photoGallaryList")
	public List<Attachment> photoGallaryList(HttpServletRequest req) {
		List<Attachment> list = null;
		try {
			String type=req.getParameter("type");
			list = attachmentservice.getAttachmentByModuleType(type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/deletePhoto")
	public void deletePhoto(HttpServletRequest req) {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			attachmentservice.deleteAttachmentByID(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/******************************Maps*******************************************************************************/

	@RequestMapping(value = "/mapList", method = RequestMethod.GET)
	public ModelAndView mapList(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Attachment> list=attachmentservice.getAttachmentByModuleType("MAP");
						NewImage.addObject("list", list);
						NewImage.setViewName("masters/MapList");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}

	@RequestMapping(value = "/mapdashboard", method = RequestMethod.GET)
	public ModelAndView mapdashboard(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						NewImage.setViewName("masters/Maps");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}	

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/uploadMap",method=RequestMethod.POST)
	public ModelAndView uploadMap(@RequestParam("attachment") MultipartFile attachment,HttpServletRequest req,ModelAndView uploadModel) {

		try {
			String title=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("title")));
			String titleh=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("title_h")));

			String RealPath = req.getServletContext().getRealPath("/staticResources/Map/");

			File f = new File(RealPath);
			if (!f.exists()) {f.mkdirs();}
			String path = RealPath.replace("\\", "/");
			attachmentservice.SaveAttachment(attachment,path,title,titleh,"MAP");
			uploadModel.setViewName("redirect:/mapList");
		} catch (Exception e) {
			e.printStackTrace();
			uploadModel.setViewName("redirect:/errors");
		}

		return uploadModel;
	}

	/*******************Video Gallary****************************************************************************/

	@RequestMapping(value = "/videoGallaryList",method=RequestMethod.GET)
	public ModelAndView videoGallaryList(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Video> list=attachmentservice.getAllVideo();
						NewImage.addObject("list", list);
						NewImage.setViewName("masters/VideoGallaryList");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}

	@RequestMapping(value = "/videogallary",method=RequestMethod.GET)
	public ModelAndView videogallary(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						Video video=new Video();
						video.setId(0);
						NewImage.addObject("video",video );
						NewImage.setViewName("masters/VideoGallary");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}


	@RequestMapping(value = "/uploadVideoGallary",method=RequestMethod.POST)
	public ModelAndView uploadVideoGallary(HttpServletRequest req,ModelAndView uploadModel) {

		try {
			String title=req.getParameter("title");
			String titleh=req.getParameter("title_h");
			String path=req.getParameter("link");
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println(id);

			if(id>0){
				attachmentservice.editVideo(path,title,titleh,id);
			}else{
				attachmentservice.saveVideo(path,title,titleh);
			}

			uploadModel.setViewName("redirect:/videoGallaryList");
		} catch (Exception e) {			
			e.printStackTrace();
			uploadModel.setViewName("redirect:/errors");
		}


		return uploadModel;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteVideo",method=RequestMethod.POST)
	public void deleteVideo(HttpServletRequest req) {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			attachmentservice.deleteVideo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/editVideo",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView editVideo(ModelAndView NewImage, HttpSession session,HttpServletRequest req) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					int id=0;
					try {
						 id=Integer.parseInt(req.getParameter("id"));
						session.setAttribute("videoID1", id);
					} catch (Exception e) {
						id=(int) session.getAttribute("videoID1");
					}finally{
						try {
							Video video=attachmentservice.getVideoById(id);
							NewImage.addObject("video", video);
							NewImage.setViewName("masters/VideoGallary");
						} catch (Exception e) {
							e.printStackTrace();
							NewImage.setViewName("redirect:/errors");
						}
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
		}
		return NewImage;
	}

	
/**************User Mannual***************************************************************/
	
	@RequestMapping(value = "/user_mannual",method=RequestMethod.GET)
	public ModelAndView user_mannual(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");	
			String userType=(String) session.getAttribute("userType");	 
			if(login.equals("login") && userType.equals(Constants.PERMANENT)){
				NewImage.setViewName(Constants.ACCESS_DENIED);
				if(LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.ADMIN_ROLE) ||
						LoginController.getCurrentLoggedInUser().getUser().getRoleID().getRole_type().equals(GrantedPermission.SUPER_ADMIN_ROLE)){
					try {
						List<Attachment> list=attachmentservice.getAttachmentByModuleType("USERMANNUAL");
						System.err.println("list :"+list.size());
						if(list.size()>0){
							//session.setAttribute("userMannual", list.get(0).getAttachmnt_name());
							session.setAttribute("userMannual", "YesMannual");
						}else{
							session.setAttribute("userMannual", "NoMannual");
						}
						NewImage.addObject("list",list);
						NewImage.setViewName("masters/userMannual");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}
				}
			}else if(login.equals("login") && userType.equals(Constants.TEMPORARY)){
				NewImage.setViewName(Constants.HOME);	
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/uploadUserMannual",method=RequestMethod.POST)
	public ModelAndView uploadUserMannual(@RequestParam("attachment") MultipartFile attachment,HttpServletRequest req,ModelAndView uploadModel) {
		try {
			String title=ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(req.getParameter("title")));
			String RealPath = req.getServletContext().getRealPath("/staticResources/UserMannual/");

			File f = new File(RealPath);
			if (!f.exists()) {f.mkdirs();}
			String path = RealPath.replace("\\", "/");
			attachmentservice.uploadUserMannual(attachment,path,"USERMANNUAL",title);

			uploadModel.setViewName("redirect:/user_mannual");
		} catch (Exception e) {			
			e.printStackTrace();
			uploadModel.setViewName("redirect:/errors");
		}

		return uploadModel;
	}
	
	@RequestMapping(value = "/showMannual",method=RequestMethod.GET)
	public ModelAndView showMannual(ModelAndView NewImage, HttpSession session) {
		try {
			String login=(String) session.getAttribute("login");				
			if(login.equals("login")){
				NewImage.setViewName(Constants.ACCESS_DENIED);				
					try {
						List<Attachment> list=attachmentservice.getAttachmentByModuleType("USERMANNUAL");	
						NewImage.addObject("list",list);
						NewImage.setViewName("masters/ShowMannual");
					} catch (Exception e) {
						e.printStackTrace();
						NewImage.setViewName("redirect:/errors");
					}			
			}else{
				NewImage.setViewName(Constants.ACCESS_DENIED);		
			}
		} catch (Exception e1) {			
			NewImage.setViewName("redirect:/logout");
			e1.printStackTrace();
		}
		return NewImage;
	}	
	
}
