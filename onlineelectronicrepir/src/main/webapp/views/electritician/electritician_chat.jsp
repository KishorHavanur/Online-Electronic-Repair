<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.demo.main.model.ChatMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chat with ${user.name}</title>
    <style>
      body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f0f2f5;
  margin: 20px;
  color: #333;
}

h2 {
  text-align: center;
  margin-bottom: 20px;
  font-size: 22px;
  color: #444;
}

.chat-box {
  width: 60%;
  margin: auto;
  border: 1px solid #ccc;
  padding: 15px;
  max-height: 350px;
  overflow-y: auto;
  background: #ffffff;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}

.msg-user, .msg-elect {
  margin: 8px 0;
  padding: 8px 12px;
  border-radius: 8px;
  max-width: 80%;
  word-wrap: break-word;
  font-size: 14px;
  line-height: 1.4;
}

.msg-user {
  background-color: #e0f7fa;
  text-align: left;
  border: 1px solid #b2ebf2;
}

.msg-elect {
  background-color: #c8e6c9;
  text-align: right;
  margin-left: auto;
  border: 1px solid #a5d6a7;
}

form {
  width: 60%;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 10px;
}

input[type="text"] {
  flex: 1;
  padding: 8px 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  background-color: #fff;
  transition: border 0.3s ease;
}

input[type="text"]:focus {
  border-color: #007bff;
  outline: none;
}

input[type="submit"] {
  padding: 8px 16px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #0056b3;
}

    </style>
</head>
<body>

<h2>Chat with ${user.name}</h2>

<div class="chat-box">
    <c:forEach var="m" items="${messages}">
        <div class="${m.senderType == 'user' ? 'msg-user' : 'msg-elect'}">
            <strong>${m.senderName}:</strong> ${m.message}
        </div>
    </c:forEach>
</div>

<form action="${pageContext.request.contextPath}/electritician/chat/send" method="post">
    <input type="hidden" name="userId" value="${user.id}" />
    <input type="text" name="message" placeholder="Type your message..." style="width:70%;" required/>
    <input type="submit" value="Send"/>
</form>

</body>
</html>
