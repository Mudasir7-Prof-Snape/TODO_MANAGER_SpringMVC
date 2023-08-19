<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body style="background-color: #bccbde;">
	<div class="container mt-3">
		<h1 class="text-center">Welcome to ToDo Manager</h1>
		<div>
			<c:if test="${not empty msg }">
				<div class="alert alert-success">
					<b><c:out value="${msg }"></c:out></b>
				</div>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty sdmsg }">
				<div class="alert alert-success">
					<b><c:out value="${sdmsg }"></c:out></b>
				</div>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty fdmsg }">
				<div class="alert alert-danger">
					<b><c:out value="${fdmsg }"></c:out></b>
				</div>
			</c:if>
		</div>
		<div class="row mt-4">
			<div class="col-md-2">
				<h3 class="text-center">Options</h3>
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href='<c:url value='/add'></c:url>'class="list-group-item list-group-item-action">Add TODO</a> 
					<a href='<c:url value='/view'></c:url>'class="list-group-item list-group-item-action">View TODO</a> 
					<a href='<c:url value='/smt'></c:url>'class="list-group-item list-group-item-action">Delete TODO</a>
					<!-- above all are links and when we click the page trigers and goes to request mapping there addAttribute places page value and below c:if triggers -->
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page=='home'}">
					<h1 class="text-center">Add and View your TODOS</h1>
				</c:if>
				<c:if test="${page=='add' }">
					<h1 class="text-center">Add TODO</h1>
					<br>

					<form:form action="save" method="post" modelAttribute="todo">
						<!-- modelattribute is todo which is variable given from controler 'todo t' -->
						<div class="form-group">
							<!-- todo object is sent to this now in which filed we need to place our input so path -->
							<form:input path="title" cssClass="form-control"
								placeholder="Enter todo title" />
						</div>
						<div class="form-group">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter todo content..." cssStyle="height:300px" />
						</div>
						<div class="text-center">
							<button class="btn btn-outline-primary">ADD ToDo</button>
						</div>
					</form:form>
				</c:if>
				<c:if test="${page=='view' }">
					<c:forEach items="${todos }" var="t">
						<div class="card">
							<div class="card-body">
								<h3>
									<c:out value="Created at ${t.date }"></c:out>
								</h3>
								<h3>
									<c:out value="${t.title }"></c:out>
								</h3>
								<p>
									<c:out value="${t.content }"></c:out>
								</p>
							</div>
						</div>
						<br>
					</c:forEach>
				</c:if>
				<c:if test="${page=='delete' }">
					<form action="delete" class="form-group" method="post">
						<div class="form-group">
							<label for="dtitle">Title</label> <input type="text"
								class="form-control" id="dtitle" name="title"
								placeholder="Enter title of todo to be deleted">
						</div>
						<div class="text-center">
						<button class="btn btn-outline-primary">delete todo</button>
						</div>
					</form>
				</c:if>
			</div>
		</div>

	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>