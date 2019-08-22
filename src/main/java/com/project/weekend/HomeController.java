package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.festi.FestiDTO;
import com.project.weekend.board.festi.FestiService;
import com.project.weekend.board.open.OpenService;
import com.project.weekend.util.PageMaker;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private OpenService opensService;
	@Inject
	private FestiService festiService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(PageMaker pageMaker, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> open = opensService.getList(pageMaker, session);
		List<FestiDTO> rank= festiService.getRankList(pageMaker);
		
		
		mv.addObject("open", open);
		mv.addObject("rank", rank);
		mv.setViewName("home");
		
		return mv;
	}
	
	
}
