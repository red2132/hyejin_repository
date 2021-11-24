package com.sist.web;
import java.util.*;
import com.sist.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController {
	@Autowired
	private BookDAO dao;
	
	@RequestMapping("book/list.do")
	public String List(String page,String category,Model model)
	{
		//목록
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=8;
		int end=rowSize*curpage;
		int start=end-rowSize+1;
		
		if(category==null)
			category="가정";
		
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		List<BookVO> list=dao.List(map);
		
		//페이지 나누기
		int totalpage=dao.TotalPage(category);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
		endPage=totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../book/list.jsp");
		
		return "main/main";
	}
	
	@RequestMapping("book/detail.do")
	public String detail(String isbn,int page, Model model)
	{
		BookVO vo=dao.Detail(Long.parseLong(isbn));
		model.addAttribute("page",page);
		model.addAttribute("vo",vo);
		model.addAttribute("main_jsp","../book/detail.jsp");
		System.out.println(vo.getTitle());
		return "main/main";
	}
	
	@RequestMapping("book/find.do")
	public String find(FindVO vo,Model model)
	{
		Map map=new HashMap();
		map.put("ss", vo.getSs());
		map.put("fsArr", vo.getFsArr());
		List<BookVO> list=dao.Find(map);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../book/find.jsp");
		return "main/main";
	}
	
	@RequestMapping("comm/list.do")
	public String clist(String page,Model model)
	{
		//목록
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int end=rowSize*curpage;
		int start=end-rowSize+1;
		map.put("start", start);
		map.put("end", end);
		List<commVO> cList=dao.cList(map);
		
		//페이지 나누기
		int totalpage=dao.cTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("cList", cList);	
		model.addAttribute("main_jsp", "../comm/list.jsp");
		return "main/main";
	}
	
	@RequestMapping("comm/detail.do")
	public String cdetail(String no,int page, Model model)
	{
		commVO vo=dao.cDetail(Integer.parseInt(no));
		model.addAttribute("page",page);
		model.addAttribute("vo",vo);
		model.addAttribute("main_jsp","../comm/detail.jsp");
		return "main/main";
		
	}
	
	@RequestMapping("comm/insert.do")
	public String cInsert(Model model)
	{
		model.addAttribute("main_jsp","../comm/insert.jsp");
		return "main/main";
	}
	
	@PostMapping("comm/insert_ok.do")
	public String cInsert_ok(commVO vo)
	{
		dao.cInsert(vo);
		return "redirect:../comm/list.do";
	}
	
	@GetMapping("comm/update.do")
	public String cUpdate(int page,int no,Model model)
	{
		commVO vo=dao.cUpdateDataRead(no);
		model.addAttribute("vo",vo);
		model.addAttribute("no",no);
		model.addAttribute("page",page);
		model.addAttribute("main_jsp", "../comm/update.jsp");
		return "main/main";
	}
	
	@GetMapping("comm/update_ok.do")
	@ResponseBody
	public String cUpdate_ok(int page,commVO vo)
	{
		int no=0;
		no=dao.cUpdate(vo);
		return String.valueOf(no);
	}
	
	@GetMapping("comm/delete.do")
	public String cDelelte(int no, int page, Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("page","page");
		model.addAttribute("main_jsp","../comm/delete.jsp");
		return "main/main";
	}				
}
