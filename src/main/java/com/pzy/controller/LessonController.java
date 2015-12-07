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

import com.pzy.entity.Lesson;
import com.pzy.service.LessonService;


/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/lesson")
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@RequestMapping("index")
	public String index() {
		return "admin/lesson/index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, String lessonname
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Lesson> lessons = lessonService.findAll(pageNumber, pageSize, lessonname);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", lessons.getContent());
		map.put("iTotalRecords", lessons.getTotalElements());
		map.put("iTotalDisplayRecords", lessons.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Lesson lesson) {
		lesson.setCreateDate(new Date());
		lessonService.save(lesson);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(Lesson lesson) {
		lessonService.save(lesson);
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
			lessonService.delete(id);
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
		map.put("object", lessonService.find(id));
		map.put("state", "success");
		map.put("msg", "成功");
		return map;
	}
}
