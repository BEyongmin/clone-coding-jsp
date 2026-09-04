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
    
        private final InquiryService InquiryService;

    @GetMapping("/contact")
    public String contactPage() {
        return "inquiry";
    }

    @PostMapping("/inquiries")
    public String submit(@ModelAttribute Inquiry inquiry, RedirectAttributes redirectAttributes) {
        InquiryService.save(inquiry);
        redirectAttributes.addFlashAttribute("submitted", true);
        return "redirect:/contact";
    }
}
