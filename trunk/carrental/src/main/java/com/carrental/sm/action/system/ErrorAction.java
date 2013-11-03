package com.carrental.sm.action.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "error")
public class ErrorAction {

	@RequestMapping(value = "/error", method = RequestMethod.POST)
	public String error() {
		return "error/500";
	}

	@RequestMapping(value = "/uploadError", method = RequestMethod.POST)
	public String uploadError() {
		return "error/uploadError";
	}
}
