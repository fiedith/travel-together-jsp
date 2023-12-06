package hangout.article;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ArticleSearchServlet")
public class ArticleSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get the search title from the request parameter
        String searchTitle = request.getParameter("searchTitle");

        // Perform a search based on the provided title
        ArticleDao articleDao = new ArticleDao();
        List<Article> articleList = articleDao.getArticlesByTitle(searchTitle);
        request.setAttribute("articleList", articleList);

        // Forward to the articleList.jsp to display the search results
        RequestDispatcher dispatcher = request.getRequestDispatcher("articleList.jsp");
        dispatcher.forward(request, response);
    }
}
