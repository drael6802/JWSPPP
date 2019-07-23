package com.spring.biz;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.ClassVO;
import com.spring.biz.vo.StudentInfoVO;
import com.spring.biz.vo.StudentVO;

@Service("StudentService")
public class StudentServiceImp implements StudentService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//학생 테이블 리스트
	@Override
	public List<StudentVO> selectListStudent(ClassVO classVO) {
		return sqlSession.selectList("selectListStudent", classVO);
	}
	//학생 상세보기 변경 업데이트
	@Override
	public StudentVO selectStudentInfo(StudentVO studentVO) {
		return sqlSession.selectOne("selectListStudentJoin", studentVO);
	}
	
	//학생 상세보기 변경 업데이트 studentVO
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean updateStudent(StudentVO studentVO ,StudentInfoVO studentInfoVO) {
		int result1 = sqlSession.update("updateStudent", studentVO);
		int result2 = sqlSession.update("updateStudentInfo", studentInfoVO);
		if (result1 + result2 == 2) {
			return true;
		}
		return false;
	}
	//학생 추가 인서트
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean insertStudent(StudentVO studentVO) {
		int result1 = sqlSession.insert("insertStudent" , studentVO );
		int result2 = sqlSession.insert("insertStudentInfo" , studentVO );
		
		if (result1 + result2 == 2) {
			return true;
		}
		return false;
	}
	//학생 삭제 딜리트
	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean deleteStudent(StudentVO studentVO) {
		int result1 = sqlSession.delete("deleteStudent", studentVO);
		int result2 = sqlSession.delete("deleteStudentInfo", studentVO);

		if (result1 + result2 >= 2 && result1 == result2 ) {
			return true;
		}else {
			throw new RuntimeException();
		}
	}
	
}
