package kr.happyjob.study.direction.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.direction.model.TB_order;

public interface DirectionDao {
	
	public List<TB_order> searchOrderList(TB_order tborder); //작업지시서 발주리스트 조회

	public List<Map<String, Object>> directionReturnList(Map<String, Object> paramMap);

	public List<Map<String, Object>> directionDeliveryList(Map<String, Object> paramMap);

}
