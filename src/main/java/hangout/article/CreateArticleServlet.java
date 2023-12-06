package hangout.article;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hangout.user.User;

@WebServlet("/CreateArticleServlet")
public class CreateArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user"); // Adjusted attribute name

        if (loggedInUser != null) {
            // User is logged in
            int loggedInUserId = loggedInUser.getId();

            // Retrieve article details from the form
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            LocalDate travelStart = LocalDate.parse(request.getParameter("travel_start"));
            LocalDate travelEnd = LocalDate.parse(request.getParameter("travel_end"));
            String travelRegion = request.getParameter("travel_region");
            String travelCity = request.getParameter("travel_city");
            int numberOfPartners = Integer.parseInt(request.getParameter("number"));
            
            // @TODO: 사진 번호
//            int imageNumber = Integer.parseInt(request.getParameter("image_number"));

            // Create an Article object with the retrieved details
            Article newArticle = new Article();
            newArticle.setUserId(loggedInUserId);
            newArticle.setTitle(title);
            newArticle.setContent(content);
            newArticle.setTravelStart(travelStart);
            newArticle.setTravelEnd(travelEnd);
            newArticle.setTravelRegion(travelRegion);
            newArticle.setTravelCity(travelCity);
            newArticle.setNumberOfPartners(numberOfPartners);
            
         // @TODO: 사진 번호
//            newArticle.setImageNumber(imageNumber);

            // Save the article to the database
            ArticleDao articleDao = new ArticleDao();
            int result = articleDao.createArticle(newArticle, loggedInUserId);

            if (result > 0) {
                // Article creation successful
                response.sendRedirect("hello.jsp");
            } else {
                // Article creation failed
                response.sendRedirect("error.jsp");
            }
        } else {
            // User is not logged in, handle accordingly (e.g., redirect to login page)
            response.sendRedirect("login.jsp");
        }
    }
}
