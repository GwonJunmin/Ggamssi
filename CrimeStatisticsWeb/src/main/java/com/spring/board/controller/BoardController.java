package com.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageMaker;
import com.spring.board.domain.ReplyVo;
import com.spring.board.service.BoardService;
import com.spring.board.service.ReplyService;
import com.spring.board.vo.BoardVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ReplyService  replyService;

	// 게시글 목록 /board/list?menu_id = 1
	@GetMapping("/list")
	public ModelAndView list(BoardVo vo) {

		// 메뉴목록
		List<MenuVo> menuList = menuService.getMenuList();
		// 현재 메뉴이름 조회
		//int menu_id = vo.getMenu_id();
		//String menu_name = menuService.getMenu_name(menu_id);

		// 게시물 목록
		List<BoardVo> boardList = boardService.getBoardList(vo);
		// System.out.println(boardList);
		ModelAndView mv = new ModelAndView();
		//mv.addObject("menu_name", menu_name);
		mv.addObject("vo", vo);
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/list");
		return mv;

	}

	// 게시물 등록 /board/writeform?menu_id=1
	@GetMapping("/writeform")
	public ModelAndView writeform(BoardVo vo) {
		// 메뉴 목록 조회
		List<MenuVo> menuList = menuService.getMenuList();

		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("vo", vo);
		mv.setViewName("board/write");
		return mv;
	}

	@PostMapping("/write")
	public ModelAndView write(BoardVo vo) {
		boardService.insertBoard(vo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/listpage?page=1&perPageNum=10&menu_id=" + vo.getMenu_id());
		return mv;
	}
	// /Board/View?idx=4&menu_id=MENU01
	// 게시물 보기
	@GetMapping("/view")
	public  ModelAndView   view( BoardVo vo ) {
		
		// 게시물 조회 시 조회수 증가
		boardService.readCount(vo);
		
		// 메뉴 목록 조회
		List<MenuVo>  menuList  =  menuService.getMenuList();
		
		// 보여줄 게시물 내용을 조회
		BoardVo       boardVo  =   boardService.getView( vo );

		// 댓글 목록 조회
		List<ReplyVo> replyList = replyService.getReplyList(vo);
		
		String        cont     =   boardVo.getCont().replace("\n", "<br>") ;
		boardVo.setCont(cont);
		
		
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("menuList",  menuList);
		mv.addObject("replyList",replyList);
		mv.addObject("vo", boardVo);
		mv.setViewName("board/view");
		return mv;
	}
	// /board/updateform?bnum=1&menu_id=1
	// 게시글 수정
	@GetMapping("/updateform")
	public  ModelAndView  updateForm( BoardVo vo ) {
		
		BoardVo       boardVo  =  boardService.getView( vo );  
		
		ModelAndView  mv       =  new ModelAndView();
		mv.addObject("vo", boardVo );
		mv.setViewName("board/update");
		return   mv;
	}
	@PostMapping("/update")
	public ModelAndView update(BoardVo vo) {
		boardService.updateBoard(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/listpage?menu_id=" +  vo.getMenu_id());
		return mv;
	}
	//게시물 삭제
	@GetMapping("/delete")
	public ModelAndView delete(BoardVo vo) {
		boardService.deleteBoard(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/listpage?menu_id=" +  vo.getMenu_id());
		return mv;
	}
	
	// 게시물 목록 + 페이징 추가
	@GetMapping("/listpage")
	public ModelAndView listpage(BoardVo vo, Criteria cri) {

		// 메뉴목록
		List<MenuVo> menuList = menuService.getMenuList();
        

		// 게시물 목록
		List<BoardVo> boardList = boardService.listPage(cri);
		
		// 페이지
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.listCount(vo));    
		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.addObject("pageMaker",pageMaker);
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.setViewName("board/listpage");
		return mv;

	}

	
}
