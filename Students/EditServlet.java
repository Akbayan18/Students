package kz.baibalaeva.javaEE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/edit?error";
        Long id = Long.valueOf(req.getParameter("id"));
    String name = req.getParameter("name");
    String surname = req.getParameter("surname");
    String birthdate = req.getParameter("birthdate");
    String city = req.getParameter("city");

    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setSurname(surname);
    student.setBirthdate(birthdate);
    student.setCity(city);

    if (DBManager.updateStudent(student)){
    redirect="/home";
}
resp.sendRedirect(redirect);
    }
}
