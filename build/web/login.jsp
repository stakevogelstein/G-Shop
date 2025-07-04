<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="./style.css">
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <style>
            body {
                background-color: #9f9da7;
                font-size: 1.6rem;
                font-family: "Open Sans", sans-serif;
                color: #2b3e51;
            }

            h2 {
                font-weight: 300;
                text-align: center;
            }

            p {
                position: relative;
            }

            a,
            a:link,
            a:visited,
            a:active {
                color: #3ca9e2;
                -webkit-transition: all 0.2s ease;
                transition: all 0.2s ease;
            }
            a:focus, a:hover,
            a:link:focus,
            a:link:hover,
            a:visited:focus,
            a:visited:hover,
            a:active:focus,
            a:active:hover {
                color: #329dd5;
                -webkit-transition: all 0.2s ease;
                transition: all 0.2s ease;
            }

            #login-form-wrap {
                background-color: #fff;
                width: 35%;
                margin: 30px auto;
                text-align: center;
                padding: 20px 0 0 0;
                border-radius: 4px;
                box-shadow: 0px 30px 50px 0px rgba(0, 0, 0, 0.2);
            }

            #login-form {
                padding: 0 60px;
            }

            input {
                display: block;
                box-sizing: border-box;
                width: 100%;
                outline: none;
                height: 60px;
                line-height: 60px;
                border-radius: 4px;
            }

            input[type="text"],
            input[type="email"] {
                width: 100%;
                padding: 1px 2px;
                margin: 0;
                color: #8a8b8e;
                border: 1px solid #c2c0ca;
                font-style: normal;
                font-size: 16px;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                position: relative;
                display: inline-block;
                background: none;
            }
            input[type="text"]:focus,
            input[type="email"]:focus {
                border-color: #3ca9e2;
            }
            input[type="text"]:focus:invalid,
            input[type="email"]:focus:invalid {
                color: #cc1e2b;
                border-color: #cc1e2b;
            }
            input[type="text"]:valid ~ .validation,
            input[type="email"]:valid ~ .validation {
                display: block;
                border-color: #0C0;
            }
            input[type="text"]:valid ~ .validation span,
            input[type="email"]:valid ~ .validation span {
                background: #0C0;
                position: absolute;
                border-radius: 6px;
            }
            input[type="text"]:valid ~ .validation span:first-child,
            input[type="email"]:valid ~ .validation span:first-child {
                top: 30px;
                left: 14px;
                width: 20px;
                height: 3px;
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            input[type="text"]:valid ~ .validation span:last-child,
            input[type="email"]:valid ~ .validation span:last-child {
                top: 35px;
                left: 8px;
                width: 11px;
                height: 3px;
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
            }

            .validation {
                display: none;
                position: absolute;
                content: " ";
                height: 60px;
                width: 30px;
                right: 15px;
                top: 0px;
            }

            input[type="submit"] {
                border: none;
                display: block;
                background-color: #3ca9e2;
                color: #fff;
                font-weight: bold;
                text-transform: uppercase;
                cursor: pointer;
                -webkit-transition: all 0.2s ease;
                transition: all 0.2s ease;
                font-size: 18px;
                position: relative;
                display: inline-block;
                cursor: pointer;
                text-align: center;
            }
            input[type="submit"]:hover {
                background-color: #329dd5;
                -webkit-transition: all 0.2s ease;
                transition: all 0.2s ease;
            }

            #create-account-wrap {
                background-color: #eeedf1;
                color: #8a8b8e;
                font-size: 14px;
                width: 100%;
                padding: 10px 0;
                border-radius: 0 0 4px 4px;
            }
        </style>
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <div id="login-form-wrap">
            <h2>Login</h2>
            <form id="login-form" action="login" method="POST">
                <p>
                    <input type="text" id="username" name="username" placeholder="Username" value="${username}" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="password" id="password" name="password" placeholder="Password" required><i class="validation"><span></span><span></span></i>
                </p>
                <p style="color: red">${requestScope.usernameOrPasswordWrong}</p>
                <p>
                    <input type="submit" id="login" value="Login">
                </p>
            </form>
            <div id="create-account-wrap">
                <p><a href="register.jsp">Create Account</a><p>
            </div><!--create-account-wrap-->
        </div><!--login-form-wrap-->
        <!-- partial -->

    </body>
</html>
