package kr.co.hta.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.hta.hr.vo.Department;
import kr.co.hta.hr.vo.Employee;
import kr.co.hta.util.ConnectionUtils;

public class EmployeeDao {
	
	public ArrayList<Employee> getAllEmployees() throws Exception{
		ArrayList<Employee> employees = new ArrayList<Employee>();
		String sql = "select * from employees ";
		
		Connection con = ConnectionUtils.hrConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
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
	public ArrayList<Employee> getEmployeesByDeptId(int id) throws Exception{
		ArrayList<Employee> employees = new ArrayList<Employee>();
		String sql = "select * "
				+ "from employees e "
				+ "where e.department_id =? "
				+ "order by employee_id";
		
		Connection con = ConnectionUtils.hrConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
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
