package com.bpoint.clone.service;

import org.springframework.stereotype.Service;

import com.bpoint.clone.repository.AdminRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {
    
    private final AdminRepository adminRepository;

    public boolean checkPassword(String inputPassword) {
        return adminRepository.findFirstByOrderByIdAsc()
                .map(admin -> admin.getPassword().equals(inputPassword))
                .orElse(false);
    }
}
