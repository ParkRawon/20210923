package co.sleep.prj.notice.service;

import java.util.List;

import co.sleep.prj.notice.vo.NoticeVO;

public interface NoticeService {
	NoticeVO noticeSearch(int id);   //NoticeVO중에서 int타입의 id를 불러오겠다..?
	List<NoticeVO> noticeWriterSearch(String key, String val);  //NoticeVO중에서 String타입의 key와 val를 가져오겠다
	int noticeInsert(NoticeVO vo);
	List<NoticeVO> noticeSelectList();
}
