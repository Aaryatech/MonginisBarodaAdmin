package com.ats.adminpanel.controller.temp;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.ats.adminpanel.commons.Constants;
import com.ats.adminpanel.commons.EInvoice_Constants;
import com.ats.adminpanel.model.ErrorMessage;
import com.ats.adminpanel.model.billing.Company;
import com.ats.adminpanel.model.einv.BuyerDetails;
import com.ats.adminpanel.model.einv.CustomErrEwayBill;
import com.ats.adminpanel.model.einv.DocSetails;
import com.ats.adminpanel.model.einv.ItmList;
import com.ats.adminpanel.model.einv.ReqPlGenIRN;
import com.ats.adminpanel.model.einv.RespAuthPl;
import com.ats.adminpanel.model.einv.RespPlGenIRN;
import com.ats.adminpanel.model.einv.SellerDetails;
import com.ats.adminpanel.model.einv.TranDetails;
import com.ats.adminpanel.model.einv.ValDetails;
import com.ats.adminpanel.model.franchisee.FranchiseeList;

@Controller
@Scope("session")
public class EInvoiceGenController {

	
	
	@RequestMapping(value = "/genEInvBill", method = RequestMethod.POST)
	public @ResponseBody List<CustomErrEwayBill> genEInvBill(HttpServletRequest request, HttpServletResponse response) {
		List<CustomErrEwayBill> errorBillList = new ArrayList<CustomErrEwayBill>();
		RestTemplate restTemplate = new RestTemplate();
		try {
			ObjectMapper mapperObj = new ObjectMapper();
			String billList = new String();
			ResponseEntity<List<EInvBillHeader>> bRes = null;
			String[] selectedBills = request.getParameterValues("select_to_print");
			String vehNo = request.getParameter("vehNo");
			for (int i = 0; i < selectedBills.length; i++) {
				billList = selectedBills[i] + "," + billList;
			}

			billList = billList.substring(0, billList.length() - 1);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billIdList", billList);

			ParameterizedTypeReference<List<EInvBillHeader>> typeRef1 = new ParameterizedTypeReference<List<EInvBillHeader>>() {
			};
			try {
				bRes = restTemplate.exchange(Constants.url + "getBillListForEInvoice", HttpMethod.POST,
						new HttpEntity<>(map), typeRef1);
			} catch (HttpClientErrorException e) {
				System.err.println("/getBillListForEInvoice Http Excep \n " + e.getResponseBodyAsString());
			}
			List<EInvBillHeader> billHeaderList = bRes.getBody();

			// System.err.println("billHeaderList " + billHeaderList.toString());

			RespAuthPl tokenRes = null; // = restTemplate.getForObject(EwayConstants.getToken, GetAuthToken.class);
			ResponseEntity<String> tokRes = null;

			ParameterizedTypeReference<String> typeRef2 = new ParameterizedTypeReference<String>() {
			};
			try {
				tokRes = restTemplate.exchange(EInvoice_Constants.E_INV_AUTH_TOKEN_URL, HttpMethod.GET, new HttpEntity<>(null), typeRef2);
				try {
					 System.err.println("Token Res SAA " +tokRes.toString());
					tokenRes = mapperObj.readValue(tokRes.getBody(), RespAuthPl.class);
					
				}catch (HttpClientErrorException e) {
					System.err.println("Inner HTTP TOKEN EX getToken" + e.getResponseBodyAsString());
				} catch (Exception e) {
					e.printStackTrace();
					System.err.println("Inner try for getToken" + e.getMessage());
				}
			} catch (HttpClientErrorException e) {
				System.err.println("/getToken Http Excep \n " + e.getResponseBodyAsString());
			}
			EInvoice_Constants.AUTH_TOKEN=tokenRes.getData().getAuthToken();
			RespPlGenIRN einvSuccess = null;
			ResponseCode ewayErrRes = null;
			ParameterizedTypeReference<String> typeRef = new ParameterizedTypeReference<String>() {
			};
			ResponseEntity<String> responseEntity = null;

			Company company = restTemplate.getForObject(Constants.url + "/getCompany", Company.class);
			//System.err.println("company " + company.toString());
			String  GSTIN="34AACCC1596Q002";
			for (int i = 0; i < billHeaderList.size(); i++) {

				EInvBillHeader bill = billHeaderList.get(i);

				FranchiseeList frData = restTemplate.getForObject(Constants.url + "getFranchisee?frId={frId}",
						FranchiseeList.class, bill.getFrId());

				ReqPlGenIRN billReq = new ReqPlGenIRN();

				BuyerDetails buyerDtls=new BuyerDetails();
				
				buyerDtls.setAddr1(frData.getFrAddress().trim());
				buyerDtls.setGstin("29AWGPV7107B1Z1");
				//buyerDtls.setGstin(GSTIN);
				
				buyerDtls.setEm("abc@xyz.com");
				buyerDtls.setLglNm(frData.getFrName());
				buyerDtls.setLoc("dfdssf");
				buyerDtls.setPh("123456");
				buyerDtls.setPin(562160);
				buyerDtls.setPos("29");
				buyerDtls.setState("29");
				buyerDtls.setStcd("29");
				buyerDtls.setTrdNm("Test ");
				
				//buyerDtls.setEm("");
				
				billReq.setBuyerDtls(buyerDtls);
				
				
				DocSetails docDtls=new DocSetails();
				
				docDtls.setDt(bill.getBillDate());
				docDtls.setNo(bill.getInvoiceNo());
				docDtls.setTyp("INV");
				
				billReq.setDocDtls(docDtls);
				
				 List<ItmList> itemList=new ArrayList<ItmList>();
				 
				 for(int k=0;k<bill.geteInvBillDetail().size();k++) {
					
					 EInvBillDetail billDetail=bill.geteInvBillDetail().get(k);
					 
					 ItmList item=new ItmList();
					 
					 item.setHsnCd(billDetail.getHsnCode());
					 item.setPrdDesc(billDetail.getItemName());
					 item.setSlNo(""+k+1);
					 item.setIsServc("N");
					 
					 item.setAssAmt(billDetail.getTaxableAmt());
					 item.setGstRt(12);
					 item.setTotAmt(billDetail.getTaxableAmt());
					 item.setTotItemVal(billDetail.getGrandTotal());
					 item.setUnitPrice(billDetail.getRate());
					
					 item.setUnit(billDetail.getItemUom());
					 item.setQty(billDetail.getBillQty());
					 itemList.add(item);
				 }
				 
				billReq.setItemList(itemList);
				
				
				SellerDetails sellerDtls=new SellerDetails();
				
				sellerDtls.setAddr1(company.getFactAddress());
				sellerDtls.setAddr2("dfdsf");
				sellerDtls.setEm("abc@xyz.com");
				sellerDtls.setGstin("34AACCC1596Q002");
				//sellerDtls.setGstin(GSTIN);
				sellerDtls.setLglNm(company.getCompName());
				sellerDtls.setLoc("sdf dsvd");
				sellerDtls.setPh("541233");
				sellerDtls.setPin(605001);
				sellerDtls.setState("27");
				sellerDtls.setStcd("34");
				sellerDtls.setTrdNm("Test");
				
				billReq.setSellerDtls(sellerDtls);
				
				TranDetails tranDtls =new  TranDetails();
				tranDtls.setEcmGstin(null);
				tranDtls.setRegRev("Y");
				tranDtls.setSupTyp("B2B");
				tranDtls.setTaxSch("GST");
				
				billReq.setTranDtls(tranDtls);
				
				ValDetails valDtls =new ValDetails();
				valDtls.setAssVal(bill.getTaxableAmt());
				valDtls.setCesVal(bill.getCessSum());
				valDtls.setCgstVal(bill.getCgstSum());
				valDtls.setIgstVal(bill.getIgstSum());
				valDtls.setRndOffAmt(bill.getRoundOff());
				valDtls.setSgstVal(bill.getSgstSum());
				valDtls.setStCesVal(0);
				valDtls.setTotInvVal(bill.getGrandTotal());
				
				valDtls.setTotInvValFc(0);
				billReq.setValDtls(valDtls);
				
				billReq.setVersion("1.1");
				
				

				String[] arr = bill.getPartyAddress().split("~~");

				System.err.println("ADDRESS - " + bill.getPartyAddress());

				String pincode = "";
				int pin = 0;
				String km = "";
				String add = bill.getPartyAddress();

				if (arr.length == 2) {
					pincode = arr[1];
					pin = Integer.parseInt(pincode);

					add = arr[0];

				} else if (arr.length == 3) {
					pincode = arr[1];
					km = arr[2];
					pin = Integer.parseInt(pincode);

					add = arr[0];

				}



				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.APPLICATION_JSON);

				 String jsonStr = mapperObj.writeValueAsString(billReq);
				//System.err.println("jsonStr " + jsonStr);

				 String  ASP_ID="1629701119";
				 String  ASP_PWD="pdMulani@123";
				 String  USER_NAME="TaxProEnvPON";
				 String  EINV_PWD="abc34*";
				 String AUTH_TOKEN=tokenRes.Data.AuthToken;
				 int QR_CD_SIZE=250;
				    String GEN_IRN_URL =
				  "https://gstsandbox.charteredinfo.com/eicore/dec/v1.03/Invoice?" +
				  "aspid="+ASP_ID+"&password="+ASP_PWD+"&Gstin="+GSTIN+"&AuthToken="+AUTH_TOKEN
				  +"&user_name="+USER_NAME+ "&QrCodeSize="+QR_CD_SIZE;
				 
							try {
								responseEntity = restTemplate.exchange(EInvoice_Constants.GEN_IRN_URL+tokenRes.getData().getAuthToken() + "",
										HttpMethod.POST, new HttpEntity<>(jsonStr), typeRef);
								System.err.println("ewaySuccRes aaaa " + responseEntity.getBody());
								try {
									einvSuccess = mapperObj.readValue(responseEntity.getBody(), RespPlGenIRN.class);
									System.err.println("ewaySuccRes " + einvSuccess.toString());

									map = new LinkedMultiValueMap<String, Object>();
									map.add("ewayBillNo", einvSuccess.Irn);
								//	map.add("billNo", bill.getBillNo());

						/*
						 * ErrorMessage updateEwayBillNo = restTemplate .postForObject(Constants.url +
						 * "/tally/updateEwayBillNo1", map, ErrorMessage.class);
						 */
								} catch (HttpClientErrorException e) {
									System.err.println("ewayErrRes body   " + e.getResponseBodyAsString());
									ewayErrRes = mapperObj.readValue(e.getResponseBodyAsString(), ResponseCode.class);
									System.err.println("ewayErrRes   " + ewayErrRes.toString());
									CustomErrEwayBill errRes = new CustomErrEwayBill();

									//errRes.setBillNo(bill.getBillNo());
									//errRes.setInvoiceNo(bill.getInvoiceNo());
									errRes.setTimeStamp("--");
									errRes.setErrorCode(ewayErrRes.getError().getError_cd());
									errRes.setMessage(ewayErrRes.getError().getMessage());

									errorBillList.add(errRes);
								}
catch (Exception e) {
									e.printStackTrace();
									System.err.println("Inner Try e inv fail");
								}

							} catch (HttpClientErrorException e) {

								ewayErrRes = mapperObj.readValue(e.getResponseBodyAsString(), ResponseCode.class);
								System.err.println("ewayErrRes   " + ewayErrRes.toString());
								CustomErrEwayBill errRes = new CustomErrEwayBill();

								//errRes.setBillNo(bill.getBillNo());
								//errRes.setInvoiceNo(bill.getInvoiceNo());
								errRes.setTimeStamp("--");
								errRes.setErrorCode(ewayErrRes.getError().getError_cd());
								errRes.setMessage(ewayErrRes.getError().getMessage());

								errorBillList.add(errRes);
							}

			} // End of Bill Header For Loop

			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return errorBillList;

	}
	
	/*
	 SELECT t_bill_header.bill_no,t_bill_header.invoice_no,t_bill_header.bill_date,
t_bill_header.fr_id,t_bill_header.tax_applicable,t_bill_header.taxable_amt,t_bill_header.total_tax,
t_bill_header.grand_total,t_bill_header.disc_amt,t_bill_header.round_off,
t_bill_header.sgst_sum,t_bill_header.cgst_sum,t_bill_header.igst_sum,t_bill_header.party_name,
t_bill_header.party_gstin,t_bill_header.party_address,t_bill_header.veh_no,t_bill_header.ex_varchar2 as cess_sum

FROM t_bill_header WHERE t_bill_header.del_status=0 and t_bill_header.bill_no IN (1,45,78,96,102)


SELECT t_bill_detail.bill_detail_no,t_bill_detail.bill_no,
t_bill_detail.order_id,t_bill_detail.item_id,t_bill_detail.bill_qty,t_bill_detail.order_qty,
t_bill_detail.mrp,t_bill_detail.rate,t_bill_detail.base_rate,t_bill_detail.taxable_amt,t_bill_detail.sgst_rs,
t_bill_detail.cgst_rs,t_bill_detail.igst_rs,t_bill_detail.cess_rs,
t_bill_detail.total_tax,t_bill_detail.grand_total,t_bill_detail.expiry_date,t_bill_detail.disc_per,
CASE  WHEN t_bill_detail.cat_id=5 THEN (SELECT m_sp_cake.sp_name  FROM  m_sp_cake WHERE m_sp_cake.sp_id= t_bill_detail.item_id) ELSE (SELECT  m_item.item_name FROM m_item WHERE t_bill_detail.item_id=m_item.id)END AS item_name from t_bill_detail 
WHERE bill_no=1

	 */
}
