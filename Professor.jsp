<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<link href="fondo.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<!-- PONE EL NOMBRE DEL PROFESOR QUE HAYA ENTRADO(Puede ser coordinador, vocal, secretario y presidente) -->
	<c:if test="${asignatura.email_coordinador.equals(profesor)}">
		<h1>Coordinador: ${asignatura.nombre_coordinador}</h1>
	</c:if>
	<c:if test="${asignatura.email_vocal.equals(profesor)}">
		<h1>Vocal: ${asignatura.nombre_vocal}</h1>
	</c:if>
	<c:if test="${asignatura.email_secretario.equals(profesor)}">
		<h1>Secretario: ${asignatura.nombre_secretario}</h1>
	</c:if>
	<c:if test="${asignatura.email_presidente.equals(profesor)}">
		<h1>Presidente: ${asignatura.nombre_presidente}</h1>
	</c:if>

<!-- MUESTRA ASIGNATURA -->
<h2>${asignatura.nombre}</h2>

<!-- MUESTRA TABLA	 -->
	<table border="1">

		<tr>
	
			<th>Asignatura</th>
			<th>Alumno</th>
			<th>Email del alumno</th>
			
			<th>Email del Coordinador</th>
			<th>Email del Vocal</th>
			
			<th>Email del Secretario</th>
			
			<th>Email del Presidente</th>
			<th>Estado</th>
			<!--<th>Memoria</th>-->
			<th>Nota</th>
			<th>Actualizar</th>
			<th>Firmar</th>
		</tr>
		
		<c:forEach items="${actas}" var="actai">
				<c:choose>
				<c:when test="${asignatura.email_coordinador.equals(profesor)}">
				<form action="FormDefinitivaServlet" method="get">
	
				<tr>
				<td><input type=asignatura id="asignatura" name="asignatura"
						value="${actai.asignatura}" /></td>
					<td><input type="text" id="nombre_alumno" name="nombre_alumno"
						value="${actai.nombre_alumno}" /></td>
					<td><input type="email" id="email_alumno" name="email_alumno"
						value="${actai.email_alumno}" /></td>
					
					<td><input type="email" id="email_coordinador" name="email_coordinador"
						value="${actai.email_coordinador}" /></td>
					<td><input type="text" id="nombre_vocal" name="nombre_vocal"
				
						value="${actai.email_vocal}" /></td>
			
					<td><input type="email" id="email_secretario" name="email_secretario"
						value="${actai.email_secretario}" /></td>
			
					<td><input type="email" id="email_presidente" name="email_presidente"
						value="${actai.email_presidente}" /></td>
					<td><input type="number" id="status" name="status"
						value="${actai.status}" min="0" max="8" /></td>
					<td><input type="number" id="nota" name="nota"
						value="${actai.nota}" /></td>
					<td><button type="submit">Actualizar valores</button></td>
					<td>No es necesaria la firma del coordinador</td>
				</tr>
				</form>
				</c:when>
				
				<c:otherwise>
				
				<tr>
				<form action="FormDefinitivaServlet" method="get">
				<td><input type="text" id="asignatura" name="asignatura"
						value="${actai.asignatura}" /></td>
					<td><input type="text" id="nombre_alumno" name="nombre_alumno"
						value="${actai.nombre_alumno}" /></td>
					<td><input type="email" id="email_alumno" name="email_alumno"
						value="${actai.email_alumno}" /></td>
					
					<td><input type="email" id="email_coordinador" name="email_coordinador"
						value="${actai.email_coordinador}" /></td>
					<td><input type="text" id="nombre_vocal" name="nombre_vocal"
				
						value="${actai.email_vocal}" /></td>
			
					<td><input type="email" id="email_secretario" name="email_secretario"
						value="${actai.email_secretario}" /></td>
			
					<td><input type="email" id="email_presidente" name="email_presidente"
						value="${actai.email_presidente}" /></td>
					<td><input type="number" id="status" name="status"
						value="${actai.status}" min="0" max="8" /></td>
					<td><input type="number" id="nota" name="nota"
						value="${actai.nota}" /></td>	
					<td><button type="submit">Actualizar valores</button></td>
															</form>
					<td>
					<form action="FirmaServlet" method="get">
					
					<input type="hidden" id="asignatura" name="asignatura"
						value="${actai.asignatura}" />
					<input type="hidden" id="nombre_alumno" name="nombre_alumno"
						value="${actai.nombre_alumno}" />
						<input type="hidden" id="email_alumno" name="email_alumno"
						value="${actai.email_alumno}" />
						<input type="hidden" id="email_coordinador" name="email_coordinador"
						value="${actai.email_coordinador}" />
						<input type="hidden" id="nombre_vocal" name="nombre_vocal"
						value="${actai.email_vocal}" />
						<input type="hidden" id="email_secretario" name="email_secretario"
						value="${actai.email_secretario}" />
						<input type="hidden" id="email_presidente" name="email_presidente"
						value="${actai.email_presidente}" />
						<input type="hidden" id="nota" name="nota"
						value="${actai.nota}" />
					<c:if test="${actai.es_definitiva}">
					<button type="submit">Firmar</button>
					</c:if>
					</form>
					</td>
					
				</tr>
				</c:otherwise>
								</c:choose>
					</c:forEach>
			</table>


	<h2>Crear ACTA</h2>
 
	<form action="FormCreaACTAServlet" method="get">
		<input type="email" id="emailalumno" name="emailalumno"
			placeholder="Email"> <input type="password" id="password"
			name="password" placeholder="Password"> <input type="text"
			id="asignatura" name="asignatura" placeholder="Asignatura"> <input
			type="number" id="notaprovisional" name="notaprovisional"
			placeholder="Nota">
		<button type="submit">Registrar</button>

	</form>


	<%@ include file="FormLogout.jsp"%>
</body>
</html>