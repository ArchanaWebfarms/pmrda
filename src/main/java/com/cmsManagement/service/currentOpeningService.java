package com.cmsManagement.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.CurrentOpening;

public interface currentOpeningService {

	List<CurrentOpening> getAllOpening();

	void saveOpening(CurrentOpening opening, String path, MultipartFile english, MultipartFile marathi, String title, String mtitle);

	CurrentOpening getOpeningById(int id);

	void editOpening(CurrentOpening opening, String path,MultipartFile english, MultipartFile marathi, String title,String mtitle);

	void closeOpening(int id);

	void deleteOpening(int id);

	List<CurrentOpening> getAllActiveOpening();

	void changeAdminOpeningStatus(String approvedStatus, String comment, int id);

	List<CurrentOpening> getAllActiveCurrentOpening();

	List<CurrentOpening> getAllApprovedOpening(String status);

	void deleteOpeningStatus(String approvedStatus, String comment, int id);

	void deletePendingOpening(int id);

	List<CurrentOpening> getOpeningByCreationStatus(String status);

}
