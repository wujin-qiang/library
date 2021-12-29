<%@ page contentType="text/html;charset=UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="css/demo02.css">
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
    <style>
    #kong{
    width:  100%;
    height: 100px;
    }
    </style>
</head>
<body  style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>

<div id="kong"></div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    温馨提示
                </h4>
            </div>
            <div class="modal-body">
                使用结束后请安全退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">知道了
                </button>
            </div>
        </div>
    </div>
</div>
<c:if test="${!empty login}">
    <script>
        $(function () {
            $("#myModal").modal({
                show: true
            })
        })
    </script>
</c:if>

<div class="circular-bg">
    <div class="moon"></div>
    <div class="snores">
        <div class="snore snore1">Z</div>
        <div class="snore snore2">Z</div>
        <div class="snore snore3">Z</div>
    </div>
    <div class="santa">
        <div class="disc"></div>

        <div class="hat">
            <div class="hat-space"></div>
        </div>
        <div class="furr"></div>

        <div class="face">
            <div class="eyebrows eyebrows--left"></div>
            <div class="eyebrows eyebrows--right"></div>
            <div class="nose"></div>
            <div class="beard">
                <div class="beard--left"></div>
                <div class="beard--right"></div>
            </div>
            <div class="mouth"> </div>
        </div>
        <div class="hand--up">
            <div class="arm--right"></div>

            <div class="hand--right"></div>

        </div>
        <div class="hand--left"></div>
        <div class="stomach">
            <div class="belt-buckle"></div>
        </div>
        <div class="leg--up"></div>
        <div class="leg--down"></div>

    </div>
    <div class="christmas-tree">
        <div class="tree-top4"></div>
        <div class="tree-top3"></div>
        <div class="tree-top2"></div>
        <div class="tree-top1"></div>
        <div class="tree-bottom"></div>
    </div>
    <div class="christmas-tree-small">
        <div class="tree-top4"></div>
        <div class="tree-top3"></div>
        <div class="tree-top2"></div>
        <div class="tree-top1"></div>
        <div class="tree-bottom"></div>
    </div>
    <div class="christmas-tree-white">
        <div class="tree-top4"></div>
        <div class="tree-top3"></div>
        <div class="tree-top2"></div>
        <div class="tree-top1"></div>
        <div class="tree-bottom"></div>
    </div>
    <div class="gift gift--orange">
        <div class="gift-bow--left"></div>
        <div class="gift-bow--right"></div>
        <div class="gift-ribbon"></div>
        <div class="gift-top"></div>
        <div class="gift-bottom"></div>
    </div>
    <div class="gift">
        <div class="gift-bow--left"></div>
        <div class="gift-bow--right"></div>
        <div class="gift-ribbon"></div>
        <div class="gift-top"></div>
        <div class="gift-bottom"></div>
    </div>
</div>



</body>
</html>
