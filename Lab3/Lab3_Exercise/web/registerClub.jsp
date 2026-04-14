<%-- 
    Document   : registerClub
    Created on : Apr 14, 2026, 4:07:24 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <style>
            body {
                background-color: #1E293B;
                color: #F8FAFC;
                justify-content: center;
                align-items: center;
                display: flex;
            }
            
            fields {
                display: block;
                justify-content: center;
                align-items: center;
                width: 100%;
            }
            
            .field {
                background-color: #334155;
                color: #F8FAFC;
                font-size: 14px;
                border: none;
                outline: none;
                display: block;
                left: 50%;
                height: 34px;
                vertical-align: middle;
                border-radius: 22px;
                width: 220px;
                box-sizing: border-box;
                padding-right: 10px;
                padding-left: 10px;
            }
            
            .field::placeholder {
                color: #94A3B8;
            }
            
            .field:focus {
               outline: 2px solid #6366F1;
            }
            
            .submit {
                color: white;
                border-radius: 22px;
                min-height: 30px;
                padding: 5px;
                background-color: #6366F1;
                padding-left: 10px;
                padding-right: 10px;
                
            }
            
            .submit:hover {
                outline: 1px solid white;
            }
            
            .cancel {
                color: black;
                border-radius: 22px;
                min-height: 30px;
                padding-left: 10px;
                padding-right: 10px;
            }
            
            .cancel:hover {
                outline: 1px solid white;
            }
        </style>
        
        <form method="POST" action="processRegistration">
            <h1>Please fill in you personal information....</h1>
            <div class="fields">
                <span>
                    <input type="text" class="field" name="name" placeholder="Name.."><br /><br />
                </span>
                
                <span>
                    <input type="text" class="field" name="matric" placeholder="Matic Number.."><br /><br />
                </span>
                
                <span>
                    <select class="field" name="club" value="Select your club..">
                        <option value="COMTECH">COMTECH</option>
                        <option value="XXR">XXR</option>
                        <option value="Buddist">Buddist</option>
                    </select><br /><br />
                </span>
            </div>
            
            <input class="submit" type="submit" value="Register">
            <input class="cancel" type="reset" value="Cancel">
        </form>
    </body>
</html>
