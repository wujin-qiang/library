<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>


</head>
<body background="img/login_bg.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 50px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">管理员注册</h3>
        </div>
        <div class="panel-body">
            <form action="admin_add" method="post" id="readeredit" >
                <div class="input-group" style="padding-top: 20px;">
                    <span>用户名 </span>
                    <input type="text" name="name" id="name"  >
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span>密  码</span>
                    <input  type="password"  name="password" id="password">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >确认密码</span>
                    <input  type="password" name="ruserPassword" id="ruserPassword">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <input style="align-items: center" type="submit" value="注册" class="btn btn-success btn-sm"
                           class="text-left">
                    <a href="login" style="align-items: center"  class="btn btn-success btn-sm">返回</a>
                </div>

                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#password").val()==''||$("#name").val()==''){
                            alert("请填入完整信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
<script>

    function typeFun() {
        var type = $("#type").val();
        if(type==1){
            document.getElementById("phoneId").style.display="inline-none";
        }else{
            document.getElementById("phoneId").style.display="true";
        }
        alert(type)
    }
</script>

<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="static/js/admin_register.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>