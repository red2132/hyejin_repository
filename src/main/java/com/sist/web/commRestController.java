package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;

@RestController
public class commRestController {
	@Autowired
	private BookDAO dao;

	//수정하기
		@PostMapping("comm/update_ok.do")
		public String update_ok(int page,commVO vo) {
			String url="";
			int result=dao.cUpdate(vo);
			if(result==1) { //비밀번호 일치
				url="<script>"
					+ "location.href=\"../comm/detail.do?no="+vo.getNo()+"&page="+page+"\";"
					+ "</script>";
			}else {
				url="<script>"
					+ "alert(\"비밀번호가 일치하지 않습니다.\");"
					+ "history.back();"
					+ "</script>";
			}
			return url;
		}
		
		//삭제하기
		@PostMapping("comm/delete_ok.do")
		public String delete_ok(String no,String page, String pwd) {
			String url="";
			int result=dao.cDelete(Integer.parseInt(no), pwd);
			if(result==1) {//비밀번호 일치
				url="<script>"
					+ "location.href=\"../comm/list.do?page=1\";"
					+ "</script>";
			}else {
				url="<script>"
						+ "alert(\"비밀번호가 일치하지 않습니다.\");"
						+ "history.back();"
						+ "</script>";
			}
			return url;
		}
		
		
	}


