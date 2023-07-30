<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <title>BestFood</title>
    <style>
        body {
            background-image: url("https://images.pexels.com/photos/616401/pexels-photo-616401.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .login-wrapper {
            text-align: center;
            position: relative;
        }

        .website-name-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: -130px;
            left: 0;
            right: 0;
        }

        .website-name {
            font-family: 'Pacifico', cursive;
            font-size: 80px;
            font-weight: bold;
            color: #e74c3c;
            white-space: nowrap;
        }

        .login-container {
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            position: relative;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-container form .form-group {
            margin-bottom: 20px;
        }

        .login-container form .form-control {
            border-radius: 5px;
        }

        .login-container form .btn-login {
            background-color: #E74B3C;
            color: #fff;
            border: none;
            border-radius: 5px;
            width: 100%;
        }

        .login-container form .btn-login:hover {
            background-color: #D91E18;
        }

        .register-container {
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            position: relative;
            display: none;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .register-container form .form-group {
            margin-bottom: 20px;
        }

        .register-container form .form-control {
            border-radius: 5px;
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .registration-form {
            display: block;
            margin-top: 20px;
        }

        .modal-dialog {
            top: 5%;
            transform: translateY(-95%);
        }

        .modal-content {
            background-color: white;
            border-radius: 10px;
        }

        .modal-title {
            font-family: 'Pacifico', cursive;
            font-size: 36px;
            color: #e74c3c;
        }

        .modal-body {
            margin-top: -20px;
        }

        .linkControl {
            color: #e74c3c;
        }

        .linkControl:hover {
            color: #e74c3c;
        }

        .btn-danger {
            background-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #D91E18;
        }

        #opt > input::placeholder {
            font-size: 17px;
        }

        #submitBtn[disabled],
        #submitBtn[disabled]:hover {
            background-color: #E74B3C;
            color: #fff;
            cursor: default;
        }

        .text-left {
            text-align: left;
        }

    </style>
</head>
<body>
<div class="login-wrapper">
    <div class="website-name-wrapper">
        <h1 class="website-name">BestFood</h1>
    </div>
    <div class="login-container" id="loginContainer">
        <h2>User Login</h2>
        <form action="userloginvalidate" method="post">
            <div class="form-group">
                <input type="text" name="username" id="username" placeholder="Username" required class="form-control form-control-lg">
            </div>
            <div class="form-group">
                <input type="password" class="form-control form-control-lg" placeholder="Password" required name="password" id="password">
            </div>
            <p class="error-message">${failMessage}</p>
            <button type="submit" class="btn btn-login">Log in</button><br><br>
            <span>Don't have an account? <a class="linkControl" href="#" data-toggle="modal" data-target="#registrationModal">Register here</a></span>
        </form>
    </div>


    <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="registrationModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="registrationModalLabel">Create an account</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="newuserregister" method="post" class="registration-form" id="registrationForm">
                        <div class="form-group">
                            <label for="email" style="display: block; width: 100%; text-align: left;">Email address</label>
                            <input type="email" class="form-control form-control-lg" required minlength="6" required name="email" id="email"
                                   aria-describedby="emailHelp" oninput="validateEmail()">
                            <div class="text-left"><span id="emailError" class="error-message"></span></div>
                        </div>
                        <div class="form-group">
                            <label for="firstName" style="display: block; width: 100%; text-align: left;">Username</label>
                            <input type="text" name="username" id="firstName" required class="form-control form-control-lg" oninput="validateUsername()">
                            <div class="text-left"><span id="usernameError" class="error-message"></span></div>
                        </div>
                        <div class="form-group">
                            <label for="passwordd" style="display: block; width: 100%; text-align: left;">Password</label>
                            <input type="password" class="form-control form-control-lg"  required name="password"
                                   id="passwordd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[~`!@#$%\^&*()\-_=+[\]{};:\x27.,\x22\\|/?><]).{8,}" title="Must contain: at least one number, one uppercase letter, one lowercase letter, one special character, and 8 or more characters" required>
                            <div style="margin-right: 70%;"><input type="checkbox" onclick="showPassword()"> <p style="display: inline;">Show password</p></div>
                        </div>
                        <div id="opt" class="form-group">
                            <label for="address" style="display: block; width: 100%; text-align: left;">Address</label>
                            <input class="form-control form-control-lg" rows="3" id="address" placeholder="Optional" name="address"></input>
                        </div>
                        <input id="submitBtn" type="submit" disabled value="Register" class="btn btn-danger btn-block"><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
    function toggleRegistrationForm() {
        var loginContainer = document.querySelector('#loginContainer');
        var registrationForm = document.querySelector('#registrationForm');

        if (loginContainer.style.display === 'none') {
            loginContainer.style.display = 'block';
            registrationForm.style.display = 'none';
        } else {
            loginContainer.style.display = 'none';
            registrationForm.style.display = 'block';
        }
    }
    function showPassword() {
        var x = document.getElementById("passwordd");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
    function checkUsernameAvailability(username) {
        return $.ajax({
            type: "GET",
            url: "/checkUsernameAvailability",
            data: { username: username },
        });
    }

    function checkEmailAvailability(email) {
        return $.ajax({
            type: "GET",
            url: "/checkEmailAvailability",
            data: { email: email },
        });
    }

    function updateSubmitButtonState() {
        var username = document.getElementById("firstName").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("passwordd").value;
        var isValid = true;

        if (!username) {
            isValid = false;
        }

        if (!email) {
            isValid = false;
        } else {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                isValid = false;
                document.getElementById("emailError").textContent = "Invalid email format";
            }
        }

        if (!password) {
            isValid = false;
        }

        var usernameErrorElement = document.getElementById("usernameError");
        var emailErrorElement = document.getElementById("emailError");
        if (usernameErrorElement.textContent || emailErrorElement.textContent) {
            isValid = false;
        }

        var submitButton = document.getElementById("submitBtn");
        submitButton.disabled = !isValid;
    }

    document.getElementById("firstName").addEventListener("input", function () {
        var username = this.value;
        if (username) {
            checkUsernameAvailability(username)
                .then(function (response) {
                    var errorElement = document.getElementById("usernameError");
                    if (response.exists) {
                        errorElement.textContent = "Username already exists";
                        updateSubmitButtonState();
                    } else {
                        errorElement.textContent = "";
                        var emailErrorElement = document.getElementById("emailError");
                        if (!emailErrorElement.textContent) {
                            updateSubmitButtonState();
                        }
                    }
                })
                .catch(function (error) {
                    console.error("Error checking username availability:", error);
                });
        } else {
            document.getElementById("usernameError").textContent = "";
            updateSubmitButtonState();
        }
    });

    document.getElementById("email").addEventListener("input", function () {
        var email = this.value;
        if (email) {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById("emailError").textContent = "Invalid email format";
                updateSubmitButtonState();
                return;
            }

            checkEmailAvailability(email)
                .then(function (response) {
                    var errorElement = document.getElementById("emailError");
                    if (response.exists) {
                        errorElement.textContent = "Email already exists";
                        updateSubmitButtonState();
                    } else {
                        errorElement.textContent = "";
                        var usernameErrorElement = document.getElementById("usernameError");
                        if (!usernameErrorElement.textContent) {
                            updateSubmitButtonState();
                        }
                    }
                })
                .catch(function (error) {
                    console.error("Error checking email availability:", error);
                });
        } else {
            document.getElementById("emailError").textContent = "";
            updateSubmitButtonState();
        }
    });

    document.getElementById("passwordd").addEventListener("input", function () {
        updateSubmitButtonState();
    });

</script>
</body>
</html>
