package hangout.global;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;

@WebServlet("/SwingAppServlet")
public class SwingAppServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // SwingApp 실행
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Swing App");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            String htmlContent = "<html><body><h1>travel together</h1> <p>혼자 여행 떠나지 마세요</p></body></html>";

            // Use a JEditorPane for HTML content
            JEditorPane editorPane = new JEditorPane("text/html", htmlContent);
            editorPane.setEditable(false);

            JScrollPane scrollPane = new JScrollPane(editorPane);

            frame.getContentPane().add(scrollPane);
            frame.pack();
            frame.setVisible(true);
        });
    }
}
