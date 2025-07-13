package com.cognizant.springlearn.controller;

import com.cognizant.springlearn.security.JwtUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.util.Base64;

@RestController
public class AuthenticationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationController.class);

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/authenticate")
    public AuthenticationResponse authenticate(@RequestHeader("Authorization") String authorizationHeader) {
        LOGGER.info("START authenticate");

        // 1. Get the username
        String username = getUser(authorizationHeader);
        LOGGER.info("Username: {}", username);

        // 2. Generate the token
        String token = jwtUtil.generateToken(username);
        LOGGER.info("Generated Token: {}", token);

        LOGGER.info("END authenticate");

        // 3. Return the token in the response object
        return new AuthenticationResponse(token);
    }

    private String getUser(String authorizationHeader) {
        if (authorizationHeader != null && authorizationHeader.startsWith("Basic ")) {
            String base64Credentials = authorizationHeader.substring(6);
            byte[] credDecoded = Base64.getDecoder().decode(base64Credentials);
            String credentials = new String(credDecoded);
            final String[] values = credentials.split(":", 2);
            return values[0];
        }
        return null;
    }
}