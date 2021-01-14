package org.comstudy21.myapp.member;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	
	String fileUpload(MultipartFile file, String root_path ,MemberVO vo);
	
}
