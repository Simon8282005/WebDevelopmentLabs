<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .card {
                display: flex;
                flex-direction: column;
                border: 1px solid #ccc;
                box-shadow: 0 0px 0px rgba(0, 0, 0, 0);
                transition: box-shadow 0.3s ease-in;
                padding: 20px;
            }

            .card:hover {
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            }

            .formContainer {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .formContainer .formTitle {
                font-size: 20px;
                font-weight: 700;
                color: #7144C1;
            }

            .formContainer p {
                display: block;
            }

            .formBorder {
                border: 1px solid grey;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Use JSP Declaration Tag. JSP Scriplet and <br/> JSP Expression in Application</h1>
        <div class="card">
            <div class="formContainer">
                <fieldset class="formBorder">
                    <legend>Insurance Calculation</legend>
                    <form action="processInsuranceQuo.jsp" method="POST">
                        <label class="formLabel">IC No* </label><br/>
                        <input type="text" name="ic" placeholder="E.g. xxxxxx-xx-xxxx" required><br/><br/>

                        <label class="formLabel">Name*</label><br/>
                        <input type="text" name="name" placeholder="Enter name" required><br/><br/>

                        <label class="formLabel">Market Price*</label><br/>
                        <input type="number" name="price" placeholder="Price" required><br/><br/>

                        <label class="formLabel" name="coverage">Coverage Type</label><br/>
                        <select name="coverage">
                            <option value="thirdParty">Third Party</option>
                            <option value="comprehensive">Comprehensive</option>
                        </select><br/><br/>

                        <label class="formLabel">No Claims Discount(NCD)</label><br/>
                        <select name="ncd">
                            <option value="0.1">10%</option>
                            <option value="0.2">20%</option>
                            <option value="0.3">30%</option>
                            <option value="0.4">40%</option>
                            <option value="0.5">50%</option>
                        </select><br/><br/>

                        <input type="submit" value="Convert">
                        <input type="reset" value="Cancel">
                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>
