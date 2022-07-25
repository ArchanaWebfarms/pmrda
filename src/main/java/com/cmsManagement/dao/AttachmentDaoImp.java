package com.cmsManagement.dao;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cmsManagement.model.Attachment;
import com.cmsManagement.model.Designation;
import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.FinancialYear;
import com.cmsManagement.model.GalaryCategory;
import com.cmsManagement.model.Video;
import com.cmsManagement.model.VisitorCounter;

@Repository()
public class AttachmentDaoImp extends AbstractDao<Integer, Attachment>
		implements AttachmentDao {

	@Override
	public List<Attachment> getAttachmentList() {
		// TODO Auto-generated method stub
		return (List<Attachment>) getSession().createQuery(
				"from Attachment where state = 'A' ").list();
	}

	@Override
	public int SaveGalaryCategory(GalaryCategory galarycategory) {
		// TODO Auto-generated method stub
		return (int) getSession().save(galarycategory);
	}

	@Override
	public List<GalaryCategory> getGalaryCategoryList() {
		// TODO Auto-generated method stub
		return (List<GalaryCategory>) getSession().createQuery(
				"from GalaryCategory").list();
	}

	@Override
	public void SaveAttachment(Attachment attachment) {
		//System.out.println("pppp===" + attachment.toString());

		getSession().save(attachment);

	}

	@Override
	public void SaveAttachmentNew(List<MultipartFile> file, int galary_cate_id,
			String path) {
		Attachment attachment = new Attachment();
		getSession().save(attachment);

	}

	@Override
	public List<Attachment> getAttachmentListByGalaryCateID(int galary_cate_id) {
		// TODO Auto-generated method stub
		return (List<Attachment>) getSession().createQuery(
				"from Attachment where galary_cate_id = '" + galary_cate_id
						+ "'  ").list();
	}

	@Override
	public GalaryCategory viewImages(int id) {
		GalaryCategory galarycategory = new GalaryCategory();
		// TODO Auto-generated method stub
		galarycategory = (GalaryCategory) getSession().createQuery(
				"from GalaryCategory where  id = '" + id + "'  ")
				.uniqueResult();

		return galarycategory;

	}

	@Override
	public void deleteAttachmentByGalaryCateID(int galary_cate_id) {
		Query q = getSession().createQuery(
				"delete Attachment where id = '" + galary_cate_id
						+ "'");
		q.executeUpdate();
	}

	@Override
	public void deleteGalaryCateID(int galary_cate_id) {
		Query q = getSession().createQuery(
				"delete GalaryCategory where id = '"
						+ galary_cate_id + "'");
		q.executeUpdate();

	}

	@Override
	public GalaryCategory getGalaryCateByID(int galary_cate_id) {
		// Query q =
		// getSession().createQuery("from  GalaryCategory where galary_cate_id = '"+galary_cate_id+"'");
		// q.executeUpdate();
		return (GalaryCategory) getSession().createQuery(
				"from  GalaryCategory where id = '"
						+ galary_cate_id + "'");

	}

	@Override
	public List<GalaryCategory> getGalaryCategoryListByFinancialID(
			int financialYear) {

		// TODO Auto-generated method stub
		return (List<GalaryCategory>) getSession().createQuery(
				"from GalaryCategory where financialYear = '" + financialYear
						+ "' ").list();
	}

	@Override
	public int SaveAttachment(List<Attachment> list) {
		int x = 0;
		System.out.println("XXX===" + list.toString());
		for (int i = 0; i < list.size(); i++) {
			Attachment t = new Attachment();

		}

		return x;
	}

	@Override
	public List<Attachment> getAttachmentByModuleID(int module_id,String category) {
		return (List<Attachment>) getSession().createQuery(
				"from Attachment where module_id = '" + module_id
						+ "' and state = 'A' and category='"+category+"'").list();
	}

	@Override
	public void saveattachment(String path, MultipartFile attachment) {
		Attachment attachment2 = new Attachment();

	}

	@Override
	public boolean deleteAttachmentByID(int attachment_id) {
		System.out.println(attachment_id);
		try {
			getSession()
					.createQuery(
							"update  Attachment set state = 'D'  where attachment_id =  :attachment_id")
					.setInteger("attachment_id", attachment_id).executeUpdate();
			return true;

		} catch (Exception exception) {
			return false;
		}

		/*
		 * try {
		 * getSession().createQuery("delete from Attachment where attachment_id = '"
		 * +id+"' ")
		 * 
		 * .setInteger( "attachment_id", id) .executeUpdate(); return true;
		 * 
		 * } catch (Exception exception) { return false; }
		 */

	}

	@Override
	public void UpdateAttachmentByID(Attachment attachmentobj, int id) {
		System.out.println("moduleID==" + attachmentobj.toString());
		System.out.println("moduleID==" + id);
		// getSession().createQuery("update Attachment set state = '"+attachmentobj.getState()+"', module_type = '"+attachmentobj.getModule_type()+"',attachment_name='"+attachmentobj.getAttachmnt_name()+"',path='"+attachmentobj.getPath()+"',FinancialYear='"+attachmentobj.getFinancialYear()+"' where module_id =  '"+id+"'")

		getSession().createQuery(
				"update Attachment set state = '" + attachmentobj.getState()
						+ "', module_type = '" + attachmentobj.getModule_type()
						+ "' ,attachment_name='"
						+ attachmentobj.getAttachmnt_name()
						+ "' where module_id =  '" + id + "' and state='D'")

		.executeUpdate();

	}

	@Override
	public List<Attachment> getAttachmentByModuleIDCheckForSize(int module_id) {
		return (List<Attachment>) getSession().createQuery(
				"from Attachment where module_id = '" + module_id + "'  ")
				.list();

	}

	@Override
	public int SaveAttachment1(Attachment attachment) {
		// TODO Auto-generated method stub
		return (int) getSession().save(attachment);
	}

	@Override
	public Attachment getAttachmentByModule_ID(int module_id, String category) {
		
		return (Attachment) getSession().createQuery("from Attachment where module_id = '" + module_id+ "' and state = 'A' and category='"+category+"'");
	
	}

	@Override
	public EntryLogModel getEntryLogById(int id) {		
		return (EntryLogModel) getSession().createQuery("from EntryLogModel where id = " + id+ " and status = 'A'");		
	}

	@Override
	public void deleteAttachment(int id) {
		getSession().createQuery("delete from Attachment where attachment_id="+id+"").executeUpdate();
		
	}

	@Override
	public List<Attachment> getAttachmentByModuleType(String type) {
		return (List<Attachment>) getSession().createQuery("from Attachment where state = 'A' and category='"+type+"' order by attachmentID desc").list();

	}

	@Override
	public VisitorCounter getCurrentDate(String date) {
		return (VisitorCounter) getSession().createQuery("from VisitorCounter where date='"+date+"'").uniqueResult();

	}

	@Override
	public List<VisitorCounter> getVisiorList() {
		return (List<VisitorCounter>) getSession().createQuery("from VisitorCounter").list();

	}

	@Override
	public void saveVisitorCount(VisitorCounter counter) {
		getSession().save(counter);
	}

	@Override
	public void updateVisitorCount(VisitorCounter visitor) {
		getSession().update(visitor);
	}

	@Override
	public void saveVideo(Video video) {
		getSession().save(video);
	}

	@Override
	public void deleteVideo(int id) {
		getSession()
		.createQuery("update  Video set state = 'D'  where id =  :id").setInteger("id", id).executeUpdate();
	}

	@Override
	public List<Video> getAllVideo() {
		return (List<Video>) getSession().createQuery("from Video where state='A' order by id desc ").list();
	}

	@Override
	public Video getVideoById(int id) {
		return (Video) getSession().createQuery("from Video where id="+id+"").uniqueResult();
	}

	@Override
	public void editVideo(Video video) {
		//getSession().createQuery("update Video set title = '"+title+"' and title_h='"+titleh+"' and link='"+path+"' where id =  :id").setInteger("id", id).executeUpdate();
			getSession().update(video);
	}

	@Override
	public void deleteAttachmentByCategory(String category) {
		getSession().createQuery("delete from Attachment where category='"+category+"'").executeUpdate();
	}

	@Override
	public Attachment getAttachmentById(int id) {
		return (Attachment) getSession().createQuery("from Attachment where attachmentID = "+id+" ").uniqueResult();
	}

	@Override
	public void deleteTodayEntry(int id) {
		getSession().createQuery("delete from VisitorCounter where id="+id).executeUpdate();
	}

	@Override
	public VisitorCounter getLastCounter(String today) {
		//return (VisitorCounter) getSession().createQuery("from VisitorCounter where date='"+today+"' order by id desc").uniqueResult();
		Query query = getSession().createQuery("from VisitorCounter where date='"+today+"' order by id desc");
		query.setMaxResults(1);
		VisitorCounter last = (VisitorCounter) query.uniqueResult();
		return last;
	}


}


