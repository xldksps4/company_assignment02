package com.nd.cms.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.FileCopyUtils;

public class FileDownload {
  public void filDown(HttpServletRequest request, HttpServletResponse response, String filePath, String realFilNm, String viewFileNm) throws IOException {
    File file = new File(String.valueOf(filePath) + realFilNm);
    System.out.println("root = " + filePath + realFilNm);
    if (file.exists() && file.isFile()) {
      response.setContentType("application/octet-stream; charset=utf-8");
      response.setContentLength((int)file.length());
      String browser = getBrowser(request);
      String disposition = getDisposition(viewFileNm, browser);
      response.setHeader("Content-Disposition", disposition);
      response.setHeader("Content-Transfer-Encoding", "binary");
      ServletOutputStream servletOutputStream = response.getOutputStream();
      FileInputStream fis = null;
      fis = new FileInputStream(file);
      FileCopyUtils.copy(fis, (OutputStream)servletOutputStream);
      if (fis != null)
        fis.close(); 
      servletOutputStream.flush();
      servletOutputStream.close();
    } 
  }
  
  private String getBrowser(HttpServletRequest request) {
    String header = request.getHeader("User-Agent");
    if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
      return "MSIE"; 
    if (header.indexOf("Chrome") > -1)
      return "Chrome"; 
    if (header.indexOf("Opera") > -1)
      return "Opera"; 
    return "Firefox";
  }
  
  private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
    String dispositionPrefix = "attachment;filename=";
    String encodedFilename = null;
    if (browser.equals("MSIE")) {
      encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
          "\\+", "%20");
    } else if (browser.equals("Firefox")) {
      encodedFilename = "\"" + 
        new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
    } else if (browser.equals("Opera")) {
      encodedFilename = "\"" + 
        new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
    } else if (browser.equals("Chrome")) {
      StringBuffer sb = new StringBuffer();
      for (int i = 0; i < filename.length(); i++) {
        char c = filename.charAt(i);
        if (c > '~') {
          sb.append(URLEncoder.encode(Character.toString(c), "UTF-8"));
        } else {
          sb.append(c);
        } 
      } 
      encodedFilename = sb.toString();
    } 
    return String.valueOf(dispositionPrefix) + encodedFilename;
  }
}
