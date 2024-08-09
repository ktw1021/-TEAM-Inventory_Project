package com.inventory.security;

import java.nio.file.Paths;
import java.nio.file.Path;

public class WalletPathResolver {

    public String getWalletJdbcUrl() {
        try {
            // 현재 클래스패스를 기준으로 상대 경로를 절대 경로로 변환
            Path walletPath = Paths.get(WalletPathResolver.class.getResource("/Wallet_OBDEHIFXDIX5MJDT").toURI());
            // Windows 경로에서 역슬래시(\)를 슬래시(/)로 변환
            String walletPathStr = walletPath.toString().replace("\\", "/");
            System.out.println("Wallet Path: " + walletPathStr);
            // JDBC URL 생성
            return "jdbc:oracle:thin:@obdehifxdix5mjdt_medium?TNS_ADMIN=" + walletPathStr;
        } catch (Exception e) {
            throw new RuntimeException("Failed to resolve wallet path", e);
        }
    }
}
