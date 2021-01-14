package org.comstudy21.myapp.message.impl;

import java.util.List;

import org.comstudy21.myapp.message.MessageService;
import org.comstudy21.myapp.message.MessageVO;
import org.springframework.beans.factory.annotation.Autowired;

public class MessageServiceImpl implements MessageService {

	@Autowired
	private org.comstudy21.myapp.message.MessageService MessageDAO;

	@Autowired
	private org.comstudy21.myapp.member.MemberService MemberDAO;

	@Override
	public void recv_insertMessage(MessageVO vo) {
		MessageDAO.recv_insertMessage(vo);
	}
	
	@Override
	public void send_insertMessage(MessageVO vo) {
		MessageDAO.send_insertMessage(vo);
	}

	@Override
	public void recv_deleteMessage(MessageVO vo) {
		MessageDAO.recv_deleteMessage(vo);
	}

	@Override
	public void send_deleteMessage(MessageVO vo) {
		MessageDAO.send_deleteMessage(vo);
	}

	@Override
	public MessageVO recv_getMessage(MessageVO vo) {
		return MessageDAO.recv_getMessage(vo);
	}

	@Override
	public MessageVO send_getMessage(MessageVO vo) {
		return MessageDAO.send_getMessage(vo);
	}

	@Override
	public List<MessageVO> recv_getMessageList(MessageVO vo) throws Exception {
		return MessageDAO.recv_getMessageList(vo);
	}

	@Override
	public List<MessageVO> send_getMessageList(MessageVO vo) throws Exception {
		return MessageDAO.send_getMessageList(vo);
	}

	@Override
	public int listCount() throws Exception {
		return MessageDAO.listCount();
	}
}