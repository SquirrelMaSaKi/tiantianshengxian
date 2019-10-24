$(function(){

	var error_name = false;
	var error_password = false;
	var error_check_password = false;
	var error_email = false;
	var error_check = false;


	$('#user_name').blur(function() {
		check_user_name();
	});

	$('#pwd').blur(function() {
		check_pwd();
	});

	$('#cpwd').blur(function() {
		check_cpwd();
	});

	$('#email').blur(function() {
		check_email();
	});

	$('#allow').click(function() {
		if($(this).is(':checked'))
		{
			error_check = false;
			$(this).siblings('span').hide();
		}
		else
		{
			error_check = true;
			$(this).siblings('span').html('请勾选同意');
			$(this).siblings('span').show();
		}
	});


	function check_user_name(){
		var len = $('#user_name').val().length;
		var ue = $("#user_name").val();
		if(len<5||len>20)
		{
			$('#user_name').next().html('请输入5-20个字符的用户名')
			$('#user_name').next().show();
			error_name = true;
		}
		else
		{
			$('#user_name').next().hide();
            $.get("/tiantianshengxian/user/check","ue="+ue,function (data) {
                if (data=='ok') {
                    $('#user_name').next().hide();
                    error_name = false;
                } else if(data=='no') {
                    $('#user_name').next().html('用户名已存在')
                    $('#user_name').next().show();
                    error_name = true;
                }
            });
			//error_name = false;
		}
	}

	function check_pwd(){
		var len = $('#pwd').val().length;
		if(len<8||len>20)
		{
			$('#pwd').next().html('密码最少8位，最长20位')
			$('#pwd').next().show();
			error_password = true;
		}
		else
		{
			$('#pwd').next().hide();
			error_password = false;
		}		
	}


	function check_cpwd(){
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();

		if(pass!=cpass)
		{
			$('#cpwd').next().html('两次输入的密码不一致')
			$('#cpwd').next().show();
			error_check_password = true;
		}
		else
		{
			$('#cpwd').next().hide();
			error_check_password = false;
		}		
		
	}

	function check_email(){
		var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;
		var ue = $("#email").val();
		if(re.test($('#email').val()))
		{
			$('#email').next().hide();
            $.get("/tiantianshengxian/user/check","ue="+ue,function (data) {
                if (data=='ok') {
                    $('#email').next().hide();
                    error_email = false;
                } else if(data=='no') {
                    $('#email').next().html('邮箱已存在')
                    $('#email').next().show();
                    error_email = true;
                }
            });
		}
		else
		{
			$('#email').next().html('你输入的邮箱格式不正确')
			$('#email').next().show();
			error_check_password = true;
		}

	}


	$('#reg_form').submit(function() {
       // var serialize = $('#reg_form').serialize();

		check_user_name();
		check_pwd();
		check_cpwd();
		check_email();

		if(error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false)
		{

            $.post("/tiantianshengxian/user/register",$('#reg_form').serialize(),function (data) {
                if (data=='ok'){
                    if(confirm("恭喜你注册成功，是否前往登陆界面")){
                        location.href = "/tiantianshengxian/user/login";
                    }
                }
            });
			return false;
		}
		else
		{
			return false;
		}

	});


})