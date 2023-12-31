<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
    <!-- Include any necessary stylesheets or scripts -->
    <!-- ... -->
</head>
<body>
    <div>
        <h2>An error occurred:</h2>
        <p>${requestScope.message}</p>
        <!-- You can customize the error message or provide additional details here -->
    </div>
</body>
</html>
