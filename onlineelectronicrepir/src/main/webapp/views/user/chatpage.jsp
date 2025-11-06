<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Chat with ${electritician.name}</title>
<style>
body {
  background-color: #f0f2f5;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin: 0;
  padding: 20px;
}

h2 {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
}

.chat-box {
  width: 90%;
  max-width: 700px;
  margin: auto;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

.messages {
  height: 320px;
  overflow-y: auto;
  background: #f9f9f9;
  padding: 15px;
  border-radius: 8px;
  border: 1px solid #ddd;
  margin-bottom: 20px;
  scroll-behavior: smooth;
}

.message {
  margin: 10px 0;
  padding: 10px 14px;
  border-radius: 10px;
  max-width: 80%;
  word-wrap: break-word;
  font-size: 15px;
  line-height: 1.4;
  transition: background 0.3s ease;
}

.user {
  background-color: #d1e7dd;
  text-align: right;
  margin-left: auto;
  border: 1px solid #bcd0c7;
}

.electritician {
  background-color: #f8d7da;
  text-align: left;
  margin-right: auto;
  border: 1px solid #e4bfc4;
}

form {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 10px;
}

input[type="text"] {
  flex: 1;
  padding: 10px 14px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 15px;
  background-color: #fff;
  transition: border 0.3s ease;
}

input[type="text"]:focus {
  border-color: #007bff;
  outline: none;
}

button {
  padding: 10px 18px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 8px;
  font-size: 15px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>
<h2 style="text-align:center;">Chat with ${electritician.name}</h2>

<div class="chat-box">
  <div class="messages">
    <c:forEach var="msg" items="${messages}">
      <div class="message ${msg.senderType}">
        <b>${msg.senderName}:</b> ${msg.message}
      </div>
    </c:forEach>
  </div>

  <form action="${pageContext.request.contextPath}/chat/send" method="post">
    <input type="hidden" name="electriticianId" value="${electritician.id}" />
    <input type="text" name="message" placeholder="Type your message..." style="width:80%;" required />
    <button type="submit">Send</button>
  </form>
</div>

</body>
</html>
