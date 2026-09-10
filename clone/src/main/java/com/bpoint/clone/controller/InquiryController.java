package com.bpoint.clone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bpoint.clone.entity.Inquiry;
import com.bpoint.clone.service.InquiryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class InquiryController {
    
    private final InquiryService inquiryService;

    @GetMapping("/contact")
    public String contactPage() {
        return "inquiry";
    }

    @PostMapping("/inquiries")
    public String submit(@ModelAttribute Inquiry inquiry, RedirectAttributes redirectAttributes) {
        try {
            validateContact(inquiry.getContact());
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/contact";
        }

        inquiryService.save(inquiry);
        redirectAttributes.addFlashAttribute("submitted", true);
        return "redirect:/contact";
    }

    private void validateContact(String contact) {
        if (contact == null || contact.isBlank()) {
            throw new IllegalArgumentException("연락처를 입력해주세요.");
        }

        String phonePattern = "^01[016789]-?\\d{3,4}-?\\d{4}$";
        String emailPattern = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$";

        if (!contact.matches(phonePattern) && !contact.matches(emailPattern)) {
            throw new IllegalArgumentException("연락처는 휴대폰 번호(예: 010-1234-5678) 또는 이메일 형식으로 입력해주세요.");
        }
    }
}
