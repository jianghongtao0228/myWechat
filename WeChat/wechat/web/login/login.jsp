<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>登录页面</title>
		<%@include file="/pub/comhead.jsp" %>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/login/css/reset.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/login/css/supersized.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/login/css/style.css">
	</head>
	<body>
		<div class="page-container">
            <h1>用户登录</h1>
            <form action="" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button >登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>介绍:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/login/js/supersized.3.2.7.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/login/js/supersized-init.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/login/js/scripts.js"></script>
	</body>
</html>
