package kr.happyjob.study.direction.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//작업지시서 사이드바
@Controller
@RequestMapping("/direction/")
public class DirectionController {
	   // Set logger
	   private final Logger logger = LogManager.getLogger(this.getClass());

	   // Get class name for logger
	   private final String className = this.getClass().toString();


	   
		//작업지시서 => 발주지시서 현황
		@RequestMapping("orderList.do")
		public String directionOrder(){
			logger.info("작업지시서 사이드바 : 발주지시서 " + className);

			
			return "direction/directionOrder";
		}
		
		//작업지시서 => 반품지시서 현황
		@RequestMapping("returnList.do")
		public String directionReturn(){
			logger.info("작업지시서 사이드바 : 반품지시서 " + className);

			
			return "direction/directionReturn";
		}
		
		//작업지시서 => 배송지시서 현황
		@RequestMapping("deliveryList.do")
		public String directionDelivery(){
			logger.info("작업지시서 사이드바 : 배송지시서 " + className);

			
			return "direction/directionDelivery";
		}
}
