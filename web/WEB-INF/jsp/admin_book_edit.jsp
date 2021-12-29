<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑《 ${detail.name}》</title>
    <style>
     #introduction{
      		width:650px;
            height: 200px;
     }
    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/2.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="book_edit_do.html?bookId=${detail.bookId}" method="post" id="addbook" enctype="multipart/form-data">

                <div class="input-group">
                    <span  class="input-group-addon">书名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${detail.name}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">作者</span>
                    <input type="text" class="form-control" name="author" id="author" value="${detail.author}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">出版社</span>
                    <input type="text" class="form-control" name="publish" id="publish"  value="${detail.publish} " >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">ISBN *不可修改</span>
                    <input type="text" class="form-control" name="isbn" id="isbn" readonly value="${detail.isbn}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">简介</span>
                    <textarea class="form-control" rows="3" name="introduction" id="introduction" 
                      >${detail.introduction}</textarea>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">语言</span>
                    <input type="text" class="form-control" name="language" id="language" value="${detail.language}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">价格</span>
                    <input type="text" class="form-control" name="price"  id="price" value="${detail.price}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">出版日期</span>
                    <input type="date" class="form-control" name="pubdate" id="pubdate" value="${detail.pubdate}" onclick="WdatePicker();">
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">分类</span>
                   <!--   <input type="text" class="form-control" name="classId" id="classId" value="${detail.classId}"> -->
                    <p> 
            <select name="classId" onchange="selectTotal(this.value)"  class="form-control" >
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
            	<option   value="综合" >综合</option>
             </select>
           </p> 
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">数量</span>
                    <input type="text" class="form-control" name="number"  id="number" value="${detail.number}">
                </div>
					<!--  <div class="input-group">
						<span  class="input-group-addon">封面</span>
						
							<input type="file" class="form-control" name="file" id="file"  value=" <img alt="" src="/image/${detail.url}" id="images">" >
						
					</div>-->
					<input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubstr").val()==''||$("#classId").val()==''||$("#number").val()==''){
                            alert("请填入完整图书信息！");
                            return false;
                        }
                        if(isNaN($("#price").val() )){
                        	alert('请输入正确的图书价格！');
                        	<!--formname.tel.focus();-->
                        	return false;
                        	}
                        if($("#price").val() <0){
                        	alert('请输入正确的图书价格！');
                        	<!--formname.tel.focus();-->
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