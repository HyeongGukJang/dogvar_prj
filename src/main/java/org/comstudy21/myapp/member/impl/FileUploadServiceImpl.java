package org.comstudy21.myapp.member.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.comstudy21.myapp.member.FileUploadService;
import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService {
	@Resource
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadServiceImpl.class);

	public String fileUpload(MultipartFile file ,String root_path , MemberVO vo) {


		//고정 이미지경로 
		String attach_path = "resources/img/";
		
		
		String fileName = vo.getId()+ ".jpg";
		
		System.out.println("#fileName#"+fileName);
		
		
	     // 이전파일 삭제.
        String imgPath = attach_path+fileName;
        
        File deleteFile = new File(root_path+imgPath);
 
        // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
        if(deleteFile.exists()) {
            
            // 파일을 삭제합니다.
            deleteFile.delete(); 
            
            System.out.println("파일을 삭제하였습니다.");
            
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }
        
        

		//파일이름 변경
		

		
		logger.info("root_path:{}",root_path);
		logger.info("attach_path:{}",attach_path);
		logger.info("imgPath:{}",imgPath);

		//저장할 File 객체를 생성 (껍데기파일)		
		File saveFile = new File(root_path+imgPath);//저장할 폴더 이름, 저장할 파일 이름
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return imgPath;
	}
}
