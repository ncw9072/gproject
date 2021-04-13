package vo;

import criteria.Criteria;
import lombok.Data;

@Data
public class MusicVO {
	private int snum;
	private String sname;
	private String stitle;
	private String singername;
	private String releasedate;
	private String genre;
	private String lyrics;
	private int country;
	private String musicurl;
	private String downloadfile;
	private String image;
	private int count;
	
	private int sno;
	private int eno;
	
	public void setSnoEno(Criteria cri) {
		this.sno=cri.getSno();
		this.eno=cri.getEno();
	}
}
