<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Loopy girl's book shop</title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Loopy Book's</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/">Home <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Sign in</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Sign up</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="/notice/list">Notice <span class="sr-only">(current)</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">Shop Logo</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">Category 1</a> <a href="#"
						class="list-group-item">Category 2</a> <a href="/notice/list"
						class="list-group-item">Notice</a>
				</div>

			</div>
			<!-- /.col-lg-3 -->
			<div class="container-lg-9" style="width: 75%">
				<h1 class="mt-4">Notice</h1>

				<div class="card mb-4">
					<div class="card-body">공지사항입니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="far fa-bell"></i> notice <a
							class="btn btn-outline-info btn-sm" href="/notice/register"
							style="float: right;">Regist</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<form action="/notice/register" method="post">
								<div class="form-group col-md-12">
									<div class="mb-3">
										<label for="title" class="form-label">Title</label> <input
											type="text" class="form-control" id="title" name="title"
											placeholder="Enter Title" required="required">
									</div>
								</div>
								<div class="form-group col-md-12">
									<div class="mb-3 row">
										<label for="writer" class="col-sm-2 col-form-label">Writer</label>
										<div class="col-sm-10">
											<input type="text" class="form-control-plaintext" id="writer"
												name="writer" placeholder="Enter Writer" required="required">
										</div>
									</div>
								</div>
								<div class="form-group col-md-12">
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">Content</label>
										<textarea class="form-control border border-secondary"
											id="content" name="content" rows="3"
											placeholder="Enter Content"></textarea>
									</div>
								</div>

								<input type="submit" value="Submit"
									class="btn btn-outline-primary btn-sm" style="float: right;">
								<a href="/notice/list" class="btn btn-outline-secondary btn-sm"
									style="float: right;">Back List</a>
							</form>

						</div>
					</div>
				</div>
			</div>

			<!-- /.row -->

		</div>

	</div>

	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Alert</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="btn2">Remove</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/jquery/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
</body>

</html>
