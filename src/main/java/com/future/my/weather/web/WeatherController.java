package com.future.my.weather.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {
	@RequestMapping("/weather")
	public String weather() {
		return "map/weather";
	}
}
