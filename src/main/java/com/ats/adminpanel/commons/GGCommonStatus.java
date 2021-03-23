package com.ats.adminpanel.commons;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.ats.adminpanel.model.setting.NewSetting;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GGCommonStatus {

	public List<GgStatuses> getStatusByIsGrn(int isGrn)// 0 for gvn 1 for GRN

	{
		RestTemplate restTemplate = new RestTemplate();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map = new LinkedMultiValueMap<String, Object>();
		if (isGrn == 1) {
			map.add("settingKey", "GRN_STATUS_JSON");
		} else {
			map.add("settingKey", "GVN_STATUS_JSON");
		}
		map.add("delStatus", 0);
		NewSetting gvnStatusValues = restTemplate.postForObject(Constants.url + "getNewSettingByKey", map,
				NewSetting.class);
		String json = gvnStatusValues.getExVarchar1();

		ObjectMapper objectMapper = new ObjectMapper();

		GgStatuses[] statusArray = null;

		try {
			statusArray = objectMapper.readValue(json, GgStatuses[].class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		List<GgStatuses> statusList = Arrays.asList(statusArray);

		return statusList;

	}

}
