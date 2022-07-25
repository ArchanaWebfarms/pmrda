/**
 *
 */
package com.cmsManagement.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.dao.NewsDao;
import com.cmsManagement.model.LeadershipCoreTeam;
import com.cmsManagement.service.AttachmentService;
import com.cmsManagement.service.ComplaintService;
import com.cmsManagement.service.DepartmentService;
import com.cmsManagement.service.DownloadService;
import com.cmsManagement.service.FeedBackService;
import com.cmsManagement.service.FinancialYearService;
import com.cmsManagement.service.LeadershipCoreTeamService;
import com.cmsManagement.service.LogDaoService;
import com.cmsManagement.service.MetaService;
import com.cmsManagement.service.NewsService;
import com.cmsManagement.service.NoticesService;
import com.cmsManagement.service.OrderService;
import com.cmsManagement.service.RoleService;
import com.cmsManagement.service.TenderService;
import com.cmsManagement.service.TendorDepartmentService;
import com.cmsManagement.service.UserService;
import com.cmsManagement.service.currentOpeningService;
import com.cmsManagement.service.projectService;


/**
 * @author ujwala_gawari
 *
 */
public class AbstractControllerHelper {
	@Autowired
	public FinancialYearDao financialYearDao;
	@Autowired
	public NewsService newsservice;
	@Autowired
	public NewsDao newsdao;
	@Autowired
	public AttachmentService attachmentservice;
	
	@Autowired
	public LogDaoService logindaoservice;
	@Autowired
	public DownloadService downloadService;
	
	@Autowired
	public TenderService tenderService;

	@Autowired
	public NoticesService noticesService;
	
	@Autowired
	public DepartmentService departmentService;
	
	@Autowired
	public OrderService orderService;
	
	@Autowired
	public RoleService roleService;
	
	@Autowired
	public FinancialYearService financialYearService;
	
	@Autowired
	public FeedBackService feedBackService;
	
	@Autowired
	public ComplaintService complaintService;
	
	@Autowired
	public JavaMailSender mailSenderObj;
	
	@Autowired
	public TendorDepartmentService tendorDepartmentService;
	
	@Autowired
	public UserService userService;
	
	@Autowired
	public MetaService metaservice;
	
	@Autowired
	public projectService projectService;
	
	@Autowired
	public currentOpeningService currentOpening;
	
	@Autowired
	public LeadershipCoreTeamService leadershipCoreTeamService;
}
