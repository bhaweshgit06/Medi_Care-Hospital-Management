<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.dao.userDao"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.colorM{
background-color :  !important;
color : active !important;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-4 mt-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-5 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty sucMsg}">
			<div class="fs-5 text-center text-success" role="alert">${sucMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		
		<div class="row p-4 mr-1">
		<% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>
			<div class="col-md-6 p-2">
				<div class="card paint-card ">
					<div class=" card-body text-center text-white" style = "background-color : indigo">
						<i class="fa-solid fa-user-nurse fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>



			<div class="col-md-6 p-2">
			<% userDao dao1 = new userDao(DBConnect.getConn()); %>
				<div class="card paint-card">
					<div class="card-body text-center text-white" style = "background-color : indigo">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User  <br><%=dao1.countUser()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 p-2">
			<% AppointmentDAO dao2 = new AppointmentDAO(DBConnect.getConn()); %>
				<div class="card paint-card">
					<div class="card-body text-center text-white" style = "background-color : indigo">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao2.countAppointment()%>
						</p>
					</div>
				</div>
			</div>

			
			<div class="col-md-6 p-2">
<% SpecialistDao dao3 = new SpecialistDao(DBConnect.getConn()); %>
				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-white" style = "background-color : indigo">
						<i class="fa-solid fa-syringe fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=dao3.countSpecialist()%>
						</p>
					</div>
				</div>

			</div>
			
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	





</body>
</html>