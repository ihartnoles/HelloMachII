<html>
	<head>
		<title>Login Form</title>
	</head>
	<body>
		<cfif event.isArgDefined("message")>
			<cfoutput><p>#event.getArg("message")#</p></cfoutput>
		</cfif>
		<form action="index.cfm?event=processLoginAttempt" method="post">
			<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#999999">
				<tr bgcolor="#dedede">
					<td colspan="2" align="center"><strong>Please Login</strong></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>User Name:</td>
					<td><input type="text" name="username" size="20" /></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td>Password:</td>
					<td><input type="password" name="password" size="20" /></td>
				</tr>
				<tr bgcolor="#dedede">
					<td colspan="2" align="center"><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</form>
	</body>
</html>