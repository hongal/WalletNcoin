package com.geopia.wallet_ncoin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
    @RequestMapping("/member/modify")
    public String getModifyPage(){

        return "tiles/default/modify";
    }
}
