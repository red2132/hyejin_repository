package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;


public interface BookMapper {
	//목록 출력
	@Select("SELECT isbn,category,subcategory,poster,title,subtitle,writer,publisher,publicationday,price,tags,etcinfo,score,num "
			+ "FROM (SELECT isbn,category,subcategory,poster,title,subtitle,writer,publisher,publicationday,price,tags,etcinfo,score,rownum as num "
			+ "FROM (SELECT isbn,category,subcategory,poster,title,subtitle,writer,publisher,publicationday,price,tags,etcinfo,score "
			+ "FROM book_info WHERE category=#{category})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> List(Map map);
	
	//총페이지
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM book_info WHERE category=#{category}")
	public int TotalPage(String category);
	
	//상세보기
	@Select("SELECT isbn,category,subcategory,poster,title,subtitle,writer,publisher,publicationday,price,tags,etcinfo,score "
			+ "FROM book_info WHERE isbn=#{isbn}")
	public BookVO Detail(long isbn);
	
	//검색
	 @Select({
		  "<script>"
		  +"SELECT isbn,category,subcategory,poster,title,subtitle,writer,publisher,publicationday,price,tags,etcinfo,score "
		  +"FROM book_info "
	        +"WHERE "
	        +"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">"
	        +"<foreach collection=\"fsArr\" item=\"fd\">"
	        +"<trim prefix=\"OR\">"
	        +"<choose>"
	        +"<when test=\"fd=='N'.toString()\">"
	        +"title LIKE '%'||#{ss}||'%'"
	        +"</when>"
	        +"<when test=\"fd=='W'.toString()\">"
	        +"writer LIKE '%'||#{ss}||'%'"
	        +"</when>"
	        +"<when test=\"fd=='T'.toString()\">"
	        +"tags LIKE '%'||#{ss}||'%'"
	        +"</when>"
	        +"</choose>"
	        +"</trim>"
	        +"</foreach>"
	        +"</trim>"
	        +"</script>"
 })
	  public List<BookVO> Find(Map map);	
	 
	 
	 //게시판 목록
	 @Select("SELECT no,name,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
	 		+ "FROM (SELECT no,name,subject,content,pwd,regdate,hit,rownum as num "
	 		+ "FROM (SELECT no,name,subject,content,pwd,regdate,hit "
	 		+ "FROM mvc_board ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	 public List<commVO> cList(Map map);
	 
	 //게시판 총페이지
	 @Select("SELECT CEIL(COUNT(*)/10.0) FROM mvc_board")
		public int cTotalPage();
		
	//상세보기
	 @Update("UPDATE mvc_board SET "
			  +"hit=hit+1 "
			  +"WHERE no=#{no}")
	public void hitIncrement(int no);
	 
	@Select("SELECT no,name,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit "
				+ "FROM mvc_board WHERE no=#{no}")
	public commVO cDetail(int no);
	
	 //게시판 등록

	 @SelectKey(keyProperty="no", resultType=int.class, before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM mvc_board")
	  @Insert("INSERT INTO mvc_board(no,name,subject,content,pwd,regdate,hit) "
	 		+ "VALUES(#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0)")
	 public void cInsert(commVO vo);
	 
	 
	 //게시판 삭제
	 @Select("SELECT pwd FROM mvc_board WHERE no=#{no}")
	  public String GetPassword(int no);
	 
	 @Delete("DELETE FROM mvc_board WHERE no=#{no}")
	 public void cDelete(int no);
	 
	 //게시판 수정
	 @Update("UPDATE mvc_board SET "
			 +"name=#{name}, subject=#{subject}, content=#{content} "
			 +"WHERE no=#{no}")
	  public void cUpdate(commVO vo);
	 
}
