package com.cmsManagement.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.DemoDepatment;
import com.cmsManagement.model.DepartmantOffice;
import com.cmsManagement.model.Department;
import com.cmsManagement.model.DepartmentOfficeContact;
import com.cmsManagement.model.Taluka;
import com.cmsManagement.model.WorkStatus;
import com.cmsManagement.util.Constants;

@Transactional
@Repository
public class DepartmentDaoImpl extends AbstractDao<Integer, Department> implements DepartmentDao {


	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartment() {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("state", "A"))
		.add(Restrictions.eq("create_approval_status", "Approved"))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.asc("deptId"));
		return criteria.list();
	}

	@Override
	public boolean updateDepartment(Department department) {		
		
		try{
			//getSession().createQuery("update Department set dept_name_h = '"+department.getDepartmentName_h()+"', dept_name = '"+department.getDepartmentName()+"', description =  '"+department.getDescription()+"' , MODIFIED_BY =  '"+department.getUpdated_by()+"',MODIFIED_ON = '"+department.getUpdated_date()+"' where id = :id").setInteger( "id", id).executeUpdate();
			getSession().merge(department);	
			System.err.println("department :"+department.toString());
			getSession().update(department);
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Department getDepartmentById(int deptId) {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("deptId", deptId));
		return (Department) criteria.uniqueResult();
	}

	@Override
	public int saveDepartmentRegistration(Department department) {
		return (int) getSession().save(department);
	}

	@Override
	public Department checkDepartment(String departmentName) {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("departmentName", departmentName));
		return (Department) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Taluka> getAllVillages() {
		return getSession().createQuery("from Taluka where status =  'A'  order by id desc").list();
	}

	@Override
	public void saveTaluka(Taluka taluka) {
		getSession().save(taluka);
	}

	@Override
	public Taluka getTalukaById(int id) {
		Criteria criteria=getSession().createCriteria(Taluka.class);
		criteria.add(Restrictions.eq("id", id));
		return (Taluka) criteria.uniqueResult();
	}

	@Override
	public void updateTaluka(Taluka info) {
		getSession().update(info);
	}

	@Override
	public void deleteTaluka(int id) {
		getSession().createQuery("update Taluka set status =  'D'  where id="+id+"").executeUpdate();
	}

	@Override
	public List<Taluka> getAllVillageList() {
		Criteria criteria=getSession().createCriteria(Taluka.class);
		criteria.add(Restrictions.eq("status", "A"));
		return (List<Taluka>) criteria.list();
	}

	@Override
	public List<Department> getActiveDepartment() {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("state", "A"))
		.add(Restrictions.eq("delete_approval_status", "Active"))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("deptId"));
		return criteria.list();
	}

	@Override
	public List<DepartmantOffice> getActiveOffice() {
		Criteria criteria=getSession().createCriteria(DepartmantOffice.class);
		criteria.add(Restrictions.eq("state", "A"));
		/*.addOrder(Order.desc("id"));*/
		return criteria.list();
	}

	@Override
	public void saveDepartmentContact(DepartmentOfficeContact contact) {
		getSession().save(contact);
		
	}

	@Override
	public List<DepartmentOfficeContact> getOfficeContactList(int deptId) {
		Criteria criteria=getSession().createCriteria(DepartmentOfficeContact.class);
		criteria.add(Restrictions.eq("state", "A"))
		.add(Restrictions.eq("department.deptId", deptId))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("id"));
		return criteria.list();
	}

	@Override
	public List<Department> getAllDepartment() {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("state", "A"))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("deptId"));
		return criteria.list();
	}

	@Override
	public List<Department> getDepartmentByDeletionStatus(String status) {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("delete_approval_status", status))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("deptId"));
		return criteria.list();
	}

	@Override
	public List<Department> getDepartmentByCreationStatus(String status) {
		Criteria criteria=getSession().createCriteria(Department.class);
		criteria.add(Restrictions.eq("state", "A"))
		.add(Restrictions.eq("create_approval_status", status))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("deptId"));
		return criteria.list();
	}

	@Override
	public DepartmentOfficeContact getDeptOfficeContactById(int id) {
		Criteria criteria=getSession().createCriteria(DepartmentOfficeContact.class);
		criteria.add(Restrictions.eq("id", id));
		return (DepartmentOfficeContact) criteria.uniqueResult();
	}

	@Override
	public void updateDepartmentOfficeContact(DepartmentOfficeContact officeContact) {
		getSession().update(officeContact);
	}

	@Override
	public void deleteDepartmentOfficeContact(int id) {
		getSession().createQuery("delete from DepartmentOfficeContact where id="+id+"").executeUpdate();
	}

	@Override
	public void saveDemoDepartment(DemoDepatment departments) {
		getSession().save(departments);
	}

	@Override
	public List<DemoDepatment> getDemoDepartment() {
		Criteria criteria=getSession().createCriteria(DemoDepatment.class);		
		return criteria.list();
	}

	@Override
	public DemoDepatment getDemoDepartment(int deptId) {
		Criteria criteria=getSession().createCriteria(DemoDepatment.class);
		criteria.add(Restrictions.eq("id", deptId));
		return (DemoDepatment) criteria.uniqueResult();
	}

	@Override
	public void saveWorkStatus(WorkStatus work) {
		getSession().save(work);
	}

	@Override
	public List<WorkStatus> getWorkList() {
		Criteria criteria=getSession().createCriteria(WorkStatus.class);		
		return criteria.list();
	}

	@Override
	public WorkStatus getLastRecord() {
		/*Criteria criteria=getSession().createCriteria(WorkStatus.class);
		criteria.add(Restrictions.eq("id", id));
		return (WorkStatus) criteria.uniqueResult();
		*/
		
		String query2="from WorkStatus order by id desc ";
		Query query3=getSession().createQuery(query2);
		query3.setMaxResults(1);
		return (WorkStatus) query3.uniqueResult();
	}



}
