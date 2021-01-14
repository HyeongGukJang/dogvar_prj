package org.comstudy21.myapp.boardAll;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import org.comstudy21.myapp.common.FileVO;
import org.comstudy21.myapp.common.SearchVO;

@Service
public class BoardAllSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;
        
    public Integer selectBoardCount(SearchVO param) {
        return sqlSession.selectOne("selectBoardAllCount", param);
    }
    
    public List<?> selectBoardList(SearchVO param) {
        return sqlSession.selectList("selectBoardAllList", param);
    }
    
    /**
     * 글 저장.
     */
    public void insertBoard(BoardAllVO param, List<FileVO> filelist, String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
            if (param.getBrdno() == null || "".equals(param.getBrdno())) {
                 sqlSession.insert("insertBoardAll", param);
            } else {
                sqlSession.update("updateBoardAll", param);
            }
            
            if (fileno != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("fileno", fileno);
                sqlSession.insert("deleteBoardAllFile", fparam);
            }
            
            for (FileVO f : filelist) {
                f.setParentPK(param.getBrdno());
                sqlSession.insert("insertBoardAllFile", f);
            }
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            System.out.println("데이터 저장 오류: " + ex.toString());
        }            
    }
 
    public BoardAllVO selectBoardOne(String param) {
        return sqlSession.selectOne("selectBoardAllOne", param);
    }
    
    public void updateBoardAllRead(String param) {
        sqlSession.insert("updateBoardAllRead", param);
    }
    
    public void deleteBoardOne(String param) {
        sqlSession.delete("deleteBoardAllOne", param);
    }
    
    public List<?> selectBoardAllFileList(String param) {
        return sqlSession.selectList("selectBoardAllFileList", param);
    }
    
    /* =============================================================== */
    public List<?> selectBoardAllReplyList(String param) {
        return sqlSession.selectList("selectBoardAllReplyList", param);
    }
    
    /**
     * 댓글 저장. 
     */
    public void insertBoardReply(BoardReplyAllVO param) {
        if (param.getReno() == null || "".equals(param.getReno())) {
            if (param.getReparent() != null) {
                BoardReplyAllVO replyInfo = sqlSession.selectOne("selectBoardAllReplyParent", param.getReparent());
                param.setRedepth(replyInfo.getRedepth());
                param.setReorder(replyInfo.getReorder() + 1);
                sqlSession.selectOne("updateBoardAllReplyOrder", replyInfo);
            } else {
                Integer reorder = sqlSession.selectOne("selectBoardAllReplyMaxOrder", param.getBrdno());
                param.setReorder(reorder);
            }
            
            sqlSession.insert("insertBoardAllReply", param);
        } else {
            sqlSession.insert("updateBoardAllReply", param);
        }
    }   
    
    /**
     * 댓글 삭제.
     * 자식 댓글이 있으면 삭제 안됨. 
     */
    public boolean deleteBoardAllReply(String param) {
        Integer cnt = sqlSession.selectOne("selectBoardAllReplyChild", param);
        
        if ( cnt > 0) {
            return false;
        }
        
        sqlSession.update("updateBoardAllReplyOrder4Delete", param);
        
        sqlSession.delete("deleteBoardAllReply", param);
        
        return true;
    }    
}
