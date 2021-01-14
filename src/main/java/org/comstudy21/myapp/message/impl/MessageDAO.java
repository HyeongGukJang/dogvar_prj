package org.comstudy21.myapp.message.impl;

import java.util.List;

import org.comstudy21.myapp.message.MessageService;
import org.comstudy21.myapp.message.MessageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("messageDAO")
public class MessageDAO implements MessageService{
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void recv_insertMessage(MessageVO vo) {
		mybatis.insert("org.comstudy21.myapp.MessageMapper.recv_insertMessage", vo);
	}
	
	@Override
	public void send_insertMessage(MessageVO vo) {
		mybatis.insert("org.comstudy21.myapp.MessageMapper.send_insertMessage", vo);
	}

	@Override
	public MessageVO recv_getMessage(MessageVO vo) {
		return mybatis.selectOne("org.comstudy21.myapp.MessageMapper.recv_getMessage", vo);
	}
	
	@Override
	public MessageVO send_getMessage(MessageVO vo) {
		return mybatis.selectOne("org.comstudy21.myapp.MessageMapper.send_getMessage", vo);
	}

	@Override
	public List<MessageVO> recv_getMessageList(MessageVO vo) {
		return mybatis.selectList("org.comstudy21.myapp.MessageMapper.recv_getMessageList", vo);
	}
	
	@Override
	public List<MessageVO> send_getMessageList(MessageVO vo) {
		return mybatis.selectList("org.comstudy21.myapp.MessageMapper.send_getMessageList", vo);
	}
	
	@Override
	public int listCount(){
		return mybatis.selectOne("org.comstudy21.myapp.MessageMapper.listCount");
	}
	
	@Override
	public void recv_deleteMessage(MessageVO vo) {
		mybatis.insert("org.comstudy21.myapp.MessageMapper.recv_deleteMessage", vo);
	}
	
	@Override
	public void send_deleteMessage(MessageVO vo) {
		mybatis.insert("org.comstudy21.myapp.MessageMapper.send_deleteMessage", vo);
	}
}