package com.geopia.wallet_ncoin.Config.viewresolver;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

public class JsonViewResolver implements ViewResolver{

	private MappingJackson2JsonView view;

	public JsonViewResolver() {
		super();
		view = new MappingJackson2JsonView();
        view.setPrettyPrint(true);
	}

	
	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		// TODO Auto-generated method stub
		return view;
	}
}
