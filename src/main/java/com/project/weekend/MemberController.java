﻿package com.project.weekend;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.weekend.member.MemberDTO;
import com.project.weekend.member.MemberService;
import com.project.weekend.naver.NaverLoginBO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping(value = "getjumin", method = RequestMethod.POST)
	@ResponseBody
	public int getjumin(MemberDTO memberDTO)throws Exception{
		System.out.println("getjuminpost");
		memberDTO = memberService.getjumin(memberDTO);
		int result=0;
		if(memberDTO==null) {

		}else {
			result=1;
		}
		return result;
	}
	
	@RequestMapping(value = "getId", method = RequestMethod.POST)
	@ResponseBody
	public int getId(MemberDTO memberDTO)throws Exception{
		memberDTO = memberService.getId(memberDTO);
		int result = 0;
		if(memberDTO==null) {
			return result;
		}else {
			result = 1;
		}
		return result;
	}
	
	@RequestMapping(value = "getNickname", method = RequestMethod.POST)
	@ResponseBody
	public int getNickname(MemberDTO memberDTO)throws Exception{
		memberDTO = memberService.getNickname(memberDTO);
		int result =0;
		if(memberDTO==null) {
			return result;
		}else {
			result =1 ;
		}
		return result;
	}

	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void setWrite(@ModelAttribute MemberDTO memberDTO)throws Exception{
	}
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView setWrite(MemberDTO memberDTO, MultipartFile photo, HttpSession session,BindingResult bindingResult)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO getId = memberService.getId(memberDTO);
		String message="회원가입 실패";
		if(getId!=null) {
			message="이미 존재하는 아이디입니다.";
			mv.setViewName("common/messageMove");
			mv.addObject("message", message);
			mv.addObject("path", "member/memberJoin");
		}else {
			int result = memberService.setWrite(memberDTO, photo, session);
			if(result>0) {
				message="회원가입 성공";
			}
			mv.setViewName("common/messageMove");
			mv.addObject("message", message);
			mv.addObject("path", "../");
			}

		return mv;
	}
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void getSelect(Model model,HttpSession session)throws Exception{}
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView getSelect(MemberDTO memberDTO, HttpSession session,HttpServletRequest request,HttpServletResponse response ,@CookieValue(value = "mcookie",required = false)Cookie mcookie)throws Exception{
		MemberDTO getId = memberService.getId(memberDTO);
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUpdate(memberDTO);
		MemberDTO getOverlap = memberService.getSelectOverlap(memberDTO);
		String message="존재 하지 않는 아이디 입니다.";
		if(getId==null) {
			mv.setViewName("common/messageMove");
			mv.addObject("message", message);
			mv.addObject("path", "./memberLogin");
		}else {
			if(getOverlap!=null) {
				message = "현재 로그인 상태인 아이디입니다.";
				mv.setViewName("common/messageMove");
				mv.addObject("message", message);
				mv.addObject("path", "./memberLogin");
			}else {
			memberDTO = memberService.getSelect(memberDTO);
			message="로그인 실패";
			if(result==1) {	
				if(memberDTO != null) {
					if(memberDTO.getCount()>6) {
						message = "로그인 횟수 제한";	
						mv.setViewName("common/messageMove");
						mv.addObject("message", message);
						mv.addObject("path", "../");
					}else {
						session.setAttribute("member", memberDTO);
						session.setAttribute("grade", memberDTO.getGrade());
						int zero = memberService.setUpdatezero(memberDTO);
						message = "로그인 성공";	
						mv.setViewName("common/messageMove");
						mv.addObject("message", message);
						mv.addObject("path", "../");
					}
				}else {
					mv.setViewName("common/messageMove");
					mv.addObject("message", message);
					mv.addObject("path", "./memberLogin");
				}
			}else {
				
			}
		}
		}
		return mv;
	}	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void getAgree()throws Exception{}
	@RequestMapping(value = "memberAgree", method = RequestMethod.POST)
	public String getAgree(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String memberAgree = "member";
		session.setAttribute("memberAgree", memberAgree);
		return "redirect:./memberJoin";
		
	}
	
    @RequestMapping(value = "NaverLogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        System.out.println("들어옴");
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("들어옴");
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "./memberLogin";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
    
        return "./memberLogin";
    }
	
	
	
	@RequestMapping(value = "memberLogout", method = RequestMethod.GET)
	public String logout(String id, HttpSession session, MemberDTO memberDTO)throws Exception{
		
		memberService.setUpdateoverlap(memberDTO);
		session.invalidate();
		return "redirect:../";
	}
	
	

}
