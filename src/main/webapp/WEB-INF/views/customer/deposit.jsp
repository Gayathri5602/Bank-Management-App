<%@page import="bank.app.entities.Account"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deposit Page</title>
<link rel="stylesheet" href="/css/transaction.css">
</head>
<body>

	<%
	List<Account> accounts = (List<Account>) session.getAttribute("accounts");
	%>
	<!-- Header -->
	<header>
		<h1>XYZ Bank - Deposit Money</h1>
	</header>

	<!-- Navigation Bar -->
	<nav>
		<a href="/customer/dashboard">Dashboard</a> <a href="/customer/account-details">Accounts</a> <a
			href="/customer/select-account">Transactions</a> <a href="/logout">Logout</a>
	</nav>

	<!-- Deposit Form -->
	<div class="deposit-container">
		<h2>Deposit Money</h2>

		<form action="/transaction" method="post">
			<!-- Account Number Input -->
			<div class="form-group">
				<label for="accountNumber">Account Number</label> <select
					id="accountNumber" name="accountNumber">
					<option value="" disabled selected>Select an Option</option>
					<%
					for (Account account : accounts) {
					%>
					<option value="<%=account.getAccountNumber()%>">
						<%=account.getAccountNumber()%>
					</option>
					<%
					}
					%>
				</select>

			</div>

			<!-- Transaction Time (Generated by JavaScript) -->
			<div class="form-group">
				<label for="transactionTime">Transaction Time</label> <input
					type="text" id="transactionTime" name="transactionTime" readonly>
			</div>

			<!-- Transaction Type (Read-only) -->
			<div class="form-group">
				<label for="transactionType">Transaction Type</label> <input
					type="text" id="transactionType" value="Deposit"
					name="transactionType" readonly>
			</div>

			<!-- Deposit Amount -->
			<div class="form-group">
				<label for="depositAmount">Deposit Amount</label> <input
					type="number" id="depositAmount"
					placeholder="Enter Amount to Deposit" name="amount">
			</div>

			<!-- Enter password -->
			<div class="form-group">
				<label for="password">Enter password</label> <input type="password"
					id="password" placeholder="Enter your password" name="password">
			</div>

			<!-- Deposit Button -->
			<button type="submit">Deposit</button>
		</form>
	</div>

<%@include file="../message.jsp" %>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 XYZ Bank. All rights reserved.</p>
	</footer>

	<script>
		// Function to display current date and time
		function showCurrentTime() {
			const now = new Date();
			const formattedTime = now.toLocaleString('en-IN', {
				hour12 : true
			});
			document.getElementById('transactionTime').value = formattedTime;
		}

		// Call the function to display the time on page load
		showCurrentTime();
	</script>

</body>
</html>
