package com.bpoint.clone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bpoint.clone.service.AdminService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    private static final String SESSION_KEY = "adminLoggedIn";

    @GetMapping("/admin/login")
    public String loginPage(HttpSession session) {
        if (Boolean.TRUE.equals(session.getAttribute(SESSION_KEY))) {
            return "redirect:/admin";
        }
        return "admin/login";
    }

    @PostMapping("/admin/login")
    public String doLogin(@RequestParam String password,
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
}