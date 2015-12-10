package com.pzy.controller;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Notice;
import com.pzy.service.NoticeService;


/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/noticeview")
public class NoticeViewController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("index")
	public String index() {
		return "admin/noticeview/index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, String noticename
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Notice> notices = noticeService.findAll(pageNumber, pageSize, noticename);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", notices.getContent());
		map.put("iTotalRecords", notices.getTotalElements());
		map.put("iTotalDisplayRecords", notices.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
}
