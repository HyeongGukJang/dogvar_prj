package org.comstudy21.myapp;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.comstudy21.myapp.member.EmailService;
import org.comstudy21.myapp.member.FileUploadService;
import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class MemberController {
	
	@Resource
	MemberService memberService;
	
	@Resource
	EmailService emailService;
	
	@Resource
	FileUploadService fileUploadService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/loginview", method = RequestMethod.GET)
	public String loginview(Locale locale, Model model ,HttpSession session) {
		
		System.out.println("1-1.로그인화면.");
		System.out.println("1-1.로그인화면 session 체크 :" + session.getAttribute("loginMember") );
		
		return "/member/loginview";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, ModelAndView mav, HttpSession session) {
		
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		
		System.out.println("1-2.로그인체크." + vo);
		
		MemberVO member = memberService.getMemberLoginChk(vo);
		
		System.out.println("1-2.로그인체크후 member :" + member);
		
		
		if(member == null) {
			mav.setViewName("/member/loginview");
			mav.addObject("idCheckMsg","가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}else {
			session.setAttribute("loginMember", member);
			session.setAttribute("loginID", member.getId());
			session.setAttribute("nickName", member.getNickname());
			System.out.println("1-2.로그인체크후 session :" + session.getAttribute("loginMember"));
			mav.setViewName("/member/loginOkview");
		}
		
		return mav;	
	}
	
	@RequestMapping(value = "/memberIview", method = RequestMethod.GET)
	public String memberIview(HttpSession session) {
		
		System.out.println("2-1.회원가입페이지");
		return "/member/memberIview";
	}
	
	@RequestMapping(value = "/memberRegister", method = RequestMethod.POST)
	public ModelAndView memberRegister(MemberVO vo,ModelAndView mav , HttpSession session) {
		
		System.out.println("2-2.회원등록"+session.getAttribute("loginMember"));
		System.out.println(vo);
		
		session.setAttribute("loginMember", vo);
		
		System.out.println("세션1"+session.getAttribute("loginMember"));
		
		memberService.insertMember(vo);

		mav.setViewName("/member/memberRegisterOkview");
		
		return mav;
	}

	
	@RequestMapping(value = "/loginOkview", method = RequestMethod.GET)
	public String loginOkview(HttpSession session) {
		
		System.out.println("3.로그인ok");
		System.out.println("3.로그인ok sesstion memnber값 :" + session.getAttribute("loginMember"));
		return "/member/loginOkview";
	}

	
	@RequestMapping(value = "/memberUview", method = RequestMethod.GET)
	public String memberUview(HttpSession session) {
		System.out.println("4-1.회원정보수정 페이지");
		System.out.println("4-1 회원정보수정 페이지 sesstion memnber값 :" + session.getAttribute("loginMember"));
		
		return "/member/memberUview";
	}
	
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public String memberModify(MemberVO vo , HttpSession session ,@RequestParam("btn") String btn ,
							   @RequestParam("uploadfile") MultipartFile uploadfile ,HttpServletRequest request) throws IllegalStateException, IOException {

		if(btn.equals("수정")) {	
			System.out.println("4-2.회원정보수정처리");
			System.out.println("4-2.회원정보수정처리전 MemberVO : " + vo);
			System.out.println("4-2.회원정보수정처리전 session : " + session.getAttribute("loginMember"));		
			logger.info("파일 이름" + uploadfile.getOriginalFilename());
			logger.info("파일 크기" + uploadfile.getSize());
			String root_path = request.getSession().getServletContext().getRealPath("/");  
			
			String imgPath = vo.getPhotoPath();
			if(!imgPath.isEmpty() && uploadfile.getOriginalFilename().isEmpty()) {
				logger.info("아무것도 수정하지 않았음");
				
			}else {
				imgPath = fileUploadService.fileUpload(uploadfile ,root_path, vo);	
				//uploadfile.transferTo(new File("C:/eGovFrame-3.9.0/workspace.edu/DogVar_Project0111/src/main/webapp/resources/img/" + uploadfile.getOriginalFilename()));
				System.out.println("파일 수정 완료");
				
			}
						
			logger.info("파일업로드후 전달경로" + imgPath);			
			vo.setPhotoPath(imgPath);			
			session.setAttribute("loginMember", vo);			
			System.out.println("4-2.회원정보수정처리후 session 다시세팅: " + session.getAttribute("loginMember"));			
			memberService.updateMember(vo);			
			return "redirect:profile?id="+vo.getId();			
			//return "redirect:/memberUview";	
		}else {
			memberService.deleteMember(vo);
			session.invalidate();
			return "redirect:/";	
		}		
	}
	
	@RequestMapping(value = "/memberPwCview", method = RequestMethod.GET)
	public String memberPwCview(Locale locale, Model model) {
		
		System.out.println("5-1.비번변경 페이지이동");
		return "/member/memberPwCview";
	}
	
	@RequestMapping(value = "/memberPwChange", method = RequestMethod.POST)
	public String memberPwChange( HttpSession session, @RequestParam("passwordBf") String passwordBf,@RequestParam("newpassword") String newpassword,@RequestParam("newpasswordRe") String newpasswordRe) {
		
		System.out.println("5-2.비번변경 "+session.getAttribute("loginMember"));
		
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		
		String password = "";
		System.out.println("##1## ");
		if(vo != null && !vo.getPassword().equals("")) {
			System.out.println("##2## ");
			password = vo.getPassword();	
		}
		
		System.out.println("5-2.비번변경 vo.getPassword():"+vo.getPassword());
		System.out.println("5-2.비번변경 password:"+password);
		System.out.println("5-2.비번변경 passwordBf:"+passwordBf);
		System.out.println("5-2.비번변경 newpassword:"+newpassword);
		System.out.println("5-2.비번변경 newpasswordRe:"+newpasswordRe);
		
		if(!passwordBf.equals(password) ) {
			throw new IllegalArgumentException("이전 비밀번호를 잘못입력하였습니다.");
		}
		
		if(!newpassword.equals(newpasswordRe) ) {
			throw new IllegalArgumentException("새 비밀번호와 새 비밀번호 확인이 틀립니다.");
		}
		
		vo.setPassword(newpassword);
		
		memberService.updateMemberPwd(vo);
		
		session.setAttribute("loginMember", vo);
		
		return "/member/memberPwCview";
	}
	
	@RequestMapping(value = "/memberIdFindview", method = RequestMethod.GET)
	public String memberIdFindview(MemberVO vo, Model model ,@RequestParam(value="msgYn", defaultValue="N") String msgYn){
		
		System.out.println("6-1.아이디찾기페이지 vo :" + vo);
		System.out.println("6-1.아이디찾기페이지 model :" + model);
		

		model.addAttribute(vo);
		model.addAttribute("msgYn",msgYn);
		
		
		return "/member/memberIdFindview";
	}
	
	@RequestMapping(value = "/memberIdFind", method = RequestMethod.POST)
	public String memberIdFind(MemberVO vo, Model model ,@RequestParam(value="sendGb", defaultValue="1") String sendGb,
														 @RequestParam(value="confirmGb", defaultValue="email") String confirmGb) {

		System.out.println("8-3.아이디찾기처리");
		

		String url = "";// 연결할페이지
		
		if(sendGb.equals("1")) {//아이디찾기	
			//컬럼1은 이름 = 값1
			//컬럼2는 이메일 or 휴대폰 = 값2
			vo.setCol1("NAME");
			vo.setValue1(vo.getName());
			
			if(confirmGb.equals("email")) {
				System.out.println("이메일 : " +vo.getEmailId()+vo.getEmailDomain());
				vo.setCol2("EMAILID||EMAILDOMAIN");
				vo.setValue2(vo.getEmailId()+vo.getEmailDomain());
			}else {
				System.out.println("폰넘버 : "+vo.getPhoneStart()+vo.getPhoneCenter()+vo.getPhoneEnd());
				vo.setCol2("PHONESTART||PHONECENTER||PHONEEND");
				vo.setValue2(vo.getPhoneStart()+vo.getPhoneCenter()+vo.getPhoneEnd());
				
			}
			url = "member/memberIdFindview";
		}else{//비번찾기
			//컬럼1은 아이디 = 값1
			//컬럼2는 이메일 or 휴대폰 = 값2
			vo.setCol1("ID");
			vo.setValue1(vo.getId());
			
			if(confirmGb.equals("email")) {
				vo.setCol2("EMAILID||EMAILDOMAIN");
				vo.setValue2(vo.getEmailId()+vo.getEmailDomain());
			}else {
				vo.setCol2("PHONESTART||PHONECENTER||PHONEEND");
				vo.setValue2(vo.getPhoneStart()+vo.getPhoneCenter()+vo.getPhoneEnd());
			}	
			url = "member/memberPwFindview";
		}
		MemberVO member = memberService.getMemberId(vo);
		
		System.out.println("8-3.아이디찾기처리 member : " +member);
		

		model.addAttribute("sendInfo", vo);
		model.addAttribute("member", member); 
		model.addAttribute("msgYn", "Y");
		model.addAttribute("confirmGb", confirmGb);
		return url;
	}
	
	@RequestMapping(value = "/memberPwFindview", method = RequestMethod.GET)
	public String memberPwFindview(MemberVO vo, Model model ,@RequestParam(value="msgYn", defaultValue="N") String msgYn) {
		
		model.addAttribute(vo);
		model.addAttribute("msgYn",msgYn);
		
		
		return "/member/memberPwFindview";
	}

	@RequestMapping(value = "/memberRegisterOkview", method = RequestMethod.GET)
	public String memberRegisterOkview(HttpSession session) {
		
		System.out.println("7.회원가입OK");
		System.out.println("7.회원가입ok sesstion memnber값 :" + session.getAttribute("loginMember"));
		return "/member/memberRegisterOkview";
	}
	
	@RequestMapping(value = "/emailSend", method = RequestMethod.POST)
	public String emailSend(@RequestParam("sendGb") String sendGb, @RequestParam("email") String email, @RequestParam("var") String var) {

		System.out.println("8-1.이메일발송");
		
		emailService.sendEmail(sendGb ,email, var);
		
		
		return "redirect:/emailSendok";
	}
	
	@RequestMapping(value = "/emailSendok", method = RequestMethod.GET)
	public String emailSendok(HttpServletRequest Request) {
		
	
		System.out.println("8-2.이메일발송ok");
		return "/member/emailSendok";
	}


	@RequestMapping(value = "/memberlogOut", method = RequestMethod.GET)
	public String memberlogOut(HttpSession session) {
		
		System.out.println("0.로그아웃");
		session.invalidate();
		return "/member/loginview";
	}
	
	
	
	@RequestMapping(value = "/getMemberIdDupCheck", method = RequestMethod.GET)
	@ResponseBody
	public String getMemberIdDupCheck(MemberVO vo , Model model) {
		
		System.out.println("11.아이디중복체크" + vo.getId());
		
		MemberVO Member = memberService.getMemberIdDupCheck(vo);
		
		String dupYn = ""; 
		
		if(Member != null) {
			dupYn = "Y";
		}else {
			dupYn = "N";
		}
		
		return dupYn;
	}
	
	@RequestMapping(value = "/getMemberPwCheck", method = RequestMethod.GET)
	@ResponseBody
	public String getMemberPwCheck(MemberVO vo , Model model) {
		
		System.out.println("12.이전패스워드체크" + vo.getId());
		
		MemberVO member = memberService.getMemberLoginChk(vo);
		
		String pwEqualYn = ""; 
		
		if(member != null) {
			pwEqualYn = "Y";
		}else {
			pwEqualYn = "N";
		}
		
		return pwEqualYn;
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(@RequestParam("id") String id, Model model) {
		logger.info("/member/profile 호출 ...");
		
		MemberVO member = memberService.getMember(new MemberVO(id));
		model.addAttribute("member", member);

		return "/member/profile";
	}
}