package co.sleep.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sleep.prj.notice.service.NoticeMapper;
import co.sleep.prj.notice.service.NoticeService;
import co.sleep.prj.notice.vo.NoticeVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper map;
	
	@Override
	public NoticeVO noticeSearch(int id) {
		// 게시물 검색(id로 검색)
		return map.noticeSearch(id);
	}

	@Override
	public List<NoticeVO> noticeWriterSearch(String key, String val) {
		// 게시물 검색(여러개 검색 가능하게)
		return map.noticeWriterSearch(key, val);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		// 게시물 입력
		return map.noticeInsert(vo);
	}

	@Override
	public List<NoticeVO> noticeSelectList() {
		// 게시글 목록
		return map.noticeSelectList();
	}

}
