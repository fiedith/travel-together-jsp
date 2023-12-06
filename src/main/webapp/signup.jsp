<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
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
    height: 600px;
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
  .loginLayout {
    display: flex;
    margin: auto;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .title {
    font-size: 2rem;
    color: #22b0f2;
    font-weight: 700;
    margin-bottom: 20px;
  }

  .text {
    width: 100%;
    margin-top: 10px;
    font-size: 1rem;
    font-weight: 700;
    color: #000f14;
  }

  .input {
    margin-top: 5px;
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }

  .buttons {
    margin-top: 15px;
    padding: 12px;
    width: 100%;
    background-color: #22b0f2;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
  }
  .bodyLayout{
    width: 100%;
    height: 94vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  .loginForm{
      width: 540px;
  }
</style>

<body>
  <div class="layout">
    <div class="headerLayout">
      <div class="headerLayout_L">
        <a href="hello.jsp" class="logo">Travel Together</a>
        <div class="H_select">
          <select class="selects">
            <option value="title" >제목</option>
            <option value="content" >내용</option>
            <option value="nickname" >닉네임</option>
          </select>
          <input placeholder="검색어를 입력해주세요" class="H_search" value="">
          <button class="S_button">검색</button>
        </div>
        <div class="headerLayout_R">
          <a href="login.jsp" class="button">로그인</a>
          <a href="signup.jsp" class="button">회원가입</a>
        </div>
      </div>
    </div>
  </div>
  <div class="bodyLayout">
    <div class="loginLayout">
      <div class="loginForm">
        <div class="title">회원가입</div>
        <form action="RegisterServlet" method="post">
            <div class="text">닉네임</div>
            <input type="text" placeholder="닉네임" class="input" name="nickname" required>
            <div class="text">아이디</div>
            <input type="text" placeholder="이메일" class="input" name="userId" required>
            <div class="text">비밀번호</div>
 
			<input type="password" placeholder="비밀번호" class="input" name="password" id="password" required>
            <div class="text">비밀번호 확인</div>
            <input type="password" placeholder="비밀번호 확인" class="input" name="confirmPassword" id="confirmPassword" required>
            <span id="passwordMatchMessage"></span>
           
            <div class="text">성별</div>
            <select class="select" name="gender" required>
                <option value="" disabled selected>성별 선택</option>
                <option value="MAN">남성</option>
                <option value="WOMAN">여성</option>
            </select>

            <div class="text">나이</div>
            <select class="select" name="age" required>
                <option value="" disabled selected>성별 선택</option>
                <option value="10">10대</option>
                <option value="20">20대</option>
                <option value="30">30대</option>
                <option value="40">40대</option>
                <option value="50">50대</option>
            </select>
            <button type="submit" class="buttons">회원가입</button>
        </form>
      </div>
    </div>
  </div>
  <script>
    document.getElementById('confirmPassword').addEventListener('blur', function () {
        var password = document.getElementById('password').value;
        var confirmPassword = this.value;

        var messageElement = document.getElementById('passwordMatchMessage');

        if (password !== confirmPassword) {
            messageElement.textContent = '비밀번호가 일치하지 않습니다.';
        } else {
            messageElement.textContent = '';
        }
    });
  </script>
</body>
</html>

