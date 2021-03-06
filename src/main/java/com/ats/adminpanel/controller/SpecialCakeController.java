package com.ats.adminpanel.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.commons.AccessControll;
import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.commons.VpsImageUpload;
import com.ats.adminpanel.model.AllEventListResponse;
import com.ats.adminpanel.model.SpecialCake;
import com.ats.adminpanel.model.Event;
import com.ats.adminpanel.model.EventNameId;
import com.ats.adminpanel.model.ExportToExcel;
import com.ats.adminpanel.model.FlavourList;
import com.ats.adminpanel.model.GetSpCakeExlPdf;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.Shape;
import com.ats.adminpanel.model.SpCake;
import com.ats.adminpanel.model.SpCakeResponse;
import com.ats.adminpanel.model.SpCakeSupplement;
import com.ats.adminpanel.model.RawMaterial.RawMaterialUom;
import com.ats.adminpanel.model.accessright.ModuleJson;
import com.ats.adminpanel.model.flavours.AllFlavoursListResponse;
import com.ats.adminpanel.model.flavours.Flavour;
import com.ats.adminpanel.model.franchisee.Menu;
import com.ats.adminpanel.model.masters.AllRatesResponse;
import com.ats.adminpanel.model.masters.GetSpCkSupplement;
import com.ats.adminpanel.model.masters.Rate;
import com.ats.adminpanel.model.mastexcel.SpCakeList;
import com.ats.adminpanel.model.spprod.CakeType;


@Controller
public class SpecialCakeController {
	private static final Logger logger = LoggerFactory.getLogger(SpecialCakeController.class);

	List<Event> eventList = new ArrayList<Event>();

	@RequestMapping(value = "/findEventList", method = RequestMethod.GET)
	public @ResponseBody List<Event> findEventList() {
		try {
			RestTemplate restTemplate = new RestTemplate();

			AllEventListResponse allEventListResponse = restTemplate.getForObject(Constants.url + "showEventList",
					AllEventListResponse.class);

			eventList = allEventListResponse.getEvent();
			System.out.println("Event List" + eventList.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return eventList;
	}

	@RequestMapping(value = "/addSpCake", method = RequestMethod.GET)
	public ModelAndView redirectToAddSpCake(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("addSpCake", "addSpCake", "1", "0", "0", "0", newModuleList);

		if (view.getError() == true) {

			model = new ModelAndView("accessDenied");

		} else {

			model = new ModelAndView("spcake/addspcake");
			Constants.mainAct = 1;
			Constants.subAct = 6;
			RestTemplate restTemplate = new RestTemplate();
			try {

				Integer maxSpId = restTemplate.getForObject(Constants.url + "getUniqueSpCode", Integer.class);

				int maxSpIdLenth = String.valueOf(maxSpId).length();
				maxSpIdLenth = 5 - maxSpIdLenth;
				StringBuilder spCode = new StringBuilder("SP");

				for (int i = 0; i < maxSpIdLenth; i++) {
					String j = "0";
					spCode.append(j);
				}
				spCode.append(String.valueOf(maxSpId));
				model.addObject("spCode", spCode);

				AllEventListResponse allEventListResponse = restTemplate.getForObject(Constants.url + "showEventList",
						AllEventListResponse.class);

				eventList = allEventListResponse.getEvent();
				System.out.println("Event List" + eventList.toString());
				model.addObject("eventList", eventList);

				// for rate
				AllRatesResponse allRatesResponse = restTemplate.getForObject(Constants.url + "getAllRates",
						AllRatesResponse.class);

				List<Rate> rateList = new ArrayList<Rate>();
				rateList = allRatesResponse.getRates();
				System.out.println("Rate List" + rateList.toString());
				// model.addObject("rateList", rateList);
				List<RawMaterialUom> rawMaterialUomList = restTemplate
						.getForObject(Constants.url + "rawMaterial/getRmUom", List.class);
				model.addObject("rmUomList", rawMaterialUomList);
				
				AllFlavoursListResponse allFlavoursListResponse = restTemplate
						.getForObject(Constants.url + "showFlavourList", AllFlavoursListResponse.class);
				List<Flavour> flavoursList = allFlavoursListResponse.getFlavour();
				model.addObject("flavoursList", flavoursList);
				
				CakeType[] ckTypeArr = restTemplate.getForObject(Constants.url + "showCakeTypeList", CakeType[].class);
				List<CakeType> cakeTypeList = new ArrayList<CakeType>(Arrays.asList(ckTypeArr));
				
				model.addObject("cakeTypeList", cakeTypeList);
				
				Shape[] AllShapeArr = restTemplate.getForObject(Constants.url + "/getAllChef",
						Shape[].class);
				List<Shape> shapeList = new ArrayList<Shape>(Arrays.asList(AllShapeArr));
				
				model.addObject("shapeList", shapeList);

			} catch (Exception e) {
				System.out.println("Error in event list display" + e.getMessage());
			}
		}
		return model;
	}

	List<SpecialCake> specialCakeList = new ArrayList<SpecialCake>();
	@RequestMapping(value = "/showSpecialCake", method = RequestMethod.GET)
	public ModelAndView redirectToSpCakeList(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("inside ViewSpCkeList");
		ModelAndView model = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("showSpecialCake", "showSpecialCake", "1", "0", "0", "0", newModuleList);
		
		

		if (view.getError() == true) {

			model = new ModelAndView("accessDenied");

		} else {
			model = new ModelAndView("spcake/spcakelist");
			Constants.mainAct = 1;
			Constants.subAct = 7;
			RestTemplate restTemplate = new RestTemplate();

			try {
				
				CakeType[] ckTypeArr = restTemplate.getForObject(Constants.url + "showCakeTypeList", CakeType[].class);
				List<CakeType> cakeTypeList = new ArrayList<CakeType>(Arrays.asList(ckTypeArr));
				
				model.addObject("cakeTypeList", cakeTypeList);
				
				
				
				SpCakeResponse spCakeResponse = restTemplate.getForObject(Constants.url + "showSpecialCakeList",
						SpCakeResponse.class);
				System.out.println("SpCake Controller SpCakeList Response " + spCakeResponse.toString());
				

				specialCakeList = spCakeResponse.getSpecialCake();
				System.out.println("my cake list");

				System.out.println("CakeList=" + specialCakeList.toString());
				System.out.println("--------------------");

				System.out.println("name=" + specialCakeList.get(0).getSpName());
				System.out.println("type=" + specialCakeList.get(0).getSpType());

				model.addObject("specialCakeList", specialCakeList);// 1 object to be used in jsp 2 actual object
				//model.addObject("url", Constants.SPCAKE_IMAGE_URL);
				model.addObject("url", Constants.SPCAKE_IMAGE_URL);
				// exportToExcel

				SpCakeList spResponse = restTemplate.getForObject(Constants.url + "tally/getAllExcelSpCake",
						SpCakeList.class);

				List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

				ExportToExcel expoExcel = new ExportToExcel();
				List<String> rowData = new ArrayList<String>();

				rowData.add("Sr. No.");
				rowData.add("Id");
				rowData.add("Sp Code");
				rowData.add("Sp Name");
				rowData.add("Category");
				rowData.add("Group1");
				rowData.add("Group2");
				rowData.add("HsnCode");
				rowData.add("UOM");
				rowData.add("ErpLink");
				rowData.add("Rate1");
				rowData.add("Rate2");
				rowData.add("Rate3");
				rowData.add("Mrp1");
				rowData.add("Mrp2");
				rowData.add("Mrp3");
				rowData.add("Sgst %");
				rowData.add("Cgst %");
				rowData.add("Igst %");
				rowData.add("Cess %");

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);
				List<com.ats.adminpanel.model.mastexcel.SpecialCake> excelSpCake = spResponse.getSpecialCakeList();
				for (int i = 0; i < excelSpCake.size(); i++) {
					expoExcel = new ExportToExcel();
					rowData = new ArrayList<String>();
					rowData.add("" + (i + 1));
					rowData.add("" + excelSpCake.get(i).getId());
					rowData.add(excelSpCake.get(i).getSpCode());
					rowData.add(excelSpCake.get(i).getItemName());
					rowData.add(excelSpCake.get(i).getItemGroup());
					rowData.add(excelSpCake.get(i).getSubGroup());
					rowData.add(excelSpCake.get(i).getSubSubGroup());
					rowData.add(excelSpCake.get(i).getHsnCode());

					rowData.add(excelSpCake.get(i).getUom());
					rowData.add(excelSpCake.get(i).getErpLinkCode());
					rowData.add("" + excelSpCake.get(i).getSpRate1());
					rowData.add("" + excelSpCake.get(i).getSpRate2());
					rowData.add("" + excelSpCake.get(i).getSpRate3());
					rowData.add("" + excelSpCake.get(i).getMrpRate1());
					rowData.add("" + excelSpCake.get(i).getMrpRate2());
					rowData.add("" + excelSpCake.get(i).getMrpRate3());
					rowData.add("" + excelSpCake.get(i).getSgstPer());
					rowData.add("" + excelSpCake.get(i).getCgstPer());
					rowData.add("" + excelSpCake.get(i).getIgstPer());
					rowData.add("" + excelSpCake.get(i).getCessPer());

					expoExcel.setRowData(rowData);
					exportToExcelList.add(expoExcel);

				}

				session = request.getSession();
				session.setAttribute("exportExcelList", exportToExcelList);
				session.setAttribute("excelName", "spCakeList");

				List<ExportToExcel> exportExcelListDummy = new ArrayList<ExportToExcel>();

				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();

				rowData.add("Sp Code");
				rowData.add("Sp Name");
				rowData.add("Sp Type");
				rowData.add("Min. Weight");
				rowData.add("Max. Weight");
				rowData.add("Book before(days)");
				rowData.add("SGST %");
				rowData.add("CGST %");
				rowData.add("IGST %");
				rowData.add("ERP LINK CODE");
				rowData.add("is Used?(1/0)");
				rowData.add("Sp Photo Upload(1/0)");
				rowData.add("Is Time 2 Appli?");
				rowData.add("Base Code");
				rowData.add("Sp Description");
				rowData.add("Order Qty");
				rowData.add("Order Discount");
				rowData.add("Is Cust Choice Cake?(1,0)");
				rowData.add("Is Addon Rate Applicable?(1,0)");
				rowData.add("MRP1");
				rowData.add("MRP2");
				rowData.add("MRP3");
				rowData.add("Rate1");
				rowData.add("Rate2");
				rowData.add("Rate3");

				expoExcel.setRowData(rowData);
				exportExcelListDummy.add(expoExcel);

				session.setAttribute("exportExcelListDummy", exportExcelListDummy);
				session.setAttribute("excelName", "SpecialCakeExcelImportFormat");

			} catch (Exception e) {
				System.out.println("Show Sp Cake List Excep: " + e.getMessage());
			}
		}
		return model;
	}
	
	@RequestMapping(value="/getFilteredSp",method=RequestMethod.GET)
	public @ResponseBody List<SpecialCake> getFilteredSp(HttpServletRequest request){
		System.err.println("In /getFilteredSp");
		List<SpecialCake> cakeList=new ArrayList<>();
		try {
			Integer cakeType = Integer.parseInt(request.getParameter("cakeType"));
			Integer flavType = Integer.parseInt(request.getParameter("flavType"));
			Integer custCh = Integer.parseInt(request.getParameter("custCh"));
			Integer picUp = Integer.parseInt(request.getParameter("picUp"));
			System.err.println("Sel-->"+cakeType+"\t"+flavType+"\t"+custCh+"\t"+picUp);
			for(SpecialCake sp : specialCakeList) {
				if(sp.getOrderQty()==cakeType && sp.getSpType()==flavType && sp.getIsCustChoiceCk()==custCh && sp.getSpPhoupload()==picUp) {
					cakeList.add(sp);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(" Excep In /getFilteredSp");
		}
		
		
		return cakeList;
	}
	
	
	
	
	
	@RequestMapping(value = "/showSpCakeImage", method = RequestMethod.GET)
	public @ResponseBody Info showSpCakeImage(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		String spImg =  null;
		try {
			int spId = Integer.parseInt(request.getParameter("spId"));
			
			for (int i = 0; i < specialCakeList.size(); i++) {
				if(specialCakeList.get(i).getSpId()==spId) {
					spImg = Constants.SPCAKE_IMAGE_URL+specialCakeList.get(i).getSpImage();					
				}
			}			
			
			info.setMessage(spImg);
			
		}catch (Exception e) {
			System.out.println("/Excep in showSpCakeImage : "+e.getMessage());
			e.printStackTrace();
		}
		System.out.println(spImg);
		return info;
	}

	/*
	 * @RequestMapping(value = "/showSpecialCake")
	 * 
	 * public ModelAndView redirectToSpecialcakeshow(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * ModelAndView model = new ModelAndView("spcake/spcakelist");
	 * 
	 * return model; }
	 */

	@RequestMapping(value = "/uploadSpByFile", method = RequestMethod.POST)
	public String uploadItemsByFile(Model model, @RequestParam("file") MultipartFile excelfile,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			// Creates a workbook object from the uploaded excelfile
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream());
			// Creates a worksheet object representing the first sheet
			XSSFSheet worksheet = workbook.getSheetAt(0);
			// Reads the data in excel file until last row is encountered

			List<SpecialCake> specialCakeRes = new ArrayList<SpecialCake>();

			System.out.println("Last Row Number is " + worksheet.getLastRowNum());

			for (int i = 1; i <= worksheet.getLastRowNum(); i++) {
				// Creates an object for the UserInfo Model

				SpecialCake specialCake = new SpecialCake();

				// Creates an object representing a single row in excel
				XSSFRow row = worksheet.getRow(i);

				// System.err.println("row = " +row.toString());
				// Sets the Read data to the model class
				// user.setId((int) row.getCell(0).getNumericCellValue());
				try {
					specialCake.setSpId(0);

					specialCake.setSpCode(ItemController.getCellValueAsString(row.getCell(0)));

					specialCake.setSpName(ItemController.getCellValueAsString(row.getCell(1)));

					specialCake.setSpType(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(2))));

					specialCake.setSpMinwt(ItemController.getCellValueAsString(row.getCell(3)));

					specialCake.setSpMaxwt(ItemController.getCellValueAsString(row.getCell(4)));

					specialCake.setSpBookb4(ItemController.getCellValueAsString(row.getCell(5)));

					specialCake.setSpImage("");

					specialCake.setSpTax1(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(6))));

					specialCake.setSpTax2(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(7))));

					specialCake.setSpTax3(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(8))));
					specialCake.setSpeIdlist("");
					specialCake.setErpLinkcode(ItemController.getCellValueAsString(row.getCell(9)));
					specialCake.setIsUsed(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(10))));

					specialCake.setSpPhoupload(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(11))));

					specialCake.setTimeTwoappli(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(12))));
					specialCake.setBaseCode(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(13))));
					specialCake.setSpDesc(ItemController.getCellValueAsString(row.getCell(14)));
					specialCake.setOrderQty(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(15))));
					specialCake
							.setOrderDiscount(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(16))));
					specialCake
							.setIsCustChoiceCk(Integer.parseInt(ItemController.getCellValueAsString(row.getCell(17))));
					specialCake.setIsAddonRateAppli(
							Integer.parseInt(ItemController.getCellValueAsString(row.getCell(18))));
					specialCake.setMrpRate1(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(19))));
					specialCake.setMrpRate2(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(20))));
					specialCake.setMrpRate3(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(21))));
					specialCake.setSpRate1(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(22))));
					specialCake.setSpRate2(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(23))));
					specialCake.setSpRate3(Float.parseFloat(ItemController.getCellValueAsString(row.getCell(24))));
					specialCake.setSprId(1);
					specialCakeRes.add(specialCake);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			workbook.close();

			// userService.addListUser(lstUser);

			// model.addAttribute("bean", bean);

			System.out.println("Excel File Arraylist " + specialCakeRes.toString());
			System.out.println("Excel File Arraylist Size: " + specialCakeRes.size());

			RestTemplate rest = new RestTemplate();
			List<SpecialCake> info = rest.postForObject(Constants.url + "/insertSpList", specialCakeRes, List.class);
			System.out.println("Response " + info.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showSpecialCake";

	}

	@RequestMapping(value = "/addSpCakeProcess", method = RequestMethod.POST)

	public String redirectToLogin56(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("sp_image") List<MultipartFile> file) {
		ModelAndView model = new ModelAndView("spcake/addspcake");

		RestTemplate rest = new RestTemplate();

		String code = request.getParameter("spc_code");
		
		int saveNext = Integer.parseInt(request.getParameter("saveNext"));
		System.err.println("saveNext-->"+saveNext);
		
		
		String name = request.getParameter("spc_name");

		int type = Integer.parseInt(request.getParameter("spc_type"));

		String minwt = request.getParameter("min_weight");

		String maxwt = request.getParameter("max_weight");

		String bookb4 = request.getParameter("book_before");

		String spDesc = request.getParameter("sp_desc");

		int orderQty = Integer.parseInt(request.getParameter("order_qty"));

		float orderDisc = Float.parseFloat(request.getParameter("order_disc"));

		float spRate1 = Float.parseFloat(request.getParameter("sp_rate1"));

		float spRate2 = Float.parseFloat(request.getParameter("sp_rate2"));

		float spRate3 = Float.parseFloat(request.getParameter("sp_rate3"));

		float mrpRate1 = Float.parseFloat(request.getParameter("mrp_rate1"));

		float mrpRate2 = Float.parseFloat(request.getParameter("mrp_rate2"));

		float mrpRate3 = Float.parseFloat(request.getParameter("mrp_rate3"));

		float tx1 = Float.parseFloat(request.getParameter("tax_1"));

		float tx2 = Float.parseFloat(request.getParameter("tax_2"));

		float tx3 = Float.parseFloat(request.getParameter("tax_3"));

		String[] eventtypes = (request.getParameterValues("cake_shape"));//spe_id_list[]

		String[] erplinkcode = request.getParameterValues("erplinkcode");

		int isCustChoiceCk = Integer.parseInt(request.getParameter("is_cust_choice_ck"));

		int isAddonRateAppli = Integer.parseInt(request.getParameter("is_addon_rate_appli"));

		int type2app = Integer.parseInt(request.getParameter("type_2_applicable"));

		int isused = Integer.parseInt(request.getParameter("is_used"));

		int allowphupload = Integer.parseInt(request.getParameter("allowphupload"));

		int isSlotUsed = Integer.parseInt(request.getParameter("isSlotUsed"));

		int noOfChars = Integer.parseInt(request.getParameter("no_of_char"));

		// --------------------------------Sp Supplement Data--------------------
		String spHsncd = "";
		int uomId = 0;
		float spCess = 0.0f;
		String[] spUom = null;
		int cutSection = 0;
		String strUom = "";
		try {

			spHsncd = request.getParameter("spck_hsncd");

			uomId = Integer.parseInt(request.getParameter("spck_uom"));

			spCess = Float.parseFloat(request.getParameter("sp_cess"));

			/*spUom = request.getParameterValues("spe_id_list[]");//cake_shape  
			 * 
			 * 
*/
			strUom = request.getParameter("sp_uom_name");  
			cutSection = Integer.parseInt(request.getParameter("cut_section"));
			
			
			if (spUom != null) {
				StringBuilder uomArr = new StringBuilder();

				for (int i = 0; i < spUom.length; i++) {

					uomArr = uomArr.append(spUom[i] + ",");

				}
				strUom = uomArr.toString();

				strUom = strUom.substring(0, strUom.length() - 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ------------------------------------------------------
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < eventtypes.length; i++) {

			sb = sb.append(eventtypes[i] + ",");

		}
		String strEvents = sb.toString();

		strEvents = strEvents.substring(0, strEvents.length() - 1);
		// --------------------------------------------------------
		String strFlavours = "";
		if (erplinkcode != null) {
			StringBuilder flav = new StringBuilder();

			for (int i = 0; i < erplinkcode.length; i++) {

				flav = flav.append(erplinkcode[i] + ",");

			}
			strFlavours = flav.toString();

			strFlavours = strFlavours.substring(0, strFlavours.length() - 1);
		}
		// ---------------------------------------------------------

		VpsImageUpload upload = new VpsImageUpload();

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		System.out.println(sdf.format(cal.getTime()));

		String curTimeStamp = sdf.format(cal.getTime());
		String spImage = null;
		spImage = curTimeStamp + "-" + file.get(0).getOriginalFilename();

		try {

			LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			String tempFileName;
			FileOutputStream fo;

			tempFileName = curTimeStamp + "-" + file.get(0).getOriginalFilename();
			fo = new FileOutputStream(tempFileName);
			fo.write(file.get(0).getBytes());
			fo.close();
			map.add("file", new FileSystemResource(tempFileName));
			map.add("imageName", spImage);
			map.add("type", "sp");
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.MULTIPART_FORM_DATA);

			HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity = new HttpEntity<>(map, headers);
			Info infoRes = rest.postForObject(Constants.url + "/photoUpload", requestEntity, Info.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * upload.saveUploadedFiles(file, Constants.SPCAKE_IMAGE_TYPE, curTimeStamp +
		 * "-" + file.get(0).getOriginalFilename());
		 * System.out.println("upload method called for image Upload " +
		 * file.toString());
		 */
		
		SpecialCake specialcake = new SpecialCake();
		specialcake.setSpCode(code);
		specialcake.setSpName(name);
		specialcake.setSpType(type);
		specialcake.setSpMinwt(minwt);
		specialcake.setSpMaxwt(maxwt);
		specialcake.setSpBookb4(bookb4);
		specialcake.setSprId(1);
		specialcake.setSpImage(spImage);
		specialcake.setSpTax1(tx1);
		specialcake.setSpTax2(tx2);
		specialcake.setSpTax3(tx3);
		specialcake.setSpeIdlist(strEvents);
		specialcake.setErpLinkcode(strFlavours);
		specialcake.setIsUsed(isused);
		specialcake.setSpPhoupload(allowphupload);
		specialcake.setTimeTwoappli(type2app);
		specialcake.setBaseCode(0);
		specialcake.setDelStatus(0);

		specialcake.setSpDesc(spDesc);
		specialcake.setOrderQty(noOfChars);
		specialcake.setOrderDiscount(orderDisc);
		specialcake.setIsCustChoiceCk(isCustChoiceCk);
		specialcake.setIsAddonRateAppli(isAddonRateAppli);
		specialcake.setMrpRate1(mrpRate1);
		specialcake.setMrpRate2(mrpRate2);
		specialcake.setMrpRate3(mrpRate3);
		specialcake.setSpRate1(spRate1);
		specialcake.setSpRate2(spRate2);
		specialcake.setSpRate3(spRate3);
		specialcake.setIsSlotUsed(isSlotUsed);// Increamented By
		
		try {
			
			SpecialCake spcakeResponse = rest.postForObject(Constants.url + "insertSpecialCake", specialcake,
				SpecialCake.class);
			if (spcakeResponse != null) {
				RestTemplate restTemplate = new RestTemplate();		

				SpCakeSupplement spCakeSupplement = new SpCakeSupplement();
				spCakeSupplement.setId(0);
				spCakeSupplement.setUomId(uomId);
				spCakeSupplement.setSpId(spcakeResponse.getSpId());
				spCakeSupplement.setSpUom(strUom);
				spCakeSupplement.setSpHsncd(spHsncd);
				spCakeSupplement.setSpCess(spCess);
				spCakeSupplement.setDelStatus(0);
				spCakeSupplement.setIsTallySync(0);
				spCakeSupplement.setCutSection(cutSection);

				restTemplate = new RestTemplate();

				Info info = restTemplate.postForObject(Constants.url + "/saveSpCakeSup", spCakeSupplement, Info.class);

			} else {
				model = new ModelAndView("addSpCake");
			}

		} catch (Exception e) {
			System.out.println("AddSpCakeProcess Excep: " + e.getMessage());
			e.printStackTrace();
		}

		if(saveNext==0) {
			return "redirect:/showSpecialCake";
		}else {
			return   "redirect:/addSpCake"; 
		}

	}

	@RequestMapping(value = "/deleteSpecialCake/{spIdList}", method = RequestMethod.GET)
	public String deleteSpecialCake(@PathVariable String[] spIdList) {
		ModelAndView model = new ModelAndView("spcake/spcakelist");
		String strSpIds = new String();
		for (int i = 0; i < spIdList.length; i++) {
			strSpIds = strSpIds + "," + spIdList[i];
		}
		strSpIds = strSpIds.substring(1);
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("spId", strSpIds);
		RestTemplate restTemplate = new RestTemplate();
		Info info = restTemplate.postForObject(Constants.url + "deleteSpecialCake", map, Info.class);
		map = new LinkedMultiValueMap<String, Object>();
		map.add("id", strSpIds);
		Info infoSpCk = restTemplate.postForObject(Constants.url + "deleteSpCakeSup", map, Info.class);

		if (info.getError() || infoSpCk.getError()) {
			return "redirect:/showSpecialCake";
		} else {
			return "redirect:/showSpecialCake";

		}

	}

	@RequestMapping(value = "/updateSpCake/{spId}")

	public ModelAndView redirectToshowUpdateSpCake(@PathVariable int spId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("spcake/editspcake");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		List<Integer> shapIds = new ArrayList<Integer>();
		
		map.add("spId", spId);
		RestTemplate restTemplate = new RestTemplate();

		SpecialCake specialCake = restTemplate.getForObject(Constants.url + "getSpecialCake?spId={spId}",
				SpecialCake.class, spId);
		try {
			map = new LinkedMultiValueMap<String, Object>();

			map.add("spfId",specialCake.getErpLinkcode());
			/*
			 * List<Integer> numbers =
			 * Arrays.asList(specialCake.getErpLinkcode().split(","));
			 * map.add("spfId",numbers);
			 */
			
			List<Flavour> flavoursListSelected = restTemplate.postForObject(Constants.url + "getFlavoursBySpfIdIn", map,
					List.class);
			model.addObject("flavoursListSelected", flavoursListSelected);
			map.add("type", specialCake.getSpType());
			List<Flavour> flavoursListNotSelected = restTemplate
					.postForObject(Constants.url + "getFlavoursBySpfIdNotIn", map, List.class);
			model.addObject("flavoursListNotSelected", flavoursListNotSelected);

		} catch (Exception e) {
			System.out.println("Exc1 In /updateSpSupp" + e.getMessage());
		}
		AllEventListResponse allEventListResponse = restTemplate.getForObject(Constants.url + "showEventList",
				AllEventListResponse.class);
		GetSpCkSupplement getSpCkSupplement = null;
		try {
			map = new LinkedMultiValueMap<String, Object>();
			map.add("id", spId);

			getSpCkSupplement	= restTemplate.postForObject(Constants.url + "/getSpCakeSupplement",
					map, GetSpCkSupplement.class);
			System.out.println("getSpCkSupplement" + getSpCkSupplement.toString());
			List<RawMaterialUom> rawMaterialUomList = restTemplate.getForObject(Constants.url + "rawMaterial/getRmUom",
					List.class);

			model.addObject("rmUomList", rawMaterialUomList);

			model.addObject("spCkSupp", getSpCkSupplement);
			
			Shape[] AllShapeArr = restTemplate.getForObject(Constants.url + "/getAllChef",
					Shape[].class);
			List<Shape> shapeList = new ArrayList<Shape>(Arrays.asList(AllShapeArr));
			model.addObject("shapeList", shapeList);
			
			 shapIds = Stream.of(specialCake.getSpeIdlist().split(",")).map(Integer::parseInt)
		.collect(Collectors.toList());
			 
			 model.addObject("shapIds", shapIds);

		} catch (Exception e) {
			System.out.println("Exc In /updateSpSupp" + e.getMessage());
		}
		List<Event> eventList = new ArrayList<Event>();
		eventList = allEventListResponse.getEvent();

		String strSpeIdList = getSpCkSupplement.getSpUom();

		List<String> speIdListArray = Arrays.asList(strSpeIdList.split("\\s*,\\s*"));

		List<EventNameId> spePrevEvents = new ArrayList<EventNameId>();

		for (int i = 0; i < speIdListArray.size(); i++) {

			for (int j = 0; j < eventList.size(); j++) {

				if (eventList.get(j).getSpeId().toString().equalsIgnoreCase(speIdListArray.get(i))) {

					EventNameId nameId = new EventNameId();
					nameId.setId(speIdListArray.get(i));
					nameId.setName(eventList.get(j).getSpeName());
					spePrevEvents.add(nameId);
					model.addObject("nameId", nameId);
				}

			}

		}

		model.addObject("specialCake", specialCake);
		model.addObject("spEventsIdList", speIdListArray);
		model.addObject("speEventNameId", spePrevEvents);

		AllRatesResponse allRatesResponse = restTemplate.getForObject(Constants.url + "getAllRates",
				AllRatesResponse.class);

		List<Rate> rateList = new ArrayList<Rate>();
		rateList = allRatesResponse.getRates();

		for (int j = 0; j < speIdListArray.size(); j++) {

			for (int i = 0; i < eventList.size(); i++) {
				if (eventList.get(i).getSpeId().toString().equals(speIdListArray.get(j))) {
					eventList.remove(i);
				}

			}
		}

		String rateName = "";
		int rate = 0;

		for (int j = 0; j < rateList.size(); j++) {

			if (rateList.get(j).getSprId() == specialCake.getSprId()) {

				rateName = rateList.get(j).getSprName();
				rate = rateList.get(j).getSprRate();
			}

		}
		model.addObject("rateName", rateName);
		model.addObject("rate", rate);

		model.addObject("eventList", eventList);

		for (int j = 0; j < rateList.size(); j++) {

			if (rateList.get(j).getSprId() == specialCake.getSprId()) {
				rateList.remove(j);

			}
		}

		model.addObject("rateList", rateList);

		int isSlotUsed = specialCake.getIsSlotUsed();
		String strIsSlotUsed = String.valueOf(isSlotUsed);
		model.addObject("isSlotUsed", strIsSlotUsed);

		int timeTwoappli = specialCake.getTimeTwoappli();
		String strTimeTwoappli = String.valueOf(timeTwoappli);
		model.addObject("strTimeTwoappli", strTimeTwoappli);

		int isUsed = specialCake.getIsUsed();
		String strIsUsed = String.valueOf(isUsed);
		model.addObject("strIsUsed", strIsUsed);
		int allowPhUp = specialCake.getSpPhoupload();
		String strallowPhUp = String.valueOf(allowPhUp);
		model.addObject("strallowPhUp", strallowPhUp);

		int isCustChoiceCk = specialCake.getIsCustChoiceCk();
		String strIsCustChoiceCk = String.valueOf(isCustChoiceCk);
		model.addObject("strIsCustChoiceCk", strIsCustChoiceCk);

		int isAddonRateAppli = specialCake.getIsAddonRateAppli();
		String strIsAddonRateAppli = String.valueOf(isAddonRateAppli);
		model.addObject("strIsAddonRateAppli", strIsAddonRateAppli);
		
		CakeType[] ckTypeArr = restTemplate.getForObject(Constants.url + "showCakeTypeList", CakeType[].class);

		List<CakeType> cakeTypeList = new ArrayList<CakeType>(Arrays.asList(ckTypeArr));
		
		model.addObject("cakeTypeList", cakeTypeList);
		
		Shape[] AllShapeArr = restTemplate.getForObject(Constants.url + "/getAllChef",
				Shape[].class);

		List<Shape> shapeList = new ArrayList<Shape>(Arrays.asList(AllShapeArr));
		model.addObject("shapeList", shapeList);
		
		

		/*
		 * String cakeType=""; int spcName=specialCake.getSpType(); switch(spcName) {
		 * case 1: cakeType="Chocolate"; break; case 2: cakeType="FC"; break; case 0:
		 * cakeType="All"; break; default: cakeType=""; break;
		 * 
		 * } model.addObject("cakeType",cakeType);
		 */
		model.addObject("url", Constants.SPCAKE_IMAGE_URL);
		return model;

	}

	// @RequestMapping(value = "/updateSpCakeProcess")

	@RequestMapping(value = "/updateSpCake/updateSpCakeProcess", method = RequestMethod.POST)
	public String redirectToUpdateSpCakeProcess(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("sp_image") List<MultipartFile> file) {
		try {
			ModelAndView model = new ModelAndView("spcake/editspcake");

			RestTemplate restTemplate = new RestTemplate();

			String code = request.getParameter("spc_code");

			String name = request.getParameter("spc_name");

			int type = Integer.parseInt(request.getParameter("spc_type"));

			String minwt = request.getParameter("min_weight");

			String maxwt = request.getParameter("max_weight");

			String bookb4 = request.getParameter("book_before");

			String spDesc = request.getParameter("sp_desc");

			int orderQty = Integer.parseInt(request.getParameter("order_qty"));

			float orderDisc = Float.parseFloat(request.getParameter("order_disc"));

			float spRate1 = Float.parseFloat(request.getParameter("sp_rate1"));

			float spRate2 = Float.parseFloat(request.getParameter("sp_rate2"));

			float spRate3 = Float.parseFloat(request.getParameter("sp_rate3"));

			float mrpRate1 = Float.parseFloat(request.getParameter("mrp_rate1"));

			float mrpRate2 = Float.parseFloat(request.getParameter("mrp_rate2"));

			float mrpRate3 = Float.parseFloat(request.getParameter("mrp_rate3"));

			int isCustChoiceCk = Integer.parseInt(request.getParameter("is_cust_choice_ck"));

			int isAddonRateAppli = Integer.parseInt(request.getParameter("is_addon_rate_appli"));

			int isSlotUsed = Integer.parseInt(request.getParameter("isSlotUsed"));

			/*
			 * String spimg = request.getParameter("sp_image");
			 * System.out.println(" fr image"+spimg);
			 */
			double tx1 = Double.parseDouble(request.getParameter("tax_1"));

			double tx2 = Double.parseDouble(request.getParameter("tax_2"));

			double tx3 = Double.parseDouble(request.getParameter("tax_3"));

			String[] eventtypes = (request.getParameterValues("cake_shape"));//spe_id_list[]

			String[] erplinkcode = request.getParameterValues("erplinkcode");

			int type2app = Integer.parseInt(request.getParameter("type_2_applicable"));

			int isused = Integer.parseInt(request.getParameter("is_used"));

			int allowphupload = Integer.parseInt(request.getParameter("allowphupload"));

			int id = Integer.parseInt(request.getParameter("spId"));
			int noOfChars = Integer.parseInt(request.getParameter("no_of_char"));

			// --------------------------------Sp Supplement Data--------------------
			int suppId = 0;
			String spHsncd = "";
			int uomId = 0;
			float spCess = 0.0f;
			String[] spUom = null;
			int cutSection = 0;
			String strUom = "";
			try {

				suppId = Integer.parseInt(request.getParameter("suppId"));

				spHsncd = request.getParameter("spck_hsncd");

				uomId = Integer.parseInt(request.getParameter("spck_uom"));

				spCess = Float.parseFloat(request.getParameter("sp_cess"));

				/*spUom = request.getParameterValues("spe_id_list[]");//cake_shape 
*/
				
				strUom = request.getParameter("sp_uom_name");
				cutSection = Integer.parseInt(request.getParameter("cut_section"));
				

				/*if (spUom != null) {
					StringBuilder uomArr = new StringBuilder();

					for (int i = 0; i < spUom.length; i++) {

						uomArr = uomArr.append(spUom[i] + ",");

					}
					strUom = uomArr.toString();

					strUom = strUom.substring(0, strUom.length() - 1);
				}*/
			} catch (Exception e) {
				e.printStackTrace();
			}
			// -----------------------------------------------------------------

			StringBuilder sb = new StringBuilder();
			String strEventTypes = "";
			for (int i = 0; i < eventtypes.length; i++) {
				sb = sb.append(eventtypes[i] + ",");

			}
			String strEvents = sb.toString();
			strEvents = strEvents.substring(0, strEvents.length() - 1);

			// --------------------------------------------------------
			String strFlavours = "";
			if (erplinkcode != null) {
				StringBuilder flav = new StringBuilder();

				for (int i = 0; i < erplinkcode.length; i++) {

					flav = flav.append(erplinkcode[i] + ",");

				}
				strFlavours = flav.toString();

				strFlavours = strFlavours.substring(0, strFlavours.length() - 1);
			}
			// ---------------------------------------------------------

			String spImage = request.getParameter("prevImage");

			if (!file.get(0).getOriginalFilename().equalsIgnoreCase("")) {

				System.out.println("Empty image");
				// spImage= ImageS3Util.uploadSpCakeImage(file);

				VpsImageUpload upload = new VpsImageUpload();

				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				System.out.println(sdf.format(cal.getTime()));

				String curTimeStamp = sdf.format(cal.getTime());
				spImage = null;
				spImage = curTimeStamp + "-" + file.get(0).getOriginalFilename();
				/*
				 * try { spImage=curTimeStamp + "-" + file.get(0).getOriginalFilename();
				 * upload.saveUploadedFiles(file, Constants.SPCAKE_IMAGE_TYPE, curTimeStamp +
				 * "-" + file.get(0).getOriginalFilename());
				 * System.out.println("upload method called for image Upload " +
				 * file.toString());
				 * 
				 * } catch (IOException e) {
				 * 
				 * System.out.println("Exce in File Upload In Sp Cake  Insert " +
				 * e.getMessage()); e.printStackTrace(); }
				 */

				try {

					LinkedMultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
					String tempFileName;
					FileOutputStream fo;

					tempFileName = curTimeStamp + "-" + file.get(0).getOriginalFilename();
					fo = new FileOutputStream(tempFileName);
					fo.write(file.get(0).getBytes());
					fo.close();
					map.add("file", new FileSystemResource(tempFileName));
					map.add("imageName", tempFileName);
					map.add("type", "sp");
					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.MULTIPART_FORM_DATA);

					HttpEntity<LinkedMultiValueMap<String, Object>> requestEntity = new HttpEntity<>(map, headers);
					Info infoRes = restTemplate.postForObject(Constants.url + "/photoUpload", requestEntity,
							Info.class);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			// String spImage= ImageS3Util.uploadSpCakeImage(file);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("spCode", code);
			map.add("spname", name);
			map.add("sptype", type);
			map.add("spminwt", minwt);
			map.add("spmaxwt", maxwt);
			map.add("spbookb4", bookb4);
			map.add("spimage", spImage);
			map.add("sptax1", tx1);
			map.add("sptax2", tx2);
			map.add("sptax3", tx3);
			map.add("spidlist", strEvents);
			map.add("erplinkcode", strFlavours);
			map.add("timetwoappli", type2app);
			map.add("isUsed", isused);
			map.add("spphoupload", allowphupload);
			map.add("id", id);
			map.add("noOfChars", noOfChars);
			map.add("spDesc", spDesc);
			map.add("orderQty", noOfChars);
			map.add("orderDiscount", orderDisc);
			map.add("isCustChoiceCk", isCustChoiceCk);
			map.add("isAddonRateAppli", isAddonRateAppli);
			map.add("mrpRate1", mrpRate1);
			map.add("mrpRate2", mrpRate2);
			map.add("mrpRate3", mrpRate3);
			map.add("spRate1", spRate1);
			map.add("spRate2", spRate2);
			map.add("spRate3", spRate3);
			map.add("isSlotUsed", isSlotUsed);

			// System.out.println("sp name is "+name);
			// System.out.println("type 2 value in update event"+type2app);
			SpecialCake cakeResponse =null;
			try {
			 cakeResponse = restTemplate.postForObject(Constants.url + "updateSpecialCake", map,
					SpecialCake.class);
		}catch (HttpClientErrorException e) {
			System.err.println("updateSpecialCake ex" +e.getResponseBodyAsString());
		}

			try {

				if (cakeResponse != null) {

					SpCakeSupplement spCakeSupplement = new SpCakeSupplement();
					spCakeSupplement.setId(suppId);
					spCakeSupplement.setUomId(uomId);
					spCakeSupplement.setSpId(id);// add errorMessage in else
					spCakeSupplement.setSpUom(strUom);
					spCakeSupplement.setSpHsncd(spHsncd);
					spCakeSupplement.setSpCess(spCess);
					spCakeSupplement.setDelStatus(0);
					spCakeSupplement.setIsTallySync(0);
					spCakeSupplement.setCutSection(cutSection);

					Info info = restTemplate.postForObject(Constants.url + "/saveSpCakeSup", spCakeSupplement,
							Info.class);
					System.out.println("Response: " + info.toString());
				} else {
					model = new ModelAndView("addSpCake");
				}

			} catch (Exception e) {
				System.out.println("AddSpCakeProcess Excep: " + e.getMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return "redirect:/showSpecialCake";

	}

	@RequestMapping(value = "/showSpSupplement", method = RequestMethod.GET)
	public ModelAndView showSpSupplement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		HttpSession session = request.getSession();

		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
		Info view = AccessControll.checkAccess("showSpSupplement", "showSpSupplement", "1", "0", "0", "0",
				newModuleList);

		if (view.getError() == true) {

			mav = new ModelAndView("accessDenied");

		} else {
			mav = new ModelAndView("spcake/spCakeSupp");
			Constants.mainAct = 1;
			Constants.subAct = 110;

			RestTemplate restTemplate = new RestTemplate();

			try {
				List<GetSpCkSupplement> spSuppList = restTemplate.getForObject(Constants.url + "/getSpCakeSuppList",
						List.class);
				System.out.println("spSuppList" + spSuppList.toString());

				List<SpCake> spList = restTemplate.getForObject(Constants.url + "/getSpCakeList", List.class);
				System.out.println("spList" + spList.toString());

				List<RawMaterialUom> rawMaterialUomList = restTemplate
						.getForObject(Constants.url + "rawMaterial/getRmUom", List.class);
				mav.addObject("rmUomList", rawMaterialUomList);
				mav.addObject("spSuppList", spSuppList);
				mav.addObject("spList", spList);

			} catch (Exception e) {
				System.out.println("Exc In /spSupList" + e.getMessage());
			}
		}
		return mav;

	}

	// ------------------------------ADD SpCakeSup
	// Process------------------------------------
	@RequestMapping(value = "/addSpCakeSupProcess", method = RequestMethod.POST)
	public String addSpCakeSupProcess(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("spcake/spCakeSupp");
		try {

			int id = 0;

			try {
				id = Integer.parseInt(request.getParameter("id"));

			} catch (Exception e) {
				id = 0;
				System.out.println("In Catch of addSpCakeSupProcess Process Exc:" + e.getMessage());

			}

			String spHsncd = request.getParameter("spck_hsncd");
			int spId = Integer.parseInt(request.getParameter("sp_id"));

			int uomId = Integer.parseInt(request.getParameter("spck_uom"));

			float spCess = Float.parseFloat(request.getParameter("sp_cess"));

			String spUom = request.getParameter("sp_uom_name");

			//int cutSection = Integer.parseInt(request.getParameter("cut_section"));

			SpCakeSupplement spCakeSupplement = new SpCakeSupplement();
			spCakeSupplement.setId(id);
			spCakeSupplement.setUomId(uomId);
			spCakeSupplement.setSpId(spId);
			spCakeSupplement.setSpUom(spUom);
			spCakeSupplement.setSpHsncd(spHsncd);
			spCakeSupplement.setSpCess(spCess);
			spCakeSupplement.setDelStatus(0);
			spCakeSupplement.setIsTallySync(0);
		//	spCakeSupplement.setCutSection(cutSection);

			RestTemplate restTemplate = new RestTemplate();

			Info info = restTemplate.postForObject(Constants.url + "/saveSpCakeSup", spCakeSupplement, Info.class);
			System.out.println("Response: " + info.toString());

			if (info.getError() == true) {

				System.out.println("Error:True" + info.toString());
				return "redirect:/showSpSupplement";

			} else {
				return "redirect:/showSpSupplement";
			}

		} catch (Exception e) {

			System.out.println("Exception In Add SpSupp Process:" + e.getMessage());

		}

		return "redirect:/showSpSupplement";
	}

	// ----------------------------------------END---------------------------------------------------
	@RequestMapping(value = "/getFlavoursByType", method = RequestMethod.GET)
	public @ResponseBody List<Flavour> getFlavoursByType(@RequestParam(value = "type", required = true) int type) {

		RestTemplate restTemplate = new RestTemplate();
		List<Flavour> flavoursList = null;
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("type", type);
			if (type != 0 && type <= 3) {
				flavoursList = restTemplate.postForObject(Constants.url + "getFlavoursByType", map, List.class);
			} else {
				AllFlavoursListResponse allFlavoursListResponse = restTemplate
						.getForObject(Constants.url + "showFlavourList", AllFlavoursListResponse.class);
				flavoursList = allFlavoursListResponse.getFlavour();
				if (type != 0) {
					List<Flavour> flList = new ArrayList<Flavour>();
					for (Flavour flavour : allFlavoursListResponse.getFlavour()) {
						if (type == 4) {
							if (flavour.getSpType() == 1 || flavour.getSpType() == 2) {
								flList.add(flavour);
							}
						} else if (type == 5) {
							if (flavour.getSpType() == 1 || flavour.getSpType() == 3) {
								flList.add(flavour);
							}
						} else if (type == 6) {
							if (flavour.getSpType() == 2 || flavour.getSpType() == 3) {
								flList.add(flavour);
							}
						}
					}
					flavoursList = flList;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flavoursList;
	}
	// ----------------------------------------END---------------------------------------------------

	@RequestMapping(value = "/updateSpSupp/{id}", method = RequestMethod.GET)
	public ModelAndView updateSpSupp(@PathVariable("id") int id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("spcake/spCakeSupp");

		RestTemplate restTemplate = new RestTemplate();

		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("id", id);

			GetSpCkSupplement getSpCkSupplement = restTemplate.postForObject(Constants.url + "/getSpCakeSupp", map,
					GetSpCkSupplement.class);
			System.out.println("getSpCkSupplement" + getSpCkSupplement.toString());
			List<RawMaterialUom> rawMaterialUomList = restTemplate.getForObject(Constants.url + "rawMaterial/getRmUom",
					List.class);
			List<GetSpCkSupplement> spSuppList = restTemplate.getForObject(Constants.url + "/getSpCakeSuppList",
					List.class);

			SpCakeResponse spCakeResponse = restTemplate.getForObject(Constants.url + "showSpecialCakeList",
					SpCakeResponse.class);
			mav.addObject("spSuppList", spSuppList);
			mav.addObject("spList", spCakeResponse.getSpecialCake());

			mav.addObject("rmUomList", rawMaterialUomList);

			mav.addObject("spCkSupp", getSpCkSupplement);

		} catch (Exception e) {
			System.out.println("Exc In /updateSpSupp" + e.getMessage());
		}

		return mav;

	}
	
	@RequestMapping(value="/showCakeTypeList",method=RequestMethod.GET)
	public ModelAndView showAllFlavours(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("In /showCakeTypeList");
		ModelAndView mav = null;
		HttpSession session = request.getSession();
		List<CakeType> cakeTypeList=null;

//		List<ModuleJson> newModuleList = (List<ModuleJson>) session.getAttribute("newModuleList");
//		Info view = AccessControll.checkAccess("showCakeTypeList", "showCakeTypeList", "1", "0", "0", "0", newModuleList);
//
//		if (view.getError() == true) {
//
//			mav = new ModelAndView("accessDenied");
//
//		} else {
		
		try {
			mav = new ModelAndView("masters/cakeType");
			Constants.mainAct = 1;
			Constants.subAct = 10;

			
			CakeType cakeType = new CakeType();
			
			RestTemplate restTemplate = new RestTemplate();
			CakeType[] ckTypeArr = restTemplate.getForObject(Constants.url + "showCakeTypeList", CakeType[].class);

			 cakeTypeList = new ArrayList<CakeType>(Arrays.asList(ckTypeArr));
			
			mav.addObject("cakeTypeList", cakeTypeList);
			mav.addObject("cakeType", cakeType);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		}
		
		
		List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

		ExportToExcel expoExcel = new ExportToExcel();
		List<String> rowData = new ArrayList<String>();

		rowData.add("Sr No.");
	
		rowData.add("Cake Type");
		rowData.add("Extra Field Appl.");
		rowData.add("Condition");
		rowData.add("Status");
		
		
		
		expoExcel.setRowData(rowData);
		
		exportToExcelList.add(expoExcel);
		int srno = 1;
		String routeAbcType = null;
		for (int i = 0; i < cakeTypeList.size(); i++) {
			expoExcel = new ExportToExcel();
			rowData = new ArrayList<String>();
			
			
			
			srno = srno + 1;
			rowData.add(""+srno);
			rowData.add(""+cakeTypeList.get(i).getTypeName());
			if(cakeTypeList.get(i).getExtraFieldApplicable()==0) {
				rowData.add(""+"YES");
			}else {
				rowData.add(""+"NO");
			}
			
			if(cakeTypeList.get(i).getTypeCondition()==1) {
				
				rowData.add(""+"Number");	
			}else {
				rowData.add(""+"Character");
			}
			
			if(cakeTypeList.get(i).getIsActive()==0) {
				rowData.add(""+"Active");
			}else {
				rowData.add(""+"In-Active");
			}
			
			
			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);

		}
		session.setAttribute("exportExcelListNew", exportToExcelList);
		session.setAttribute("excelNameNew", "Cake Type List");
		session.setAttribute("reportNameNew", "Cake Type List");
		session.setAttribute("", "");
		session.setAttribute("mergeUpto1", "$A$1:$L$1");
		session.setAttribute("mergeUpto2", "$A$2:$L$2");
		session.setAttribute("excelName", "Cake Type Excel");
		
		
		
		
		return mav;

	}
	
	@RequestMapping(value = "/addCakeType")
	public String addFlavour(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("masters/flavours");

		RestTemplate rest = new RestTemplate();
		
		CakeType cakeType = new CakeType();
		cakeType.setCakeTypeId(Integer.parseInt(request.getParameter("cakeTypeId")));
		cakeType.setDelStatus(0);
		cakeType.setExInt1(0);
		cakeType.setExInt2(0);
		cakeType.setExtraFieldApplicable(Integer.parseInt(request.getParameter("ex_field")));
		cakeType.setExVar1("NA");
		cakeType.setExVar2("NA");
		cakeType.setIsActive(Integer.parseInt(request.getParameter("isActive")));
		cakeType.setTypeCondition(Integer.parseInt(request.getParameter("type_con")));
		cakeType.setTypeName(request.getParameter("cake_type_name"));
		
		CakeType cake = rest.postForObject("" + Constants.url + "insertCakeType", cakeType, CakeType.class);
		
		return "redirect:/showCakeTypeList";

	}
	
	
	
	
	@RequestMapping(value = "/updateCakeType")
	public ModelAndView updateCakeType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("masters/cakeType");


		RestTemplate restTemplate = new RestTemplate();
		CakeType[] ckTypeArr = restTemplate.getForObject(Constants.url + "showCakeTypeList", CakeType[].class);

		List<CakeType> cakeTypeList = new ArrayList<CakeType>(Arrays.asList(ckTypeArr));
		
		mav.addObject("cakeTypeList", cakeTypeList);
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("cakeTypeId", Integer.parseInt(request.getParameter("cakeTypeId")));
		
		CakeType cakeType = restTemplate.postForObject("" + Constants.url + "getCakeTypeById", map, CakeType.class);
		
		mav.addObject("cakeType", cakeType);
		return mav;

	}
	
	@RequestMapping(value = "/deleteCakeType", method = RequestMethod.GET)
	public String deleteSpecialCake(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate restTemplate = new RestTemplate();

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("cakeTypeId", Integer.parseInt(request.getParameter("cakeTypeId")));

		Info info = restTemplate.postForObject(Constants.url + "deleteCakeType", map, Info.class);

		return "redirect:/showCakeTypeList";

	}
	
	@RequestMapping(value = "/getSpCakePrintIds", method = RequestMethod.GET)
	public @ResponseBody List<GetSpCakeExlPdf> getCompanyPrintIds(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<GetSpCakeExlPdf> printSpCakeList = new ArrayList<GetSpCakeExlPdf>();
		
		try {
			HttpSession session = request.getSession();		
					
			String selctId = request.getParameter("elemntIds");

			selctId = selctId.substring(1, selctId.length() - 1);
			selctId = selctId.replaceAll("\"", "");
			
			RestTemplate restTemplate = new RestTemplate();
			
		
			GetSpCakeExlPdf[] allRouteListResponse = restTemplate.getForObject(Constants.url + "/getSpCakeListPdfExl",
					GetSpCakeExlPdf[].class);

			printSpCakeList = new ArrayList<GetSpCakeExlPdf>(Arrays.asList(allRouteListResponse));

			List<Long> spCakeIds =  Stream.of(selctId.split(","))
			        .map(Long::parseLong)
			        .collect(Collectors.toList());
			
			
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Sr No.");
			for (int i = 0; i < spCakeIds.size(); i++) {
								
				if(spCakeIds.get(i)==1)
					rowData.add("Name");
				
				if(spCakeIds.get(i)==2)
					rowData.add("UOM");
				
				if(spCakeIds.get(i)==3)
					rowData.add("GST %");
				
				if(spCakeIds.get(i)==4)
					rowData.add("HSN Code");
				
				if(spCakeIds.get(i)==5)
					rowData.add("Cake Type");
				
				if(spCakeIds.get(i)==6)
					rowData.add("Cake Shape");
				
				if(spCakeIds.get(i)==7)
					rowData.add("Flavour");
				
				if(spCakeIds.get(i)==8)
					rowData.add("Event");
				
				if(spCakeIds.get(i)==9)
					rowData.add("Book Before");
				
				if(spCakeIds.get(i)==10)
					rowData.add("MAX Range");
				
				if(spCakeIds.get(i)==11)
					rowData.add("MIN Range");
				
				if(spCakeIds.get(i)==12)
					rowData.add("Increamented By");
				
				if(spCakeIds.get(i)==13)
					rowData.add("MRP1");				
				
				if(spCakeIds.get(i)==14)
					rowData.add("MRP2");
				
				if(spCakeIds.get(i)==15)
					rowData.add("MRP3");
				
				if(spCakeIds.get(i)==16)
					rowData.add("Customer Choice");
				
				if(spCakeIds.get(i)==17)
					rowData.add("Addon Appli");
				
				if(spCakeIds.get(i)==18)
					rowData.add("Status");
				
								
				
			}
			expoExcel.setRowData(rowData);
			
			exportToExcelList.add(expoExcel);
			int srno = 1;
			String routeAbcType = null;
			for (int i = 0; i < printSpCakeList.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();				
				
				rowData.add(" "+srno);
				for (int j = 0; j < spCakeIds.size(); j++) {		
					
					
					if(spCakeIds.get(j)==1)
					rowData.add(" " + printSpCakeList.get(i).getSpName());
					
					if(spCakeIds.get(j)==2)
					rowData.add(" " + printSpCakeList.get(i).getUom());
					
					if(spCakeIds.get(j)==3)
					rowData.add(" " + printSpCakeList.get(i).getSpTax3());
					
					if(spCakeIds.get(j)==4)
					rowData.add(" " + printSpCakeList.get(i).getSpHsncd());
					
					if(spCakeIds.get(j)==5)
					rowData.add(" " + printSpCakeList.get(i).getTypeName());
					
					if(spCakeIds.get(j)==6)
					rowData.add(" " + printSpCakeList.get(i).getShapeName());
						
					if(spCakeIds.get(j)==7)
					rowData.add(" " + printSpCakeList.get(i).getFlavour());	
					
					if(spCakeIds.get(j)==8)
						rowData.add(" " + printSpCakeList.get(i).getEventName());	
					
					if(spCakeIds.get(j)==9)
						rowData.add(" " + printSpCakeList.get(i).getSpBookB4());	
					
					if(spCakeIds.get(j)==10)
						rowData.add(" " + printSpCakeList.get(i).getSpMaxwt());	
					
					if(spCakeIds.get(j)==11)
						rowData.add(" " + printSpCakeList.get(i).getSpMinwt());	
					
					if(spCakeIds.get(j)==12)
						rowData.add(" " + printSpCakeList.get(i).getIncreamentedBy());	
					
					if(spCakeIds.get(j)==13)
						rowData.add(" " + printSpCakeList.get(i).getMrpRate1());	
					
					if(spCakeIds.get(j)==14)
						rowData.add(" " + printSpCakeList.get(i).getMrpRate2());	
					
					if(spCakeIds.get(j)==15)
						rowData.add(" " + printSpCakeList.get(i).getMrpRate3());	
					
					if(spCakeIds.get(j)==16)
						rowData.add(printSpCakeList.get(i).getIsCustChoiceCk() == 0 ? "Yes" : "No");	
					
					if(spCakeIds.get(j)==17)
						rowData.add(printSpCakeList.get(i).getIsAddonRateAppli()== 0 ? "Yes" : "No");	
					
					if(spCakeIds.get(j)==18)
						rowData.add(printSpCakeList.get(i).getIsUsed()== 0 ? "Yes" : "No");	
					
				}
				srno = srno + 1;
				
				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}
			session.setAttribute("exportExcelListNew", exportToExcelList);
			session.setAttribute("excelNameNew", "Sp Cake List");
			session.setAttribute("reportNameNew", "Sp Cake List");
			session.setAttribute("", "");
			session.setAttribute("mergeUpto1", "$A$1:$L$1");
			session.setAttribute("mergeUpto2", "$A$2:$L$2");
			session.setAttribute("excelName", "Sp Cake Excel");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return printSpCakeList;
	}
	
	
	@RequestMapping(value = "pdf/getSpCakeListPdf/{selctId}", method = RequestMethod.GET)
	public ModelAndView getCompanyListPdf(HttpServletRequest request,
			HttpServletResponse response, @PathVariable String selctId) {
		
		ModelAndView model = new ModelAndView("masters/masterPdf/spCakePdf");
		
		List<GetSpCakeExlPdf> printSpCakeList = new ArrayList<GetSpCakeExlPdf>();
		try {
			
			RestTemplate restTemplate = new RestTemplate();
			
			GetSpCakeExlPdf[] allRouteListResponse = restTemplate.getForObject(Constants.url + "/getSpCakeListPdfExl",
					GetSpCakeExlPdf[].class);

			printSpCakeList = new ArrayList<GetSpCakeExlPdf>(Arrays.asList(allRouteListResponse));

			List<Long> spCakeIds =  Stream.of(selctId.split(","))
			        .map(Long::parseLong)
			        .collect(Collectors.toList());
			
			
			model.addObject("printSpCakeList", printSpCakeList);
			model.addObject("spCakeIds", spCakeIds);
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
		
	}
}
