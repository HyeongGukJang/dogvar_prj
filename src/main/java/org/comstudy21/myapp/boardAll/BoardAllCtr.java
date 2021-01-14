package org.comstudy21.myapp.boardAll;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.comstudy21.myapp.common.FileUtil;
import org.comstudy21.myapp.common.FileVO;
import org.comstudy21.myapp.common.SearchVO;

@Controller 
public class BoardAllCtr {

    @Autowired
    private BoardAllSvc boardSvc;
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/boardAllList")
    public String boardList(SearchVO searchVO, ModelMap modelMap) {

        searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); // startRow, endRow

        List<?> listview  = boardSvc.selectBoardList(searchVO);
        
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        
        return "boardAll/BoardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/boardAllForm")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        if (brdno != null) {
            BoardAllVO boardInfo = boardSvc.selectBoardOne(brdno);
            List<?> listview = boardSvc.selectBoardAllFileList(brdno);
        
            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listview", listview);
        }
        
        return "boardAll/BoardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/boardAllSave")
    public String boardSave(HttpServletRequest request, BoardAllVO boardInfo) {
        String[] fileno = request.getParameterValues("fileno");
        
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());

        boardSvc.insertBoard(boardInfo, filelist, fileno);

        return "redirect:/boardAllList";
    }

    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/boardAllRead")
    public String boardAllRead(HttpServletRequest request, ModelMap modelMap) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.updateBoardAllRead(brdno);
        BoardAllVO boardInfo = boardSvc.selectBoardOne(brdno);
        List<?> listview = boardSvc.selectBoardAllFileList(brdno);
        List<?> replylist = boardSvc.selectBoardAllReplyList(brdno);
        
        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("replylist", replylist);
        
        return "boardAll/BoardRead";
    }
    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/boardAllDelete")
    public String boardDelete(HttpServletRequest request) {
        
        String brdno = request.getParameter("brdno");
        
        boardSvc.deleteBoardOne(brdno);
        
        return "redirect:/boardAllList";
    }

    /* ===================================================================== */
    
    /**
     * 댓글 저장.
     */
    @RequestMapping(value = "/boardAllReplySave")
    public String boardAllReplySave(HttpServletRequest request, BoardReplyAllVO boardReplyInfo) {
        
        boardSvc.insertBoardReply(boardReplyInfo);

        return "redirect:/boardAllRead?brdno=" + boardReplyInfo.getBrdno();
    }
    
    /**
     * 댓글 삭제.
     */
    @RequestMapping(value = "/boardAllReplyDelete")
    public String boardAllReplyDelete(HttpServletRequest request, BoardReplyAllVO boardReplyInfo) {
        
        if (!boardSvc.deleteBoardAllReply(boardReplyInfo.getReno()) ) {
            return "boardAll/BoardFailure";
        }

        return "redirect:/boardAllRead?brdno=" + boardReplyInfo.getBrdno();
    }      
}
