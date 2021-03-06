package com.ssbusy.controller.carbarn;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssbusy.carbarn.form.CarbarnForm;
import com.ssbusy.core.carbarn.domain.Carbarn;
import com.ssbusy.core.carbarn.service.CarbarnService;

/**
 * 
 * @author song
 * 
 */
@Controller
public class CarbarnController {

	@Value("${carbarnSize}")
	private int pageSize;
	@Resource(name = "carbarnService")
	protected CarbarnService carbarnService;

	@Value("${radius}")
	protected Double radius;
	

	/**
	 * 
	 * @param latitude
	 * @param longitude
	 * @param pageShow
	 * @param sortBy
	 * @return
	 */
	@RequestMapping(value = "/v1/carbarn/latitude-longitude", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String readCarbarnsByLatitudeAndLongitude_v1(
			@RequestParam("latitude") Double latitude,
			@RequestParam("longitude") Double longitude,
			@RequestParam(value = "page_show", required = false) Integer pageShow,
			@RequestParam(value = "sortBy", required = false) String sortBy,
			@RequestParam(value = "carbarn_name", required = false) String carbarn_name){
		List<Carbarn> carbarns = null;
		// 没有传入车库名根据经纬度查询,否则根据name检索
		if (carbarn_name == null){
		carbarns = carbarnService
				.readCarbarnByLatitudeAndLongitude(latitude, longitude, sortBy,
						radius);
		}else {
			String name = "";
			try {
				name = new String(carbarn_name.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			carbarns = carbarnService.
					readCarbarnByNameAndLocation(name, latitude, longitude, sortBy, radius); // 根据车库名得到车库，车库有经纬度算出距离，反之
		}
		List<Carbarn> returnCarbarns = null;
		returnCarbarns = showPage(pageShow, carbarns);
		CarbarnForm carbarnForm = null;
		if (returnCarbarns.isEmpty() || returnCarbarns == null) {
			carbarnForm = new CarbarnForm(400, "没有对应的数据", returnCarbarns);
		} else {
			carbarnForm = new CarbarnForm(0, "调用接口成功", returnCarbarns);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "carbarn" });
		JSONObject jsonObject = JSONObject.fromObject(carbarnForm, jsonConfig);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/v1/carbarn/name-latitude-longitude", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String readCarbarnsByNameAndLocation(
			@RequestParam("carbarn_name") String carbarn_name,
			@RequestParam("latitude") Double latitude,
			@RequestParam("longitude") Double longitude,
			@RequestParam(value = "page_show", required = false) Integer pageShow,
			@RequestParam(value = "sortBy", required = false) String sortBy
			){
		System.out.println(carbarn_name);
		String name = "";
		try {
			name = new String(carbarn_name.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(name);
		List<Carbarn> carbarns = carbarnService.
				readCarbarnByNameAndLocation(name, latitude, longitude, sortBy, radius); // 根据车库名得到车库，车库有经纬度算出距离，反之
		List<Carbarn> returnCarbarns = null;
		returnCarbarns = showPage(pageShow, carbarns);
		CarbarnForm carbarnForm = null;
		if (returnCarbarns.isEmpty() || returnCarbarns == null){
			carbarnForm = new CarbarnForm(400, "没有对应数据", returnCarbarns);
		}else{
			carbarnForm = new CarbarnForm(0, "调用成功", returnCarbarns);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[]{ "carbarn"});
		JSONObject jsonObject = JSONObject.fromObject(carbarnForm, jsonConfig);
		return jsonObject.toString();
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @param quantity
	 * @return
	 */
	@RequestMapping(value = "/v1/carbarn/update/{carparkid}", produces = { "application/json;charset=UTF-8" },method = RequestMethod.PUT)
	@ResponseBody
	public String updateCarbarnById(HttpServletRequest request,
			HttpServletResponse response,@PathVariable("carparkid") Long id) {
		Integer quantity = null;
		Carbarn carbarn = carbarnService.readCarbarnById(id);
		BufferedReader bufferReader;
		StringBuffer buffer = new StringBuffer();
		try {
			bufferReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
			String s = "";
			while((s = bufferReader.readLine()) != null) {
				buffer.append(s);
			}
			bufferReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONObject paramJson = null;
		paramJson = JSONObject.fromObject(buffer.toString());
		try {
			quantity = paramJson.getInt("EmptyParkSpaces");
		} catch (Exception e) {
			quantity = 0;
		}
		Map<String, Object> returnMap = new HashMap<String, Object>(2);
		if (carbarn == null || quantity == null) {
			returnMap.put("status", 400);
			returnMap.put("message", "没有找到对应的出库数据");
		} else {
			if (quantity < 0) {
				returnMap.put("status", 401);
				returnMap.put("message", "剩余车位数量必须为正数");
			} else {
				carbarn.setLast(quantity);
				carbarn = carbarnService.updateCarbarn(carbarn);
				if (carbarn.getLast() != null
						&& carbarn.getLast() == quantity) {
					returnMap.put("status", 0);
					returnMap.put("message", "更新成功");
				} else {
					returnMap.put("status", 402);
					returnMap.put("message", "更新失败");
				}
			}
		}
		JSONObject jsonObject = JSONObject.fromObject(returnMap);
		return jsonObject.toString();
	}
	protected int getPageCount(int size) {
		return (size / (pageSize + 1)) + 1;
	}

	/**
	 * @author jin
	 * @param id
	 * @return 根据id返回车库信息
	 */
	@RequestMapping(value = "/v1/carbarn/get/{id}", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String getCarbranById(@PathVariable("id") Long id) {
		Carbarn carbran = carbarnService.readCarbarnById(id);
		Map<String, Object> returnMap = new HashMap<String, Object>(2);
		if (carbran == null) {
			returnMap.put("status", 400);
			returnMap.put("message", "没有相对应的数据");
		} else {
			returnMap.put("status", 0);
			returnMap.put("message", "请求成功");
			returnMap.put("data", carbran);
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "carbarn" });
		JSONObject jsonObject = JSONObject.fromObject(returnMap, jsonConfig);
		return jsonObject.toString();
	}

	/**
	 * 
	 * @param latitude
	 * @param longitude
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/v1/carbarn/notice-customer", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String readCarbarnByIdAndLatitude(
			@RequestParam("latitude") Double latitude,
			@RequestParam("longitude") Double longitude,
			@RequestParam(value = "id") Long id) {
		Map<String, Object> returnMap = carbarnService
				.readCarbarnByIdAndLatitude(latitude, longitude, id);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "carbarn" });
		JSONObject jsonObject = JSONObject.fromObject(returnMap, jsonConfig);
		return jsonObject.toString();
	}

	/**
	 * 
	 * @param pageShow
	 * @param carbarns
	 * @return
	 */
	private List<Carbarn> showPage(Integer pageShow, List<Carbarn> carbarns) {
		List<Carbarn> returnCarbarns;
		int pageCount = getPageCount(carbarns.size());
		if (pageShow == null || pageShow > pageCount) {
			pageShow = 1;
		}
		if (pageShow > 0 && pageShow < pageCount) {
			returnCarbarns = carbarns.subList((pageShow - 1) * pageSize,
					pageShow * pageSize);
		} else if (pageShow == pageCount) {
			returnCarbarns = carbarns.subList((pageShow - 1) * pageSize,
					carbarns.size());
		} else {
			returnCarbarns = carbarns;
		}
		return returnCarbarns;
	}
}
