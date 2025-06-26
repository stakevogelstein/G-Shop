<%@ page contentType="text/html" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <style>
            .body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 65vh;
            }
            .profile-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            .profile-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .profile-header h2 {
                margin: 0;
                color: #333;
            }
            .profile-info {
                list-style: none;
                padding: 0;
            }
            .profile-info li {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .profile-info li span {
                font-weight: bold;
                color: #555;
            }
        </style>
    </head>

    <body>
        
     
        
        <%@include file="pannerAdmin.jsp" %>
        <div class="body">
            <div class="profile-container">
                <div class="profile-header">
                    <h2>User Profile</h2>
                </div>

                <ul class="profile-info">
                    <li><span>Full Name:</span>${user.fullname} </li>
                    <li><span>Email:</span> ${user.email}  </li>
                    <li><span>Phone:</span> ${user.phone} </li>
                    <li><span>Address:</span>${user.address}  </li>
                </ul>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
