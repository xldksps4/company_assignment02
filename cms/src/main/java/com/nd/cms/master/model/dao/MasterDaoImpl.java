package com.nd.cms.master.model.dao;

import com.nd.cms.employee.model.vo.Employee;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class MasterDaoImpl implements MasterDao {
  private SqlSessionTemplate session;
  
  public MasterDaoImpl(SqlSessionTemplate session) {
    this.session = session;
  }
  
  public int getMasterListCount(Employee emp) {
    return ((Integer)this.session.selectOne("Master.getMasterListCount", emp)).intValue();
  }
  
  public List<Employee> getMasterList(Map<String, Object> map) {
    return this.session.selectList("Master.getMasterList", map);
  }
  
  public int changeEmpLevel(Employee emp) {
    return this.session.update("Master.changeEmpLevel", emp);
  }
  
  public Employee empInfoSearch(int emp_no) {
    return (Employee)this.session.selectOne("Master.empInfoSearch", Integer.valueOf(emp_no));
  }
}
