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
            @RequestParam(defaultValue = "all") String type,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "new") String sort,
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

    //  @GetMapping("/download/{id}")
    // @ResponseBody
    // public ResponseEntity<Resource> download(@PathVariable Long id) throws IOException {
    //     Notice notice = noticeService.getNoticeById(id);
    //     String fileName = notice.getFileName();

    //     if (fileName == null || fileName.isBlank()) {
    //         return ResponseEntity.notFound().build();
    //     }

    //     Resource resource = new ClassPathResource("static/uploads/" + fileName);
    //     if (!resource.exists()) {
    //         return ResponseEntity.notFound().build();
    //     }

    //     String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8)
    //             .replace("+", "%20");

    //     return ResponseEntity.ok()
    //             .header(HttpHeaders.CONTENT_DISPOSITION,
    //                     "attachment; filename*=UTF-8''" + encodedFileName)
    //             .contentType(MediaType.APPLICATION_OCTET_STREAM)
    //             .body(resource);
    // }
}