package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.CurrentOpening;

public interface currentOpeningDao {

	List<CurrentOpening> getAllOpening();

	void saveOpening(CurrentOpening opening);

	CurrentOpening getOpeningById(int id);

	void editOpening(CurrentOpening opening);

	void closeOpening(int id);

	void deleteOpening(int id);

	List<CurrentOpening> getAllActiveOpening();

	List<CurrentOpening> getAllActiveCurrentOpening();

	List<CurrentOpening> getAllApprovedOpening(String status);

	void deletePendingOpening(int id);

	List<CurrentOpening> getOpeningByCreationStatus(String status);

}
