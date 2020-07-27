package com.nd.cms.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChangeFileName {
  public static String getChangeFileName() {
    Date now = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    format.format(now);
    return "naedam_" + format.format(now) + "_" + now.getTime();
  }
}
