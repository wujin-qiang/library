
var userName = null;
var userPassword = null;
var ruserPassword = null;


$(function() {

	userName = $("#name");
	userPassword = $("#password");
	ruserPassword = $("#ruserPassword");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	userName.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");

	/*
	 * 用户名验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
    /*
     * 验证
     * 失焦\获焦
     * jquery的方法传递
     */
    userName.bind("blur",function(){
        //ajax后台验证--userName是否已存在
        //user.do?method=ucexist&userName=**
        $.ajax({
            type:"GET",//请求类型
            url:path+"/sys/adminUserName",//请求的url
            data:{"userName":userName.val()},//请求参数
            dataType:"json",//ajax接口（请求url）返回的数据类型
            success:function(data){//data：返回数据（json对象）
                if(data.result == "exist"){//账号已存在，错误提示
                    validateTip(userName.next(),{"color":"red"},imgNo+ " 该用户账号已存在",false);
                }else if(data.result == "kong"){//账号可用，正确提示
                    validateTip(userName.next(),{"color":"green"},imgYes+"请输入账号",true);
                }else{//账号可用，正确提示
                    validateTip(userName.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
                }
            },
            error:function(data){//当访问时候，404，500 等非200的错误状态码
                validateTip(userName.next(),{"color":"red"},imgNo+" 验证账号是否存在错误",false);
            }
        });


    });
	
	userName.bind("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* 用户名长度必须是大于1小于10的字符",false);
	}).bind("blur",function(){
		if(userName.val() != null && userName.val().length > 1
				&& userName.val().length < 10){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" 用户名输入的不符合规范，请重新输入",false);
		}
		
	});
	
	userPassword.bind("focus",function(){
		validateTip(userPassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).bind("blur",function(){
		if(userPassword.val() != null && userPassword.val().length > 6
				&& userPassword.val().length < 20 ){
			validateTip(userPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userPassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* 请输入与上面一只的密码",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
	
	addBtn.bind("click",function(){
		if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur(alert('密码不正确'));
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
	});
	
	$('#addBtn').click(function () {
		if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur(alert('密码不正确'));
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
   });
	
	
	
	
	
	

});

