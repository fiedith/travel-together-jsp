<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 검색</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }
      .layout{
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
    .article-list {
        width: 80%;
        margin: 20px auto;
    }

    .article {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 10px;
    }

    .article a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }
</style>
<body>

    <div class="article-list">
        <h2>검색 결과</h2>

        <c:forEach var="article" items="${articleList}">
            <div class="article">
                <h3>제목: <a href="ArticleServlet?articleId=${article.articleId}">${article.title}</a></h3>
                <p>작성자: ${article.userName}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
