package com.nd.cms.master.model.service;

import com.nd.cms.master.model.dao.MasterDao;
import com.nd.cms.employee.model.vo.Employee;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class MasterServiceImpl implements MasterService {
  private MasterDao md;
  
  public MasterServiceImpl(MasterDao md) {
    this.md = md;
  }
  
  public int getMasterListCount(Employee emp) {
    return this.md.getMasterListCount(emp);
  }
  
  public List<Employee> getMasterList(Map<String, Object> map) {
    return this.md.getMasterList(map);
  }
  
  public int changeEmpLevel(Employee emp) {
    return this.md.changeEmpLevel(emp);
  }
  
  public Employee empInfoSearch(int emp_no) {
    return this.md.empInfoSearch(emp_no);
  }
}
