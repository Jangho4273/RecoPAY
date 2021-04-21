package com.spring.recopay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("Login Success");
		HttpSession session = request.getSession();

		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		System.out.println("ROLE NAMES: " + roleNames);
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String uri = "/";
		
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
		} else if (prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
		}
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(uri);
			return;
		}

		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect(uri);
			return;
		}
	}

}
