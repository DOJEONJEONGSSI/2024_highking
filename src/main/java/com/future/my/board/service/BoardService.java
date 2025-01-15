package com.future.my.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.future.my.board.dao.IBoardDAO;
import com.future.my.board.vo.BoardVO;
import com.future.my.board.vo.ReplyVO;

@Service
public class BoardService {
    @Autowired
    IBoardDAO dao;

    public ArrayList<BoardVO> getBoardList() {
        return dao.getBoardList();
    }

    public BoardVO getBoard(int boardNo) throws Exception {
        BoardVO result = dao.getBoard(boardNo);
        if (result == null) {
            throw new Exception("게시글을 찾을 수 없습니다.");
        }
        return result;
    }

    public void writeBoard(BoardVO vo) throws Exception {
        int result = dao.writeBoard(vo);
        if (result == 0) {
            throw new Exception("게시글 작성에 실패했습니다.");
        }
    }

    public void updateBoard(BoardVO board) throws Exception {
        int result = dao.updateBoard(board);
        if (result == 0) {
            throw new Exception("게시글 수정에 실패했습니다.");
        }
    }

    public void deleteBoard(int boardNo) throws Exception {
        int result = dao.deleteBoard(boardNo); // DAO에서 삭제 메서드 호출
        if (result == 0) {
            throw new Exception("게시글 삭제에 실패했습니다.");
        }
    }

    public ArrayList<ReplyVO> getReplyList(int boardNo) {
        return dao.getReplyList(boardNo);
    }

    public ReplyVO getReply(String replyNo) {
        return dao.getReply(replyNo);
    }

    public int writeReply(ReplyVO vo) throws Exception {
        int result = dao.writeReply(vo);
        if (result == 0) {
            throw new Exception("댓글 작성에 실패했습니다.");
        }
        return result;
    }

    public void delReply(String replyNo) throws Exception {
        int result = dao.delReply(replyNo);
        if (result == 0) {
            throw new Exception("댓글 삭제에 실패했습니다.");
        }
    }

    public String boardimage(BoardVO vo, String uploadDir, String webPath) throws Exception {
        MultipartFile file = vo.getFileImage(); // MultipartFile 가져오기
        if (file == null || file.isEmpty()) {
        	this.writeBoard(vo);
            throw new Exception("업로드할 파일이 없습니다.");
        }

        // 파일명 생성
        String origin = file.getOriginalFilename();
        String unique = UUID.randomUUID().toString() + "_" + origin;
        String dbPath = webPath + unique; // DB에 저장할 경로
        Path filePath = Paths.get(uploadDir, unique); // 실제 저장할 경로

        // 물리적으로 저장
        try {
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new Exception("파일 저장 중 오류가 발생했습니다.", e);
        }

        // DB에 경로 저장
        vo.setBoardimage(dbPath);
        int result = dao.writeBoard(vo); // DB에 업로드
        if (result == 0) {
            throw new Exception("게시글 업로드에 실패했습니다.");
        }

        return dbPath; // 저장된 경로 반환
    }
    
    public String boardimageUpdate(BoardVO vo, String uploadDir, String webPath) throws Exception {
        MultipartFile file = vo.getFileImage(); // MultipartFile 가져오기
        if (file == null || file.isEmpty()) {
            throw new Exception("업로드할 파일이 없습니다.");
        }

        // 파일명 생성
        String origin = file.getOriginalFilename();
        String unique = UUID.randomUUID().toString() + "_" + origin;
        String dbPath = webPath + unique; // DB에 저장할 경로
        Path filePath = Paths.get(uploadDir, unique); // 실제 저장할 경로

        // 물리적으로 저장
        try {
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new Exception("파일 저장 중 오류가 발생했습니다.", e);
        }

        // DB에 경로 저장
        vo.setBoardimage(dbPath);
        int result = dao.updateBoard(vo); // DB에 업로드
        if (result == 0) {
            throw new Exception("게시글 업로드에 실패했습니다.");
        }

        return dbPath; // 저장된 경로 반환
    }
}
