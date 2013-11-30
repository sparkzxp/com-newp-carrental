package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.common.bean.Pager;

/**
 * 租用车型管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IRentTypeService {

	/**
	 * 查询租用车型信息
	 */
	List<RentType> queryList(RentType rentType, Pager pager);

	/**
	 * 根据业务类型查询租用车型信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentType>
	 */
	List<RentType> queryByBusinessType(String businessType);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(RentType rentType, String carSeriesIds, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String update(RentType rentType, String carSeriesIds, Admin loginUser);

	/**
	 * 批量删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String delete(String ids, String names, Admin loginUser);
}
