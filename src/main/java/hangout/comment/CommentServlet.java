package hangout.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long articleId = Long.parseLong(request.getParameter("articleId"));
        long userId = Long.parseLong(request.getParameter("userId"));
        String content = request.getParameter("content");

        // Process and store the comment in the database using your CommentDao
        Comment comment = new Comment();
        comment.setArticleId(articleId);
        comment.setUserId(userId);
        comment.setContent(content);

        CommentDao commentDao = new CommentDao();
        commentDao.createComment(comment);

        // Redirect back to the article page or show a success message
        response.sendRedirect("ArticleServlet?articleId=" + articleId);
    }
}
