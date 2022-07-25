package com.cmsManagement.dao;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.cmsManagement.model.Notices;
import com.cmsManagement.util.Constants;

@Repository
public class DownloadDaoImpl extends AbstractDao<Serializable, Notices> implements DownloadDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getDownloadList() {
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='DOWNLOAD' ORDER BY created_date DESC").list();
	}

	@Override
	public int saveDownload(Notices downloads) {
		return (int) getSession().save(downloads);
	}


	@Override
	public boolean updateDownload(Notices downloads) {
		try{
			getSession().update(downloads);
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notices> getDownloadListByStatus(String downloadStatus) {
		
		if(downloadStatus.equals("All"))
		{
			return (List<Notices>) getSession().createQuery("from Notices where state='A' and category='DOWNLOAD' ORDER BY created_date DESC").list();

		}
		
			

	
		return (List<Notices>) getSession().createQuery("from Notices where state='A' and publishStatus='"+downloadStatus+"' and category='DOWNLOAD' ORDER BY created_date DESC").list();
		/*Criteria criteria=getSession().createCriteria(Notices.class);
				criteria.add(Restrictions.eq("category", Constants.DOWNLOAD_CATEGORY));
				criteria.add(Restrictions.eq("state", Constants.ACTIVE_STATE));
			if(downloadStatus.equals(Constants.REPORT_TYPE_ALL)){
				
			}else{
				criteria.add(Restrictions.eq("publishStatus", downloadStatus));
			}
		return criteria.list();*/
	}

}
