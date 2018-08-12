
<!DOCTYPE html>

<%@page import="common.Common_Things"%><html class="no-js">

<head>
    <!-- meta -->
    <meta charset="utf-8">
    <meta name="description" content="Flat, Clean, Responsive, admin template built with bootstrap 3">
    <meta name="viewport" content="width=device-width, user-scalable=1, initial-scale=1, maximum-scale=1">

    <title>Cameo | Responsive Admin Dashboard</title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/bootstrap/css/bootstrap.min.css">
    <!-- /bootstrap -->

    <!-- core styles -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/main.css">
    <!-- /core styles -->

    <!-- page styles -->
    <!-- /page styles -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- load modernizer -->
    <script src="<%=Common_Things.url %>/vendor/modernizr.js"></script>
</head>

<body class="bg-dark">


		
    <div class="app-user">
        <div class="user-container">
            <section class="panel panel-default">
                <header class="panel-heading">Sign in</header>
                <div class="bg-white user pd-lg">
                    <h6>
                        <strong>Welcome.</strong>Sign in to get started!</h6>

                    <form role="form" action="index.html">
                        <input type="text" class="form-control mg-b-sm" placeholder="Username" autofocus>
                        <input type="password" class="form-control" placeholder="Password">
                        <label class="checkbox pull-left">
                            <input type="checkbox" value="remember-me">Remember me
                        </label>
                        <div class="text-right mg-b-sm mg-t-sm">
                            <a href="#">Forgot password?</a>
                        </div>
                        <button class="btn btn-info btn-block" type="submit">Sign in</button>
                    </form>

                   
                </div>
            </section>
        </div>









    </div>
</body>

</html>
