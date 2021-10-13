package co.sleep.prj.notice.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int id;
	private String writer;
	private Date writeDate;
	private String title;
	private String contents;
	private int hit;
	private String fileName;
	
	private String name;  //이름을 사용하기 위해

}
