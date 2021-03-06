package pl.coderslab.servlet;

import com.google.gson.Gson;
import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.OrderDao;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetOrders", urlPatterns = "/GetOrders")
public class GetOrders extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");

        String employeeIdParam = request.getParameter("employeeId").trim();
        String vehicleIdParam = request.getParameter("vehicleId").trim();


        if(!employeeIdParam.isEmpty() && !vehicleIdParam.isEmpty()){

            int employeeId = Integer.parseInt(employeeIdParam);
            int vehicleId = Integer.valueOf(vehicleIdParam);

            List<Order> employeeOrdersOnVehicle = OrderDao.loadAllByEmployeeIdAndVehicleId(employeeId, vehicleId);
            if(employeeOrdersOnVehicle!= null) {
                response.setContentType("application/json");
                new Gson().toJson(employeeOrdersOnVehicle, response.getWriter());
            }

        } else if(!employeeIdParam.isEmpty()) {
            int employeeId = Integer.parseInt(employeeIdParam);
            List<Order> employeeOrders = OrderDao.loadAllByEmployeeId(employeeId);
            if(employeeOrders!= null) {
                response.setContentType("application/json");
                new Gson().toJson(employeeOrders, response.getWriter());
            }
        }

    }
}
