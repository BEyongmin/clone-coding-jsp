package com.bpoint.clone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bpoint.clone.entity.Inquiry;
import com.bpoint.clone.entity.News;
import com.bpoint.clone.entity.Notice;
import com.bpoint.clone.service.AdminService;
import com.bpoint.clone.service.InquiryService;
import com.bpoint.clone.service.NewsService;
import com.bpoint.clone.service.NoticeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final NoticeService noticeService;
    private final NewsService newsService;
    private final InquiryService inquiryService;
    

    private static final String SESSION_KEY = "adminLoggedIn";

    @GetMapping("/admin/login")
    public String loginPage(HttpSession session) {
        if (Boolean.TRUE.equals(session.getAttribute(SESSION_KEY))) {
            return "redirect:/admin";
        }
        return "admin/login";
    }

    @PostMapping("/admin/login")
    public String doLogin(@RequestParam("password") String password,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        if (adminService.checkPassword(password)) {
            session.setAttribute(SESSION_KEY, true);
            return "redirect:/admin";
        } else {
            redirectAttributes.addFlashAttribute("loginError", true);
            return "redirect:/admin/login";
        }
    }

    @GetMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    @GetMapping("/admin")
    public String dashboard(HttpSession session, Model model) {
        if (!Boolean.TRUE.equals(session.getAttribute(SESSION_KEY))) {
            return "redirect:/admin/login";
        }

        long noticeCount = noticeService.countByType("all");
        long newsCount = newsService.countAll();
        long inquiryCount = inquiryService.countAll();

        List<Notice> recentNotices = noticeService.searchNotices("all", "", "new")
                .stream().limit(5).toList();
        List<News> recentNews = newsService.getAllNews()
                .stream().limit(5).toList();
        List<Inquiry> recentInquiries = inquiryService.getRecent(5);

        model.addAttribute("noticeCount", noticeCount);
        model.addAttribute("newsCount", newsCount);
        model.addAttribute("inquiryCount", inquiryCount);
        model.addAttribute("recentNotices", recentNotices);
        model.addAttribute("recentNews", recentNews);
        model.addAttribute("recentInquiries", recentInquiries);

        return "admin/dashboard";
    }
}