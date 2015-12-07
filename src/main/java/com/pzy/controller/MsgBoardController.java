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

import com.pzy.entity.MsgBoard;
import com.pzy.service.MsgBoardService;


/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/msgboard")
public class MsgBoardController {
	@Autowired
	private MsgBoardService msgboardService;
	
	@RequestMapping("index")
	public String index() {
		return "admin/msgboard/index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, String msgboardname
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<MsgBoard> msgboards = msgboardService.findAll(pageNumber, pageSize, msgboardname);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", msgboards.getContent());
		map.put("iTotalRecords", msgboards.getTotalElements());
		map.put("iTotalDisplayRecords", msgboards.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(MsgBoard msgboard) {
		msgboard.setCreateDate(new Date());
		msgboardService.save(msgboard);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(MsgBoard msgboard) {
		msgboardService.save(msgboard);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			msgboardService.delete(id);
			map.put("state", "success");
			map.put("msg", "删除成功");
		} catch (Exception e) {
			map.put("state", "error");
			map.put("msg", "删除失败，外键约束");
		}
        return map;
	}

	@RequestMapping(value = "/get/{id}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable Long id ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("object", msgboardService.find(id));
		map.put("state", "success");
		map.put("msg", "成功");
		return map;
	}
}
