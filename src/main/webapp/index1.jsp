<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<%-- //<title>${sysName}</title> --%>
<%@ include file="/WEB-INF/common/head.jspf"%>
</head>
<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf green"></i> <span class="red">平高</span> <span class="white">电力工程</span>
							</h1>
							<h4 class="blue">&copy; 差旅管理系统</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 清输入您的个人信息
										</h4>

										<div class="space-6"></div>

										<form action="GzMavenSSM/student/listStudentBootstrapTable3" method="post">
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="text" class="form-control" placeholder="Username"
														name="name" /> <i class="icon-user"></i>
												</span>
												</label>
												<div class="form-group">
													<div class="input-group">
														<div class="input-group-addon">是否为合同制</div>

													</div>
												</div>
												<div class="radio-inline">
													<input type="radio" data-toggle="tooltip" data-placement="bottom" title="合同制" name="hetong" value="8" /> <label for="killOrder1">是</label>&nbsp&nbsp&nbsp&nbsp&nbsp <input
														type="radio" data-toggle="tooltip" data-placement="bottom" title="外包制" name="hetong" value="2" /> <label for="killOrder1">否</label>
												</div>
												<div class="space"></div>
												<div class="input-group">
													<div class="input-group-addon">员工级别</div>
													<!-- 						<input type="text" class="form-control" data-toggle="tooltip" data-placement="bottom" title="项目经理补助180,副经理160，其他140" name="searchgys" placeholder="" /> -->
													<select data-toggle="tooltip" data-placement="bottom" id="jibie" style="width: 210px" title="项目经理在项目上补助180,副经理160，其他140">
														<option value="yiban">一般项目人员</option>
														<option value="xmj">项目经理</option>
														<option value="xmfj">项目副经理</option>

														<option value="xs">销售人员</option>
														<option value="bg">办公室人员</option>
													</select>
												</div>
												<div class="space"></div>
												<div class="form-group" id="jj">
													<div class="input-group">
														<div class="input-group-addon">项目名称</div>
														<!-- 	<input type="text" class="form-control" data-toggle="tooltip" data-placement="bottom" id="xmmc" title="项目人员请选择项目名称" name="searchgys" placeholder="" /> -->
														<select style="width: 210px" data-toggle="tooltip" data-placement="bottom" title="项目人员请选择项目名称">
															<option value="辽宁盛基风电">辽宁盛基风电</option>
															<option value="汝州光伏扶贫">汝州光伏扶贫</option>
															<option value="叶县平煤光伏">叶县平煤光伏</option>
															<option value="豫粮光伏">豫粮光伏</option>
															<option value="叶县将军山">叶县将军山</option>
														</select>
													</div>
												</div>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="password" class="form-control" placeholder="Password"
														name="password" /> <i class="icon-lock"></i>
												</span>
												</label>
												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox" class="ace" /> <span class="lbl"> 二维码扫描登录</span>
													</label>

													<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> 登录
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"> <i class="icon-arrow-left"></i> 联系系统管理员
											</a>
										</div>

										<div>
											<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link"> 注册 <i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="icon-key"></i> Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>Enter your email and to receive instructions</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="email" class="form-control" placeholder="Email" /> <i
														class="icon-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="icon-lightbulb"></i> Send Me!
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /widget-main -->

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"> Back to login <i class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="icon-group blue"></i> New User Registration
										</h4>

										<div class="space-6"></div>
										<p>Enter your details to begin:</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="email" class="form-control" placeholder="Email" /> <i
														class="icon-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="text" class="form-control" placeholder="Username" /> <i
														class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="password" class="form-control" placeholder="Password" /> <i
														class="icon-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span class="block input-icon input-icon-right"> <input type="password" class="form-control"
														placeholder="Repeat password" /> <i class="icon-retweet"></i>
												</span>
												</label> <label class="block"> <input type="checkbox" class="ace" /> <span class="lbl"> I accept the <a href="#">User Agreement</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="icon-refresh"></i> Reset
													</button>

													<button type="button" class="width-65 pull-right btn btn-sm btn-success">
														Register <i class="icon-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"> <i class="icon-arrow-left"></i> Back to login
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /signup-box -->
						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->
	<div id="login_container">这是装二维码的容器div</div>

	<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
	<script type="text/javascript">
		//id和scope不用改、appid和redirect_uri改为自己的
		var obj = new WxLogin({
			id : "login_container",
			appid : "wx73c528e3dd138a7a",
			scope : "snsapi_login",
			redirect_uri : "http%3a%2f%2fwww.pgepc.cn",
			state : "",
			style : "black",
			href : ""
		});
	</script>
	<%@ include file="/WEB-INF/common/foot.jspf"%>

	<script>
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
	</script>
</body>
</html>
