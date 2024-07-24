package kr.happyjob.study.business.dao;

import java.util.List;
import java.util.Map;

public interface BusinessDao {

	List<Map<String, Object>> businessObtainList(Map<String, Object> paramMap);

	List<Map<String, Object>> deliveryManList();

	List<Map<String, Object>> getStorageListList(Map<String, Object> paramMap);

	Integer findDeliveryStatus(Map<String, Object> paramMap);

	Integer deliveryInsert(Map<String, Object> paramMap);

	List<Map<String, Object>> getDeliveryModalSelect(Map<String, Object> paramMap);

	Integer updateDeliveryModal(Map<String, Object> paramMap);

	List<Map<String, Object>> businessreturnList(Map<String, Object> paramMap);

	Integer findInsertOrUpdateCntRe(Map<String, Object> paramMap);

	Integer RE_deliveryInsert(Map<String, Object> paramMap);

	List<Map<String, Object>> getDeliveryReModalSelect(Map<String, Object> paramMap);

	Integer Order_findstatus(Map<String, Object> paramMap);

	Integer toOrderInsert(Map<String, Object> paramMap);

	Map<String, Object> selectDelivery(Map<String, Object> paramMap);

	List<Map<String, Object>> businessorderList(Map<String, Object> paramMap);

	List<Map<String, Object>> getOrderCompnay(Map<String, Object> paramMap);

	Integer insertOrder(Map<String, Object> paramMap);

	Integer getOrderStatus(Map<String, Object> paramMap);

	List<Map<String, Object>> return_deliverySelect(Map<String, Object> paramMap);

	int returnListCnt(Map<String, Object> paramMap);




}
