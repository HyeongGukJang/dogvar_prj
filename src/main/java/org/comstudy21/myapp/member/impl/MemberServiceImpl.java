package org.comstudy21.myapp.member.impl;

import java.util.List;

import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}
	
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}
	
	public void updateMemberPwd(MemberVO vo) {
		memberDAO.updateMemberPwd(vo);
	}
	
	public void updateMemberPhotoPath(MemberVO vo) {
		memberDAO.updateMemberPhotoPath(vo);
	}
	
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}
	
	public MemberVO getMemberLoginChk(MemberVO vo) {
		return memberDAO.getMemberLoginChk(vo);
	}
	
	public MemberVO getMemberId(MemberVO vo) {
		return memberDAO.getMemberId(vo);
	}
	
	public MemberVO getMemberPw(MemberVO vo) {
		return memberDAO.getMemberPw(vo);
	}
	
	public MemberVO getMemberIdDupCheck(MemberVO vo) {
		return memberDAO.getMemberIdDupCheck(vo);
	}
		
	public void emailSend(String sendGb ,String email, String id , String pw) {
		
	}
	
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
}