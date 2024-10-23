package com.future.my.common.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	@RequestMapping("/test")
	public String board() {
		return "map/test";
	}
}
