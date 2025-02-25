package com.project.weekend.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;



public class DeleteInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	private FestiService festiService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		boolean result=false;
		String writer = request.getParameter("writer");
		String num = request.getParameter("num");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("memberNickname");
		Object grade = session.getAttribute("grade");
		if(obj!=null) {
			if(grade.equals(3)) {
				result=true;
				return result;
			}else {
			if(grade.equals(2)){
				if(obj.equals(writer)) {
					result= true;
				}else {
					response.sendRedirect("../festi/festiSelect?num="+num);
				}
			}else {
				response.sendRedirect("../festi/festiSelect?num="+num);
			}
		}
		}else {
			response.sendRedirect("../festi/festiSelect?num="+num);
		}
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	

}
