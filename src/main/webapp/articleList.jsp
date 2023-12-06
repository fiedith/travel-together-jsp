<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  .headerLayout{
    width: 80%;
    height: 60px;
    background-color: white;
    display: flex;
    flex-direction: column;
    color: #3db9ff;
    justify-content: center;
  }
  .headerLayout_L{
    justify-content: space-between;
    display: flex;
    flex-direction: row;
  }
  .logo{
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 100%;
    font-size: 1.4rem;
    letter-spacing: 2px;
    color: #3db9ff;
    background-color: white;
    font-weight: bold;
    border: none;
    transition: transform 0.7s;
    cursor: pointer;
  }
  .H_select{
    width: 50%;
    height: 100%;
    border: 1.5px groove #c2c3c5;
    border-radius: 0.9rem;
    padding-left: 1rem;
    padding-right: 1.5rem;
    align-items: center;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    font-size: medium;
  }
  .selects{
    border: none;
    color: #3db9ff;
    font-size: large;
    font-weight: bolder;
    cursor: pointer;
  }
  .H_search{
    width: 80%;
    border: none;
    height: 100%;
    opacity: 0.7;
    font-size: large;
    font-weight: bolder;
  }
  .S_button{
    width: 4rem;
    color: #3db9ff;
    border: none;
    font-size: large;
    font-weight: bolder;
    background-color: white;
    cursor: pointer;
  }
  .headerLayout_R{
    display: flex;
    margin-left: 1rem;
  }
  .button{
    width: 5.5rem;
    display: flex;
    justify-content: center;
    padding: 0.5rem;
    background-color: #4ab8f7;
    color: white;
    border-radius: 1rem;
    font-weight: bold;
    font-family: 'NanumSquareNeo-Variable';
    margin-top: 4px;
    margin-bottom: 4px;
    cursor: pointer;
    margin: 4px;
  }
  .postLayout{
    background-color: #eaf0f8;
    height: 100%;
    padding-bottom: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .post{
    width: 70rem;
    height: 30rem;
    display: flex;
    align-items: center;
    flex-direction:  column;
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
  .pic{
    height: 400px;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    background-size : cover;
    background-image: url("https://plus.unsplash.com/premium_photo-1700141570570-22c02f4b654f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
  }
  .circle {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #3498db;
    color: white;
    text-align: center;
    vertical-align: middle;
    position: fixed;
    bottom: 20px; 
    right: 20px; 
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
<body>
    <div class="layout">
        <div class="headerLayout">
          <div class="headerLayout_L">
            <a href="hello.jsp" class="logo">Travel Together</a>
            <form action="ArticleSearchServlet" method="get" class="H_select">
              <select class="selects">
                <option value="title" >제목</option>
              </select>
              <input placeholder="검색어를 입력해주세요" class="H_search" value="" name="searchTitle">
              <button type="submit" class="S_button">검색</button>
            </form>
            <div class="headerLayout_R">
              <c:choose>
                <c:when test="${empty sessionScope.user}">
                  <!-- User is not logged in -->
                  <a href="login.jsp" class="button">로그인</a>
                  <a href="signup.jsp" class="button">회원가입</a>
                </c:when>
                <c:otherwise>
                  <!-- User is logged in -->
                  <a href="LogoutServlet" class="button">로그아웃</a>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
      <div class="pic">
    
      </div>

    <div class="article-list">
        <h2>검색 결과</h2>

        <c:forEach var="article" items="${articleList}">
            <div class="article">
                <c:if test="${article.imageNumber eq 1}">
                   <img src="images/1.jpg" alt="ocean">
                </c:if>
                <c:if test="${article.imageNumber eq 2}">
                  <img src="images/2.jpg" alt="mountain">
                </c:if>
                <c:if test="${article.imageNumber eq 3}">
                  <img src="images/3.jpg" alt="temple">
                </c:if>
                <h3>제목: <a href="ArticleServlet?articleId=${article.articleId}">${article.title}</a></h3>
                <p>작성자: ${article.userName}</p>
            </div>
        </c:forEach>
    </div>
    <a href="create.jsp" class="circle">
      글쓰기
    </a>
</body>
</html>