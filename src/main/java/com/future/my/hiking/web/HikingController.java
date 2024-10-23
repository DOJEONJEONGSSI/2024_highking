package com.future.my.hiking.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HikingController {
	@RequestMapping("/hiking")
	public String hikingView() {
		return "map/hiking";
	}
}
