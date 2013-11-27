package com.carrental.sm.ws.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.Constants;

/**
 * @author 张霄鹏
 * 
 */
public class JitianService {

	public String fetchGps() {
		String result = "";
		JSONObject jsonObject = new JSONObject();
		Admin admin = new Admin();
		admin.setIsDelete("0");
		admin.setInBlacklist("0");
		jsonObject.put("admin", admin);

		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		String wsUrl = "http://localhost:8080/jitian/ws/fetchGpsService?wsdl";
		String method = "findByPlateNumAndDate";
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
			e.printStackTrace();
		}
		// END SNIPPET: client
		return result;
	}
}
