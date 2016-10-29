/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.changmotongji.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.changmotongji.entity.Changmo;
import com.thinkgem.jeesite.modules.changmotongji.service.ChangmoService;

/**
 * 常模统计Controller
 * @author wp
 * @version 2016-10-05
 */
@Controller
@RequestMapping(value = "${adminPath}/changmotongji/changmo")
public class ChangmoController extends BaseController {

	@Autowired
	private ChangmoService changmoService;
	
	@ModelAttribute
	public Changmo get(@RequestParam(required=false) String id) {
		Changmo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = changmoService.get(id);
		}
		if (entity == null){
			entity = new Changmo();
		}
		return entity;
	}
	
	@RequiresPermissions("changmotongji:changmo:view")
	@RequestMapping(value = {"list", ""})
	public String list(Changmo changmo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Changmo> page = changmoService.findPage(new Page<Changmo>(request, response), changmo); 
		model.addAttribute("page", page);
		return "modules/changmotongji/changmoList";
	}

	@RequiresPermissions("changmotongji:changmo:view")
	@RequestMapping(value = "form")
	public String form(Changmo changmo, Model model) {
		model.addAttribute("changmo", changmo);
		return "modules/changmotongji/changmoForm";
	}

	@RequiresPermissions("changmotongji:changmo:edit")
	@RequestMapping(value = "save")
	public String save(Changmo changmo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, changmo)){
			return form(changmo, model);
		}
		changmoService.save(changmo);
		addMessage(redirectAttributes, "保存查询常模成功");
		return "redirect:"+Global.getAdminPath()+"/changmotongji/changmo/?repage";
	}
	

	
	@RequiresPermissions("changmotongji:changmo:edit")
	@RequestMapping(value = "delete")
	public String delete(Changmo changmo, RedirectAttributes redirectAttributes) {
		changmoService.delete(changmo);
		addMessage(redirectAttributes, "删除查询常模成功");
		return "redirect:"+Global.getAdminPath()+"/changmotongji/changmo/?repage";
	}

}