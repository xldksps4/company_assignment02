package com.nd.cms.employee.model.service;

import com.nd.cms.common.Attachment;
import com.nd.cms.employee.model.dao.EmployeeDao;
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
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
	
	private EmployeeDao ed;

	// BCrypt, Password storage or verification for using 'hash function'
	private BCryptPasswordEncoder passwordEncoder;

	
	/* Constructor */
	
	public EmployeeServiceImpl(EmployeeDao ed, BCryptPasswordEncoder passwordEncoder) {
		this.ed = ed;
		this.passwordEncoder = passwordEncoder;
		logger.info("[EmpBizImpl]__ ed " + ed.toString() + ", ps " + passwordEncoder.toString());
	}

	
	
	
	/*	Springframework creates 'proxy' in '@Transactional' annotated classes.
	 
	 	rollbackFor		=TestException.class 	의 경우 해당 exception 에 대해서 롤백을 진행하고
		noRollbackFor	=Test2Exception.class 	의 경우 해당 exception 에 대해서 롤백을 진행하지 않는다.
		
	 */
	
	//로그인
	@Transactional(rollbackFor = { Exception.class })
	public Employee signin(Employee emp) throws Exception {
		Employee loginEmp = null;
		String rawPassword = emp.getEmp_pwd();					// db에 등록된 emp.비번
		String encPassword = this.ed.selectEncPassword(emp);	// 마스터계정 비번
		if (this.passwordEncoder.matches(rawPassword, encPassword)) {
			loginEmp = this.ed.signin(emp); // SELECT no, id, level_code (from생략) WHERE= emp_id=emp_id
			InetAddress local = InetAddress.getLocalHost(); 	// localHost Name
			String ip = local.getHostAddress();					// ip
			Login_History history = new Login_History();
			history.setEmp_no(loginEmp.getEmp_no());
			history.setLogin_ip(ip);
			this.ed.insertLoginHistory(history);				// 로그인 성공시 로그인 기록 저장
		}
		return loginEmp;
	}

	public int idCheck(String emp_id) {
		return this.ed.idCheck(emp_id);
	}

	//회원가입 dept리스트를 들고 화면이동
	public int signup(Employee emp) {
		String encPassword = this.passwordEncoder.encode(emp.getEmp_pwd());
		emp.setEmp_pwd(encPassword);
		return this.ed.signup(emp);
	}

	public Employee myInfoSearch(int emp_no) {
		return this.ed.myInfoSearch(emp_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public int modyMyInfo(Employee emp) {
		this.ed.modyMyInfo(emp);
		int emp_no = emp.getEmp_no();
		return this.ed.insertEmpMody(emp_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public void modyFile(Attachment attachment) {
		this.ed.modyFile(attachment);
		int emp_no = attachment.getEmp_no();
		this.ed.insertEmpMody(emp_no);
	}

	public List<School> selectSchoolList(int emp_no) {
		return this.ed.selectSchoolList(emp_no);
	}

	public int schoolMody(List<School> schoolList) {
		return this.ed.schoolMody(schoolList);
	}

	public void deleteSchool(int school_no) {
		this.ed.deleteSchool(school_no);
	}

	public Military selectMilitary(int emp_no) {
		return this.ed.selectMilitary(emp_no);
	}

	public int militaryMody(Military military) {
		return this.ed.militaryMody(military);
	}

	public List<Education> selectEdu(int emp_no) {
		return this.ed.selectEdu(emp_no);
	}

	public int eduMody(List<Education> eduList) {
		return this.ed.eduMody(eduList);
	}

	public void deleteEdu(int edu_no) {
		this.ed.deleteEdu(edu_no);
	}

	public List<License> selectLicense(int emp_no) {
		return this.ed.selectLicense(emp_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public int skillMody(Map<String, Object> map, int emp_no) {
		List<Emp_Skill> empSkillList = new ArrayList();
		if (map.get("skill_codes") != null) {
			Map<String, Object> deleteMap = new HashMap();
			String[] skill_codes = (String[]) map.get("skill_codes");
			List<Emp_Skill> skillList = new ArrayList();
			for (int i = 0; i < skill_codes.length; i++) {
				Emp_Skill emp_skill = new Emp_Skill();
				emp_skill.setSkill_code(Integer.parseInt(skill_codes[i]));
				emp_skill.setEmp_no(emp_no);
				skillList.add(emp_skill);
				empSkillList.add(emp_skill);
			}
			deleteMap.put("skillList", skillList);
			deleteMap.put("emp_no", Integer.valueOf(emp_no));
			this.ed.deleteSkill(deleteMap);
		}
		if (map.get("keyword_codes") != null) {
			Map<String, Object> deleteMap = new HashMap();
			String[] keyword_codes = (String[]) map.get("keyword_codes");
			List<Emp_Skill> keywordList = new ArrayList();
			for (int i = 0; i < keyword_codes.length; i++) {
				Emp_Skill emp_skill = new Emp_Skill();
				emp_skill.setKeyword_code(Integer.parseInt(keyword_codes[i]));
				emp_skill.setEmp_no(emp_no);
				keywordList.add(emp_skill);
				empSkillList.add(emp_skill);
			}
			deleteMap.put("keywordList", keywordList);
			deleteMap.put("emp_no", Integer.valueOf(emp_no));
			this.ed.deleteSkill(deleteMap);
		}
		if (map.get("etc") == null) {
			Map<String, Object> deleteMap = new HashMap();
			deleteMap.put("etc", "etc");
			deleteMap.put("emp_no", Integer.valueOf(emp_no));
			this.ed.deleteSkill(deleteMap);
		} else {
			Emp_Skill emp_skill = new Emp_Skill();
			emp_skill.setEmp_no(emp_no);
			emp_skill.setEtc((String) map.get("etc"));
			empSkillList.add(emp_skill);
		}
		return this.ed.skillMody(empSkillList);
	}

	public List<Emp_Skill> selectSkill(int emp_no) {
		return this.ed.selectSkill(emp_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public int licenseMody(List<License> licenseList, int emp_no) {
		Map<String, Object> deleteMap = new HashMap();
		if (licenseList.size() > 0)
			deleteMap.put("licenseList", licenseList);
		deleteMap.put("emp_no", Integer.valueOf(emp_no));
		this.ed.deleteLicense(deleteMap);
		int result = 0;
		if (licenseList.size() <= 0) {
			result = 1;
		} else {
			result = this.ed.licenseMody(licenseList);
		}
		return result;
	}

	public List<Career> selectCareer(int emp_no) {
		return this.ed.selectCareer(emp_no);
	}

	public void deleteProject(int project_no) {
		this.ed.deleteProject(project_no);
	}

	public void deleteCareer(int career_no) {
		this.ed.deleteCareer(career_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public int careerMody(List<Career> careerList) {
		int result = 0;
		int i;
		for (i = 0; i < careerList.size(); i++) {
			Career career = careerList.get(i);
			if (career.getResignation_date().equals(""))
				career.setResignation_date(null);
			result += this.ed.careerMody(career);
		}
		for (i = 0; i < careerList.size(); i++) {
			int career_num = ((Career) careerList.get(i)).getCareer_no();
			List<Project> projectList = ((Career) careerList.get(i)).getProjectList();
			if (projectList != null) {
				for (int j = 0; j < projectList.size(); j++) {
					((Project) projectList.get(j)).setCareer_num(career_num);
					if (((Project) projectList.get(j)).getProject_no() > 0
							&& ((Project) projectList.get(j)).getEnd_date().equals(""))
						((Project) projectList.get(j)).setEnd_date(null);
				}
				this.ed.projectMody(projectList);
			}
		}
		return result;
	}

	public List<Search_Employee> adminSearch(Map<String, Object> map) {
		return this.ed.adminSearch(map);
	}

	public int getAdminSearchCount(Search_Employee search) {
		return this.ed.getAdminSearchCount(search);
	}

	public Employee selectDetailEmp(int emp_no) {
		return this.ed.selectDetailEmp(emp_no);
	}

	public int deleteEmp(int emp_no) {
		return this.ed.deleteEmp(emp_no);
	}

	@Transactional(rollbackFor = { Exception.class })
	public int passwordCheck(Employee emp) {
		int result = 0;
		String rawPassword = emp.getEmp_pwd();
		String encPassword = this.ed.selectEncPassword(emp);
		if (this.passwordEncoder.matches(rawPassword, encPassword))
			result = 1;
		return result;
	}

	public int updatePwd(Employee emp) {
		String encPassword = this.passwordEncoder.encode(emp.getEmp_pwd());
		emp.setEmp_pwd(encPassword);
		return this.ed.updatePwd(emp);
	}

	public Attachment selectProfileImg(int emp_no) {
		return this.ed.selectProfileImg(emp_no);
	}

	public Employee findMyId(Employee emp) {
		return this.ed.findMyId(emp);
	}

	public Employee findMyPwd(Employee emp) {
		emp = this.ed.findMyPwd(emp);
		if (emp != null) {
			String randomPassword = UUID.randomUUID().toString().replaceAll("-", "");
			randomPassword = randomPassword.substring(0, 10);
			String encPassword = this.passwordEncoder.encode(randomPassword);
			emp.setEmp_pwd(encPassword);
			this.ed.updatePwd(emp);
			emp.setEmp_pwd(randomPassword);
		}
		return emp;
	}

	public List<Department> selectDepartment() {
		return this.ed.selectDepartment();
	}

	public List<Degree> selectDegree() {
		return this.ed.selectDegree();
	}

	public List<Graduate_Status> selectGraduate() {
		return this.ed.selectGraduate();
	}

	public List<Military_Service> selectMiliService() {
		return this.ed.selectMiliService();
	}

	public List<Military_Group> selectMiliGroup() {
		return this.ed.selectMiliGroup();
	}

	public List<Militaty_Rank> selectMiliRank() {
		return this.ed.selectMiliRank();
	}

	public List<Discharge> selectDischarge() {
		return this.ed.selectDischarge();
	}

	public List<Education_Status> selectEduStatus() {
		return this.ed.selectEduStatus();
	}

	public List<Skill> selectSkills() {
		return this.ed.selectSkills();
	}

	public List<Keyword> selectKeywords() {
		return this.ed.selectKeywords();
	}

	public List<Skill_Type> selectSkillType() {
		return this.ed.selectSkillType();
	}

	public List<License_List> selectliList() {
		return this.ed.selectliList();
	}
}
