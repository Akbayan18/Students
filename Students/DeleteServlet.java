package kz.baibalaeva.javaEE;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        @WebServlet("/delete")
        public class DeleteServlet extends HttpServlet {
            @Override
            protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String red= "/delete?error";
                Long id = Long.valueOf(req.getParameter("id"));
        if(DBManager.deleteStudent(id)){
            red= "/home";
        }
        resp.sendRedirect(red);

    }
}