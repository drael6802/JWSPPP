package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.ClassVO;
import com.spring.biz.vo.StudentInfoVO;
import com.spring.biz.vo.StudentVO;

public interface StudentService {
	public List<StudentVO> selectListStudent(ClassVO classVO);
	public StudentVO selectStudentInfo(StudentVO studentVO);
	public boolean updateStudent(StudentVO studentVO , StudentInfoVO studentInfoVO);
	public boolean insertStudent(StudentVO studentVO);
	public boolean deleteStudent(StudentVO studentVO);
}
