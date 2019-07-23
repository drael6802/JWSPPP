package com.spring.biz.vo;

import java.sql.Date;

public class UserVO {

	private int userCode;
	private String userId;
	private String userPassword;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private String userAdmin;
	private String emailcheck;
	private Date userBirth;
	private Date userJoinday;
	private int rowNum;
	private int totalRowNum;
	private int pageIndex;
	private String searchState;
	private String searchKeyword;
	private String userDeleteflag;
	
	//
	
	public int getUserCode() {
		return userCode;
	}
	public String getUserDeleteflag() {
		return userDeleteflag;
	}
	public void setUserDeleteflag(String userDeleteflag) {
		this.userDeleteflag = userDeleteflag;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchState() {
		return searchState;
	}
	public void setSearchState(String searchState) {
		this.searchState = searchState;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(String userAdmin) {
		this.userAdmin = userAdmin;
	}
	public String getEmailcheck() {
		return emailcheck;
	}
	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public Date getUserJoinday() {
		return userJoinday;
	}
	public void setUserJoinday(Date userJoinday) {
		this.userJoinday = userJoinday;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getTotalRowNum() {
		return totalRowNum;
	}
	public void setTotalRowNum(int totalRowNum) {
		this.totalRowNum = totalRowNum;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	//
	
	
}
