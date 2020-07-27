package com.nd.cms.employee.model.dao;

import com.nd.cms.common.Attachment;
import com.nd.cms.employee.model.vo.Career;
import com.nd.cms.employee.model.vo.Degree;
import com.nd.cms.employee.model.vo.Department;
import com.nd.cms.employee.model.vo.Discharge;
import com.nd.cms.employee.model.vo.Education;
import com.nd.cms.employee.model.vo.Education_Status;
import com.nd.cms.employee.model.vo.Emp_Skill;
import com.nd.cms.employee.model.vo.Employee;
import com.nd.cms.employee.model.vo.Graduate_Status;
import com.nd.cms.employee.model.vo.Keyword;
import com.nd.cms.employee.model.vo.License;
import com.nd.cms.employee.model.vo.License_List;
import com.nd.cms.employee.model.vo.Login_History;
import com.nd.cms.employee.model.vo.Military;
import com.nd.cms.employee.model.vo.Military_Group;
import com.nd.cms.employee.model.vo.Military_Service;
import com.nd.cms.employee.model.vo.Militaty_Rank;
import com.nd.cms.employee.model.vo.Project;
import com.nd.cms.employee.model.vo.School;
import com.nd.cms.employee.model.vo.Search_Employee;
import com.nd.cms.employee.model.vo.Skill;
import com.nd.cms.employee.model.vo.Skill_Type;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
  private SqlSessionTemplate session;
  
  public EmployeeDaoImpl(SqlSessionTemplate session) {
    this.session = session;
  }
  
  public String selectEncPassword(Employee emp) {
    return (String)this.session.selectOne("Employee.selectEncPassword", emp);
  }
  
  public Employee signin(Employee emp) {
    return (Employee)this.session.selectOne("Employee.signin", emp);
  }
  
  public void insertLoginHistory(Login_History history) {
    this.session.insert("Employee.insertLoginHistory", history);
  }
  
  public int idCheck(String emp_id) {
    return ((Integer)this.session.selectOne("Employee.idCheck", emp_id)).intValue();
  }
  
  public int signup(Employee emp) {
    return this.session.insert("Employee.signup", emp);
  }
  
  public Employee myInfoSearch(int emp_no) {
    return (Employee)this.session.selectOne("Employee.myInfoSearch", Integer.valueOf(emp_no));
  }
  
  public void modyMyInfo(Employee emp) {
    this.session.update("Employee.modyMyInfo", emp);
  }
  
  public int insertEmpMody(int emp_no) {
    return this.session.insert("Employee.insertEmpMody", Integer.valueOf(emp_no));
  }
  
  public void modyFile(Attachment attachment) {
    this.session.insert("Employee.modyFile", attachment);
  }
  
  public List<School> selectSchoolList(int emp_no) {
    return this.session.selectList("Employee.selectSchoolList", Integer.valueOf(emp_no));
  }
  
  public int schoolMody(List<School> schoolList) {
    return this.session.insert("Employee.schoolMody", schoolList);
  }
  
  public void deleteSchool(int school_no) {
    this.session.update("Employee.deleteSchool", Integer.valueOf(school_no));
  }
  
  public Military selectMilitary(int emp_no) {
    return (Military)this.session.selectOne("Employee.selectMilitary", Integer.valueOf(emp_no));
  }
  
  public int militaryMody(Military military) {
    return this.session.insert("Employee.militaryMody", military);
  }
  
  public List<Education> selectEdu(int emp_no) {
    return this.session.selectList("Employee.selectEdu", Integer.valueOf(emp_no));
  }
  
  public int eduMody(List<Education> eduList) {
    return this.session.insert("Employee.eduMody", eduList);
  }
  
  public void deleteEdu(int edu_no) {
    this.session.update("Employee.deleteEdu", Integer.valueOf(edu_no));
  }
  
  public List<License> selectLicense(int emp_no) {
    return this.session.selectList("Employee.selectLicense", Integer.valueOf(emp_no));
  }
  
  public void deleteSkill(Map<String, Object> deleteMap) {
    this.session.update("Employee.deleteSkill", deleteMap);
  }
  
  public int skillMody(List<Emp_Skill> empSkillList) {
    return this.session.insert("Employee.skillMody", empSkillList);
  }
  
  public List<Emp_Skill> selectSkill(int emp_no) {
    return this.session.selectList("Employee.selectSkill", Integer.valueOf(emp_no));
  }
  
  public void deleteLicense(Map<String, Object> deleteMap) {
    this.session.update("Employee.deleteLicense", deleteMap);
  }
  
  public int licenseMody(List<License> licenseList) {
    return this.session.insert("Employee.licenseMody", licenseList);
  }
  
  public List<Career> selectCareer(int emp_no) {
    return this.session.selectList("Employee.selectCareer", Integer.valueOf(emp_no));
  }
  
  public void deleteProject(int project_no) {
    this.session.update("Employee.deleteProject", Integer.valueOf(project_no));
  }
  
  public void deleteCareer(int career_no) {
    this.session.update("Employee.deleteCareer", Integer.valueOf(career_no));
  }
  
  public int careerMody(Career career) {
    return this.session.insert("Employee.careerMody", career);
  }
  
  public void projectMody(List<Project> projectList) {
    this.session.insert("Employee.projectMody", projectList);
  }
  
  public List<Search_Employee> adminSearch(Map<String, Object> map) {
    return this.session.selectList("Employee.adminSearch", map);
  }
  
  public int getAdminSearchCount(Search_Employee search) {
    return ((Integer)this.session.selectOne("Employee.getAdminSearchCount", search)).intValue();
  }
  
  public Employee selectDetailEmp(int emp_no) {
    return (Employee)this.session.selectOne("Employee.selectDetailEmp", Integer.valueOf(emp_no));
  }
  
  public int deleteEmp(int emp_no) {
    return this.session.update("Employee.deleteEmp", Integer.valueOf(emp_no));
  }
  
  public int updatePwd(Employee emp) {
    return this.session.update("Employee.updatePwd", emp);
  }
  
  public Attachment selectProfileImg(int emp_no) {
    return (Attachment)this.session.selectOne("Employee.selectProfileImg", Integer.valueOf(emp_no));
  }
  
  public Employee findMyId(Employee emp) {
    return (Employee)this.session.selectOne("Employee.findMyId", emp);
  }
  
  public Employee findMyPwd(Employee emp) {
    return (Employee)this.session.selectOne("Employee.findMyPwd", emp);
  }
  
  public List<Department> selectDepartment() {
    return this.session.selectList("Employee.selectDepartment");
  }
  
  public List<Degree> selectDegree() {
    return this.session.selectList("Employee.selectDegree");
  }
  
  public List<Graduate_Status> selectGraduate() {
    return this.session.selectList("Employee.selectGraduate");
  }
  
  public List<Military_Service> selectMiliService() {
    return this.session.selectList("Employee.selectMiliService");
  }
  
  public List<Military_Group> selectMiliGroup() {
    return this.session.selectList("Employee.selectMiliGroup");
  }
  
  public List<Militaty_Rank> selectMiliRank() {
    return this.session.selectList("Employee.selectMiliRank");
  }
  
  public List<Discharge> selectDischarge() {
    return this.session.selectList("Employee.selectDischarge");
  }
  
  public List<Education_Status> selectEduStatus() {
    return this.session.selectList("Employee.selectEduStatus");
  }
  
  public List<Skill> selectSkills() {
    return this.session.selectList("Employee.selectSkills");
  }
  
  public List<Keyword> selectKeywords() {
    return this.session.selectList("Employee.selectKeywords");
  }
  
  public List<Skill_Type> selectSkillType() {
    return this.session.selectList("Employee.selectSkillType");
  }
  
  public List<License_List> selectliList() {
    return this.session.selectList("Employee.selectliList");
  }
}
