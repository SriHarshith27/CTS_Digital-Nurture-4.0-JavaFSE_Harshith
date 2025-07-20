package com.cognizant.loan.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoanController {

    @GetMapping("/loans/{number}")
    public String getLoanDetails(@PathVariable String number) {
        return "{ number: \"H00987987972342\", type: \"car\", loan: 400000, emi: 3258, tenure:\n" +
                "18 } ";
    }
}