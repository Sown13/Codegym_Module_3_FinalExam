package controller;

import dao.EmployeeDAO;
import model.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/home")
public class EmployeeServlet extends HttpServlet {
    EmployeeDAO employeeDAO;
    @Override
    public void init() {
        this.employeeDAO = new EmployeeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choice = request.getParameter("choice");
        if (choice == null) {
            choice = "";
        }
            switch (choice) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "edit":
                    showUpdateForm(request, response);
                    break;
                case "delete":
                    showDeleteForm(request, response);
                    break;
                default:
                    getEmployeeList(request, response);
                    break;
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choice = request.getParameter("choice");
        if (choice == null) {
            choice = "";
        }
            switch (choice) {
                case "create":
                    createNewEmployee(request, response);
                    getEmployeeList(request, response);
                    break;
                case "edit":
                    updateEmployee(request, response);
                    getEmployeeList(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    getEmployeeList(request, response);
                    break;
                default:
                    getEmployeeList(request, response);
                    break;
            }
    }

    private void getEmployeeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Employee> employeeList = employeeDAO.getAllEmployee();
        request.setAttribute("employeeList",employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/home.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String employee_id = request.getParameter("employee_id");
        request.setAttribute("employee_id", employee_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String employee_id = request.getParameter("employee_id");
        request.setAttribute("employee_id", employee_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/delete.jsp");
        dispatcher.forward(request, response);
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int department_id = Integer.parseInt(request.getParameter("department_id"));
        Employee employee = new Employee(name,email,address,phoneNumber,salary,department_id);
        employeeDAO.insertEmployee(employee);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String department = request.getParameter("department_name");
        int department_id = Integer.parseInt(request.getParameter("department_id"));
        Employee employee = new Employee(employee_id,name,email,address,phoneNumber,salary,department,department_id);
        employeeDAO.updateEmployee(employee);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String employee_id = request.getParameter("employee_id");
        employeeDAO.deleteEmployee(employee_id);
    }
}
