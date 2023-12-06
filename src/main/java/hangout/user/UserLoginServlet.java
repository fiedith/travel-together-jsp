package hangout.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        // Validate the user credentials
        UserDao userDao = new UserDao();
        int loginResult = userDao.login(userId, password);

        if (loginResult == 1) {
            // Login successful, set user information in the session
            User user = userDao.getUser(userId);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to home
            response.sendRedirect("hello.jsp");
            
        } else {
            // Login failed, redirect back to the login form with an error message
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
