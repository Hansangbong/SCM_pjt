package kr.happyjob.study.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.board.model.NoticeModel;
import kr.happyjob.study.board.service.NoticeService;

@Controller
@RequestMapping("/board/")
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	// 처음 로딩될 때 공지사항 연결
	@RequestMapping("notice.do")
	public String init(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initNotice");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);

		return "board/notice";
	}

	@RequestMapping("noticeList.do")
	public String getNoticeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("+ Start " + className + ".getNoticeList");
		logger.info("   - paramMap : " + paramMap);

		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<NoticeModel> noticeList = noticeService.noticeList(paramMap);
		int noticeCnt = noticeService.noticeListCnt(paramMap);

		model.addAttribute("notice", noticeList);
		model.addAttribute("noticeCnt", noticeCnt);

		return "board/noticeList";
	}

	@RequestMapping("noticeSave.do")
	@ResponseBody
	public Map<String, Object> noticeSave(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeSave");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = noticeService.noticeSave(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

	@RequestMapping("noticeUpdate.do")
	@ResponseBody
	public Map<String, Object> noticeUpdate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeUpdate");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = noticeService.noticeUpdate(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

	@RequestMapping("noticeDetail.do")
	@ResponseBody
	public Map<String, Object> noticeDetail(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeDetail");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		NoticeModel detail = noticeService.noticeDetail(paramMap);

		resultMap.put("detailValue", detail);

		return resultMap;

	}

	@RequestMapping("noticeDelete.do")
	@ResponseBody
	public Map<String, Object> noticeDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeDelete");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = noticeService.noticeDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

	@RequestMapping("noticeSaveFile.do")
	@ResponseBody
	public Map<String, Object> noticeSaveFile(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeSaveFile");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);

		int result = 0;
		String returnMsg = "";

		result = noticeService.noticeSaveFile(paramMap, request);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

	@RequestMapping("noticeUpdateFile.do")
	@ResponseBody
	public Map<String, Object> noticeUpdateFile(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeUpdateFile");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);

		int result = 0;
		String returnMsg = "";

		result = noticeService.noticeUpdateFile(paramMap, request);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

	@RequestMapping("noticeDownload.do")
	public void downloadNotice(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".downloadNotice");
		logger.info("   - paramMap : " + paramMap);

		NoticeModel getFileData = noticeService.noticeDetail(paramMap);

		String file = getFileData.getPhsycal_path();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(file));

		response.setContentType("application/octet-stream");

		response.setContentLength(fileByte.length);

		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(getFileData.getFile_name(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

		return;

	}

}
