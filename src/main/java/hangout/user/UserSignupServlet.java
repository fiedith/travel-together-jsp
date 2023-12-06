package hangout.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class UserSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String nickname = request.getParameter("nickname");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));

        // Validate the form data (You can add more validation logic here)

        // Create a User object
        User user = new User();
        user.setUserName(nickname);
        user.setUserId(userId); // Assuming email is used as the user ID
        user.setUserPassword(password);
        user.setUserGender(gender);
        user.setUserAge(age);

        // Perform user registration
        UserDao userDao = new UserDao();
        // 아이디 중복 검증 
        if(userDao.userExists(userId)) {
        	response.sendRedirect("signup.jsp?error=email_exists");
        	return;
        }
        
        // 비밀번호 확인 검증 
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=password_mismatch");
            return;
        }
        
        int result = userDao.join(user);

        if (result > 0) {
            // Registration successful, redirect to a success page or login page
            response.sendRedirect("hello.jsp");
        } else {
            // Registration failed, redirect back to the registration form with an error message
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
