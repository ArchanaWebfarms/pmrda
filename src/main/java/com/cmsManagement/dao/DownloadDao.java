package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.Notices;

public interface DownloadDao {

	List<Notices> getDownloadList();

	int saveDownload(Notices downloads);

	boolean updateDownload(Notices downloads);

	List<Notices> getDownloadListByStatus(String downloadStatus);

}
