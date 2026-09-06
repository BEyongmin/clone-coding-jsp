package com.bpoint.clone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bpoint.clone.entity.Notice;
import com.bpoint.clone.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notices")
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    @GetMapping
    public String getAllNotices(
            @RequestParam(value = "type", defaultValue = "all") String type,
            @RequestParam(value = "keyword", defaultValue = "") String keyword,
            @RequestParam(value = "sort", defaultValue = "new") String sort,
            Model model) {

        List<Notice> notices = noticeService.searchNotices(type, keyword, sort);

        model.addAttribute("notices", notices);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sort", sort);
        model.addAttribute("allCount", noticeService.countByType("all"));
        model.addAttribute("noticeCount", noticeService.countByType("notice"));
        model.addAttribute("dataCount", noticeService.countByType("data"));

        return "notice/list";
    }

    @GetMapping("/{id}")
    public String getNoticeById(@PathVariable("id") Long id, Model model) {
        Notice notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        model.addAttribute("prevNotice", noticeService.getPrevNotice(id));
        model.addAttribute("nextNotice", noticeService.getNextNotice(id));
        return "notice/detail";
    }

}