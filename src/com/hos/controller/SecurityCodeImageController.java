package com.hos.controller;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hos.util.SecurityCode;
import com.hos.util.SecurityImage;

@Controller
@SessionAttributes(value = { "securityCode" }, types = { String.class })
public class SecurityCodeImageController {
  @RequestMapping("/imagecode")
  public void doGet(HttpServletResponse response, ModelMap modelMap) {
    try {
      String securityCode = SecurityCode.getSecurityCode();
      modelMap.put("securityCode", securityCode);

      response.setContentType("image/jpeg");
      response.setHeader("Pragma", "No-cache");
      response.setHeader("Cache-Control", "no-cache");
      response.setDateHeader("Expires", 0);

      ImageIO.write(SecurityImage.getImage(securityCode), "JPEG", response.getOutputStream());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
