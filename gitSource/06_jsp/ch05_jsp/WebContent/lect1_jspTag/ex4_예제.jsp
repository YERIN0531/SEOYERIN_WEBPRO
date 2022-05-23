<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

<%String su = request.getParameter("su"); %>
<fieldset>
	<legend>숫자입력</legend>
	<form action="">
	숫자 <input type="text" name="su" value="<%if(su!=null)out.print(su);%>">
		<input type="submit" value="누적">
		</form>
</fieldset>
<%
			if(su!=null && !su.equals("")){
    	int su2 = Integer.parseInt(su);
    	int sum=0;
    	for(int i=1; i<=su2; i++){
    		sum = sum + i;
    	}
    	 out.println("<h2>1부터" + su2 + "까지 누적합 :" +sum + "</h2>");
    } 
    %>
</body>
</html>