<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body background="img/4.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<div class="col-xs-5 col-md-offset-3">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                信息修改
            </h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do_r.html" method="post" id="edit" >
                <div class="input-group">
                    <span  class="input-group-addon">读者证号</span>
                    <input type="text" readonly="readonly" class="form-control" name="readerId" id="readerId" value="${readerinfo.readerId}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">姓名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${readerinfo.name}"  readonly>
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">性别</span>
                    <!--  <input type="text" class="form-control" name="sex" id="sex"  value="${readerinfo.sex}" >-->
                    <input type="radio"  value="男" name="sex" />男
        			<input type="radio"  value="女"name="sex" checked />女
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">出生日期</span>
                    <input type="text" class="Wdate form-control" name="birth" id="birth"  value="${readerinfo.birth}" onclick="WdatePicker();" >
                </div>

                <div class="input-group">
                    <span  class="input-group-addon">地址</span>
                    <input type="text" class="form-control" name="address" id="address"  value="${readerinfo.address}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">电话</span>
                    <input type="text" class="form-control" name="phone" id="phone"  value="${readerinfo.phone}" >
                </div>
                <br/>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#edit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''){
                            alert("请填入完整图书信息！");
                            return false;
                        }
                        if (isNaN($("#phone").val())) {
							alert("输入的手机号必须是11位数字");
							return false;
                    }
                    	if ($("#phone").val().length!=11){
            				alert("请输入11位手机号");
            				return false;
            		}
                    })
                </script>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
