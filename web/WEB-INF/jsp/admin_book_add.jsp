<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息添加</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/1.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div style="position: relative;padding-top: 60px; width: 80%;margin-left: 10%">
    <form action="book_add_do.html" method="post" id="addbook" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">图书名 *必填项</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名" required>
        </div>
        <div class="form-group">
            <label for="author">作者  *必填项</label>
            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名" required>
        </div>
        <div class="form-group">
            <label for="publish">出版社  *必填项</label>
            <input type="text" class="form-control" name="publish" id="publish" placeholder="请输入出版社" required>
        </div>
        <div class="form-group">
            <label for="isbn">ISBN  *必填项 *请确保输入ISBN唯一</label>
            <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN" required>
        </div>
        <div class="form-group">
            <label for="introduction">简介 *非必填</label>
            <textarea class="form-control" rows="3" name="introduction" id="introduction"
                      placeholder="请输入简介" >此图书在上架时，并无添加简介！</textarea>
        </div>
        <div class="form-group">
            <label for="language">语言 *非必填，默认为中文</label>
            <input type="text" class="form-control" name="language" id="language" placeholder="请输入语言" value="中文">
        </div>
        <div class="form-group">
            <label for="price">价格  *必填项</label>
            <input type="text" class="form-control" name="price" id="price" placeholder="请输入价格" required>
        </div>
        <div class="form-group" >
            <label for="pubdate">出版日期  *必填项</label>
            <input type="text" class="form-control Wdate"  id="pubdate" name="pubdate"
                   readonly="readonly" onclick="WdatePicker();">
        </div>
        <div class="form-group">
            <label for="classId">分类  *非必选项，默认为“综合”</label>
           <p> 
            <select name="classId" class="form-control">
            	<option   value="马克思主义 " >马克思主义 </option>
            	<option   value="哲学" >哲学</option>
            	<option   value="社会科学总论" >社会科学总论</option>
            	<option   value="政治法律" >政治法律</option>
            	<option   value="军事" >军事</option>
            	<option   value="经济" >经济</option>
            	<option   value="文化" >文化</option>
            	<option   value="语言" >语言</option>
            	<option   value="文学" >文学</option>
            	<option   value="艺术" >艺术</option>
            	<option   value="历史地理" >历史地理</option>
            	<option   value="自然科学总论" >自然科学总论</option>
            	<option   value="数理科学和化学" >数理科学和化学</option>
            	<option   value="天文学、地球科学" >天文学、地球科学</option>
            	<option   value="生物科学" >生物科学</option>
            	<option   value="医药、卫生" >医药、卫生</option>
            	<option   value="农业科学" >农业科学</option>
            	<option   value="农业科学" >工业技术</option>
            	<option   value="交通运输" >交通运输</option>
            	<option   value="航空、航天" >航空、航天</option>
            	<option   value="环境科学" >环境科学</option>
            	<option   value="综合" selected>综合</option>
             </select>
           </p> 
        </div>
        <div class="form-group">
            <label for="number">数量 *非必填项 默认图书数量为10，图书上限为100，下限为1</label>
           <p>
             <input type="number" class="form-control" name="number" max="100" min = "1" step="1" value="10">
           </p>
        </div>
         <div class="form-group">
            <label for="url">图书封面</label>
           <p>
             <input type="file" class="form-control" name="file">
           </p>
        </div>

        <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
        <input type="reset" value="重置"  class="btn btn-success btn-sm" class="text-right">
        <script>
            $("#addbook").submit(function () {
            	<!--if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubstr").val() == '' || $("#classId").val() == '' || $("#pressmark").val() == '' || $("#number").val() == '') {
                    alert("请填入完整图书信息！");
                    return false;
                }-->
                if(isNaN($("#price").val() )){
                	alert('请输入正确的图书价格！');
                	return false;
                	}
                if($("#price").val() <0){
                	alert('请输入正确的图书价格！');
                	return false;
                	}
            })
        </script>
    </form>
</div>
</body>
</html>
<script type="text/javascript" src="static/calendar/WdatePicker.js"></script>
