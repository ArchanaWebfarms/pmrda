package com.cmsManagement.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.captcha.botdetect.web.servlet.Captcha;
import com.cmsManagement.dto.NewsAttachmentDto;
import com.cmsManagement.dto.NoticeAttachmentsDto;
import com.cmsManagement.dto.NoticeResponse;
import com.cmsManagement.dto.TendorAttachmentDto;
import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Complaint;
import com.cmsManagement.model.CurrentOpening;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.Enquiry;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FeedBack;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.model.MetaData;
import com.cmsManagement.model.News;
import com.cmsManagement.model.Notices;
import com.cmsManagement.model.Project;
import com.cmsManagement.model.RTIApplications;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.Tendors;
import com.cmsManagement.model.Video;
import com.cmsManagement.model.VisitorCounter;
import com.cmsManagement.util.Email;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.NumbersEnglishToMarathi;
import com.cmsManagement.util.ValidateInput;
import com.cmsManagement.util.ValidationResponse;

@Controller
public class FrontController extends AbstractControllerHelper {

	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
	LocalDateTime now = LocalDateTime.now();

	/**
	 * 
	 * @throws ParseException
	 * @Front Controller Index page
	 *
	 */
	String emailSubject;

	@RequestMapping(value = "/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request, Model indexModel,
			HttpSession session) throws ParseException {

		try {
			/************* getting current date and time *******************/
			session.setAttribute("currdatetime", MethodsHelper
					.convertDateAndTime1(MethodsHelper.getCurrentDateAndTime()));
			List<EntryLogModel> entryLogModellist = noticesService.GetData();
			/*
			 * String dd=null; String tt=null;
			 */
			EntryLogModel entryLogModellist1 = noticesService.GetAllData();
			/* for(int i=0;i<entryLogModellist1.size();i++){ */
			String dd = MethodsHelper.convertDateAndTime2(entryLogModellist1
					.getMODIFIED_ON());
			String tt = MethodsHelper.convertDateInTime(entryLogModellist1
					.getMODIFIED_ON());

			session.setAttribute("LAST_UPDATE", MethodsHelper
					.convertDateAndTime(entryLogModellist1.getMODIFIED_ON()));
			session.setAttribute("last_update_time", MethodsHelper
					.convertTimein12hr(MethodsHelper
							.convertDateInTime(entryLogModellist1
									.getMODIFIED_ON())));
			/* } */
			session.setAttribute("LAST_UPDATE_mr",
					MethodsHelper.convertDateInMarathi1(dd));
			session.setAttribute("last_update_time_mr",
					MethodsHelper.convertTimeInMarathi(tt));

			/************* latest update List *******************/
			indexModel.addAttribute("entryLogModellist", entryLogModellist);

			/************* Project List *******************/
			session.setAttribute("projectList",
					projectService.getProjectListByApprovedStatus());

			/************* Archived Tender *******************/
			List<Tendors> tenderList = tenderService.getAllTendors();
			//			java.util.Date date2 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
			//			.parse(dtf.format(now));
			Date date2=MethodsHelper.convertInDate3(MethodsHelper.getCurrentDateAndTime2());
			System.out.println("Now :" + date2);
			for (int x = 0; x < tenderList.size(); x++) {
				java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
				.parse(tenderList.get(x).getClosingDate() + " "
						+ tenderList.get(x).getClosing_time());
				if (date2.before(date1) || date1.equals(date2)) {

				}// if
				else {
					tenderService.changeTendorStaus1(tenderList.get(x).getId(),
							"Archived", "Archived");
				}// else
			}// for

			/************* Tender List *******************/
			List<Tendors> approvedTendors = tenderService
					.getAllApprovedTendors();
			List<Tendors> approvedTendors1 = new ArrayList<Tendors>();
			for (Tendors n : approvedTendors) {
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				n.setClosing_time(MethodsHelper.convertTimein12hr(n
						.getClosing_time()));
				approvedTendors1.add(n);
			}
			indexModel.addAttribute("approvedTendors", approvedTendors1);

			/************* Notices List *******************/
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("CIRCULERS");
			indexModel.addAttribute("approvedNotice", approvedNotice);

			/************* News List *******************/
			List<News> approvedNews = newsservice.GetApprovedNews();
			List<News> approvedNews1 = new ArrayList<News>();
			for (News n : approvedNews) {
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				approvedNews1.add(n);
			}
			indexModel.addAttribute("approvedNews", approvedNews1);

			/****** Visitor Counter ******/
			String today = MethodsHelper.getCurrentDate();
			List<VisitorCounter> visitorlist = attachmentservice
					.getVisiorList();
			if (visitorlist.size() > 0) {
				VisitorCounter visitor = null;
				try {
					visitor = attachmentservice.getCurrentDate(today.trim());
				} catch (Exception e) {
					e.printStackTrace();
					VisitorCounter lastRecord = attachmentservice
							.getLastCounter(today.trim());
					System.out.println("lastRecord :" + lastRecord.getId());
					attachmentservice.deleteTodayEntry(lastRecord.getId());
				} finally {
					if (visitor == null) {
						attachmentservice.saveVisitorCount(today, 1,
								(visitorlist.get(visitorlist.size() - 1)
										.getTotal_count() + 1));
					} else {
						visitor.setDatewise_count(visitor.getDatewise_count() + 1);
						visitor.setTotal_count(visitor.getTotal_count() + 1);
						attachmentservice.updateVisitorCount(visitor);
					}
				}
			} else {
				attachmentservice.saveVisitorCount(today, 1, 1);
			}
			VisitorCounter visitor = null;
			try {
				visitor = attachmentservice.getCurrentDate(today.trim());
			} catch (Exception e) {
				e.printStackTrace();
				VisitorCounter lastRecord = attachmentservice
						.getLastCounter(today.trim());
				attachmentservice.deleteTodayEntry(lastRecord.getId());
			} finally {
				try {
					session.setAttribute("totalVisit", visitor.getTotal_count());
					session.setAttribute("dailyVisit",
							visitor.getDatewise_count());
					session.setAttribute("totalVisit_mr",
							NumbersEnglishToMarathi.convertInMarathi(String
									.valueOf(visitor.getTotal_count())));
					session.setAttribute("dailyVisit_mr",
							NumbersEnglishToMarathi.convertInMarathi(String
									.valueOf(visitor.getDatewise_count())));
				} catch (Exception e) {

				}

			}

			/************* Department List *******************/
			List<Department> deptList = departmentService.getDepartment();
			session.setAttribute("departmentList", deptList);

			/********************** CM and CEO ***********************/
			LeadershipCoreTeam cm_info = leadershipCoreTeamService
					.viewLeaderById(1);
			try {
				int indexOfSubStr = cm_info.getDescription().indexOf("<br>");
				cm_info.setDescription(cm_info.getDescription().substring(0,
						indexOfSubStr));
				int indexOfSubStrM = cm_info.getDescription_h().indexOf("<br>");
				cm_info.setDescription_h(cm_info.getDescription_h().substring(
						0, indexOfSubStrM));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				indexModel.addAttribute("cm_info", cm_info);
			}

			LeadershipCoreTeam ceo_info = leadershipCoreTeamService
					.viewLeaderById(3);
			try {
				int indexOfSubStr1 = ceo_info.getDescription().indexOf("<br>");
				ceo_info.setDescription(ceo_info.getDescription().substring(0,
						indexOfSubStr1));
				int indexOfSubStrM1 = ceo_info.getDescription_h().indexOf(
						"<br>");
				ceo_info.setDescription_h(ceo_info.getDescription_h()
						.substring(0, indexOfSubStrM1));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				indexModel.addAttribute("ceo_info", ceo_info);
			}

		} catch (Exception e) {

		}
		return "static/home/index";
	}

	/*
	 * @RequestMapping(value = "/Gallery") public ModelAndView
	 * gallary(ModelAndView model){
	 * 
	 * model.setViewName("static/home/gallery"); return model;
	 * 
	 * }
	 */

	@RequestMapping(value = "/pmrda_notice")
	public ModelAndView pmrdaNotice(ModelAndView noticeModel)
			throws ParseException {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("NOTICE");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}
			// java.util.Date date2=new
			// SimpleDateFormat("dd-MM-yyyy").parse(dtf.format(now));
			for (Notices n : approvedNotice) {
				/*
				 * java.util.Date date1=new
				 * SimpleDateFormat("dd-MM-yyyy").parse(n.getClosingDate());
				 * if(date2.before(date1) || date1.equals(date2)) {
				 * //System.err.println("in iffff"+n.getClosingDate()); }else{
				 * //System.err.println("in elseeee"+n.getClosingDate());
				 * noticesService.changeNoticesStaus(n.getNoticeID(),
				 * "Archived", "Archive"); }
				 */
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				approvedNotice1.add(n);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/Notice");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_rti",method=RequestMethod.GET)
	public ModelAndView RTI(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("RTI");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");

				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			RTIApplications rti = new RTIApplications();
			List<RTIApplications> rtiAppl = noticesService.getRTIApplications();
			if (rtiAppl.size() > 0) {
				rti.setApplication_received(rtiAppl.get(0)
						.getApplication_received());
				rti.setApplication_received_h(rtiAppl.get(0)
						.getApplication_received_h());
				rti.setApplication_disposed(rtiAppl.get(0)
						.getApplication_disposed());
				rti.setApplication_disposed_h(rtiAppl.get(0)
						.getApplication_disposed_h());
				rti.setApplication_pending(rtiAppl.get(0)
						.getApplication_pending());
				rti.setApplication_pending_h(rtiAppl.get(0)
						.getApplication_pending_h());
			} else {
				rti.setApplication_received(0);
				rti.setApplication_received_h("0");
				rti.setApplication_disposed(0);
				rti.setApplication_disposed_h("0");
				rti.setApplication_pending(0);
				rti.setApplication_pending_h("0");
			}
			noticeModel.addObject("rti", rti);
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/RTI");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_circulars",method=RequestMethod.GET)
	public ModelAndView Downloads(ModelAndView noticeModel) {
		try {
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("CIRCULERS");
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");

				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
			List<Department> departments = departmentService.getDepartment();
			noticeModel.addObject("departments", departments);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/Circulars");
		return noticeModel;
	}

	@RequestMapping(value = "/press_notes",method=RequestMethod.GET)
	public ModelAndView press_notes(ModelAndView noticeModel,
			HttpServletRequest req) {
		try {
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("PRESS NOTES");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");

				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
			noticeModel.addObject("departments",
					departmentService.getDepartment());
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/press_notes");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_quotations")
	public ModelAndView Quotations(ModelAndView noticeModel) {

		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("QUOTATIONS");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");

				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/Quotations");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_downloads")
	public ModelAndView Circulars(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("DOWNLOADS");
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/Downloads");
		return noticeModel;
	}

	@RequestMapping(value = "/central_gov")
	public ModelAndView central_gov(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("CENTRAL GOV GR");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");

				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/CentralGR");
		return noticeModel;
	}

	@RequestMapping(value = "/state_gov")
	public ModelAndView state_gov(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("STATE GOV GR");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}
			for (Notices n : approvedNotice) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);
				} catch (ParseException e) {

					e.printStackTrace();
				}
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/StateGR");
		return noticeModel;
	}

	@RequestMapping(value = "/other")
	public ModelAndView other(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesList();
			noticeModel.addObject("approvedNotice", approvedNotice);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/OtherGR");
		return noticeModel;
	}

	@RequestMapping(value = "/press_notesv")
	public ModelAndView pressnotes(ModelAndView noticeModel) {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesList();
			noticeModel.addObject("approvedNotice", approvedNotice);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/press_notes");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_news",method=RequestMethod.GET)
	public ModelAndView news(HttpServletRequest request,
			ModelAndView noticeModel) {
		try {
			List<Object> attachmentlist1 = new ArrayList<Object>();
			List<News> newslist = newsservice.GetApprovedActiveNews();
			List<News> newslist1 = new ArrayList<News>();
			for (News n : newslist) {
				try {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					newslist1.add(n);
				} catch (ParseException e) {
				}

			}
			for (int i = 0; i < newslist.size(); i++) {

				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(newslist.get(i).getNewsid(),
								"NEWS");

				attachmentlist1.addAll(attachmentlist);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", newslist1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/News");
		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_tenders",method=RequestMethod.GET)
	public ModelAndView tender(HttpServletRequest request,
			ModelAndView noticeModel) throws ParseException {
		try {
			List<Tendors> tenderList = tenderService.getAllTendors();
			/*java.util.Date date2 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
			.parse(dtf.format(now));*/
			Date date2=MethodsHelper.convertInDate3(MethodsHelper.getCurrentDateAndTime2());
			for (int x = 0; x < tenderList.size(); x++) {
				java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
				.parse(tenderList.get(x).getClosingDate() + " "
						+ tenderList.get(x).getClosing_time());
				if (date2.before(date1) || date1.equals(date2)) {

				}// if
				else {
					tenderService.changeTendorStaus1(tenderList.get(x).getId(),
							"Archived", "Archived");
				}// else
			}// for

			List<Object> attachmentlist1 = new ArrayList<Object>();
			noticeModel.addObject("departments",
					tenderService.getTenderDepartment());

			List<Tendors> approvedNotice = tenderService
					.getAllApprovedTendors();
			List<Tendors> tenderListt1 = new ArrayList<Tendors>();
			for (Tendors n : approvedNotice) {
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				n.setPublish_time(MethodsHelper.convertTimein12hr(n
						.getPublish_time()));
				n.setClosing_time(MethodsHelper.convertTimein12hr(n
						.getClosing_time()));
				n.setOpening_time(MethodsHelper.convertTimein12hr(n
						.getOpening_time()));
				tenderListt1.add(n);
			}
			noticeModel.addObject("approvedNotice", tenderListt1);
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i).getId(),
								"TENDER");
				attachmentlist1.addAll(attachmentlist);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		noticeModel.setViewName("static/home/Tender");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/sendbothdates")
	public List<Notices> dates(ModelAndView noticeModel, HttpServletRequest req)
			throws ParseException {

		List<Notices> approvedNotice = null;
		try {
			String date1 = req.getParameter("fromdate");
			String date2 = req.getParameter("todate");
			String type = req.getParameter("Type");

			if (date1 != "" && date2 != "") {
				String newdate1 = MethodsHelper.convertStringToDateTime(date1);

				String newdate2 = MethodsHelper.convertStringToDateTime(date2);

				approvedNotice = noticesService
						.getApprovedNoticesListBetweenDates(newdate1, newdate2,
								type);

			} else {
				approvedNotice = noticesService.getApprovedNoticesbyType(type);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return approvedNotice;
	}

	@ResponseBody
	@RequestMapping(value = "/newsbydates",method=RequestMethod.GET)
	public NewsAttachmentDto newsbydates(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {

		NewsAttachmentDto object = new NewsAttachmentDto();

		try {
			String date1 = req.getParameter("fromdate");
			String date2 = req.getParameter("todate");
			List<News> approvedNotice = null;
			List<News> approvedNotice1 = new ArrayList<News>();
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();

			if (date1 != "" && date2 != "") {

				approvedNotice = newsservice.GetdNewsByDates(date1, date2);
				for (News n : approvedNotice) {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(n.getNewsid(), "NEWS");
					attachmentlist1.addAll(attachmentlist);
				}

			} else {
				approvedNotice = newsdao.GetApprovedNews();
				for (News n : approvedNotice) {
					n.setPublish_date(MethodsHelper.convertDate1(n
							.getPublish_date()));
					approvedNotice1.add(n);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(n.getNewsid(), "NEWS");
					attachmentlist1.addAll(attachmentlist);
				}
			}
			object.setNews(approvedNotice1);
			object.setAttachment(attachmentlist1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return object;
	}

	@ResponseBody
	@RequestMapping(value = "/tenderbydates")
	public TendorAttachmentDto tenderbydates(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {

		TendorAttachmentDto object = new TendorAttachmentDto();

		try {
			String date1 = req.getParameter("fromdate");
			String date2 = req.getParameter("todate");
			List<Attachment> attachment = new ArrayList<Attachment>();
			List<Tendors> approvedNotice = new ArrayList<Tendors>();
			List<Tendors> approvedNotice1 = null;
			if (date1 != "" && date2 != "") {

				approvedNotice1 = tenderService
						.GetdTendorsByDates(date1, date2);
				for (Tendors a : approvedNotice1) {
					a.setPublish_date(MethodsHelper.convertDate1(a
							.getPublish_date()));
					approvedNotice.add(a);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(a.getId(), "TENDER");
					attachment.addAll(attachmentlist);
				}
			} else {
				approvedNotice1 = tenderService.getAllApprovedTendors();
				for (Tendors a : approvedNotice1) {
					a.setPublish_date(MethodsHelper.convertDate1(a
							.getPublish_date()));
					approvedNotice.add(a);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(a.getId(), "TENDER");
					attachment.addAll(attachmentlist);

				}
			}

			object.setTendor(approvedNotice);
			object.setAttachment(attachment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return object;
	}

	@RequestMapping(value = "/obps_system")
	public ModelAndView obps_system(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/obps_system");

		return noticeModel;
	}

	@RequestMapping(value = "/mobility_plan")
	public ModelAndView mobility_plan(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/mobility_plan");

		return noticeModel;
	}

	@RequestMapping(value = "/prdhamnantri_yogana")
	public ModelAndView prdhamnantri_yogana(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/prdhamnantri_yogana");

		return noticeModel;
	}

	@RequestMapping(value = "/land_management")
	public ModelAndView land_management(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/land_management");

		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_background",method=RequestMethod.GET)
	public ModelAndView Background(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/Background");

		return noticeModel;
	}

	@RequestMapping(value = "/vision_and_mission",method=RequestMethod.GET)
	public ModelAndView vision_and_mission(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/vision_and_mission");

		return noticeModel;
	}

	@RequestMapping(value = "/objectives",method=RequestMethod.GET)
	public ModelAndView objectives(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/objectives");

		return noticeModel;
	}

	@RequestMapping(value = "/pmrda_establishment")
	public ModelAndView pmrda_establishment(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/pmrda_establishment");

		return noticeModel;
	}

	@RequestMapping(value = "/master_plan",method=RequestMethod.GET)
	public ModelAndView master_plan(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/master_plan");

		return noticeModel;
	}

	@RequestMapping(value = "/digital_policy")
	public ModelAndView digital_policy(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/digital_policy");

		return noticeModel;
	}

	@RequestMapping(value = "/leadership_and_core_team",method=RequestMethod.GET)
	public ModelAndView leadership_and_core_team(ModelAndView noticeModel) {
		try {
			List<LeadershipCoreTeam> leaderList = leadershipCoreTeamService
					.getAllLeadersList("LEADER");
			for (LeadershipCoreTeam l : leaderList) {
				try {
					int indexOfSubStr = l.getDescription().indexOf("<br>");
					l.setDescription(l.getDescription().substring(0,
							indexOfSubStr));

					int indexOfSubStrM = l.getDescription_h().indexOf("<br>");
					l.setDescription_h(l.getDescription_h().substring(0,
							indexOfSubStrM));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			noticeModel.addObject("leaderList", leaderList);
			List<Attachment> leaderAttachList = attachmentservice
					.getAttachmentByModuleType("LEADERSHIP");
			noticeModel.addObject("leaderAttachList", leaderAttachList);

			List<LeadershipCoreTeam> teamList = leadershipCoreTeamService
					.getAllLeadersList("CORE TEAM");
			noticeModel.addObject("teamList", teamList);
			List<Attachment> teamAttachList = attachmentservice
					.getAttachmentByModuleType("CORE TEAM");
			noticeModel.addObject("teamAttachList", teamAttachList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			noticeModel.setViewName("static/home/leadership_and_core_team");
		}
		return noticeModel;
	}

	@RequestMapping(value = "/getLeader",method=RequestMethod.POST)
	public ModelAndView getLeader(ModelAndView noticeModel,
			HttpServletRequest req, HttpSession session) {
		int id = 0;
		try {
			id = Integer.parseInt(req.getParameter("id"));
			session.setAttribute("leaderID", id);
		} catch (Exception e) {
			id = (int) session.getAttribute("leaderID");
		} finally {
			System.err.println("iddd :" + id);
			LeadershipCoreTeam leader = leadershipCoreTeamService
					.viewLeaderById(id);
			noticeModel.addObject("leader", leader);
			noticeModel.setViewName("static/home/ViewLeader");
		}
		return noticeModel;
	}

	@RequestMapping(value = "/contact",method=RequestMethod.GET)
	public ModelAndView contact(ModelAndView noticeModel,
			@ModelAttribute("complaint") Complaint complaint,
			BindingResult result) {

		noticeModel.setViewName("static/home/contact");
		return noticeModel;
	}

	@RequestMapping(value = "/contact1")
	public ModelAndView contact1(ModelAndView noticeModel,
			@ModelAttribute("complaint") Complaint complaint,
			BindingResult result) {

		noticeModel.setViewName("static/home/contact1");
		return noticeModel;
	}

	@RequestMapping(value = "/contact2")
	public ModelAndView contact2(ModelAndView noticeModel,
			@ModelAttribute("complaint") Complaint complaint,
			BindingResult result) {

		noticeModel.setViewName("static/home/contact2");
		return noticeModel;
	}

	@RequestMapping(value = "/contact3")
	public ModelAndView contact3(ModelAndView noticeModel,
			@ModelAttribute("complaint") Complaint complaint,
			BindingResult result) {

		noticeModel.setViewName("static/home/contact3");
		return noticeModel;
	}

	@RequestMapping(value = "/gallery",method=RequestMethod.GET)
	public ModelAndView gallery(ModelAndView model) {
		try {
			/*
			 * List<GalaryCategory> getGalaryCategoryList =
			 * attachmentservice.getGalaryCategoryList();
			 * noticeModel.addObject("getGalaryCategoryList",
			 * getGalaryCategoryList); for(int
			 * i=0;i<getGalaryCategoryList.size();i++){ List<Attachment>
			 * attachment = attachmentservice.getAttachmentListByGalaryCateID(
			 * getGalaryCategoryList.get(i).getId());
			 * noticeModel.addObject("attachment", attachment); }
			 */
			// List<Attachment> attachment =
			// attachmentservice.getAttachmentList();

			List<Attachment> photoList = attachmentservice
					.getAttachmentByModuleType("GALLARY");
			model.addObject("photoList", photoList);
			model.addObject("size", photoList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.setViewName("static/home/gallery");
		return model;
	}

	@RequestMapping(value = "/doSearch", method = RequestMethod.GET)
	public String doSearch(ModelMap model, HttpServletRequest req) {
		ArrayList arraylist = new ArrayList();
		String abc = req.getParameter("searchword");
		List<News> newslist = newsservice.SearchByKeyWord(abc);
		arraylist.addAll(newslist);
		List<Tendors> tenderlist = tenderService.SearchTenderByKeyWord(abc);
		arraylist.addAll(tenderlist);
		List<Notices> noticelist = noticesService.SearchNoticesByKeyWord(abc);
		arraylist.addAll(noticelist);
		List<MetaData> metalist = metaservice.SearchByKeyWord(abc);
		arraylist.addAll(metalist);

		model.addAttribute("arraylist", arraylist);
		return "static/home/search";

	}

	@ResponseBody
	@RequestMapping(value = "/searchNoticesByDepartment", method=RequestMethod.GET)
	public NoticeAttachmentsDto searchNoticesByDepartment(
			HttpServletRequest request) throws ParseException {
		NoticeAttachmentsDto object = null;
		try {
			object = new NoticeAttachmentsDto();
			List<Notices> approvedNotice = new ArrayList<Notices>();
			List<Attachment> attachment = new ArrayList<Attachment>();

			int deptID = Integer.parseInt(request.getParameter("departments"));
			String noticeType = request.getParameter("noticeType");
			String category = request.getParameter("category");
			FinancialYear financialYear = financialYearDao
					.getCurrentActiveFinancialYear();
			int year = financialYear.getFinancialId();
			List<Notices> List = noticesService.searchNoticesByDepartment(
					deptID, noticeType, category, year);
			for (Notices a : List) {
				a.setPublish_date(MethodsHelper.convertDate1(a
						.getPublish_date()));
				approvedNotice.add(a);

				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(a.getNoticeID(), "NOTICE");
				attachment.addAll(attachmentlist);
			}
			object.setAttachment(attachment);
			object.setNotice(approvedNotice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@ResponseBody
	@RequestMapping(value = "/searchTendersByDepartment", method=RequestMethod.GET)
	public TendorAttachmentDto searchTendersByDepartment(
			HttpServletRequest request, Model searchTendersByDepartmentModel)
					throws ParseException {
		TendorAttachmentDto object = new TendorAttachmentDto();
		try {
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			int deptID = Integer.parseInt(request.getParameter("departments"));
			List<Tendors> tenderList = tenderService
					.searchTendersByDepartment(deptID);
			java.util.Date date2 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
			.parse(dtf.format(now));
			for (int x = 0; x < tenderList.size(); x++) {
				java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
				.parse(tenderList.get(x).getClosingDate() + " "
						+ tenderList.get(x).getClosing_time());
				if (date2.before(date1) || date1.equals(date2)) {
					tenderList.get(x).setPublish_date(
							MethodsHelper.convertDate1(tenderList.get(x)
									.getPublish_date()));
					tenderList.get(x).setPublish_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getPublish_time()));
					tenderList.get(x).setClosing_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getClosing_time()));
					tenderList.get(x).setOpening_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getOpening_time()));
				}// if
				else {
					tenderService.changeTendorStaus1(tenderList.get(x).getId(),
							"Archived", "Archived");
					tenderList.get(x).setPublish_date(
							MethodsHelper.convertDate1(tenderList.get(x)
									.getPublish_date()));
					tenderList.get(x).setPublish_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getPublish_time()));
					tenderList.get(x).setClosing_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getClosing_time()));
					tenderList.get(x).setOpening_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getOpening_time()));
				}// else
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(tenderList.get(x).getId(),
								"TENDER");
				attachmentlist1.addAll(attachmentlist);
			}
			object.setAttachment(attachmentlist1);
			object.setTendor(tenderList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@RequestMapping(value = "/screen_reader")
	public ModelAndView screen_reader(ModelAndView noticeModel,
			HttpServletRequest req) {
		String path = req.getParameter("path");
		noticeModel.setViewName("static/home/screen_reader");
		return noticeModel;
	}

	// =======Archieve Tenders========

	@RequestMapping(value = "/Archive_tenders")
	public ModelAndView Archive_tenders(ModelAndView noticeModel)
			throws ParseException {
		try {
			noticeModel.addObject("departments",
					tenderService.getTenderDepartment());
			List<Tendors> tendorList = tenderService
					.getTendorListByStatus("Archived");
			noticeModel.addObject("Archive_tenders", tendorList);
			List<Attachment> attachList = new ArrayList<Attachment>();
			for (Tendors t : tendorList) {
				t.setPublish_date(MethodsHelper.convertDate1(t
						.getPublish_date()));
				t.setPublish_time(MethodsHelper.convertTimein12hr(t
						.getPublish_time()));
				t.setClosing_time(MethodsHelper.convertTimein12hr(t
						.getClosing_time()));
				t.setOpening_time(MethodsHelper.convertTimein12hr(t
						.getOpening_time()));
				List<Attachment> list = attachmentservice
						.getAttachmentByModuleID(t.getId(), "TENDER");
				attachList.addAll(list);
			}
			noticeModel.addObject("attachmentlist", attachList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/Archive_tenders");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_tendersbydates")
	public List<Tendors> Archive_tendersbydates(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {
		List<Tendors> approvedNotice = null;
		try {
			String date1 = req.getParameter("fromdate");
			String date2 = req.getParameter("todate");

			approvedNotice = null;
			if (date1 != "" && date2 != "") {
				String newdate1 = MethodsHelper.convertStringToDateTime(date1);
				String newdate2 = MethodsHelper.convertStringToDateTime(date2);

				approvedNotice = tenderService.GetdTendorsByDates(newdate1,
						newdate2);
				return approvedNotice;
			} else {
				approvedNotice = tenderService.getTendorListByStatus("Archive");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return approvedNotice;
	}

	@ResponseBody
	@RequestMapping(value = "/searchArchive_tenderByDepartment", produces = "application/json")
	public List<Tendors> searchArchive_tenderByDepartment(
			HttpServletRequest request, Model searchTendersByDepartmentModel)
					throws ParseException {
		List<Tendors> tenderList = null;
		try {
			int deptID = Integer.parseInt(request.getParameter("departments"));
			tenderList = tenderService.searchTendersByDepartment(deptID,
					"Archive");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tenderList;
	}

	// ============================================================================================================

	// Archive Notices

	/*
	 * @RequestMapping(value="/Archive_notice") public ModelAndView
	 * Archive_notices(ModelAndView noticeModel){
	 * noticeModel.addObject("departments", departmentService.getDepartment());
	 * noticeModel.addObject("Archive_notices",
	 * noticesService.getNoticesByStatus("Archive","NOTICE"));
	 * noticeModel.setViewName("static/home/Archive_notices"); return
	 * noticeModel;
	 * 
	 * }
	 */

	@RequestMapping(value = "/Archive_notice")
	public ModelAndView Archive_notices(ModelAndView noticeModel) {
		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "NOTICE"));
		noticeModel.setViewName("static/home/Archive_notices");
		return noticeModel;
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/Archive_noticesbydates") public List<Notices>
	 * Archive_Noticessbydates(ModelAndView noticeModel,HttpServletRequest req)
	 * throws ParseException{ String date1 =req.getParameter("fromdate"); String
	 * date2 =req.getParameter("todate");
	 * 
	 * List<Notices> archiveNotice = null; if(date1 != "" && date2 != "") {
	 * 
	 * String newdate1=MethodsHelper.convertStringToDateTime(date1); String
	 * newdate2=MethodsHelper.convertStringToDateTime(date2); archiveNotice =
	 * noticesService.getArchieveNoticesByDates(newdate1, date2, "NOTICE");
	 * 
	 * 
	 * return archiveNotice; } else{ archiveNotice =
	 * noticesService.getNoticesByStatus("Archive","NOTICE");
	 * 
	 * 
	 * }
	 * 
	 * return archiveNotice; }
	 */

	@ResponseBody
	@RequestMapping(value = "/Archive_noticesbydates")
	public List<NoticeResponse> Archive_Noticessbydates(
			ModelAndView noticeModel, HttpServletRequest req)
					throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");
		List<Notices> archiveNotice = null;
		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;

		if (date1 != "" && date2 != "") {
			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);
			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "NOTICE");

			for (Notices notices : archiveNotice) {
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");

				response = new NoticeResponse();
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			System.out.println("****************************************"
					+ attachmentList.get(0).getPath());
			return noticeResponse;
		}// if
		else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"NOTICE");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);

			}// enhanced for
			System.out.println("****************************************"
					+ attachmentList.get(0).getPath());
		}
		return noticeResponse;
	}

	@ResponseBody
	@RequestMapping(value = "/searchArchive_noticeByDepartment", produces = "application/json")
	public List<Notices> searchArchive_noticeByDepartment(
			HttpServletRequest request, Model searchTendersByDepartmentModel)
					throws ParseException {

		int deptID = Integer.parseInt(request.getParameter("departments"));

		List<Notices> noticeList = noticesService.searchNoticeByDepartment(
				deptID, "Archive");

		return noticeList;
	}

	// ===============================================Archive_Circulars_notices================================================================================

	@RequestMapping(value = "/Archive_circulersnotice")
	public ModelAndView Archive_Circulars_notices(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "CIRCULERS"));
		noticeModel.setViewName("static/home/Archive_Circulars_notices");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_Circulars_noticesbydates")
	public List<NoticeResponse> Archive_CircularsNoticessbydates(
			ModelAndView noticeModel, HttpServletRequest req)
					throws ParseException {

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;

		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "CIRCULERS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"CIRCULERS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// =============================================Archive_Download_notices===============================================================================================
	@RequestMapping(value = "/Archive_Downloadnotice")
	public ModelAndView Archive_Download_notices(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "DOWNLOADS"));
		noticeModel.setViewName("static/home/Archive_Download_notices");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_Download_noticesbydates")
	public List<NoticeResponse> Archive_Download_Noticessbydates(
			ModelAndView noticeModel, HttpServletRequest req)
					throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "DOWNLOADS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"DOWNLOADS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// =================================================Archive_Quotation_notices=========================================================================
	@RequestMapping(value = "/Archive_quotationnotice")
	public ModelAndView Archive_Quotation_notices(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "QUOTATIONS"));
		noticeModel.setViewName("static/home/Archive_Quotations_notices");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_Quotation_noticesbydates")
	public List<NoticeResponse> Archive_Quotation_Noticessbydates(
			ModelAndView noticeModel, HttpServletRequest req)
					throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "QUOTATIONS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"QUOTATIONS");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// =================================================Archive_PressNotes=====================================================================

	@RequestMapping(value = "/Archive_PressNotes_notice")
	public ModelAndView Archive_PressNotes(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "PRESS NOTES"));
		noticeModel.setViewName("static/home/Archive_PressNotes");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_PressNotes_bydates")
	public List<NoticeResponse> Archive_PressNotesbydates(
			ModelAndView noticeModel, HttpServletRequest req)
					throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "PRESS NOTES");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"PRESS NOTES");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// ===========================Archive=====Central=============================================================
	@RequestMapping(value = "/Archive_centralGR")
	public ModelAndView Archive_Central(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "CENTRAL GOV GR"));
		noticeModel.setViewName("static/home/Archive_CentralGR");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_centralgrbydates")
	public List<NoticeResponse> Archive_Central(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "CENTRAL GOV GR");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"CENTRAL GOV GR");

			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
		}

		return noticeResponse;
	}

	// ===========================Archive=====State=============================================================

	@RequestMapping(value = "/Archive_stateGR")
	public ModelAndView Archive_State(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "STATE GOV GR"));
		noticeModel.setViewName("static/home/Archive_StateGR");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_Stategrbydates")
	public List<NoticeResponse> Archive_State(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "STATE GOV GR");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive",
					"STATE GOV GR");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// ================Archive
	// RTI===========================================================

	@RequestMapping(value = "/Archive_rti")
	public ModelAndView Archive_RTI(ModelAndView noticeModel) {

		noticeModel.addObject("departments", departmentService.getDepartment());
		noticeModel.addObject("Archive_notices",
				noticesService.getNoticesByStatus("Archive", "RTI"));
		noticeModel.setViewName("static/home/Archieve_RTI");
		return noticeModel;
	}

	@ResponseBody
	@RequestMapping(value = "/Archive_RTIbydates")
	public List<NoticeResponse> Archive_RTIbydates(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {
		String date1 = req.getParameter("fromdate");
		String date2 = req.getParameter("todate");

		List<Attachment> attachmentList = null;
		List<Attachment> attachments = null;
		List<NoticeResponse> noticeResponse = new ArrayList<NoticeResponse>();
		NoticeResponse response = null;
		List<Notices> archiveNotice = null;
		if (date1 != "" && date2 != "") {

			String newdate1 = MethodsHelper.convertStringToDateTime(date1);
			String newdate2 = MethodsHelper.convertStringToDateTime(date2);

			archiveNotice = noticesService.getArchieveNoticesByDates(newdate1,
					date2, "RTI");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for
			return noticeResponse;
		} else {
			archiveNotice = noticesService.getNoticesByStatus("Archive", "RTI");
			for (Notices notices : archiveNotice) {
				response = new NoticeResponse();
				attachmentList = attachmentservice.getAttachmentByModuleID(
						notices.getNoticeID(), "NOTICE");
				response.setAttachmentList(attachmentList);
				response.setDepartment(notices.getDepartment()
						.getDepartmentName());
				response.setDepartment_h(notices.getDepartment()
						.getDepartmentName_h());
				response.setTitle(notices.getTitle());
				response.setTitle_h(notices.getTitle_h());
				response.setType(notices.getType());
				response.setClosingDate(notices.getClosingDate());
				response.setPublishDate(notices.getPublish_date());

				noticeResponse.add(response);
			}// enhanced for

		}

		return noticeResponse;
	}

	// ===================================================================================
	@ResponseBody
	@RequestMapping(value = "/noticebydates",method=RequestMethod.GET)
	public NoticeAttachmentsDto noticebydates(ModelAndView noticeModel,
			HttpServletRequest req) throws ParseException {

		NoticeAttachmentsDto object = new NoticeAttachmentsDto();

		try {
			String date1 = req.getParameter("fromdate");
			String date2 = req.getParameter("todate");
			String type = req.getParameter("type");
			List<Attachment> attachment = new ArrayList<Attachment>();
			List<Notices> approvedNotice = new ArrayList<Notices>();
			List<Notices> approvedNotice1 = null;
			if (date1 != "" && date2 != "") {
				approvedNotice1 = noticesService.GetNoticesByDates(date1,
						date2, type);
				for (Notices a : approvedNotice1) {
					a.setPublish_date(MethodsHelper.convertDate1(a
							.getPublish_date()));
					approvedNotice.add(a);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(a.getNoticeID(), "NOTICE");
					attachment.addAll(attachmentlist);
				}
			} else {
				approvedNotice1 = noticesService.getApprovedNoticesbyType(type);
				for (Notices a : approvedNotice1) {
					a.setPublish_date(MethodsHelper.convertDate1(a
							.getPublish_date()));
					approvedNotice.add(a);

					List<Attachment> attachmentlist = attachmentservice
							.getAttachmentByModuleID(a.getNoticeID(), "NOTICE");
					attachment.addAll(attachmentlist);

				}
			}

			object.setNotice(approvedNotice);
			object.setAttachment(attachment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return object;
	}

	@RequestMapping(value = "/disclaimer", method=RequestMethod.GET)
	public ModelAndView disclaimer(ModelAndView model) throws ParseException {
		model.setViewName("static/home/disclaimer");
		return model;
	}

	@RequestMapping(value = "/termsconditions", method=RequestMethod.GET)
	public ModelAndView termsconditions(ModelAndView model)
			throws ParseException {
		model.setViewName("static/home/termsconditions");
		return model;
	}

	@RequestMapping(value = "/nationalportal", produces = "application/json")
	public ModelAndView nationalportal(ModelAndView model)
			throws ParseException {
		model.setViewName("static/home/NationalPortal");
		return model;
	}

	@RequestMapping(value = "/hyperlinkpolicy", method=RequestMethod.GET)
	public ModelAndView hyperlinkpolicy(ModelAndView model)
			throws ParseException {
		model.setViewName("static/home/hyperlinkpolicy");
		return model;
	}

	@RequestMapping(value = "/privacypolicy", method=RequestMethod.GET)
	public ModelAndView privacypolicy(ModelAndView model) throws ParseException {
		model.setViewName("static/home/privacypolicy");
		return model;
	}

	@RequestMapping(value = "/feedback", method=RequestMethod.GET)
	public ModelAndView feedback(ModelAndView model) throws ParseException {

		model.setViewName("static/home/feedback");
		return model;
	}

	@RequestMapping(value = "/websitepolicy", produces = "application/json")
	public ModelAndView websitepolicy(ModelAndView model) throws ParseException {
		model.setViewName("static/home/websitepolicy");
		return model;
	}

	@RequestMapping(value = "/cmap", method=RequestMethod.GET)
	public ModelAndView cmap(ModelAndView model) throws ParseException {

		model.setViewName("static/home/cmap");
		return model;
	}

	@RequestMapping(value = "/sitemap", method=RequestMethod.GET)
	public ModelAndView sitemap(ModelAndView model) throws ParseException {

		model.setViewName("static/home/sitemap");
		return model;
	}

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/submitFeedback",method=RequestMethod.GET)
	public ValidationResponse submitFeedback(@ModelAttribute("feedBackForm") @Valid FeedBack info,BindingResult result, ValidationResponse resp,HttpServletRequest request, ModelAndView model,
			HttpServletResponse response) throws ParseException {
		System.out.println("in controller");
		String captchaCodeFeedback = request.getParameter("captchaCodeFeedback");

		Captcha captcha = Captcha.load(request, "feedbackCaptcha");
		boolean isHuman = captcha.validate(captchaCodeFeedback);

		if (isHuman) {

			if (result.hasErrors()) {
				resp.setStatus("FAIL");
				Map<String, String> errors = result
						.getFieldErrors()
						.stream()
						.collect(
								Collectors.toMap(FieldError::getField,
										FieldError::getDefaultMessage));

				resp.setErrorMessages(errors);
			} else {			
				/*String name = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("name")));
				String phone = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("phone")));
				String email = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("email")));
				// String title=request.getParameter("title");
				String subject = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("subject")));
				String description = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("description")));
				String code = ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(request.getParameter("ccode")));*/

				info.setName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getName())));
				info.setPhone(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getPhone())));
				info.setEmail(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getEmail())));
				// info.setTitle(title);
				info.setSubject(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getSubject())));
				info.setDescription(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getDescription())));
				info.setState("pending");
				info.setCreated_date(MethodsHelper.getCurrentDate());
				info.setCode(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getCode())));

				System.err.println("info :" + info.toString());

				/*
				 * Prevent Feedback from Xss attack
				 * info=PreventionFromXSSAttack.preventFeedback(info);
				 */

				feedBackService.saveComplaint(info);

				/*************** Mail send to admin *********************/
				try {
					emailSubject = "Feedback";
					mailSenderObj.send(new MimeMessagePreparator() {
						public void prepare(MimeMessage mimeMessage)
								throws Exception {
							MimeMessageHelper mimeMsgHelperObj1 = new MimeMessageHelper(
									mimeMessage, true, "UTF-8");

							mimeMsgHelperObj1.setTo(info.getEmail());
							// mimeMsgHelperObj1.setFrom("archanawpt1@gmail.com");
							mimeMsgHelperObj1.setSubject(emailSubject);
							mimeMsgHelperObj1.setText(
									Email.sendFeedbackMail(response, info),
									true);

						}
					});
				} catch (Exception e1) {
				}
				resp.setStatus("SUCCESS");
			}
		} else {
			resp.setStatus("CAPTCHAFAIL");
		}
		return resp;
	}

	@RequestMapping(value = "/help", method=RequestMethod.GET)
	public ModelAndView help(ModelAndView model) throws ParseException {

		model.setViewName("static/home/help");
		return model;
	}

	@RequestMapping(value = "/getNewsById", produces = "application/json")
	public ModelAndView getNewsById(ModelAndView model, HttpServletRequest req)
			throws ParseException {
		try {
			List<News> newsList = newsservice.GetApprovedNews();
			model.addObject("newsList", newsList);
			News news = newsservice.ViewNews(Integer.parseInt(req
					.getParameter("id")));
			// System.out.println("news :"+news);
			model.addObject("news", news);
			List<Attachment> attachmentlist = attachmentservice
					.getAttachmentByModuleID(news.getNewsid(), "NEWS");
			System.out.println("size :" + attachmentlist.size());
			model.addObject("attachmentlist", attachmentlist);
			model.setViewName("static/home/ViewFullNews");
		} catch (Exception e) {
			model.setViewName("redirect:/pmrda_news");
		}
		return model;
	}

	@RequestMapping(value = "/getTenderById", produces = "application/json")
	public ModelAndView getTenderById(ModelAndView model, HttpServletRequest req)
			throws ParseException {
		try {
			List<Tendors> tendorList = tenderService.getAllApprovedTendors();
			model.addObject("tendorList", tendorList);
			Tendors tendor = tenderService.findTenderById(Integer.parseInt(req
					.getParameter("id")));
			model.addObject("tendor", tendor);
			List<Attachment> attachmentlist = attachmentservice
					.getAttachmentByModuleID(tendor.getId(), "TENDER");
			System.err.println("size :" + attachmentlist.size());
			model.addObject("attachmentlist", attachmentlist);
			model.setViewName("static/home/ViewFullTendor");
		} catch (Exception e) {
			model.setViewName("redirect:/pmrda_tenders");
		}
		return model;
	}

	@RequestMapping(value = "/getNoticeById", produces = "application/json")
	public ModelAndView getNoticeById(ModelAndView model, HttpServletRequest req)
			throws ParseException {

		try {
			Notices notice = noticesService.findNoticesById(Integer
					.parseInt(req.getParameter("id")));
			model.addObject("notice", notice);
			List<Attachment> attachmentlist = attachmentservice
					.getAttachmentByModuleID(notice.getNoticeID(), "NOTICE");
			model.addObject("attachmentlist", attachmentlist);
			List<Notices> noticeList = noticesService
					.getApprovedNoticesbyType(notice.getType());
			model.addObject("noticeList", noticeList);
			model.setViewName("static/home/viewFullNotice");

		} catch (Exception e) {
			model.setViewName("redirect:/index");
		}
		return model;
	}

	@RequestMapping(value = "/getUpdatesById", produces = "application/json")
	public ModelAndView getUpdatesById(ModelAndView model,
			HttpServletRequest req) throws ParseException {
		try {
			EntryLogModel entryLog = attachmentservice.getEntryLogById(Integer
					.parseInt(req.getParameter("id")));
			System.err.println("idddd:"
					+ Integer.parseInt(req.getParameter("id")));
			if (entryLog.getType().equals("NEWS")) {
				model.addObject("id", entryLog.getTitle_id());
				model.setViewName("redirect:/getNewsById");
			} else if (entryLog.getType().equals("TENDER")) {
				model.addObject("id", entryLog.getTitle_id());
				model.setViewName("redirect:/getTenderById");
			} else if (entryLog.getType().equals("NOTICE")) {

			} else {

			}
		} catch (Exception e) {
			model.setViewName("redirect:/pmrda_tenders");
		}
		return model;
	}

	@RequestMapping(value = "/PuneRingRoad", produces = "application/json")
	public ModelAndView PuneRingRoad(ModelAndView model) throws ParseException {

		model.setViewName("static/home/stRingroad");
		return model;
	}

	@RequestMapping(value = "/Mhalunge", produces = "application/json")
	public ModelAndView Mhalunge(ModelAndView model) throws ParseException {

		model.setViewName("static/home/stMhalunge");
		return model;
	}

	@RequestMapping(value = "/Indrayani", produces = "application/json")
	public ModelAndView Indrayani(ModelAndView model) throws ParseException {

		model.setViewName("static/home/stIndrayani");
		return model;
	}

	@RequestMapping(value = "/FireStation", produces = "application/json")
	public ModelAndView FireStation(ModelAndView model) throws ParseException {

		model.setViewName("static/home/stFire");
		return model;
	}

	@RequestMapping(value = "/metro", produces = "application/json")
	public ModelAndView metro(ModelAndView model) throws ParseException {

		model.setViewName("static/home/stMetro");
		return model;
	}

	@RequestMapping(value = "/underMaintenance")
	public ModelAndView underMaintenance(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/MaintenancePage");
		return noticeModel;
	}

	@RequestMapping(value = "/crp", method=RequestMethod.GET)
	public ModelAndView crp(ModelAndView model) throws ParseException {

		model.setViewName("static/home/crp");
		return model;
	}

	@RequestMapping(value = "/cap", method=RequestMethod.GET)
	public ModelAndView cap(ModelAndView model) throws ParseException {

		model.setViewName("static/home/cap");
		return model;
	}

	@RequestMapping(value = "/copyrightPolicy", method=RequestMethod.GET)
	public ModelAndView copyrightPolicy(ModelAndView model)
			throws ParseException {

		model.setViewName("static/home/copyrightPolicy");
		return model;
	}

	@RequestMapping(value = "/websiteMonitoringPolicies", method=RequestMethod.GET)
	public ModelAndView websiteMonitoringPolicies(ModelAndView model)
			throws ParseException {

		model.setViewName("static/home/webMonitorPolicy");
		return model;
	}

	@RequestMapping(value = "/welcomeToPMRDA", method=RequestMethod.GET)
	public ModelAndView WelcomeToPMRDA(ModelAndView model)
			throws ParseException {

		model.setViewName("static/home/welcome");
		return model;
	}

	@RequestMapping(value = "/videos",method=RequestMethod.GET)
	public ModelAndView videos(ModelAndView noticeModel) {
		List<Video> videoList = attachmentservice.getAllVideo();
		noticeModel.addObject("videoList", videoList);
		noticeModel.setViewName("static/home/videos");
		return noticeModel;
	}

	@RequestMapping(value = "/enquiry", method=RequestMethod.GET)
	public ModelAndView enquiry(ModelAndView model) throws ParseException {
		List<Department> list = departmentService.getDepartment();
		model.addObject("list", list);
		model.setViewName("static/home/enquiry");
		return model;
	}

	@RequestMapping(value = "/pmay", produces = "application/json")
	public ModelAndView pmay(ModelAndView model) throws ParseException {

		model.setViewName("static/home/pmay");
		return model;
	}

	@RequestMapping(value = "/Maps", method=RequestMethod.GET)
	public ModelAndView Maps(ModelAndView model) throws ParseException {
		List<Attachment> mapList = attachmentservice
				.getAttachmentByModuleType("MAP");
		model.addObject("mapList", mapList);
		model.addObject("size", mapList.size());
		model.setViewName("static/home/Maps");
		return model;
	}

	@RequestMapping(value = "/openMaps", produces = "application/json")
	public ModelAndView openMaps(ModelAndView model) throws ParseException {

		model.setViewName("static/home/openMaps");
		return model;
	}

	@RequestMapping(value = "/currentOpen",method=RequestMethod.GET)
	public ModelAndView currentOpen(ModelAndView noticeModel) {
		try {
			List<CurrentOpening> list = currentOpening
					.getAllActiveCurrentOpening();
			if (list.size() > 0) {
				noticeModel.addObject("list", list);

				List<Attachment> attachment = attachmentservice
						.getAttachmentByModuleType("OPENING");
				noticeModel.addObject("attachmentList", attachment);

				noticeModel.setViewName("static/home/CurrentOpening");
			} else {
				noticeModel.setViewName("static/home/currentOpen");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return noticeModel;
	}

	@RequestMapping(value = "/accessibility",method=RequestMethod.GET)
	public ModelAndView accessibility(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/accessibility");
		return noticeModel;
	}

	@RequestMapping(value = "/act",method=RequestMethod.GET)
	public ModelAndView act(ModelAndView noticeModel) throws ParseException {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("STATE GOV GR");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}

			for (Notices n : approvedNotice) {
				n.setPublish_date(MethodsHelper.getYear(n.getPublish_date()));
				approvedNotice1.add(n);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/act");
		return noticeModel;
	}

	@RequestMapping(value = "/govresolution",method=RequestMethod.GET)
	public ModelAndView govresolution(ModelAndView noticeModel)
			throws ParseException {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("CENTRAL GOV GR");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}

			for (Notices n : approvedNotice) {
				n.setPublish_date(MethodsHelper.getYear(n.getPublish_date()));
				approvedNotice1.add(n);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/resolution");
		return noticeModel;
	}

	@RequestMapping(value = "/govnotiication")
	public ModelAndView govnotiication(ModelAndView noticeModel)
			throws ParseException {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("NOTIFICATION");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}

			for (Notices n : approvedNotice) {
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				approvedNotice1.add(n);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
			noticeModel.setViewName("static/home/notiication");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeModel;
	}

	@RequestMapping(value = "/policies",method=RequestMethod.GET)
	public ModelAndView policies(ModelAndView noticeModel)
			throws ParseException {
		try {
			noticeModel.addObject("departments",
					departmentService.getDepartment());
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			List<Notices> approvedNotice1 = new ArrayList<Notices>();
			List<Notices> approvedNotice = noticesService
					.getApprovedNoticesbyType("POLICIES");
			for (int i = 0; i < approvedNotice.size(); i++) {
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(approvedNotice.get(i)
								.getNoticeID(), "NOTICE");
				attachmentlist1.addAll(attachmentlist);
			}

			for (Notices n : approvedNotice) {
				n.setPublish_date(MethodsHelper.convertDate1(n
						.getPublish_date()));
				approvedNotice1.add(n);
			}
			noticeModel.addObject("attachmentlist", attachmentlist1);
			noticeModel.addObject("approvedNotice", approvedNotice1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeModel.setViewName("static/home/policies");
		return noticeModel;
	}

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/submitEnquiry",method=RequestMethod.GET)
	public ValidationResponse submitEnquiry(@ModelAttribute("enquiryForm") @Valid Enquiry info,BindingResult result,ValidationResponse resp,HttpServletRequest request,HttpServletResponse response) throws ParseException {
		String captchaCodeEnquiry = request.getParameter("captchaCodeEnquiry");

		Captcha captcha = Captcha.load(request, "enquiryCaptcha");
		boolean isHuman = captcha.validate(captchaCodeEnquiry);
		System.err.println("captcha :"+isHuman+" "+captchaCodeEnquiry);

		if (isHuman) {
			try {
				if(result.hasErrors()){
					resp.setStatus("FAIL");
					Map<String, String> errors = result
							.getFieldErrors()
							.stream()
							.collect(
									Collectors.toMap(FieldError::getField,
											FieldError::getDefaultMessage));

					resp.setErrorMessages(errors);
				}else{

					/*String name = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("name")));
			String phone = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("phone")));
			String email = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("email")));
			String subject = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("subject")));
			String description = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("description")));
			int id = Integer.parseInt(request.getParameter("dept"));
			String code = ValidateInput.replaceSome(StringEscapeUtils
					.escapeHtml4(request.getParameter("ccode")));*/

					int id = Integer.parseInt(request.getParameter("dept"));
					Department department = departmentService.getDepartmentById(id);
					info.setDepartment(department);

					info.setName(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getName())));
					info.setPhone(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getPhone())));
					info.setEmail(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getEmail())));
					info.setSubject(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getSubject())));
					info.setDescription(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getDescription())));
					info.setState("pending");
					info.setCode(ValidateInput.replaceSome(StringEscapeUtils.escapeHtml4(info.getCode())));
					info.setCreated_date(MethodsHelper.getCurrentDate());

					feedBackService.saveEnquiry(info);

					/*************** Mail send to admin *********************/
					try {
						emailSubject = "Enquiry";
						mailSenderObj.send(new MimeMessagePreparator() {
							public void prepare(MimeMessage mimeMessage)
									throws Exception {
								MimeMessageHelper mimeMsgHelperObj1 = new MimeMessageHelper(
										mimeMessage, true, "UTF-8");

								mimeMsgHelperObj1.setTo(info.getEmail());
								// mimeMsgHelperObj1.setFrom("archanawpt1@gmail.com");
								mimeMsgHelperObj1.setSubject(emailSubject);
								mimeMsgHelperObj1.setText(
										Email.sendEnquiryMail(response, info), true);

							}
						});
					} catch (Exception e1) {
					}
					resp.setStatus("SUCCESS");


				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			resp.setStatus("CAPTCHAFAIL");
		}
		return resp;
	}

	@ResponseBody
	@RequestMapping(value = "/searchArchieveTendersByDepartment")
	public TendorAttachmentDto searchArchieveTendersByDepartment(
			HttpServletRequest request, Enquiry info) throws ParseException {
		TendorAttachmentDto object = new TendorAttachmentDto();
		try {
			List<Attachment> attachmentlist1 = new ArrayList<Attachment>();
			int deptID = Integer.parseInt(request.getParameter("departments"));
			List<Tendors> tenderList = tenderService.searchTendersByDepartment(
					deptID, "Archive");
			java.util.Date date2 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
			.parse(dtf.format(now));
			for (int x = 0; x < tenderList.size(); x++) {
				java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy HH:mm")
				.parse(tenderList.get(x).getClosingDate() + " "
						+ tenderList.get(x).getClosing_time());
				if (date2.before(date1) || date1.equals(date2)) {
					tenderList.get(x).setPublish_date(
							MethodsHelper.convertDate1(tenderList.get(x)
									.getPublish_date()));
					tenderList.get(x).setPublish_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getPublish_time()));
					tenderList.get(x).setClosing_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getClosing_time()));
					tenderList.get(x).setOpening_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getOpening_time()));
				}// if
				else {
					tenderService.changeTendorStaus1(tenderList.get(x).getId(),
							"Archived", "Archived");
					tenderList.get(x).setPublish_date(
							MethodsHelper.convertDate1(tenderList.get(x)
									.getPublish_date()));
					tenderList.get(x).setPublish_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getPublish_time()));
					tenderList.get(x).setClosing_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getClosing_time()));
					tenderList.get(x).setOpening_time(
							MethodsHelper.convertTimein12hr(tenderList.get(x)
									.getOpening_time()));
				}// else
				List<Attachment> attachmentlist = attachmentservice
						.getAttachmentByModuleID(tenderList.get(x).getId(),
								"TENDER");
				attachmentlist1.addAll(attachmentlist);
			}
			object.setAttachment(attachmentlist1);
			object.setTendor(tenderList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@RequestMapping(value = "/listofvillages",method=RequestMethod.GET)
	public ModelAndView listofvillages(ModelAndView model)
			throws ParseException {
		try {
			List<Taluka> talukaList = departmentService.getAllVillages();
			model.addObject("talukaList", talukaList);

			List<Attachment> attachment = attachmentservice
					.getAttachmentByModuleType("TALUKA");
			model.addObject("attachmentList", attachment);

			int count = 0;
			for (Taluka t : talukaList) {
				count = count + t.getTotal_villages();
			}
			model.addObject("count", count);
			model.addObject("count_mr", NumbersEnglishToMarathi
					.convertInMarathi(String.valueOf(count)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.setViewName("static/home/Villages");
		return model;
	}

	@RequestMapping(value = "/getDepartmentById",method=RequestMethod.POST)
	public ModelAndView getDepartmentById(ModelAndView model,
			HttpServletRequest req, HttpSession session) throws ParseException {
		int id = 0;
		try {
			id = Integer.parseInt(req.getParameter("id"));
			session.setAttribute("deptID", id);
		} catch (Exception e) {
			id = (int) session.getAttribute("deptID");
		} finally {
			Department department = departmentService.getDepartmentById(id);
			model.addObject("department", department);
			model.setViewName("static/home/Department");
		}
		return model;
	}

	// getProjectById
	@RequestMapping(value = "/getProjectById",method=RequestMethod.POST)
	public ModelAndView getProjectById(ModelAndView projectmodel,
			HttpServletRequest request, HttpSession session) {
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("projectID", id);
		} catch (Exception e) {
			id = (int) session.getAttribute("projectID");
		} finally {
			Project project = projectService.getProjectById(id);
			List<Attachment> attachmentlist = attachmentservice
					.getAttachmentByModuleID(project.getId(), "Project");
			// List<project_features>
			// scopeList=projectService.getProjectFeaturesById(id);

			if (project.getDescription().isEmpty()
					&& project.getSpecification().isEmpty()
					&& project.getProjectCordinator().isEmpty()
					&& project.getProject_status().isEmpty()
					&& project.getScope_of_work().isEmpty()
					&& attachmentlist.isEmpty()) {
				projectmodel.setViewName("redirect:/underMaintenance");
			} else {
				projectmodel.addObject("project", project);
				// projectmodel.addObject("scopeList", scopeList);

				List<Attachment> photo = new ArrayList<Attachment>();

				for (Attachment a : attachmentlist) {
					if (a.getTitle().equals("Map")) {
						projectmodel.addObject("map", a);
					}
					if (a.getTitle().equals("Photo")) {
						photo.add(a);
					}
					if (a.getTitle().equals("Video")) {
						projectmodel.addObject("video", a);
					}
				}
				projectmodel.addObject("photo", photo);
				List<Project> projectlist = projectService
						.getProjectListByApprovedStatus();
				projectmodel.addObject("projectlist", projectlist);

				projectmodel.setViewName("static/home/LatestProject");
			}
		}
		return projectmodel;
	}

	@RequestMapping(value = "/previewFrontPdf")
	public ModelAndView previewPdf(ModelAndView modelAndView,
			HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {

		try {
			int id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
				session.setAttribute("pdfID1", id);
			} catch (Exception e) {
				id = (int) session.getAttribute("pdfID1");
			} finally {

				Attachment attachment = attachmentservice.getAttachmentById(id);
				File file = new File(attachment.getPath());
				if (file.exists()) {
					BufferedOutputStream outStream = null;
					BufferedInputStream inStrem = null;
					try {
						response.setContentType("application/pdf");
						response.setHeader("Content-Disposition",
								"inline;filename=" + file.getName());
						inStrem = new BufferedInputStream(new FileInputStream(
								file));

						outStream = new BufferedOutputStream(
								response.getOutputStream());
					} catch (Exception e) {

					}

					byte[] buffer = new byte[1024];
					int bytesRead = 0;
					while ((bytesRead = inStrem.read(buffer)) != -1) {
						outStream.write(buffer, 0, bytesRead);
					}
					outStream.flush();
					outStream.close();
					inStrem.close();
					// modelAndView.setViewName("static/home/courtnoticeList");
					modelAndView.addObject("user",
							LoginController.getPrincipal());

				} else {
					modelAndView.setViewName("Exception/AttachmentException");
					modelAndView.addObject("user",
							LoginController.getPrincipal());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("redirect:/errors");
		}
		return modelAndView;

	}

	@RequestMapping(value = "/inauguration")
	public ModelAndView inauguration(ModelAndView noticeModel) {
		noticeModel.setViewName("static/home/inauguration");
		return noticeModel;
	}
	// =============================
	
	
} // class

