package com.future.my.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.board.vo.BoardVO;
import com.future.my.board.vo.ReplyVO;
import com.future.my.login.vo.MemberVO;

@Mapper
public interface IBoardDAO {
	
	// 게시글 목록 조회
	public ArrayList<BoardVO> getBoardList();
	
	// 게시글 상세 조회
	public BoardVO getBoard(int boardNo);
	
	// 게시글 작성 
	public int writeBoard(BoardVO vo);
	
	// 게시글 수정
	public int updateBoard(BoardVO board);
	
	// 게시글 삭제
	public int deleteBoard(int boardNo); // 게시물 삭제 메서드 추가
	
	// 댓글 리스트 
	public ArrayList<ReplyVO> getReplyList(int boardNo);
	
	// 댓글 조회
	public ReplyVO getReply (String replyNo);
	
	// 댓글 작성
	public int writeReply(ReplyVO vo);
	
	// 댓글 삭제 
	public int delReply(String replyNo);
	
	public int boardUpload(BoardVO vo);
	
	public int boardUpload(MemberVO vo);
}
