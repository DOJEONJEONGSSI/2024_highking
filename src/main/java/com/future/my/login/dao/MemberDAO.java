package com.future.my.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.login.vo.MemberVO;
// Mybatis에서 Mapper 인터페이스임을 나타내는 어노테이션 
// SQL 쿼리와 Java객체 간의 매핑을 자동으로 처리함.
@Mapper          //mapper에 namespace와 매핑됨.
public interface MemberDAO {
	// mapper xml 의 	id와 매핑됨.
	public int registMember(MemberVO vo);
	// 회원 조회
	public MemberVO loginMember(MemberVO vo);
	 // 비밀번호 업데이트 메서드
	public int updatePassword(MemberVO vo);
	// 프로필이미지 수정
	public int profileUpload(MemberVO vo);
	// 질문
}
