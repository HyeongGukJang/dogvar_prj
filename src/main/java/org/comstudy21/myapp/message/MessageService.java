package org.comstudy21.myapp.message;

import java.util.List;

public interface MessageService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void recv_insertMessage(MessageVO vo);

	void send_insertMessage(MessageVO vo);

	// 받는쪽지함 쪽지 삭제
	void recv_deleteMessage(MessageVO vo);

	// 보낸쪽지함 쪽지 삭제
	void send_deleteMessage(MessageVO vo);

	// 쪽지 상세 조회
	MessageVO recv_getMessage(MessageVO vo);

	// 쪽지 상세 조회
	MessageVO send_getMessage(MessageVO vo);

	// 보낸쪽지 목록 조회
	List<MessageVO> send_getMessageList(MessageVO vo) throws Exception;

	int listCount() throws Exception;

	// 받는쪽지 목록 조회
	List<MessageVO> recv_getMessageList(MessageVO vo) throws Exception;
}
