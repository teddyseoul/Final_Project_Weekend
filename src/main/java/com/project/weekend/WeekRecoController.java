package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.festi.after.AfterDTO;
import com.project.weekend.board.festi.after.AfterService;
import com.project.weekend.board.festi.dates.DatesDTO;
import com.project.weekend.board.festi.dates.DatesService;
import com.project.weekend.board.festi.festiQna.FestiQnaDTO;
import com.project.weekend.board.festi.festiQna.FestiQnaService;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/WeekReco/")
public class WeekRecoController{
	
	@Inject
	private FestiService festiService;
	@Inject
	private FestiQnaService festiQnaService;
	@Inject
	private DatesService datesService;
	
	// 리스트 출력;
	@RequestMapping(value = "WeekRecoList", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FestiDTO> list = festiService.getWeekRecoList(pageMaker);
		mv.addObject("list", list);
		mv.setViewName("board/WeekRecoList");
		return mv;
	}
	// 글선택
	@RequestMapping(value = "WeekRecoSelect", method = RequestMethod.GET)
	public ModelAndView getSelect(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getWeekRecoSelect(num);
		mv.addObject("list", festiDTO);
		mv.setViewName("board/WeekRecoSelect");
		return mv;
	}
	// 글쓰기;
	@RequestMapping(value = "WeekRecoWrite", method = RequestMethod.POST)
	public void setWrite() throws Exception{
	}
	// 글수정;
	// 글수정 폼으로;
	@RequestMapping(value = "WeekRecoUpdate", method = RequestMethod.GET)
	public ModelAndView setUpdate(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		FestiDTO festiDTO = festiService.getWeekRecoSelect(num);
		mv.addObject("board", festiDTO);
		mv.setViewName("board/WeekRecoUpdate");
		return mv;
	}
	// 글수정 진행;
	@RequestMapping(value = "WeekRecoUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(FestiDTO festiDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setWeekRecoUpdate(festiDTO);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	} 
	// 글삭제;
	@RequestMapping(value = "WeekRecoDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(String num) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = festiService.setWeekRecoDelete(num);
		mv.addObject("result", result);
		mv.setViewName("./common/message");
		return mv;
	}
}
