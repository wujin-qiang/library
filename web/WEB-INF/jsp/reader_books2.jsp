<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
    <style>
        #link01{
            width: 50px;
            height: 50px;
            background-color: #abe0a8;
            position: fixed;
            right: 0;
            bottom: 0;
        }
     </style>
    
</head>
<body background="img/3.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div style="padding: 20px 550px 10px">
    <form method="post"  class="form-inline" id="searchform">
        <div class="input-group">
            <input type="text" placeholder="图书名/作者/出版社/ISBN/分类" class="form-control" id="search" name="searchWord"
                   class="form-control" style="width:250px">
            <span class="input-group-btn">
                <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
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
                <th>借还</th>
                <th>详情</th>
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

                    <c:set var="flag" value="false"/>
                    <c:forEach var="lend" items="${myLendList}">
                        <c:if test="${lend eq book.bookId}">
                            <c:set var="flag" value="true"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${flag}">
                        <td><a href="javascript:if(confirm('确实要归还吗?'))
                        location='returnbook.html?bookId=<c:out value="${book.bookId}"></c:out>'">
                            <button type="button"  class="btn btn-danger btn-xs">归还 <c:out value="${book.overDate}"></c:out></button>
                        </a></td>
                    </c:if>
                    <c:if test="${not flag}">
                        <c:if test="${book.number>0}">
                            <td><a href="javascript:if(confirm('确实要借阅吗?'))
                            location='lendbook.html?bookId=<c:out value="${book.bookId}"></c:out>'">
                                <button type="button"  class="btn btn-primary btn-xs">借阅</button>
                            </a></td>
                        </c:if>
                        <c:if test="${book.number==0}">
                            <td>
                                <button type="button" class="btn btn-defalut btn-xs" disabled="disabled">已空</button>
                            </td>
                        </c:if>
                    </c:if>
                    <td><a href="reader_book_detail.html?bookId=<c:out value="${book.bookId}"></c:out>">
                        <button type="button" class="btn btn-success btn-xs">详情</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        
       <div class='page all'>
				<b>共${pageUtil.pageNumber}</b>条,当前第<span>${pageUtil.pageIndex}</span>页
				<a href="?pageIndex=1" class='first'>首页</a> <a
					href="?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}"
					class='pre'>上一页</a>
				<c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
					<a href="?pageIndex=${i}"
						style="text-decoration: none;">${i}</a>
				</c:forEach>
				<a
					href="?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}"
					class='next'>下一页</a> <a
					href="?pageIndex=${pageUtil.pageCount}"
					class='last'>末页</a>
			</div>
        
        
        
        
        
    </div>
</div>
</body>
</html>
