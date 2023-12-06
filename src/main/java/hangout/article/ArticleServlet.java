package hangout.article;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get the article ID from the request parameter
        String articleId = request.getParameter("articleId");

        // Assuming you have a method to retrieve an article by ID from your data source
        ArticleDao articleDao = new ArticleDao();
        Article article = articleDao.getArticleById(articleId);

        // Set the article in the request attribute
        request.setAttribute("article", article);

        // Forward the request to the article.jsp page
        request.getRequestDispatcher("article.jsp").forward(request, response);
    }
}
