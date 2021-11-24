package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAO {
	@Autowired
	BookMapper mapper;
	public List<BookVO> List(Map map)
	{
		return mapper.List(map);
	}
	
	public int TotalPage(String category)
	{
		return mapper.TotalPage(category);
	}
	
	public BookVO Detail(long isbn)
	{
		return mapper.Detail(isbn);
	}
	
	public List<BookVO> Find(Map map)
	{
		return mapper.Find(map);
	}
	
	public List<commVO> cList(Map map)
	{
		return mapper.cList(map);
	}
	
	public int cTotalPage()
	{
		return mapper.cTotalPage();
	}
	
	public commVO cDetail(int no)
	{
		mapper.hitIncrement(no);
		return mapper.cDetail(no);
	}
	
	public void cInsert(commVO vo)
	{
		mapper.cInsert(vo);
	}
	
	public int cDelete(int no,String pwd)
	{
		int result=0;
		   String db_pwd=mapper.GetPassword(no);
		   if(db_pwd.equals(pwd))
		   {
			   result=1;
			   mapper.cDelete(no);
		   }
		   else
		   {
			   result=0;
		   }
	 return result;
	}
	
	public commVO cUpdateDataRead(int no)
	{
		return mapper.cDetail(no);
	}
	
	public int cUpdate(commVO vo)
	 {
		int result=0;
		   // 비밀번호 읽기 
		   String db_pwd=mapper.GetPassword(vo.getNo());
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   result=1;
			   mapper.cUpdate(vo);
		   }
		   else
		   {
			   result=0;
		   }
		   return result;
	 }
	
	
}

