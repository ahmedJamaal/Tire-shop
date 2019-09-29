# Tire-shop
build with Spring Boot and Hibenate 

# Project Description:
* It’s web application for a car tire shop , Web App provides services to owner that can add new product with details and manage them ,also contain budget expenses and incomes.
* the user can add information about supliers and manage them

# Project Tools:
Spring boot / mysql / hibernate  

# Project architecture
* This Project Using the most popular DAO Design Pattern that make easily isolate application layer 
 
# What is DAO Pattern ?
* The Data Access Object (DAO) pattern is a structural pattern that allows us to isolate the application/business layer from the persistence layer (usually a relational database, but it could be any other persistence mechanism) using an abstract API.

# DAO Exapmle

![Image](https://github.com/ahmedJamaal/Tire-shop/blob/master/screenShot/Screenshot_2019-09-29%2001-spring-boot-rest-project-overview%20pdf%20-%2001-spring-boot-rest-project-overview%20pdf.png)

# Development Process


1. Define DAO interface
``` java
public interface EmployeeDAO {
public List<Employee> getEmployees();
}
```

2. Define DAO implementation
``` java
public class EmployeeDAOImpl implements EmployeeDAO {
@Autowired
private SessionFactory sessionFactory;
public List<Employee> getEmployees() {
...
}
}
```
3. Create Employee Service
``` java
@Service
public class EmployeeService{
	
	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	@Transactional
	public List<User> getAllUsers() {
		
		return employeeDAO.getAllEmployes();
	}
```
4. Create Employee Controller
``` java
@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	

	@RequestMapping("/Users")
	public String listUsers(Model theModel) {
		//calling services 
  .....
	}
```
