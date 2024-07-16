package kr.happyjob.study.business.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/business/")
public class BusinessController {
	   // Set logger
	   private final Logger logger = LogManager.getLogger(this.getClass());

	   // Get class name for logger
	   private final String className = this.getClass().toString();

	   //http://localhost/business/obtain.do
		@RequestMapping("obtain.do")//url똑같이했음 페이지랑
		public String obtainBusiness(){
			logger.info("거래내역 : 수주내역컨트롤러"+className);

			
			return "business/obtain";
		}
		
		//2.거래내역 반품
		   //http://localhost/business/return.do
			@RequestMapping("return.do")//url똑같이했음 페이지랑
			public String returnBusiness(){
				logger.info("거래내역 : 반품내역 컨트롤러"+className);

				return "business/return";
			}
	   

}
