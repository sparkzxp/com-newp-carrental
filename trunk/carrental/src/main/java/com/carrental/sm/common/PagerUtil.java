package com.carrental.sm.common;

import com.carrental.sm.common.bean.Pager;

/**
 * @author 张霄鹏
 */
public class PagerUtil {

	/**
	 * 设置Pager参数
	 * 
	 * @author 张霄鹏
	 */
	public static void setPager(Pager pager) {
		pager.setTotalPage((pager.getTotalSize() + pager.getPageSize() - 1) / pager.getPageSize());
		if (pager.getCurrentPage() < 1) {
			pager.setCurrentPage(1);
		}
		if (pager.getCurrentPage() > pager.getTotalPage()) {
			pager.setCurrentPage(pager.getTotalPage());
		}
		pager.setEndIndex(pager.getCurrentPage() * pager.getPageSize());
		pager.setStartIndex(pager.getEndIndex() - pager.getPageSize());
		if (pager.getEndIndex() > pager.getTotalSize()) {
			pager.setEndIndex(pager.getTotalSize());
		}
		if (pager.getStartIndex() < 0) {
			pager.setStartIndex(0);
		}
	}
}
