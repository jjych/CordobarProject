package com.spring.ex.dto;

public class MemberDto {
	
	// 아이디
	private String mId;
	// 비밀번호
	private String mPw;
	// 이름
	private String mName;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	public String login() {
		return "MemberDto[mId=" + mId + ", mPw=" + mPw + "]";
	}
	
}
