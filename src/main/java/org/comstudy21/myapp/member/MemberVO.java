package org.comstudy21.myapp.member;

public class MemberVO {
	
	//테이블 컬럼
	private String id;
	private String name;
	private String password;
	private String nickname;
	private String website;
	private String birthday;
	private String introduce;
	private String emailId;
	private String emailDomain;
	private String phoneStart;
	private String phoneCenter;
	private String phoneEnd;
	private String sex;
	private String enableYn;
	private String photoPath;
	
	
	//기타변수
	private String col1;
	private String col2;
	private String value1;
	private String value2;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String id) {
		this(id,"","","","","","","","","","","","","","");
	}
	
	public MemberVO(String id, String name, String password, String nickname, String website, String birthday,
			String introduce, String emailId, String emailDomain, String phoneStart, String phoneCenter,
			String phoneEnd, String sex, String enableYn, String photoPath, String col1, String col2, String value1,
			String value2) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.nickname = nickname;
		this.website = website;
		this.birthday = birthday;
		this.introduce = introduce;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.phoneStart = phoneStart;
		this.phoneCenter = phoneCenter;
		this.phoneEnd = phoneEnd;
		this.sex = sex;
		this.enableYn = enableYn;
		this.photoPath = photoPath;
		this.col1 = col1;
		this.col2 = col2;
		this.value1 = value1;
		this.value2 = value2;
	}
	
	public MemberVO(String id, String name, String password, String nickname, String website, String birthday,
			String introduce, String emailId, String emailDomain, String phoneStart, String phoneCenter,
			String phoneEnd, String sex, String enableYn, String photoPath) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.nickname = nickname;
		this.website = website;
		this.birthday = birthday;
		this.introduce = introduce;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.phoneStart = phoneStart;
		this.phoneCenter = phoneCenter;
		this.phoneEnd = phoneEnd;
		this.sex = sex;
		this.enableYn = enableYn;
		this.photoPath = photoPath;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getPhoneStart() {
		return phoneStart;
	}
	public void setPhoneStart(String phoneStart) {
		this.phoneStart = phoneStart;
	}
	public String getPhoneCenter() {
		return phoneCenter;
	}
	public void setPhoneCenter(String phoneCenter) {
		this.phoneCenter = phoneCenter;
	}
	public String getPhoneEnd() {
		return phoneEnd;
	}
	public void setPhoneEnd(String phoneEnd) {
		this.phoneEnd = phoneEnd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEnableYn() {
		return enableYn;
	}
	public void setEnableYn(String enableYn) {
		this.enableYn = enableYn;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getCol1() {
		return col1;
	}
	public void setCol1(String col1) {
		this.col1 = col1;
	}
	public String getCol2() {
		return col2;
	}
	public void setCol2(String col2) {
		this.col2 = col2;
	}
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	public String geValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", nickname=" + nickname
				+ ", website=" + website + ", birthday=" + birthday + ", introduce=" + introduce + ", emailId="
				+ emailId + ", emailDomain=" + emailDomain + ", phoneStart=" + phoneStart + ", phoneCenter="
				+ phoneCenter + ", phoneEnd=" + phoneEnd + ", sex=" + sex + ", enableYn=" + enableYn + ", photoPath="
				+ photoPath + ", col1=" + col1 + ", col2=" + col2 + ", value1=" + value1 + ", value2=" + value2 + "]";
	}
}