<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
        <script type="text/javascript">
            function validate () {
                var usr = $("#ip_user").val();
                var psw = $("#ip_pass").val();
                if (usr.trim() === '') {
                    alert ("Username can't be empty");
                    $("#ip_user").focus();
                    return false;
                }
                if (psw.trim() === '') {
                    alert ("Password can't be empty");
                    $("#ip_pass").focus();
                    return false;
                }
                return true;
            }
        </script>
        <style type="text/css">
            body {
                background-image: url(images/bg.jpg);
                background-size: cover;
                background-color: black;
                background-repeat: no-repeat;
            }
            #login_div {
                //opacity: 0.7;
                border: 5px solid green;
                border-radius: 10px;
                position: absolute;
                top: 1%;
                left: 10%;
                text-align: center;
                vertical-align: central;
                padding-left: 10px;
                padding-right: 10px;
            }
            #head1 {
                text-align: center;
                color: green;
                line-height: 120%;
            }
            #head2 {
                text-align: center;
                color: green;
                line-height: 120%;
            }
            #login_form {
                color: green;
                text-align: center;
            }
            #login_form input {
                color: black;
                font-size: larger;
                line-height: 120%;
                border: 2px solid white;
                border-radius: 5px;
                text-align: left;
            }
            #login_form .lft {
                text-align: left;
                font-size: large;
                font-weight: bold;
            }
            #banner {
                left: 10%;
            }
        </style>
    </head>
    <body>
        <div id="login_div">
            <img src="images/banner1.jpg" alt="Diamond Casino" height="200" width="200" id="banner"/>
            <h5 id="head1">
                FOR AMUSEMENT ONLY
            </h5>
            <h1 id="head2">
                Member Login
            </h1>
            <form id="login_form" method="post" onsubmit="return validate();" action="LoginPerform">
                <p class="lft">User Name:<br/>
                    <input type="text" id="ip_user" name="uid" /></p>
                <p class="lft">Password:<br />
                    <input type="password" id="ip_pass" name="pass" /></p>
                <br /><br />
                <input type="submit" value="Login" style="padding: 10px; font-weight: bold; font-size: large;"/>
                <br /><br />
                <a >New User? Sign up here</a>
            </form>
            <br /><br />
        </div>
    </body>
</html>
