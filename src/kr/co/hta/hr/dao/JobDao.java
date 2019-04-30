package kr.co.hta.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.hta.hr.vo.Employee;
import kr.co.hta.hr.vo.Job;
import kr.co.hta.util.ConnectionUtils;

public class JobDao {
	public ArrayList<Job> getAllJobs() throws Exception{
		ArrayList<Job> jobs = new ArrayList<Job>();
		String sql = "select * from jobs";
		
		Connection con = ConnectionUtils.hrConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Job job = new Job();
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getDouble("min_salary"));
			job.setMaxSalary(rs.getDouble("max_salary"));
			jobs.add(job);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return jobs;
	}
	
	public ArrayList<Employee> getAllEmployeesByJobTitle(String title) throws Exception{
		ArrayList<Employee> employees = new ArrayList<Employee>();
		String sql = "select * "
				+ "from employees e, jobs j "
				+ "where e.job_id = j.job_id "
				+ "and j.job_title = ?";
		
		Connection con = ConnectionUtils.hrConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee employee = new Employee();
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			employee.setJobId(rs.getString("job_id"));
			employee.setSalary(rs.getDouble("salary"));
			employee.setCommissionPct(rs.getDouble("commission_pct"));
			employee.setManagerId(rs.getInt("manager_id"));
			employee.setDepartmentId(rs.getInt("department_id"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return employees;
	}
}
