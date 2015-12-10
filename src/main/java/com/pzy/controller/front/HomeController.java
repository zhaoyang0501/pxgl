package com.pzy.controller.front;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Fee;
import com.pzy.entity.Lesson;
import com.pzy.entity.MsgBoard;
import com.pzy.entity.Notice;
import com.pzy.entity.Plan;
import com.pzy.entity.Score;
import com.pzy.entity.User;
import com.pzy.entity.Weather;
import com.pzy.service.CityService;
import com.pzy.service.FeeService;
import com.pzy.service.LessonService;
import com.pzy.service.MsgBoardService;
import com.pzy.service.NoticeService;
import com.pzy.service.PlanService;
import com.pzy.service.ScoreService;
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
	private LessonService lessonService;
	@Autowired
	private FeeService feeService;
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private PlanService planService;
	@Autowired
	private MsgBoardService msgBoardService;
	@Autowired
	private CityService cityService;
	@Autowired
	private WeatherService weatherService;
	@InitBinder  
	protected void initBinder(HttpServletRequest request,  
	            ServletRequestDataBinder binder) throws Exception {   
	      binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));  
	}  
	
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("notices", noticeService.findAll());
		return "notice";
	}
	/***
	 * 关于
	 * @return
	 */
	@RequestMapping("about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("score")
	public String score(Model model) {
		model.addAttribute("lessons", lessonService.findAll());
		return "score";
	}
	
	@RequestMapping(value = "score" ,method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> score(Long lessonid, Model model,HttpSession httpSession) throws ParseException {
		Lesson lesson=null;
		if(lessonid!=null)
			lesson=lessonService.find(lessonid);
		List<Score> scores=scoreService.findAll(lesson,(User)httpSession.getAttribute("user"));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("scores", scores);
		return map;
	}
	@RequestMapping("fee")
	public String fee(Model model) {
		return "fee";
	}
	@RequestMapping("notice")
	public String notice(Model model) {
		model.addAttribute("notices", noticeService.findAll());
		return "notice";
	}
	@RequestMapping(value = "fee" ,method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> fee(String year, Model model,HttpSession httpSession) throws ParseException {
		List<Fee> scores=feeService.findAll(year,(User)httpSession.getAttribute("user"));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("fees", scores);
		return map;
	}
	@RequestMapping("plan")
	public String plan(Model model) {
		return "plan";
	}
	@RequestMapping(value = "plan" ,method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> plan(Date start,Date end, Model model,HttpSession httpSession) throws ParseException {
		List<Plan> plans=planService.findAll(start,end);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("plans", plans);
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
			return "notice";
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
		return "notice";
	}
	
	@ModelAttribute
	public void getNotice(Model model) {
		List<Notice> list= noticeService.findAll();
			model.addAttribute("notice", list==null||list.size()==0?null:list.get(0));
	}
}

