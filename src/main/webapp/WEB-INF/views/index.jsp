<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>
<link href="/css/app.css" rel="stylesheet"/>

<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script type="text/javascript" src="/js/app.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retirement Income Estimation</title>
</head>
<body ng-app="appManager" ng-controller="appController">
	</br>
	<h4 class="user">Retirement Income Estimation</h4>
	
	
	
	<table>
 
			<tr>
				<th colspan="2">Input Your Personal Info</th>
			</tr>
			<tr>
				<td>Current Age</td>
				<td><input type="text" ng-model="age" /></td>
			</tr>
			<tr>
				<td>Age to Retire</td>
				<td><input type="text" ng-model="retireAge" /></td>
			</tr>
			<tr>
				<td>Pre-tax Salary</td>
				<td><input type="text" ng-model="salary" /></td>
			</tr>
			<tr>
				<td>Monthly Saving Capability ({{percent}}% of monthly income)</td>
				<td><input type="text" ng-model="monthlySav" /></td>
			</tr>
			<tr>
				<td>Age You Want the Retirement to End</td>
				<td><input type="text" ng-model="endingAge" /></td>
			</tr>
			<tr>
				<td>Annual Retirement Withdrawal</td>
				<td><input type="text" ng-model="withdrawal" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Calculate" ng-click="calculate(); show=!show"
					class="blue-button" /></td>
			</tr>
		</table>
	
	
	
	<table ng-show="show">
 
			<tr>
				<th colspan="2">Result</th>
			</tr>
			<tr>
				<td colspan="2">You will have about $ {{realisticAmount}} at age {{retireAge}}</td>
			</tr>
			<tr>
				<td colspan="2">You will need about $ {{expectedAmount}} to retire at age {{retireAge}}</td>
			</tr>
			
			<tr>
				<td colspan="2">You are {{compare}}% to goal! Input your contact info to set up an appointment with a TIAA financial advisor!</td>
			</tr>
		</table>
	
	
	
	
	<form ng-submit="submitUser()">
		<table>
 
			<tr>
				<th colspan="2">Input Your Contact Info</th>
			</tr>
			<tr>
				<td>Your Name</td>
				<td><input type="text" ng-model="userForm.name" /></td>
			</tr>
			<tr>
				<td>Your Phone Number</td>
				<td><input type="text" ng-model="userForm.phone" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"
					class="blue-button" /></td>
			</tr>
		</table>
	</form>
	
	 

</body>
</html>
