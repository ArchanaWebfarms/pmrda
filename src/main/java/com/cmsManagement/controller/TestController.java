package com.cmsManagement.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NewsDao;
import com.cmsManagement.dao.NoticesDao;
import com.cmsManagement.dto.GrantedPermission;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.TendorsDepartment;
import com.cmsManagement.service.AttachmentService;
import com.cmsManagement.service.NewsService;
import com.cmsManagement.service.NoticesService;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PreventionFromXSSAttack;
import com.cmsManagement.util.ValidateInput;

@Controller
public class TestController extends AbstractControllerHelper {

	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");
	LocalDateTime now = LocalDateTime.now();
	String date = dtf.format(now).toString();





	@RequestMapping(value = "/save_tenders",method=RequestMethod.POST)
	public ModelAndView saveNews(HttpServletRequest request,@ModelAttribute("tendors") @Valid Tendors tendors,BindingResult result,	@RequestParam("english") List<MultipartFile> english,@RequestParam("marathi") List<MultipartFile> marathi,ModelAndView model, HttpServletRequest req,SecurityContextHolder auth, HttpSession session) throws IOException, ParseException {

		try {
			if(result.hasErrors()){
				//System.err.println("errors :"+re);
				model.addObject("tendors", tendors);
				List<TendorsDepartment>	departments=tenderService.getTenderDepartment();
				model.addObject("departments", departments);
				session.setAttribute("action", "newTender");
				model.setViewName("tender/newTender");
			}

			else{				
				System.err.println("time :"+tendors.getOpening_time()+" "+tendors.getClosing_time());	
				tendors.setPublish_time(MethodsHelper.convertIn24hr(tendors.getPublish_time()));
				tendors.setClosing_time(MethodsHelper.convertIn24hr(tendors.getClosing_time()));
				tendors.setOpening_time(MethodsHelper.convertIn24hr(tendors.getOpening_time()));
				
				Date opdate=MethodsHelper.convertInDate1(MethodsHelper.convertDate(tendors.getOpeningDate()));
				Date cldate=MethodsHelper.convertInDate1(MethodsHelper.convertDate(tendors.getClosingDate()));


				Date opdate1=MethodsHelper.convertInDate(MethodsHelper.convertDate(tendors.getOpeningDate())+" "+MethodsHelper.convertIn24hr(tendors.getOpening_time()));
				Date cldate1=MethodsHelper.convertInDate(MethodsHelper.convertDate(tendors.getClosingDate())+" "+MethodsHelper.convertIn24hr(tendors.getClosing_time()));

				System.err.println("opdate :"+opdate+" "+opdate1);
				System.err.println("cldate :"+cldate+" "+cldate1);
				
				if(opdate.after(cldate)){
					model=saveTenders1(tendors,english,marathi,req,model);
				}else if(opdate.equals(cldate)){
					if(opdate1.after(cldate1)){
						model=saveTenders1(tendors,english,marathi,req,model);
					}else{
						model.addObject("tendors", tendors);
						List<TendorsDepartment>	departments=tenderService.getTenderDepartment();
						model.addObject("departments", departments);
						session.setAttribute("action", "newTender");
						model.setViewName("tender/newTender");
						model.addObject("dateValidation", "invalidTime");
					}
				}else{
					model.addObject("tendors", tendors);
					List<TendorsDepartment>	departments=tenderService.getTenderDepartment();
					model.addObject("departments", departments);
					session.setAttribute("action", "newTender");
					model.setViewName("tender/newTender");
					model.addObject("dateValidation", "invalidDate");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/errors");
		}

		return model;
	}





	@SuppressWarnings("deprecation")
	private ModelAndView saveTenders1(Tendors tendors,List<MultipartFile> english, List<MultipartFile> marathi,
			HttpServletRequest req,ModelAndView model) {
		try {
			
			String title[]=req.getParameterValues("atitle");

			String RealPath = req.getServletContext().getRealPath("/staticResources/Tenders/");
			File f = new File(RealPath);
			if (!f.exists()) {
				f.mkdirs();
			}
			String path = RealPath.replace("\\", "/");

			if (tendors.getId() == 0) {
				int newsID = tenderService.saveTendors(tendors);
				if (newsID > 0) {
					for(int j=0;j<english.size();j++)
					{
						String atitle=StringEscapeUtils.escapeHtml4(title[j]);
						if (!english.isEmpty()) {
							attachmentservice.saveattachment(path, english.get(j), "english",newsID,"TENDER",atitle);
						}
					}
					for(int j=0;j<marathi.size();j++)
					{
						String atitle=StringEscapeUtils.escapeHtml4(title[j]);
						if (!marathi.isEmpty()) {
							attachmentservice.saveattachment(path, marathi.get(j), "marathi",newsID,"TENDER",atitle);
						}
					}
				}
			} else {

				try {
					tendors.setPublish_date(MethodsHelper.convertDate(tendors.getPublish_date()));
				} catch (ParseException e) {

				}
				boolean b = tenderService.updateTendors(tendors);

				if (b == true) {


					//attachmentservice.UpdateAttachmentByID(path, english,"english", tendors.getId());

					//attachmentservice.UpdateAttachmentByID(path, marathi,"marathi", tendors.getId());

					for(int j=0;j<english.size();j++)
					{
						String atitle=StringEscapeUtils.escapeHtml4(title[j]);
						if (!english.isEmpty()) {
							attachmentservice.saveattachment(path, english.get(j), "english",tendors.getId(),"TENDER",atitle);
						}
					}
					for(int j=0;j<marathi.size();j++)
					{
						String atitle=StringEscapeUtils.escapeHtml4(title[j]);
						if (!marathi.isEmpty()) {
							attachmentservice.saveattachment(path, marathi.get(j), "marathi",tendors.getId(),"TENDER",atitle);
						}
					}
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.setViewName("redirect:/tenderList");
		return model;
	}





}
