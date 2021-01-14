package org.comstudy21.myapp.member;

import java.util.List;

public interface MemberService {
	
	public MemberVO getMemberLoginChk(MemberVO vo);
	
	void insertMember(MemberVO vo);
	
	void updateMember(MemberVO vo);
	
	void updateMemberPhotoPath(MemberVO vo);

	void deleteMember(MemberVO vo);
	
	void updateMemberPwd(MemberVO vo);
	
	public MemberVO getMemberId(MemberVO vo);
	
	public MemberVO getMemberPw(MemberVO vo);
	
	public MemberVO getMemberIdDupCheck(MemberVO vo);
	
	public List<MemberVO> getMemberList(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo);
	
}