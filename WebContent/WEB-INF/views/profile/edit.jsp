<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	String contextPath = request.getContextPath(); %>
<%@ page import="com.myclass.constant.UrlConstant"%>
<%@ page import="com.myclass.entity.Job"%>
<%@ page import="com.myclass.entity.Task"%>
<%@ page import="com.myclass.entity.Status"%>
<%@ page import="com.myclass.dto.UserDto"%>
<%@ page import="java.util.List"%>
<% List<Job> jobList = (List<Job>) request.getAttribute("jobList"); %>
<% List<UserDto> userDtoList = (List<UserDto>) request.getAttribute("userDtoList"); %>
<% List<Status> statusList = (List<Status>) request.getAttribute("statusList"); %>
<% Task task = (Task) request.getAttribute("task"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="<%= contextPath %>/static/plugins/images/favicon.png">
<title>Pixel Admin</title>
<!-- Bootstrap Core CSS -->
<link
	href="<%= contextPath %>/static/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="<%= contextPath %>/static/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="<%= contextPath %>/static/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%= contextPath %>/static/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="<%= contextPath %>/static/css/colors/blue-dark.css"
	id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Navigation -->
		<jsp:include page="../layout/navbar.jsp"></jsp:include>
		<!-- Left navbar-header -->
		<jsp:include page="../layout/sidebar.jsp"></jsp:include>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Cập nhật công việc</h4>
					</div>
				</div>
				<!-- /.row -->
				<!-- .row -->
				<div class="row">
					<div class="col-md-2 col-12"></div>
					<div class="col-md-8 col-xs-12">
						<div class="white-box">
							<form class="form-horizontal form-material" method="post"
								action="<%= contextPath + UrlConstant.URL_PROFILE_TASK_EDIT %>">
								<div class="form-group">
									<input type="hidden" name="id" value="${task.id }"
										class="form-control" />
								</div>
								<div class="form-group">
									<label class="col-md-12">Tên dự án</label>
									<div class="col-md-12">
										<select class="form-control form-control-line" name="job_id">
											<% for(Job job : jobList){ %>
											<option value="<%= job.getId()%>"
												<%= job.getId() == task.getJobId() ? "Selected" : "" %>><%= job.getName() %></option>
											<%} %>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Tên công việc</label>
									<div class="col-md-12">
										<input type="text" value="${task.name}"
											class="form-control form-control-line" name="name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Người thực hiện</label>
									<div class="col-md-12">
										<select class="form-control form-control-line" name="user_id">
											<% for(UserDto userDto : userDtoList){ %>
											<option value="<%= userDto.getId()%>"
												<%= userDto.getId() == task.getUserId() ? "Selected" : "" %>><%= userDto.getFullname() %></option>
											<%} %>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Ngày bắt đầu</label>
									<div class="col-md-12">
										<input type="text" value="${task.startDate}"
											class="form-control form-control-line" name="start_date">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Ngày kết thúc</label>
									<div class="col-md-12">
										<input type="text" value="${task.endDate}"
											class="form-control form-control-line" name="end_date">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Trạng Thái</label>
									<div class="col-md-12">
										<select class="form-control form-control-line"
											name="status_id">
											<% for(Status status : statusList){ %>
											<option value="<%= status.getId()%>"
												<%= status.getId() == task.getStatusId() ? "Selected" : "" %>><%= status.getName() %></option>
											<%} %>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-success">Lưu lại</button>
										<a
											href="<%= contextPath + UrlConstant.URL_PROFILE_TASK %>?id=<%= task.getUserId() %>"
											class="btn btn-primary">Quay lại</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-2 col-12"></div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<jsp:include page="../layout/footer.jsp"></jsp:include>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script
		src="<%= contextPath %>/static/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%= contextPath %>/static/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="<%= contextPath %>/static/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="<%= contextPath %>/static/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="<%= contextPath %>/static/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%= contextPath %>/static/js/custom.min.js"></script>
</body>

</html>