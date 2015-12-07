package com.pzy.controller.front;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.MsgBoard;
import com.pzy.entity.Notice;
import com.pzy.entity.User;
import com.pzy.entity.Weather;
import com.pzy.service.CityService;
import com.pzy.service.MsgBoardService;
import com.pzy.service.NoticeService;
import com.pzy.service.UserService;
import com.pzy.service.WeatherService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MsgBoardService msgBoardService;
	@Autowired
	private CityService cityService;
	@Autowired
	private WeatherService weatherService;
	@RequestMapping("index")
	public String index() {
		return "weather";
	}
	/***
	 * 关于
	 * @return
	 */
	@RequestMapping("about")
	public String about() {
		return "about";
	}
	/***
	 * 大气查询
	 * @return
	 */
	@RequestMapping(value = "weather" ,method = RequestMethod.GET)
	public String weather(Model model) {
		model.addAttribute("citys", cityService.findAll());
		return "weather";
	}
	/***
	 * 大气查询
	 * @return
	 * @throws ParseException 
	 */
	
	@RequestMapping(value = "weather" ,method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> weather(Integer cityid,String start,String end, Model model) throws ParseException {
		Date b=StringUtils.isBlank(start)?null:DateUtils.parseDate(start, "yyyy-MM-dd");
		Date e=StringUtils.isBlank(end)?null:DateUtils.parseDate(end, "yyyy-MM-dd");
		List<Weather> weathers=weatherService.findAll(b, e, cityid);
		List<String> dates=new ArrayList<String>();
		List<Double> tmpmax=new ArrayList<Double>();
		List<Double> tmpmin=new ArrayList<Double>();
		List<Double> aqi=new ArrayList<Double>();
		List<Double> pm25=new ArrayList<Double>();
		List<Double> sd=new ArrayList<Double>();
		
		for(Weather bean:weathers){
			dates.add(DateFormatUtils.format(bean.getNowDate(), "yyyy-MM-dd"));
			tmpmax.add(bean.getTemmax());
			tmpmin.add(bean.getTemmin());
			aqi.add(bean.getAqi());
			pm25.add(bean.getAqi());
			sd.add(bean.getSd());
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("dates", dates);
		map.put("tmpmax", tmpmax);
		map.put("tmpmin", tmpmin);
		map.put("sd", sd);
		map.put("aqi", aqi);
		map.put("pm25", pm25);
		map.put("weathers", weathers);
		return map;
	}
	/***
	 * 查看留言板
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "msgbox" ,method = RequestMethod.GET)
	public String msgbox(Model model ) {
		model.addAttribute("msgboards",msgBoardService.findAll());
		return "msgbox";
	}
	/***
	 * 发表留言板
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "msgbox" ,method = RequestMethod.POST)
	public String domsgbox(Model model,MsgBoard msgboard ,HttpSession httpSession) {
		httpSession.getAttribute("user");
		msgboard.setUser((User)httpSession.getAttribute("user"));
		msgboard.setCreateDate(new Date());
		msgBoardService.save(msgboard);
		model.addAttribute("msgboards",msgBoardService.findAll());
		return "msgbox";
	}
	
	/***
	 * 跳转到注册
	 * @return
	 */
	@RequestMapping(value = "register",method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	/***
	 * 提交注册信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String doregister(User user,Model model ) {
		model.addAttribute("tip", "注册成功，请登录");
		userService.save(user);
		return "login";
	}
	/***
	 * 登录跳转
	 * @return
	 */
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	/***
	 * 点击登录按钮
	 * @return
	 */
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String dologin(String username,String password,Model model,HttpSession httpSession ) {
		User user=userService.login(username, password);
		if(user==null){
			model.addAttribute("tip", "用户名密码不正确");
			return "login";
		}else{
			httpSession.setAttribute("user", user);
			model.addAttribute("citys", cityService.findAll());
			return "weather";
		}
	}
	/***
	 * 退出
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "loginout",method = RequestMethod.GET)
	public String loginout(HttpSession httpSession, Model model) {
		httpSession.removeAttribute("user");
		return "weather";
	}
	
	@ModelAttribute
	public void getNotice(Model model) {
		List<Notice> list= noticeService.findAll();
			model.addAttribute("notice", list==null||list.size()==0?null:list.get(0));
	}
}

