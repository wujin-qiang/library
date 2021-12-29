<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>

</head>
<body background="img/5.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 50px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">用户注册</h3>
        </div>
        <div class="panel-body">
            <form action="reader_add" method="post" id="readeredit" >
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
                    <span >性别</span>
                    <input type="radio" value="男" name="sex" />男
        			<input type="radio" value="女" name="sex" checked />女
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span>出生日期</span>
                    <input type="text" class="Wdate"  id="birth" name="birth"
                           readonly="readonly" onclick="WdatePicker();">
                    <span></span>
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span >居住地址</span>
                    <input type="text"  name="address" id="address"  >
                    <span></span>
                </div>
                <div class="input-group"  style="padding-top: 20px;" id="phoneId">
                    <span >通讯电话</span>
                    <input type="text"  name="phone" id="phone"  >
                    <span></span>
                </div>

                <div class="input-group" style="padding-top: 20px;">
                    <input style="align-items: center" type="submit" value="注册" class="btn btn-success btn-sm"
                           class="text-left"  name="addBtn" id="addBtn"  onclick="aaa()" >
                    <a href="login" style="align-items: center"  class="btn btn-success btn-sm">返回</a>
                </div>

                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#password").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                        if (isNaN($("#phone").val())) {
							alert("输入的手机号必须是11位数字");
							return mySubmit(false);
                    	}
                    	if ($("#phone").val().length!=11){
            			alert("请输入11位手机号");
            				return mySubmit(false);
            			}
                    })
                    $('#addBtn').click(function () {
                    	alert('是否确认提交信息？');
            		})
                    //}
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>

<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>