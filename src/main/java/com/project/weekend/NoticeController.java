package com.project.weekend;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.weekend.board.BoardDTO;
import com.project.weekend.board.notice.NoticeDAOImpl;
import com.project.weekend.board.notice.NoticeDTO;
import com.project.weekend.board.notice.NoticeServiceImpl;
import com.project.weekend.file.FileDTO;
import com.project.weekend.util.PageMaker;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	
	@Inject
	private NoticeServiceImpl noticeSerivceImpl;
	private static final String boardTitle = "공지";
	
	/*공지 글쓰기*/
	// 글쓰기 폼으로 이동 - admin
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public ModelAndView noticeWrite(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		mv.addObject("topCount", top.size());
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/noticeWrite");
		return mv;
	}
	
	// 글쓰기 프로세스 진행 - admin
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{

		ModelAndView mv = new ModelAndView();
		String path = "./noticeList";
		String message = "글 작성에 실패했어요";
		int result = noticeSerivceImpl.setWrite(boardDTO, filelist, session);
		if(result>0) {
			mv.setViewName("redirect:./noticeList");
		} else {
			mv.addObject("message", message);
			mv.addObject("path", path);
			mv.setViewName("common/messageMove");			
		}
		
		return mv;
	}
	
	/*공지 업데이트*/
	// 업데이트 폼으로 이동 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session);
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		mv.addObject("topCount", top.size());
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	
	// 업데이트 프로세스 진행 - admin
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(BoardDTO boardDTO, List<MultipartFile> filelist, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "redirect:./noticeList";
	
		int result = noticeSerivceImpl.setUpdate(boardDTO, filelist, session);
		if(result>0) {
			
			mv.setViewName(path);
		} else {
			//mv.setViewName("redirect:./noticeSelect?num="+boardDTO.getNum());
			
			mv.setViewName(path);
		}
		return mv;
	}
	
	// 공지 삭제 - admin
	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(String num, HttpSession session) throws Exception{
		String path = "./boardSelect?num="+num;
		String message = "실패";
		int res = noticeSerivceImpl.setDelete(num, session);
		if(res>0) {
			path = "redirect:./noticeList";
			message="성공";
		}
		System.out.println(message);
		return path;
	}
	
	// 공지글보기 - all
	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView noticeSelect(String num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();

		BoardDTO boardDTO = noticeSerivceImpl.getSelect(num, session);
		
		mv.addObject("dto", boardDTO);
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.setViewName("board/boardSelect");
		
		return mv;
	}
	
	// 공지리스트 - all
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = noticeSerivceImpl.getList(pageMaker, session);
		List<BoardDTO> top = noticeSerivceImpl.getTopList();
		mv.addObject("board", "notice");
		mv.addObject("boardTitle", boardTitle);
		mv.addObject("list", list);
		mv.addObject("top", top);
		mv.addObject("pager",pageMaker);
		mv.setViewName("board/boardList");
		return mv;
	}
	
}
