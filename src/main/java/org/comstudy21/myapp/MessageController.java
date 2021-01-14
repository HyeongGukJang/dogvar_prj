package org.comstudy21.myapp;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.comstudy21.myapp.message.MessageService;
import org.comstudy21.myapp.message.MessageVO;
import org.comstudy21.myapp.message.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class MessageController {
		
	Service service;
	
	@Resource
	MessageService messageService;
	
	@Resource
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class.getSimpleName());
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(@RequestParam("id") String id, MemberVO vo, Model model) {
		logger.info("/message/write 호출...");
		List<MemberVO> list = memberService.getMemberList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "message/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write_ok(MessageVO vo) {
		logger.info("POST /message/write 호출...");
		messageService.recv_insertMessage(vo);
		messageService.send_insertMessage(vo);

		return "redirect:list?send_id="+vo.getName();
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String id, MemberVO vo, Model model, MessageVO cri)throws Exception {
		logger.info("/message/list 호출...");
		
		List<MemberVO> list = memberService.getMemberList(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.listCount());
		
		model.addAttribute("list", list);
		model.addAttribute("Mlist", messageService.send_getMessageList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("id", id);

		return "message/list";
	}
	
	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public String memberlist(String id, MemberVO vo, Model model, MessageVO cri) throws Exception {		
		List<MemberVO> list = memberService.getMemberList(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.listCount());
		
		model.addAttribute("list", list);
		model.addAttribute("Mlist", messageService.send_getMessageList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("id", id);

		return "admin/memberlist";
	}
	
	@RequestMapping(value = "/recv" , method = RequestMethod.GET)
	public String recv(String id, MemberVO vo, Model model, MessageVO cri)throws Exception {
		logger.info("/message/recv 호출...");
				
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.listCount());
		model.addAttribute("recv", messageService.recv_getMessageList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("id", id);
		
		return "message/recv";
	}
	
	@RequestMapping(value = "/recv_detail" , method = RequestMethod.GET)
	public String recv_detail(@RequestParam("seq") int seq, Model model) {
		logger.info("/message/detail 호출...");
		
		MessageVO recv_message = messageService.recv_getMessage(new MessageVO(seq));
		model.addAttribute("recv_message", recv_message);
		
		return "message/recv_detail";
	}
	
	@RequestMapping(value = "/send_detail" , method = RequestMethod.GET)
	public String send_detail(@RequestParam("seq") int seq, Model model) {
		logger.info("/message/send_detail 호출...");
		
		MessageVO send_message = messageService.send_getMessage(new MessageVO(seq));
		model.addAttribute("send_message", send_message);
		
		return "message/send_detail";
	}

	@RequestMapping(value = "/recv_delete", method = RequestMethod.GET)
	public String recv_delete(MessageVO vo, Model model) {
		logger.info("/recv/delete 호출 ...");
		
		model.addAttribute("recv_message", vo);

		return "message/recv_delete";
	}
	
	@RequestMapping(value = "/recv_delete", method = RequestMethod.POST)
	public String recv_delete_ok(MessageVO vo, Model model) {
		logger.info("/recv/delete 호출 ...");
		messageService.recv_deleteMessage(vo);

		return "redirect:recv?recv_id="+vo.getName();
	}
	
	@RequestMapping(value = "/send_delete", method = RequestMethod.GET)
	public String send_delete(MessageVO vo, Model model) {
		logger.info("/list/delete 호출 ...");
		
		model.addAttribute("send_message", vo);
		
		return "message/send_delete";
	}
	
	@RequestMapping(value = "/send_delete", method = RequestMethod.POST)
	public String send_delete_ok(MessageVO vo, Model model) {
		logger.info("/list/delete 호출 ...");
		messageService.send_deleteMessage(vo);
		
		return "redirect:list?send_id="+vo.getName();
	}
}