package com.future.my.login.vo;

public class MemberVO {
	
	   private String memId;
	   private String memPw;
	   private String memEmail;
	   private String profileImg;
	   private String useYn;
	   private String updateDt;
	   private String createDt;
	
	   
    public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	public void updatePassword(String newPassword) {
		this.memPw = newPassword;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memEmail=" + memEmail + ", profileImg=" + profileImg
				+ ", useYn=" + useYn + ", updateDt=" + updateDt + ", createDt=" + createDt + "]";
	}

	   

}
