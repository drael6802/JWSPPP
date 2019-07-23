package com.spring.biz.vo;

import java.util.List;

public class StudentVO {
	private int studentNum;
	private String studentName;
	private int korScore;
	private int engScore;
	private int mathScore;
	private int classCode;
	private String className;
	private StudentInfoVO studentInfoVO;
	private List<StudentVO> studentList;
	
	public int getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getKorScore() {
		return korScore;
	}
	public void setKorScore(int korScore) {
		this.korScore = korScore;
	}
	public int getEngScore() {
		return engScore;
	}
	public void setEngScore(int engScore) {
		this.engScore = engScore;
	}
	public int getMathScore() {
		return mathScore;
	}
	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public StudentInfoVO getStudentInfoVO() {
		return studentInfoVO;
	}
	public void setStudentInfoVO(StudentInfoVO studentInfoVO) {
		this.studentInfoVO = studentInfoVO;
	}
	public List<StudentVO> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<StudentVO> studentList) {
		this.studentList = studentList;
	}


	
	

	
	
	
	
}
