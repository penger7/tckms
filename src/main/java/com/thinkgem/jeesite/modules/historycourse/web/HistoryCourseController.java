/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.historycourse.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.changmotongji.entity.Changmo;
import com.thinkgem.jeesite.modules.changmotongji.service.ChangmoService;
import com.thinkgem.jeesite.modules.course.dao.CourseHuiyingDao;
import com.thinkgem.jeesite.modules.course.dao.CourseShenduDao;
import com.thinkgem.jeesite.modules.course.dao.CourseSiheDao;
import com.thinkgem.jeesite.modules.course.dao.CourseStDao;
import com.thinkgem.jeesite.modules.course.dao.CourseYouxiaoxingDao;
import com.thinkgem.jeesite.modules.course.entity.Course;
import com.thinkgem.jeesite.modules.course.entity.CourseHuiying;
import com.thinkgem.jeesite.modules.course.entity.CourseShendu;
import com.thinkgem.jeesite.modules.course.entity.CourseSihe;
import com.thinkgem.jeesite.modules.course.entity.CourseSt;
import com.thinkgem.jeesite.modules.course.entity.CourseYouxiaoxing;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseHuiyingDao;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseShenduDao;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseSiheDao;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseStDao;
import com.thinkgem.jeesite.modules.historycourse.dao.HistoryCourseYouxiaoxingDao;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourse;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseHuiying;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseShendu;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseSihe;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseSt;
import com.thinkgem.jeesite.modules.historycourse.entity.HistoryCourseYouxiaoxing;
import com.thinkgem.jeesite.modules.historycourse.service.HistoryCourseService;

/**
 * history_course_dataController
 * @author wp
 * @version 2016-10-05
 */
@Controller
@RequestMapping(value = "${adminPath}/historycourse/historycourse")
public class HistoryCourseController extends BaseController {

	@Autowired
	private HistoryCourseService historyCourseService;
	@Autowired
	private HistoryCourseSiheDao course4matDao;
	@Autowired
	private HistoryCourseYouxiaoxingDao coursequestionDao;
	@Autowired
	private HistoryCourseHuiyingDao courseresponseDao;
	@Autowired
	private HistoryCourseShenduDao coursedialogueDao;
	@Autowired
	private HistoryCourseStDao coursestDao;
	@Autowired
	private ChangmoService changmoService;
	
	
	@ModelAttribute
	public HistoryCourse get(@RequestParam(required=false) String id) {
		HistoryCourse entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = historyCourseService.get(id);
		}
		if (entity == null){
			entity = new HistoryCourse();
		}
		return entity;
	}
	
	@RequiresPermissions("historycourse:historycourse:view")
	@RequestMapping(value = {"list", ""})
	public String list(HistoryCourse historyCourse, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HistoryCourse> page = historyCourseService.findPage(new Page<HistoryCourse>(request, response), historyCourse); 
		model.addAttribute("page", page);
		return "modules/historycourse/historyCourseList";
	}

	@RequiresPermissions("historycourse:historycourse:view")
	@RequestMapping(value = "form")
	public String form(HistoryCourse historyCourse, Model model) {
		model.addAttribute("historyCourse", historyCourse);
		return "modules/historycourse/historyCourseForm";
	}
	
	@RequiresPermissions("historycourse:historycourse:edit")
	@RequestMapping(value = "drawall")
	public String drawAll(HistoryCourse historycourse, Model model) {
		model.addAttribute("historycourse", historycourse);
		return "modules/historycourse/historycourseRecordChart";
	}

	@RequiresPermissions("historycourse:historycourse:edit")
	@ResponseBody
	@RequestMapping(value = "regular", method = RequestMethod.GET)
	public Map<String, Object> getRegular(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		System.out.println(request.getParameter("id").toString());
		HistoryCourse course = historyCourseService.get(request.getParameter("id").toString());
		List<HistoryCourseSt> sts = coursestDao.findList(new HistoryCourseSt(course));
		HistoryCourseSt st = null;
		if (sts.size() > 0) {
			st = sts.get(0);
			if (st.getJiaoxueleixing().equals(""))
				map.put("result", "error");
			else {
				Changmo cm = changmoService.find(course);
				map.put("regular", cm);
				
				map.put("course", course);
				List<HistoryCourseSihe> _4mats = course4matDao.findList(new HistoryCourseSihe(course));
				HistoryCourseSihe _4mat = null;
				if (_4mats.size() > 0)
					_4mat = _4mats.get(0);
				else
					_4mat = new HistoryCourseSihe();
				map.put("_4mat", _4mat);
				
				List<HistoryCourseYouxiaoxing> questions = coursequestionDao.findList(new HistoryCourseYouxiaoxing(course));
				HistoryCourseYouxiaoxing question = null;
				if (questions.size() > 0)
					question = questions.get(0);
				else
					question = new HistoryCourseYouxiaoxing();
				map.put("question", question);
				
				List<HistoryCourseHuiying> resps = courseresponseDao.findList(new HistoryCourseHuiying(course));
				HistoryCourseHuiying resp = null;
				if (resps.size() > 0)
					resp = resps.get(0);
				else
					resp = new HistoryCourseHuiying();
				map.put("resp", resp);
				
				List<HistoryCourseShendu> dialogues = coursedialogueDao.findList(new HistoryCourseShendu(course));
				HistoryCourseShendu dialogue = null;
				if (dialogues.size() > 0)
					dialogue = dialogues.get(0);
				else
					dialogue = new HistoryCourseShendu();
				map.put("dialogue", dialogue);
				
				map.put("st", st);
			}
		} else {
			map.put("result", "error");
		}
	
		return map;
	}
	
	@RequiresPermissions("historycourse:historycourse:edit")
	@RequestMapping(value = "updateregular")
	public String updateregular(HistoryCourse course, Model model,RedirectAttributes redirectAttributes) {
		//1.提取常模表中数据。
		List<Changmo> changmos = changmoService.findList(new Changmo());
		System.out.println("测试1:执行点");
		
		for(int i=0;i<changmos.size();i++){
			//2.根据常模类型提取课程列表。
			Changmo cm = changmos.get(i);
			//"0":查询时过滤为1的课
			HistoryCourse hc = new HistoryCourse("0",cm.getXueduan(),cm.getXuekeleixing(),cm.getJiaoxueleixing());
			
			List<HistoryCourse> courses = historyCourseService.findList(hc);

			int newCourseQuantity = 0;
			double k = 0;
			
			double ch = 0;
	        double rt = 0;      
	        double rs = 0;      
	       
	        double yyhy = 0;    
	        double fyyhy = 0;   
	        double kdhy = 0;    
	        double fdhy = 0;    
	        double why = 0;     
	        double ddxshdd = 0; 
	        double cfhdhjs = 0; 
	        
	        double glxwt = 0;   
	        double jyxwt = 0;   
	        double tlxwt = 0;   
	        double czxwt = 0;   
	        double ppxwt = 0;   
	        double dm = 0;      
	        double rxsqd = 0;   
	        double jjszd = 0;   
	        double jwjszd = 0;  
	        double glxxtcwt = 0;
	        double jtqd = 0;    
	        double tlhhb = 0;   
	        double gbhd = 0;    
	        double zyd = 0;     
	        double whd = 0;     
	        double pdsf = 0;    
	        double rzjyxhd = 0; 
	        double tlxhd = 0;   
	        double czpjxhd = 0; 
	       
	        double sh = 0;      
	        double wh = 0;      
	        double ruh = 0;     
	        double ruoh = 0;    
	        
	        double sdy = 0;     
	        double sder = 0;    
	        double sds = 0;     
	        double sdsi = 0;    
	        double sdw = 0;    
	        System.out.println("i:"+i);
	        System.out.println("测试2：执行点"+"newCourseQuantity:"+newCourseQuantity+"k:"+k+"ch:"+ch);
	        System.out.println(courses.size());
			for (int j=0;j<courses.size();j++) {
				System.out.println("j"+j);
				HistoryCourse c = courses.get(j);
				//只加入没有计算过常模的数据
				
//				if(c.getRegularFlag().equals("1"))
//					continue;				
				//标记课程信息为已计入常模，如果是东城区则先不标记，后面计算东城区常模时再标记。
				if(c.getArea().getId().equals("110101")){
					System.out.println("东城区课程，跳过不标记。");
				}else{
					System.out.println("地区编号："+c.getArea().getId());
					c.setRegularFlag("1");
					historyCourseService.save(c);
				}
				newCourseQuantity++;
				
				System.out.println("测试3：执行点"+"newCourseQuantity:"+newCourseQuantity);
				
				List<HistoryCourseSihe> _4mats = course4matDao.findList(new HistoryCourseSihe(c));
				HistoryCourseSihe _4mat = null;
				if (_4mats.size() > 0)
					_4mat = _4mats.get(0);
				else
					_4mat = new HistoryCourseSihe();
				sh = sh + Double.parseDouble(_4mat.getSh());
				wh = wh + Double.parseDouble(_4mat.getWh());
				ruh = ruh + Double.parseDouble(_4mat.getRuh());
				ruoh = ruoh + Double.parseDouble(_4mat.getRuoh());
				
				List<HistoryCourseYouxiaoxing> questions = coursequestionDao.findList(new HistoryCourseYouxiaoxing(c));
				HistoryCourseYouxiaoxing question = null;
				if (questions.size() > 0)
					question = questions.get(0);
				else
					question = new HistoryCourseYouxiaoxing();
				glxwt = glxwt + Double.parseDouble(question.getGlxwt());
				jyxwt = jyxwt + Double.parseDouble(question.getJyxwt());
				tlxwt = tlxwt + Double.parseDouble(question.getTlxwt());
				czxwt = czxwt + Double.parseDouble(question.getCzxwt());
				ppxwt = ppxwt + Double.parseDouble(question.getPpxwt());
				dm = dm +Double.parseDouble(question.getDm());
				rxsqd = rxsqd + Double.parseDouble(question.getRxsqd());
				jjszd = jjszd + Double.parseDouble(question.getJjszd());
				jwjszd = jwjszd + Double.parseDouble(question.getJwjszd());
				glxxtcwt = glxxtcwt +Double.parseDouble(question.getGlxxtcwt());
				jtqd = jtqd + Double.parseDouble(question.getJtqd());
				tlhhb = tlhhb + Double.parseDouble(question.getTlhhb());
				gbhd = gbhd + Double.parseDouble(question.getGbhd());
				zyd = zyd + Double.parseDouble(question.getZyd());
				whd = whd + Double.parseDouble(question.getWhd());
				pdsf = pdsf + Double.parseDouble(question.getPdsf());
				rzjyxhd = rzjyxhd + Double.parseDouble(question.getRzjyxhd());
				tlxhd = tlxhd + Double.parseDouble(question.getTlxhd());
				czpjxhd = czpjxhd + Double.parseDouble(question.getCzpjxhd());
				
				List<HistoryCourseHuiying> resps = courseresponseDao.findList(new HistoryCourseHuiying(c));
				HistoryCourseHuiying resp = null;
				if (resps.size() > 0)
					resp = resps.get(0);
				else
					resp = new HistoryCourseHuiying();
				yyhy = yyhy + Double.parseDouble(resp.getYyhy());
				fyyhy = fyyhy + Double.parseDouble(resp.getFyyhy());
				kdhy = kdhy + Double.parseDouble(resp.getKdhy());
				fdhy = fdhy + Double.parseDouble(resp.getFdhy());
				why = why + Double.parseDouble(resp.getWhy());
				ddxshdd = ddxshdd + Double.parseDouble(resp.getDdxshdd());
				cfhdhjs = cfhdhjs + Double.parseDouble(resp.getCfhdhjs());
				
				List<HistoryCourseShendu> dialogues = coursedialogueDao.findList(new HistoryCourseShendu(c));
				HistoryCourseShendu dialogue = null;
				if (dialogues.size() > 0)
					dialogue = dialogues.get(0);
				else
					dialogue = new HistoryCourseShendu();
				sdy = sdy + Double.parseDouble(dialogue.getSdy());
				sder = sder + Double.parseDouble(dialogue.getSder());
				sds = sds + Double.parseDouble(dialogue.getSds());
				sdsi = sdsi + Double.parseDouble(dialogue.getSdsi());
				sdw = sdw + Double.parseDouble(dialogue.getSdw());
				
				List<HistoryCourseSt> sts = coursestDao.findList(new HistoryCourseSt(c));
				HistoryCourseSt st = null;				
				if (sts.size() > 0)
					st = sts.get(0);
				else
					st = new HistoryCourseSt();
				ch = ch + Double.parseDouble(st.getCh());
				rt = rt + Double.parseDouble(st.getRt());
				rs = rs + Double.parseDouble(st.getRs());
				
			}
			//3.根据常模数据，课程列表数据；计算新常模。
			if(newCourseQuantity==0){
				System.out.println("测试4：没有新课加入，跳过本次循环！");
			}else{
				ch = ch/newCourseQuantity;
				rt = rt/newCourseQuantity;
				rs = rs/newCourseQuantity;
				
				k = yyhy + fyyhy;
				yyhy = yyhy/k;
				fyyhy = fyyhy/k;
				
				k = kdhy+fdhy+why+ddxshdd+cfhdhjs;
				kdhy = kdhy/k;
				fdhy = fdhy/k;
				why = why/k;
				ddxshdd = ddxshdd/k;
				cfhdhjs = cfhdhjs/k;
				
				k = glxwt+jyxwt+tlxwt+czxwt+ppxwt;
				glxwt = glxwt/k;
				jyxwt = jyxwt/k;
				tlxwt = tlxwt/k;
				czxwt = czxwt/k;
				ppxwt = ppxwt/k;
			        
				k = dm+rxsqd+jjszd+jwjszd+glxxtcwt;
				dm = dm/k;
				rxsqd = rxsqd/k;
				jjszd = jjszd/k;
				jwjszd = jwjszd/k;
				glxxtcwt = glxxtcwt/k;
				
				k = jtqd+tlhhb+gbhd+zyd;
				jtqd = jtqd/k;
				tlhhb = tlhhb/k;
				gbhd = gbhd/k;
				zyd = zyd/k;
				
				k = whd+pdsf+rzjyxhd+tlxhd+czpjxhd;
				whd = whd/k;
				pdsf = pdsf/k;
				rzjyxhd = rzjyxhd/k;
				tlxhd = tlxhd/k;
				czpjxhd = czpjxhd/k;		
			        
				k = sh+wh+ruh+ruoh;
				sh = sh/k;
				wh = wh/k;
				ruh = ruh/k;
				ruoh = ruoh/k;
				
				k = sdy+sder+sds+sdsi+sdw;
				sdy = sdy/k;
				sder =sder/k;
				sds = sds/k;
				sdsi = sdsi/k;
				sdw = sdw/k;
			    System.out.println("测试4：执行点"+"ch:"+ch+"k:"+k+"newCourseQuantity"+newCourseQuantity);    	
				
				cm.setCh((ch*newCourseQuantity+cm.getCh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));	
				cm.setRt((rt*newCourseQuantity+cm.getRt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setRs((rs*newCourseQuantity+cm.getRs()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setYyhy((yyhy*newCourseQuantity+cm.getYyhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setFyyhy((fyyhy*newCourseQuantity+cm.getFyyhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setKdhy((kdhy*newCourseQuantity+cm.getKdhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setFdhy((fdhy*newCourseQuantity+cm.getFdhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setWhy((why*newCourseQuantity+cm.getWhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setDdxshdd((ddxshdd*newCourseQuantity+cm.getDdxshdd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setCfhdhjs((cfhdhjs*newCourseQuantity+cm.getCfhdhjs()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setGlxwt((glxwt*newCourseQuantity+cm.getGlxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setJyxwt((jyxwt*newCourseQuantity+cm.getJyxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setTlxwt((tlxwt*newCourseQuantity+cm.getTlxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setCzxwt((czxwt*newCourseQuantity+cm.getCzxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setPpxwt((ppxwt*newCourseQuantity+cm.getPpxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setDm((dm*newCourseQuantity+cm.getDm()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setRxsqd((rxsqd*newCourseQuantity+cm.getRxsqd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setJjszd((jjszd*newCourseQuantity+cm.getJjszd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setJwjszd((jwjszd*newCourseQuantity+cm.getJwjszd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setGlxxtcwt((glxxtcwt*newCourseQuantity+cm.getGlxxtcwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setJtqd((jtqd*newCourseQuantity+cm.getJtqd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setTlhhb((tlhhb*newCourseQuantity+cm.getTlhhb()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setGbhd((gbhd*newCourseQuantity+cm.getGbhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setZyd((zyd*newCourseQuantity+cm.getZyd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setWhd((whd*newCourseQuantity+cm.getWhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setPdsf((pdsf*newCourseQuantity+cm.getPdsf()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setRzjyxhd((rzjyxhd*newCourseQuantity+cm.getRzjyxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setTlxhd((tlxhd*newCourseQuantity+cm.getTlxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setCzpjxhd((czpjxhd*newCourseQuantity+cm.getCzpjxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSh((sh*newCourseQuantity+cm.getSh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setWh((wh*newCourseQuantity+cm.getWh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setRuh((ruh*newCourseQuantity+cm.getRuh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setRuoh((ruoh*newCourseQuantity+cm.getRuoh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSdy((sdy*newCourseQuantity+cm.getSdy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSder((sder*newCourseQuantity+cm.getSder()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSds((sds*newCourseQuantity+cm.getSds()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSdsi((sdsi*newCourseQuantity+cm.getSdsi()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				cm.setSdw((sdw*newCourseQuantity+cm.getSdw()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
				//4.写入新常模。	
				System.out.println("测试5：执行点"+"newCourseQuantity:"+newCourseQuantity+"cm.getQuantity():"+cm.getQuantity());
				
				cm.setQuantity(newCourseQuantity+cm.getQuantity());
				System.out.println("测试6："+cm.getArea().getId());
				if(cm.getArea().getId().equals("100000"))
					changmoService.save(cm);
			}
		}	
		
		
		//1.计算东城数据。				
				for(int i=0;i<changmos.size();i++){
					//2.根据常模类型提取课程列表。
					Changmo cm = changmos.get(i);
					//“0”：只提取未被计算过的课程。
					HistoryCourse hc = new HistoryCourse("0",cm.getXueduan(),cm.getXuekeleixing(),cm.getJiaoxueleixing());
					List<HistoryCourse> courses = historyCourseService.findList(hc);

					int newCourseQuantity = 0;
					double k = 0;
					
					double ch = 0;
			        double rt = 0;      
			        double rs = 0;      
			       
			        double yyhy = 0;    
			        double fyyhy = 0;   
			        double kdhy = 0;    
			        double fdhy = 0;    
			        double why = 0;     
			        double ddxshdd = 0; 
			        double cfhdhjs = 0; 
			        
			        double glxwt = 0;   
			        double jyxwt = 0;   
			        double tlxwt = 0;   
			        double czxwt = 0;   
			        double ppxwt = 0;   
			        double dm = 0;      
			        double rxsqd = 0;   
			        double jjszd = 0;   
			        double jwjszd = 0;  
			        double glxxtcwt = 0;
			        double jtqd = 0;    
			        double tlhhb = 0;   
			        double gbhd = 0;    
			        double zyd = 0;     
			        double whd = 0;     
			        double pdsf = 0;    
			        double rzjyxhd = 0; 
			        double tlxhd = 0;   
			        double czpjxhd = 0; 
			       
			        double sh = 0;      
			        double wh = 0;      
			        double ruh = 0;     
			        double ruoh = 0;    
			        
			        double sdy = 0;     
			        double sder = 0;    
			        double sds = 0;     
			        double sdsi = 0;    
			        double sdw = 0;    
			        System.out.println("测试2：执行点"+"newCourseQuantity:"+newCourseQuantity+"k:"+k+"ch"+ch);
					for (int j=0;j<courses.size();j++) {
						
						HistoryCourse c = courses.get(j);
						//只加入没有计算过常模的数据
//						if(c.getRegularFlag().equals("1"))
//							continue;				
						//标记东城区课程信息。						
						c.setRegularFlag("1");
						historyCourseService.save(c);
						newCourseQuantity++;
						
						System.out.println("测试3：执行点"+newCourseQuantity);
						
						List<HistoryCourseSihe> _4mats = course4matDao.findList(new HistoryCourseSihe(c));
						HistoryCourseSihe _4mat = null;
						if (_4mats.size() > 0)
							_4mat = _4mats.get(0);
						else
							_4mat = new HistoryCourseSihe();
						sh = sh + Double.parseDouble(_4mat.getSh());
						wh = wh + Double.parseDouble(_4mat.getWh());
						ruh = ruh + Double.parseDouble(_4mat.getRuh());
						ruoh = ruoh + Double.parseDouble(_4mat.getRuoh());
						
						List<HistoryCourseYouxiaoxing> questions = coursequestionDao.findList(new HistoryCourseYouxiaoxing(c));
						HistoryCourseYouxiaoxing question = null;
						if (questions.size() > 0)
							question = questions.get(0);
						else
							question = new HistoryCourseYouxiaoxing();
						glxwt = glxwt + Double.parseDouble(question.getGlxwt());
						jyxwt = jyxwt + Double.parseDouble(question.getJyxwt());
						tlxwt = tlxwt + Double.parseDouble(question.getTlxwt());
						czxwt = czxwt + Double.parseDouble(question.getCzxwt());
						ppxwt = ppxwt + Double.parseDouble(question.getPpxwt());
						dm = dm +Double.parseDouble(question.getDm());
						rxsqd = rxsqd + Double.parseDouble(question.getRxsqd());
						jjszd = jjszd + Double.parseDouble(question.getJjszd());
						jwjszd = jwjszd + Double.parseDouble(question.getJwjszd());
						glxxtcwt = glxxtcwt +Double.parseDouble(question.getGlxxtcwt());
						jtqd = jtqd + Double.parseDouble(question.getJtqd());
						tlhhb = tlhhb + Double.parseDouble(question.getTlhhb());
						gbhd = gbhd + Double.parseDouble(question.getGbhd());
						zyd = zyd + Double.parseDouble(question.getZyd());
						whd = whd + Double.parseDouble(question.getWhd());
						pdsf = pdsf + Double.parseDouble(question.getPdsf());
						rzjyxhd = rzjyxhd + Double.parseDouble(question.getRzjyxhd());
						tlxhd = tlxhd + Double.parseDouble(question.getTlxhd());
						czpjxhd = czpjxhd + Double.parseDouble(question.getCzpjxhd());
						
						List<HistoryCourseHuiying> resps = courseresponseDao.findList(new HistoryCourseHuiying(c));
						HistoryCourseHuiying resp = null;
						if (resps.size() > 0)
							resp = resps.get(0);
						else
							resp = new HistoryCourseHuiying();
						yyhy = yyhy + Double.parseDouble(resp.getYyhy());
						fyyhy = fyyhy + Double.parseDouble(resp.getFyyhy());
						kdhy = kdhy + Double.parseDouble(resp.getKdhy());
						fdhy = fdhy + Double.parseDouble(resp.getFdhy());
						why = why + Double.parseDouble(resp.getWhy());
						ddxshdd = ddxshdd + Double.parseDouble(resp.getDdxshdd());
						cfhdhjs = cfhdhjs + Double.parseDouble(resp.getCfhdhjs());
						
						List<HistoryCourseShendu> dialogues = coursedialogueDao.findList(new HistoryCourseShendu(c));
						HistoryCourseShendu dialogue = null;
						if (dialogues.size() > 0)
							dialogue = dialogues.get(0);
						else
							dialogue = new HistoryCourseShendu();
						sdy = sdy + Double.parseDouble(dialogue.getSdy());
						sder = sder + Double.parseDouble(dialogue.getSder());
						sds = sds + Double.parseDouble(dialogue.getSds());
						sdsi = sdsi + Double.parseDouble(dialogue.getSdsi());
						sdw = sdw + Double.parseDouble(dialogue.getSdw());
						
						List<HistoryCourseSt> sts = coursestDao.findList(new HistoryCourseSt(c));
						HistoryCourseSt st = null;				
						if (sts.size() > 0)
							st = sts.get(0);
						else
							st = new HistoryCourseSt();
						ch = ch + Double.parseDouble(st.getCh());
						rt = rt + Double.parseDouble(st.getRt());
						rs = rs + Double.parseDouble(st.getRs());
						
					}
					//3.根据常模数据，课程列表数据；计算新常模。
					if(newCourseQuantity==0){
						System.out.println("测试4：没有新课加入，跳过本次循环！");
					}else{
						ch = ch/newCourseQuantity;
						rt = rt/newCourseQuantity;
						rs = rs/newCourseQuantity;
						
						k = yyhy + fyyhy;
						yyhy = yyhy/k;
						fyyhy = fyyhy/k;
						
						k = kdhy+fdhy+why+ddxshdd+cfhdhjs;
						kdhy = kdhy/k;
						fdhy = fdhy/k;
						why = why/k;
						ddxshdd = ddxshdd/k;
						cfhdhjs = cfhdhjs/k;
						
						k = glxwt+jyxwt+tlxwt+czxwt+ppxwt;
						glxwt = glxwt/k;
						jyxwt = jyxwt/k;
						tlxwt = tlxwt/k;
						czxwt = czxwt/k;
						ppxwt = ppxwt/k;
					        
						k = dm+rxsqd+jjszd+jwjszd+glxxtcwt;
						dm = dm/k;
						rxsqd = rxsqd/k;
						jjszd = jjszd/k;
						jwjszd = jwjszd/k;
						glxxtcwt = glxxtcwt/k;
						
						k = jtqd+tlhhb+gbhd+zyd;
						jtqd = jtqd/k;
						tlhhb = tlhhb/k;
						gbhd = gbhd/k;
						zyd = zyd/k;
						
						k = whd+pdsf+rzjyxhd+tlxhd+czpjxhd;
						whd = whd/k;
						pdsf = pdsf/k;
						rzjyxhd = rzjyxhd/k;
						tlxhd = tlxhd/k;
						czpjxhd = czpjxhd/k;		
					        
						k = sh+wh+ruh+ruoh;
						sh = sh/k;
						wh = wh/k;
						ruh = ruh/k;
						ruoh = ruoh/k;
						
						k = sdy+sder+sds+sdsi+sdw;
						sdy = sdy/k;
						sder =sder/k;
						sds = sds/k;
						sdsi = sdsi/k;
						sdw = sdw/k;
					    System.out.println("测试4：执行点"+"ch:"+ch+"k:"+k+"newCourseQuantity"+newCourseQuantity);    	
						
						cm.setCh((ch*newCourseQuantity+cm.getCh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));	
						cm.setRt((rt*newCourseQuantity+cm.getRt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setRs((rs*newCourseQuantity+cm.getRs()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setYyhy((yyhy*newCourseQuantity+cm.getYyhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setFyyhy((fyyhy*newCourseQuantity+cm.getFyyhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setKdhy((kdhy*newCourseQuantity+cm.getKdhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setFdhy((fdhy*newCourseQuantity+cm.getFdhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setWhy((why*newCourseQuantity+cm.getWhy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setDdxshdd((ddxshdd*newCourseQuantity+cm.getDdxshdd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setCfhdhjs((cfhdhjs*newCourseQuantity+cm.getCfhdhjs()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setGlxwt((glxwt*newCourseQuantity+cm.getGlxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setJyxwt((jyxwt*newCourseQuantity+cm.getJyxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setTlxwt((tlxwt*newCourseQuantity+cm.getTlxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setCzxwt((czxwt*newCourseQuantity+cm.getCzxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setPpxwt((ppxwt*newCourseQuantity+cm.getPpxwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setDm((dm*newCourseQuantity+cm.getDm()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setRxsqd((rxsqd*newCourseQuantity+cm.getRxsqd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setJjszd((jjszd*newCourseQuantity+cm.getJjszd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setJwjszd((jwjszd*newCourseQuantity+cm.getJwjszd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setGlxxtcwt((glxxtcwt*newCourseQuantity+cm.getGlxxtcwt()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setJtqd((jtqd*newCourseQuantity+cm.getJtqd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setTlhhb((tlhhb*newCourseQuantity+cm.getTlhhb()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setGbhd((gbhd*newCourseQuantity+cm.getGbhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setZyd((zyd*newCourseQuantity+cm.getZyd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setWhd((whd*newCourseQuantity+cm.getWhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setPdsf((pdsf*newCourseQuantity+cm.getPdsf()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setRzjyxhd((rzjyxhd*newCourseQuantity+cm.getRzjyxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setTlxhd((tlxhd*newCourseQuantity+cm.getTlxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setCzpjxhd((czpjxhd*newCourseQuantity+cm.getCzpjxhd()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSh((sh*newCourseQuantity+cm.getSh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setWh((wh*newCourseQuantity+cm.getWh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setRuh((ruh*newCourseQuantity+cm.getRuh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setRuoh((ruoh*newCourseQuantity+cm.getRuoh()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSdy((sdy*newCourseQuantity+cm.getSdy()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSder((sder*newCourseQuantity+cm.getSder()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSds((sds*newCourseQuantity+cm.getSds()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSdsi((sdsi*newCourseQuantity+cm.getSdsi()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						cm.setSdw((sdw*newCourseQuantity+cm.getSdw()*cm.getQuantity())/(newCourseQuantity+cm.getQuantity()));
						//4.写入新常模。	
						System.out.println("测试5：执行点"+"newCourseQuantity:"+newCourseQuantity+"cm.getQuantity():"+cm.getQuantity());
						
						
						System.out.println("测试6："+cm.getArea().getId());
						if(cm.getArea().getId().equals("110101"))
							changmoService.save(cm);
					}
				}	
		
		addMessage(redirectAttributes, "更新常模成功");
		return "redirect:"+Global.getAdminPath()+"/changmotongji/changmo/?repage";
		
	}
	
	@RequiresPermissions("historycourse:historycourse:edit")
	@RequestMapping(value = "save")
	public String save(HistoryCourse historyCourse, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, historyCourse)){
			return form(historyCourse, model);
		}
		historyCourseService.save(historyCourse);
		addMessage(redirectAttributes, "保存课程成功");
		return "redirect:"+Global.getAdminPath()+"/historycourse/historycourse/?repage";
	}
	
	@RequiresPermissions("historycourse:historycourse:edit")
	@RequestMapping(value = "delete")
	public String delete(HistoryCourse historyCourse, RedirectAttributes redirectAttributes) {
		historyCourseService.delete(historyCourse);
		addMessage(redirectAttributes, "删除课程成功");
		return "redirect:"+Global.getAdminPath()+"/historycourse/historycourse/?repage";
	}

}