import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String date = request.getParameter("date");

        Task nouvelleTache = new Task(titre, description, date);

        HttpSession session = request.getSession();
        List<Task> taches = (List<Task>) session.getAttribute("taches");

        if (taches == null) {
            taches = new ArrayList<>();
        }

        taches.add(nouvelleTache);
        session.setAttribute("taches", taches);

        response.sendRedirect("lesconditions.jsp");
    }
}
