package com.carrental.sm.ws.impl;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.log4j.Logger;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.bean.Tracker;

/**
 * @author 张霄鹏
 * 
 */
public class JitianService {

	private Logger logger = Logger.getLogger(getClass());

	public String fetchGps() {
		String result = "";
		JSONObject jsonObject = new JSONObject();
		Admin admin = new Admin();
		admin.setIsDelete("0");
		admin.setInBlacklist("0");
		jsonObject.put("admin", admin);

		Properties prop = System.getProperties();
		try {
			prop.load(getClass().getResourceAsStream("/webservice.properties"));
		} catch (IOException e) {
			logger.error(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		if (null != prop.getProperty("jitian.fetchGps.wsUrl")) {
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
			String wsUrl = prop.getProperty("jitian.fetchGps.wsUrl");
			String method = prop.getProperty("jitian.fetchGps.method");
			Client client = dcf.createClient(wsUrl);
			Object[] res = null;
			try {
				res = client.invoke(method, jsonObject.toString());// 调用webservice，cxf客户端调用webservice就是这么简单
				JSONObject resObject = JSONObject.fromObject(res[0]);
				result = resObject.getString("result");
				if (Constants.OPERATION_SUCCESS.equals(result)) {
					List<JSONObject> admins = (List<JSONObject>) resObject.get("admins");
					for (JSONObject a : admins) {
						result += a.getString("adminName");
					}
				}
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		// END SNIPPET: client
		return result;
	}

	public JSONObject fetchGps(Tracker tracker) {
		JSONObject result = null;
		JSONObject jsonObject = new JSONObject();

		if (null == tracker || StringUtils.isEmpty(tracker.getCarNumber())) {
			result = new JSONObject();
			result.put("result", "请输入要查询车辆的车牌号码");
			return result;
		} else if (null == tracker.getQueryStartDt()) {
			result = new JSONObject();
			result.put("result", "请输入查询的开始时间");
			return result;
		} else if (null == tracker.getQueryEndDt()) {
			result = new JSONObject();
			result.put("result", "请输入查询的结束时间");
			return result;
		}

		jsonObject.put("withDt", "");
		jsonObject.put("carNumber", tracker.getCarNumber());
		jsonObject.put("queryStartDt", DateUtil.formatDate(tracker.getQueryStartDt(), "yyyy-MM-dd HH:mm"));
		jsonObject.put("queryEndDt", DateUtil.formatDate(tracker.getQueryEndDt(), "yyyy-MM-dd HH:mm"));

		Properties prop = System.getProperties();
		try {
			prop.load(getClass().getResourceAsStream("/webservice.properties"));
		} catch (IOException e) {
			logger.error(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		if (null != prop.getProperty("jitian.fetchGps.wsUrl")) {
			String wsUrl = prop.getProperty("jitian.fetchGps.wsUrl");
			String method = prop.getProperty("jitian.fetchGps.method");
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
//			String wsUrl = "http://58.214.240.29:82/jitian/ws/fetchGpsService?wsdl";
//			String method = "findByPlateNumAndDate";
			Client client = dcf.createClient(wsUrl);
			Object[] res = null;
			try {
				res = client.invoke(method, jsonObject.toString());// 调用webservice，cxf客户端调用webservice就是这么简单
				result = JSONObject.fromObject(res[0]);
			} catch (Exception e) {
				logger.error(e);
				result.put("result", "通信失败，请稍后再试");
			}
		}
		// END SNIPPET: client
		return result;
	}
}
