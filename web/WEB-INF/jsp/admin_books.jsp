<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="tools.Pagetwo"%>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="layer-v3.5.1/layer/layer.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/5.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div style="padding: 70px 550px 10px">
    <form   method="post" action="querybook.html" class="form-inline"  id="searchform">
        <div class="input-group">
           <input type="text" placeholder="图书名/作者/出版社/ISBN/分类" class="form-control" id="search" name="searchWord" 
           		style="width:250px">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script type="text/javascript">
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''){
                alert("请输入关键字");
                return false;
            }
        })
		</script>
</div>
<div style="position: relative;top: 10%">
<c:if test="${!empty succ}">
    <div class="alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${succ}
    </div>
</c:if>
<c:if test="${!empty error}">
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        ${error}
    </div>
</c:if>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">  
            <thead>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>分类</th>
                <th>详情</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
            <tr>
                <td><c:out value="${book.name}"></c:out></td>
                <td><c:out value="${book.author}"></c:out></td>
                <td><c:out value="${book.publish}"></c:out></td>
                <td><c:out value="${book.isbn}"></c:out></td>
                <td><c:out value="${book.price}"></c:out></td>
                <td><c:out value="${book.number}"></c:out></td>
                <td><c:out value="${book.classId}"></c:out></td>
                <td><a href="admin_book_detail.html?bookId=<c:out value="${book.bookId}"></c:out>">
                    <button type="button" class="btn btn-success btn-xs">详情</button>
                </a></td>
                <td><a href="updatebook.html?bookId=<c:out value="${book.bookId}"></c:out>">
                <button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                
                  <td><a href="javascript:if(confirm('确实要删除吗?'))
                  location='deletebook.html?bookId=<c:out value="${book.bookId}"></c:out>'">
                	 <button type="button" class="btn btn-danger btn-xs" >删除</button></a></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>

			<div class='page all'>
				<b>共${pageUtil.pageNumber}</b>条,当前第<span>${pageUtil.pageIndex}</span>页
				<a href="admin_books.html?pageIndex=1" class='first'>首页</a> <a
					href="admin_books.html?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}"
					class='pre'>上一页</a>
				<c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
					<a href="admin_books.html?pageIndex=${i}"
						style="text-decoration: none;">${i}</a>
				</c:forEach>
				<a
					href="admin_books.html?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}"
					class='next'>下一页</a> <a
					href="admin_books.html?pageIndex=${pageUtil.pageCount}"
					class='last'>末页</a>
			</div>





		</div>
</div>
</body>
</html>
