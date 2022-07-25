package com.cmsManagement.service;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.FinancialYearDao;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;

/**
 * @author ujwala_gawari
 *
 */
@Service()
@Transactional
public class FinancialYearServiceImpl implements FinancialYearService{

	
	@Autowired
	FinancialYearDao financialYearDao;
	
	@Override
	public int saveFinancialYear(FinancialYear financialYear) {
		financialYear.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		financialYear.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		financialYear.setState(Constants.ACTIVE_STATE);
		financialYear.setCurrentStatus(Constants.NO_STATE);
		return financialYearDao.saveFinancialYear(financialYear);
	}

	@Override
	public boolean updateFinancialYear(FinancialYear financialYear) {
		 FinancialYear fy= financialYearDao.getFinancialYear(financialYear.getFinancialId());
		 fy.setDescription(financialYear.getDescription());
		 fy.setFinancialYear(financialYear.getFinancialYear());
		 fy.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		 fy.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		 return financialYearDao.updateFinancialYear(fy);
	}

	@Override
	public List<FinancialYear> getFinancialYearList() {
		return financialYearDao.getFinancialYearList();
	}

	@Override
	public FinancialYear getFinancialYear(int financialId) {
		return financialYearDao.getFinancialYear(financialId);
	}

	@Override
	public boolean deleteFinancialYear(int financialId) {
		FinancialYear financialYear= financialYearDao.getFinancialYear(financialId);
		financialYear.setState(Constants.DEACTIVE_STATE);
		return financialYearDao.updateFinancialYear(financialYear);
	}

	@Override
	public void saveChangedFYCurrentStatus(int financialId, String currentStatus) {
		FinancialYear financialYear= financialYearDao.getFinancialYear(financialId);
		financialYear.setCurrentStatus(currentStatus);
		financialYearDao.updateFinancialYear(financialYear);
	}

	@Override
	public boolean changeFYCurrentStatus(int financialId) {
		List<FinancialYear> list = financialYearDao.getFinancialYearList();
		for(int i=0; i<list.size(); i++){
			FinancialYear financialYear= financialYearDao.getFinancialYear(list.get(i).getFinancialId());
			financialYear.setCurrentStatus(Constants.NO_STATE);
			financialYearDao.updateFinancialYear(financialYear);
		}
		FinancialYear financialYear= financialYearDao.getFinancialYear(financialId);
		financialYear.setCurrentStatus(Constants.YES_STATE);
		return financialYearDao.updateFinancialYear(financialYear);
	}

	@Override
	public FinancialYear checkUniqueFinacialYear(String financialYear) {
		return financialYearDao.checkUniqueFinacialYear(financialYear);
	}

	@Override
	public FinancialYear getCurrentActiveFinancialYear() {		
		return financialYearDao.getCurrentActiveFinancialYear();
	}
	
}
