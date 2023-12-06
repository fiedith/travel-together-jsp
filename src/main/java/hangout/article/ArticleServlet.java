package hangout.article;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hangout.comment.Comment;
import hangout.comment.CommentDao;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get the article ID from the request parameter
        String articleId = request.getParameter("articleId");

        // 댓글
        CommentDao commentDao = new CommentDao(); 
        List<Comment> comments = commentDao.getCommentsByArticleId(articleId);
        
        // Assuming you have a method to retrieve an article by ID from your data source
        ArticleDao articleDao = new ArticleDao();
        Article article = articleDao.getArticleById(articleId);

        // Set the article in the request attribute
        request.setAttribute("article", article);
        request.setAttribute("comments", comments);


        // Forward the request to the article.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("article.jsp");
        dispatcher.forward(request, response);
    }
}
