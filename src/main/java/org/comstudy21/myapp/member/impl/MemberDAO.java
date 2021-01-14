package org.comstudy21.myapp.member.impl;

import java.util.List;

import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO implements MemberService{
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("#insertMember#");
		mybatis.insert("org.comstudy21.myapp.MemberMapper.insertMember", vo);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		System.out.println("#updateMember#");
		mybatis.insert("org.comstudy21.myapp.MemberMapper.updateMember", vo);
	}
	
	@Override
	public void updateMemberPwd(MemberVO vo) {
		System.out.println("#updateMemberPwd#");
		mybatis.insert("org.comstudy21.myapp.MemberMapper.updateMemberPwd", vo);
	}
	
	@Override
	public void updateMemberPhotoPath(MemberVO vo) {
		System.out.println("#updateMemberPhotoPath#");
		mybatis.insert("org.comstudy21.myapp.MemberMapper.updateMemberPhotoPath", vo);
	}

	
	@Override
	public void deleteMember(MemberVO vo) {
		System.out.println("#deleteMember#");
		mybatis.insert("org.comstudy21.myapp.MemberMapper.deleteMember", vo);
	}
	
	@Override
	public MemberVO getMemberLoginChk(MemberVO vo) {
		System.out.println("#getMemberLoginChk#");
		return mybatis.selectOne("org.comstudy21.myapp.MemberMapper.getMemberLoginChk", vo);
	}
	
	@Override
	public MemberVO getMemberId(MemberVO vo) {
		System.out.println("#getMemberId#");
		return mybatis.selectOne("org.comstudy21.myapp.MemberMapper.getMemberId", vo);
	}
	
	@Override
	public MemberVO getMemberPw(MemberVO vo) {
		System.out.println("#getMemberPw#");
		return mybatis.selectOne("org.comstudy21.myapp.MemberMapper.getMemberPw", vo);
	}
	
	@Override
	public MemberVO getMemberIdDupCheck(MemberVO vo) {
		System.out.println("#getMemberIdDupCheck#");
		return mybatis.selectOne("org.comstudy21.myapp.MemberMapper.getMemberIdDupCheck", vo);
	}
	
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return mybatis.selectList("org.comstudy21.myapp.MemberMapper.getMemberList", vo);
	}
	
	@Override
	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("org.comstudy21.myapp.MemberMapper.getMember", vo);
	}
}