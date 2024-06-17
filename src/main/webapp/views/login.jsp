<%-- 
    Document   : login
    Created on : Jun 11, 2024, 11:58:55 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Login</title>
        <link rel="icon" href="img/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!--================Login Box Area =================-->
        <section class="login_box_area section-margin">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <div class="hover">
                                <h4>New to our website?</h4>
                                <p>There are advances being made in science and technology everyday, and a good example of this is the</p>
                                <a class="button button-account" href="register">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Log in to enter</h3>
                            <form class="row login_form" action="login" method="post" >
                                    <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger" role="alert">
                                        ${errorMessage}
                                    </div>
                                </c:if>
                                    <div class="col-md-12 form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="creat_account">
                                            <input type="checkbox" id="f-option2" name="selector">
                                            <label for="f-option2">Keep me logged in</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="button button-login w-100">Log In</button>
                                        <a href="resetpassword">Forgot Password?</a>
                                    </div>
                                </form>

                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!--================End Login Box Area =================-->


        <jsp:include page="footer.jsp"/>

        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
