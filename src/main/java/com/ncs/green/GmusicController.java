package com.ncs.green;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MusicService;
import vo.MusicVO;

@Controller
public class GmusicController {

	@Autowired
	MusicService service;


	// musiclist
	@RequestMapping(value = "/musiclist")
	public ModelAndView musiclist(ModelAndView mv) {

		List<MusicVO> list = service.selectList();

		if (list != null) {
			mv.addObject("Banana", list);
		}
		mv.setViewName("musicview/musiclist");
		return mv;
	}

	// playlist
	@RequestMapping(value = "/playlist")
	public ModelAndView playlist(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) {
		// jsonView 사용시 response 의 한글 처리
				response.setContentType("text/html; charset=UTF-8");
		
		MusicVO vo1 = new MusicVO();
		MusicVO vo2 = new MusicVO();
		
		String a = request.getParameter("snum");
		String jsoncode = request.getParameter("jsoncode");
		System.out.println( " Test ******************* > "+a);
		String[] arr = a.split(","); // String타입으로 들어온 파라미터를 배열로 다시 바꿔줌 (단, 중간에 체크안한 체크박스는 빈값으로 섞여 들어온다)
		String dummy =null; // 배열을 정렬하기 위한 더미 변수생성
		int blankcount = 0; // 빈값이 몇개인지 확인하기 위한 카운트
		for (int j = 0; j < arr.length-1; j++) { //반복횟수
			for(int i = 0; i < arr.length; i++) {// 모든 인덱스
				if("".equals(arr[i]) && i!=arr.length-1)  { //빈값이면 다음 인덱스와 교환.
					dummy=arr[i];							//단, 마지막인덱스라면 그 다음 인덱스가 존재하지 않으므로 제외시켜줘야함
					arr[i]=arr[i+1];
					arr[i+1]=dummy;
				}
			}
		}
		for (String string : arr) {
			if ("".equals(string)) { // 체크한 범위내에서 체크안한 체크박스가 몇개인지 확인
				blankcount++;
			}
		}
		int c[] = new int[arr.length-blankcount]; // 대입할 배열의 크기에서 카운트만큼(빈값만큼) 제외시킴
		
		for (int i = 0; i< c.length ; i ++) {
			c[i] = Integer.parseInt(arr[i]);
		}
		vo1.setSnum(c[0]); //첫번째 곡 재생
		
		vo1 = service.selectOne(vo1);
		List<MusicVO> list = new ArrayList<MusicVO>(); //MusicVO타입 리스트 생성(여러 리스트 담을곳)
		for (int i = 0; i< c.length ; i ++) {
			vo2.setSnum(c[i]);
			list.add(service.selectOne(vo2)); //selectOne의 return타입은 vo이므로 담을 수 있다.
		}
		
		if (vo1 != null) {
			mv.addObject("Apple", vo1);
			
			if("A".equals(jsoncode)) {
				mv.addObject("music", vo1.getDownloadfile());
				 System.out.println("****************"+vo1.getDownloadfile());
				mv.setViewName("jsonView");
			}else {
				mv.setViewName("musicview/playlist");
			}
		}
		mv.addObject("Banana", list);
		return mv;
	}
//	// playlist
//		@RequestMapping(value = "/playlist")
//		public ModelAndView playlist(HttpServletRequest request, ModelAndView mv, MusicVO vo) {
//
//			vo = service.selectOne(vo);
//			if (vo != null) {
//
//				mv.setViewName("musicview/playlist");
//			}
//			mv.addObject("Apple", vo);
//			return mv;
//		}

	// ** Image DownLoad
	@RequestMapping(value = "/dnload")
	public ModelAndView dnload(ModelAndView mv, @RequestParam("dnfile") String dnfile) {
		dnfile = "C:/NamCheolWoo/MyWork/gproject/src/main/webapp/" + dnfile;
		System.out.println("** dnfile => " + dnfile);
		File file = new File(dnfile);

		mv.addObject("downloadFile", file);
		mv.setViewName("download");

		// 일반적인 경우 views/download.jsp 를 찾음, 그러나 이 경우에는 아님

		// viewresolver bean 체크하기 기본적으로 viewresolver
		// => servlet-context.xzml 에 설정하는 view 클래스 (DownloadView.java) 의
		// id 와 동일 해야함.
		return mv;

		/*
		 * 위 50~51 행은 아래처럼 작성할 수도 있다. return new ModelAndView("download",
		 * "downloadFile", file);
		 * 
		 * => 생성자 참고 public ModelAndView(View view, String modelName, Object
		 * modelObject) { this.view = view; addObject(modelName, modelObject); }
		 */
	} // dnload
}
