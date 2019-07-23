package com.spring.view;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.BoardService;
import com.spring.biz.ClassService;

import com.spring.biz.StudentService;
import com.spring.biz.UserService;
import com.spring.biz.vo.ClassVO;
import com.spring.biz.vo.StudentInfoVO;
import com.spring.biz.vo.StudentVO;

//네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class ClassController {
	@Resource(name = "userService")
	UserService userService;
	
	@Resource(name = "boardService")
	BoardService boardService;
	
	@Resource(name = "ClassService")
	ClassService classService;
	
	@Resource(name = "StudentService")
	StudentService studentService;
	
	//학생 폼
	@RequestMapping(value = "/studentManager.do")
	public String studentManager(ClassVO classVO , Model model , String date) {
		System.out.println("===>studentManager");
		model.addAttribute("Calsslsit", classService.selectLsitCalss());
		model.addAttribute("studentList", studentService.selectListStudent(classVO));
		return "/jsp/student_manager.jsp";
	}
	//학생 셀렉트 박스 채인지 후 반 변경
	@ResponseBody
	//a-jax을 통해서 controller를 통할떄 @ResponseBody 반드시 써야한다.
	@RequestMapping(value = "/studentClassSelecter.do")
	public List<StudentVO> studentClassSelecter(ClassVO classVO , Model model) {
		System.out.println("===>studentClassSelecter");
		//System.out.println("===> " + classVO.getAllOption());
		return studentService.selectListStudent(classVO);
	}
	//학생 상세보기 셀렉트
	@ResponseBody
	//a-jax을 통해서 controller를 통할떄 @ResponseBody 반드시 써야한다.
	@RequestMapping(value = "/studentInfoSelecter.do")
	public StudentVO studentInfoSelecter(StudentVO studentVO , Model model) {
		System.out.println("===>studentInfoSelecter ==> " + studentVO.getStudentNum());
		return studentService.selectStudentInfo(studentVO);
	}
	//상세보기 수정 업데이트
	@ResponseBody
	@RequestMapping(value = "/studentUpdate.do")
	public StudentVO studentInsert(StudentVO studentVO , StudentInfoVO studentInfoVO  ) {
		System.out.println("===>studentInsert" );
		
		studentService.updateStudent(studentVO, studentInfoVO);
		return null;
		
	}
	//학생 추가 인서트 프로세스
	@ResponseBody
	@RequestMapping(value = "/studentClassInsert.do")
	public boolean studentClassInsert(StudentVO studentVO , StudentInfoVO studentInfoVO) {
		System.out.println("===>studentInsert");
//		System.out.println(studentVO.getStudentNum());
//		System.out.println(studentVO.getStudentName());
//		System.out.println(studentInfoVO.getStudentNum());
//		System.out.println(studentVO.getClassCode());
		boolean isSucess = studentService.insertStudent(studentVO);
		return isSucess;
	}
	
	//학생 삭제 딜리트 프로세스
	@RequestMapping(value = "/studentDelete.do")
	public String studentDelete(StudentVO studentVO , String studentNums) {
		System.out.println("===>studentDelete");
		System.out.println("studentNums ===> " + studentNums);
	
		String[] arrayStudentNums = studentNums.split(",");
	
		List<StudentVO> studentList = new ArrayList<>();
		for (int i = 0; i < arrayStudentNums.length; i++) {
			studentVO = new StudentVO();
			System.out.println(arrayStudentNums[i]);
			studentVO.setStudentNum(Integer.parseInt(arrayStudentNums[i]));
			studentList.add(studentVO);
		}
		studentVO.setStudentList(studentList);
		
		studentService.deleteStudent(studentVO);
		return null;
	}
	
	//상세보기 수정 업데이트
		@RequestMapping(value = "/naverMemberProfile.do")
		public StudentVO naverMemberProfile( ) {
			System.out.println("===>naverMemberProfile" );
			String token = "YOUR_ACCESS_TOKEN";// 네이버 로그인 접근 토큰;
		    String header = "Bearer " + token; // Bearer 다음에 공백 추가
		        try {
		            String apiURL = "https://openapi.naver.com/v1/nid/me";
		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("Authorization", header);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            System.out.println(response.toString());
		        } catch (Exception e) {
		            System.out.println(e);
		        }
			return null;
			
		}
	

}
