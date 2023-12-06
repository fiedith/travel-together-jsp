<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Travel Together</title>
</head>
<style>
  body{
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
  .pic{
    height: 400px;
    background-color: #3db9ff;
  }
  .mainText{
    margin-top: 1rem;
    width: 100%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    font-weight: 500;
    font-size: 1.5rem;
    font-family: 'SUITE-Regular';
  }
  .postList{
  	display: grid;
  	grid-template-rows : repeat(4,1fr)
  }
</style>
<body>
  <p><%= request.getAttribute("message") %></p>

  <div class="layout">
    <div class="headerLayout">
      <div class="headerLayout_L">
        <a href="hello.jsp" class="logo">Travel Together</a>
        <form action="read" method="get" class="H_select">
          <select class="selects">
            <option value="title" >제목</option>
            <option value="nickname" >닉네임</option>
          </select>
          <input placeholder="검색어를 입력해주세요" class="H_search" value="">
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
  <div>
    <div class="mainText">인기 여행지</div>
<%--     <div class="postList">
    	<c:forEach var="item" items="${dataArray}">
        	<p>${item}</p>
    	</c:forEach>
    </div> --%>
  </div>
</body>
</html>
