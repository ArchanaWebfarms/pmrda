package com.cmsManagement.service;

/**
 * @author ujwala_gawari
 *
 */
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.util.Constants;

public interface FinancialYearService {

	/**
	 * Adds a new FinancialYear and return inserted ID
	 * @param financialYear
	 */
	int saveFinancialYear(FinancialYear financialYear);

	/**
	 * update FinancialYear and return boolean value 
	 * @param financialYear
	 */
	boolean updateFinancialYear(FinancialYear financialYear);

	/**
	 * returns list of all the Financial Year available.
	 * @return
	 */
	List<FinancialYear> getFinancialYearList();

	/**
	 * returns the FinancialYear with a specific id.
	 * @param financialId
	 * @return
	 */
	FinancialYear getFinancialYear(int financialId);

	/**
	 * Deactivate Financial Year with a specific id.
	 * @param financialId
	 */
	boolean deleteFinancialYear(int financialId);

	/**
	 * update FinancialYear status 
	 * @param financialYear
	 */
	void saveChangedFYCurrentStatus(int financialId, String currentStatus);

	boolean changeFYCurrentStatus(int financialId);

	/**
	 * returns the FinancialYear if selected financial year at UI matches with existing years.
	 * @param financialYear
	 * @return
	 */
	FinancialYear checkUniqueFinacialYear(String financialYear);
	
	
	
	
	public FinancialYear getCurrentActiveFinancialYear() ;
}
