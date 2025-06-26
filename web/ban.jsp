<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông Báo Tài Khoản Bị Cấm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            color: #fff;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            padding: 30px;
            display: inline-block;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #ff7eb3;
            background: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s, color 0.3s;
        }
        .btn:hover {
            background: #ff7eb3;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tài Khoản Bị Cấm</h1>
        <p>Chúng tôi rất tiếc phải thông báo rằng tài khoản của bạn đã bị cấm vì vi phạm điều lệ của chúng tôi.</p>
        <p>Nếu bạn tin rằng đây là một sự nhầm lẫn, vui lòng liên hệ với bộ phận hỗ trợ của chúng tôi qua SĐT 0392231547 để được trợ giúp thêm.</p>
        <a href="login.jsp" >Back to Login</a>
        
    </div>
</body>
</html>
