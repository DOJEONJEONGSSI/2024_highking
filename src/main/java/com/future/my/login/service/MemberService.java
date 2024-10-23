package com.future.my.login.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.future.my.login.dao.MemberDAO;
import com.future.my.login.vo.MemberVO;

@Service // 비즈니스 로직을 처리하는 계층
public class MemberService {

	@Autowired
	MemberDAO dao;

	public MemberVO loginMember(MemberVO vo) throws Exception {
		MemberVO user = dao.loginMember(vo);

		if (user == null) {
			throw new Exception("사용자를 찾을 수 없습니다.");
		}

		// 비밀번호 비교 (암호화 없이 직접 비교)
		if (!vo.getMemPw().equals(user.getMemPw())) {
			throw new Exception("비밀번호가 일치하지 않습니다.");
		}

		return user;
	}

	// 회원 가입
	public void registMember(MemberVO vo) throws Exception {
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new Exception("회원 가입 실패");
		}
	}

	// 비밀번호 수정
	public void changePassword(MemberVO vo, String oldPassword, String newPassword) throws Exception {
		MemberVO user = dao.loginMember(vo);

		if (user == null) {
			throw new Exception("사용자를 찾을 수 없습니다.");
		}

		// 기존 비밀번호 확인
		if (!oldPassword.equals(user.getMemPw())) {
			throw new Exception("기존 비밀번호가 일치하지 않습니다.");
		}

		// 새로운 비밀번호로 업데이트
		vo.setMemPw(newPassword);
		int result = dao.updatePassword(vo); // 새로운 메서드 추가 필요
		if (result == 0) {
			throw new Exception("비밀번호 변경 실패. 데이터베이스 오류.");
		}
	}

	// 이미지 업로드
	public String profileUpload(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {
// 파일명 생성
		System.out.println("서비스");
		String origin = file.getOriginalFilename();
		String uniqe = UUID.randomUUID().toString() + "_" + origin;
		String dbPath = webPath + uniqe;
		Path filePath = Paths.get(uploadDir, uniqe);
// 물리적으로 저장
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("file to save the file", e);
		}
// db 저장
		vo.setProfileImg(dbPath);
		int result = dao.profileUpload(vo);
		if (result == 0) {
			throw new Exception();
		}
		return dbPath;
	}
}