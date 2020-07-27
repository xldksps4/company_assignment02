package com.nd.cms.employee.model.service;

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
import com.nd.cms.employee.model.vo.Military;
import com.nd.cms.employee.model.vo.Military_Group;
import com.nd.cms.employee.model.vo.Military_Service;
import com.nd.cms.employee.model.vo.Militaty_Rank;
import com.nd.cms.employee.model.vo.School;
import com.nd.cms.employee.model.vo.Search_Employee;
import com.nd.cms.employee.model.vo.Skill;
import com.nd.cms.employee.model.vo.Skill_Type;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
  Employee signin(Employee paramEmployee) throws Exception;
  
  int idCheck(String paramString);
  
  int signup(Employee paramEmployee);
  
  Employee myInfoSearch(int paramInt);
  
  int modyMyInfo(Employee paramEmployee);
  
  void modyFile(Attachment paramAttachment);
  
  List<School> selectSchoolList(int paramInt);
  
  int schoolMody(List<School> paramList);
  
  void deleteSchool(int paramInt);
  
  Military selectMilitary(int paramInt);
  
  int militaryMody(Military paramMilitary);
  
  List<Education> selectEdu(int paramInt);
  
  int eduMody(List<Education> paramList);
  
  void deleteEdu(int paramInt);
  
  List<License> selectLicense(int paramInt);
  
  int skillMody(Map<String, Object> paramMap, int paramInt);
  
  List<Emp_Skill> selectSkill(int paramInt);
  
  int licenseMody(List<License> paramList, int paramInt);
  
  List<Career> selectCareer(int paramInt);
  
  void deleteProject(int paramInt);
  
  void deleteCareer(int paramInt);
  
  int careerMody(List<Career> paramList);
  
  List<Search_Employee> adminSearch(Map<String, Object> paramMap);
  
  int getAdminSearchCount(Search_Employee paramSearch_Employee);
  
  Employee selectDetailEmp(int paramInt);
  
  int deleteEmp(int paramInt);
  
  int passwordCheck(Employee paramEmployee);
  
  int updatePwd(Employee paramEmployee);
  
  Attachment selectProfileImg(int paramInt);
  
  Employee findMyId(Employee paramEmployee);
  
  Employee findMyPwd(Employee paramEmployee);
  
  List<Department> selectDepartment();
  
  List<Degree> selectDegree();
  
  List<Graduate_Status> selectGraduate();
  
  List<Military_Service> selectMiliService();
  
  List<Military_Group> selectMiliGroup();
  
  List<Militaty_Rank> selectMiliRank();
  
  List<Discharge> selectDischarge();
  
  List<Education_Status> selectEduStatus();
  
  List<Skill> selectSkills();
  
  List<Keyword> selectKeywords();
  
  List<Skill_Type> selectSkillType();
  
  List<License_List> selectliList();
}
