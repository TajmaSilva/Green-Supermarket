<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <!-- Importing all ui libs -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="js/jquery.easing.min.js"></script>
    <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
    <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
</head> 
<style>
    body {
        background-color: #1a1a1a; /* Dark Background Color */
        color: #fff; /* Text Color */
        padding-top: 0px; /* Adjusted for Fixed Navbar */
    }

    .banner-grid {
        margin-top: 20px;
        background-color: #333;
        padding: 20px;
    }

    #visual {
        margin-bottom: 20px;
    }

    .welcome-section {
        text-align: center;
        padding: 50px 0;
        background-color: #444;
        color: #fff;
    }

    .welcome-section h1 {
        font-size: 42px;
        margin-bottom: 20px;
    }

    .welcome-section p {
        font-size: 20px;
        margin-bottom: 30px;
    }

    .instructions {
        font-size: 18px;
        margin-top: 30px;
    }

    .category-container {
        text-align: center;
        margin-top: 20px;
        background-color: #555;
        padding: 20px;
    }

    .category-item {
        display: inline-block;
        margin: 0 20px;
    }

    .category-item img {
        max-width: 100%;
        height: auto;
    }
</style>
</head>

<body>
    <div class="ban-top">
        <div class="container">
            <div class="top_nav_left">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                        </div>
                        <jsp:include page="header.jsp"></jsp:include>
                        </div>
                    </nav>
                </div>
                <div class="top_nav_right">
                    <div class="cart box_1">
                        <a href="checkout.jsp">
                        <%
                            //Getting all cart details of the customer
                            ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
                            resultCount.next();
                            int count = resultCount.getInt(1);
                        %>
                        <h3>
                            <div class="total">
                                <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                                (<%=count%> items )
                            </div>
                        </h3>
                    </a>
                    <p>
                        <a href="javascript:;" class="simpleCart_empty">My Cart</a>
                    </p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>    </div>

    <div class="welcome-section">
        <h1>Welcome to our online shopping platform</h1>
        <p>Explore extraordinary products that fit your lifestyle.</p>
        <div class="instructions">
            <p>If you have an account, <a href="customer-login.jsp">login here</a>.</p>
            <p>If you don't have an account, <a href="customer-register.jsp">register as a customer</a>.</p>
        </div>
    </div>
</div>
</div>
<br />

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>