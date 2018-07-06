package com.geopia.wallet_ncoin.Controller;

import com.geopia.wallet_ncoin.mapper.LoginMapper;
import com.geopia.wallet_ncoin.mapper.SecurityMapper;
import com.geopia.wallet_ncoin.service.OTPService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class LoginController {

    @Autowired
    SecurityMapper securityMapper;

    @Autowired
    OTPService otpService;

    @RequestMapping("/login")
    public String login() {


        AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();

        Set<String> roles =
                AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        if(roles.contains("ROLE_ANONYMOUS")){
            return "tiles/default/login";
        }else if(roles.contains("ROLE_TEMPORARY")){
            return "tiles/default/loginOtp";
        }else{
            return "redirect:/";
        }


/*        if(trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())){
            return "tiles/default/login";
        }else{
            return "redirect:/";
        }*/
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "tiles/default/login";
    }

    @RequestMapping("/login_otp")
    public String loginOtp(){

        AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
        Set<String> roles =
                AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());

        if(roles.contains("ROLE_USER") || roles.contains("ROLE_ADMIN")){
            return "redirect:/";
        }else{
            return "tiles/default/loginOtp";
        }


    }


    @RequestMapping("/api/loginOTP")
    @ResponseBody
    public String loginOtpPage(@Param("code") String code){

        String id = SecurityContextHolder.getContext().getAuthentication().getName();
        String encodeKey = securityMapper.getOtpKey(id);

        boolean result = otpService.checkOTP(encodeKey, code);

        if(result){
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());
            updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));

            Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);
            SecurityContextHolder.getContext().setAuthentication(newAuth);

            return "otpLoginSuccess!!";
        }else{
            return "otpLoginFail!!";
        }
    }

    @RequestMapping("/login_error")
    public String loginError(){

        AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
        Set<String> roles =
                AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());

        if(roles.contains("ROLE_USER") || roles.contains("ROLE_ADMIN") || roles.contains("ROLE_TEMPORARY")){
            return "redirect:/";
        }else{
            return "tiles/default/loginError";
        }

    }
}
