package com.cmsManagement.dao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;
import com.cmsManagement.dto.Rights;
import com.cmsManagement.model.RightsDto;

@Repository()
public class RightsDaoImpl extends AbstractDao<Integer, RightsDto> implements RightsDao {

	@Override
	public void saveRights(Rights rights) {
		//persist(rights);
		getSession().persist(rights);
	}

	@Override
	public List<Rights> findAllRights() {
		Criteria crit = createEntityCriteria();
		//crit.setProjection(Projections.property("fileName"));		
		crit.addOrder(Order.asc("right_type"));
		return (List<Rights>)crit.list();
	}

	@Override
	public RightsDto findRightsById(int id) {
		return getByKey(id);
	}

	@Override
	public void deleteRight(int rightId) {
		Rights right = (Rights) getSession().load(Rights.class, rightId);
		if (null != right) {
			this.getSession().delete(right);
		}
		
	}

	@Override
	public Rights updateRights(Rights rights) {
		getSession().update(rights);
		return rights;
	}

}
