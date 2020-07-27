package com.nd.cms.master.model.service;

import com.nd.cms.employee.model.vo.Employee;
import java.util.List;
import java.util.Map;

public interface MasterService {
  int getMasterListCount(Employee paramEmployee);
  
  List<Employee> getMasterList(Map<String, Object> paramMap);
  
  int changeEmpLevel(Employee paramEmployee);
  
  Employee empInfoSearch(int paramInt);
}
