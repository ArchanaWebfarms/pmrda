package com.cmsManagement.dao;
import java.util.List;

import com.cmsManagement.model.FinancialYear;

/**
 * @author ujwala_gawari
 *
 */
public interface FinancialYearDao {

	boolean updateFinancialYear(FinancialYear financialYear);

	int saveFinancialYear(FinancialYear financialYear);

	List<FinancialYear> getFinancialYearList();

	FinancialYear getFinancialYear(int financialId);

	FinancialYear getCurrentActiveFinancialYear();

	FinancialYear checkUniqueFinacialYear(String financialYear);

	//void deleteFinancialYear(FinancialYear financialYear);

	//void saveChangedFYCurrentStatus(FinancialYear financialYear);

}
