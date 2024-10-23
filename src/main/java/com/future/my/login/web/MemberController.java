package com.future.my.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.future.my.login.service.MemberService;
import com.future.my.login.vo.MemberVO;

@Controller
public class MemberController {
    
    @Autowired
    MemberService memberService;
    
    @Value("#{util['file.upload.path']}")
    private String CURR_IMAGE_PATH;
    
    @Value("#{util['file.download.path']}")
    private String WEB_PATH;
    
    @RequestMapping("login")
    public String login() {
        return "login/login";
    } 
    
    @RequestMapping("/registDo")
    public String registDo(MemberVO vo) {
        System.out.println(vo);
        try {
            memberService.registMember(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
    
    @RequestMapping("/loginDo")
    public String loginDo(MemberVO vo, HttpSession session, boolean remember, HttpServletResponse response) throws Exception {
        System.out.println(vo);
        System.out.println(remember);
        
        MemberVO login = memberService.loginMember(vo);
        
        if (login != null) {
            session.setAttribute("login", login);
            
            if (remember) {
                Cookie cookie = new Cookie("rememberId", vo.getMemId());
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("rememberId", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            System.out.println(login);
            return "redirect:/"; // 로그인 성공 시
        } else {
            // 로그인 실패 처리
            return "redirect:/login?error"; // 오류 메시지를 추가할 수 있음
        }
    }
    
    @RequestMapping("/logoutDo")
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) {

        if (session.getAttribute("login") == null) {
            return "redirect:/loginView";
        }
        return "login/mypage";
    }
    
	@ResponseBody
	@PostMapping("/files/upload")
	public Map<String, Object> uploadFiles(
			HttpSession session
		 , @RequestParam("uploadImage") MultipartFile uploadImage ) throws Exception{
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String imgPath = memberService.profileUpload(vo
				                             , CURR_IMAGE_PATH
				                             , WEB_PATH, uploadImage);
		Map<String, Object> map = new HashMap<>();
		map.put("message","success");
		map.put("imagePath", imgPath);
		return map;  // map을 json 데이터로 리턴 
	}
}