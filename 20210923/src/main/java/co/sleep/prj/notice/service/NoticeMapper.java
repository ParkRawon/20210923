package co.sleep.prj.notice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.sleep.prj.notice.vo.NoticeVO;

public interface NoticeMapper {
	NoticeVO noticeSearch(int id);   //NoticeVO중에서 int타입의 id를 불러오겠다..?
	List<NoticeVO> noticeWriterSearch(
			@Param("key")String key,    //NoticeVO에 없는 변수들을 String타입의 key와 val로 지정해서 가져오겠다
			@Param("val")String val);   //@Param:  매개 변수에 대한 설명을 표시 할 때 사용, 
	                                    //         Mybatis의 SQL 문장에 다수의 파라미터를 전달할 때는 전달되는 변수들에 
	                                    //         꼭 @Param 어노테이션을 붙여줘야한다.	
	int noticeInsert(NoticeVO vo);
	List<NoticeVO> noticeSelectList();
}
