<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>   
   
    <%
   	request.setCharacterEncoding("utf-8");
    
    Calendar cal = Calendar.getInstance();
    
    int ty = cal.get(Calendar.YEAR);
    int tm = cal.get(Calendar.MONTH)+1;
    int td = cal.get(Calendar.DATE);
    
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH)+1;
    
    String sy = request.getParameter("year");
    String sm = request.getParameter("month");
    
    if(sy!= null) {
    	year = Integer.parseInt(sy);
    }
    if(sm!= null){
    	month = Integer.parseInt(sm);
    }
    
    cal.set(year,month-1 , 1 );
    year = cal.get(Calendar.YEAR);
    month = cal.get(Calendar.MONTH)+1;
    
    int week = cal.get(Calendar.DAY_OF_WEEK); //1(일)~7(토)
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0; padding: 0;
    box-sizing: border-box;
}



a 					{text-decoration: none;}
a:active, a:hover 	{text-decoration: underline;color:orange;}

.calendar 			{width: 480px;margin: 30px auto;}
.calendar .title	{height: 37px;line-height: 37px;text-align: center;font-weight: 600;}

/*표 줄간격*/	.calendar table 	{width: 100%;border-collapse: collapse;border-spacing: 0;}

			.calendar table thead tr{background: #f6f6f6;}
			.calendar table td					{padding: 10px;text-align: center;border: 1px solid #ccc;}
/*일요일*/	.calendar table td:nth-child(7n+1)	{color: red;}		/* 7번째 바로 다음 한가지 요소를 말함 */
/*토요일*/	.calendar table td:nth-child(7n)	{color: blue;}		/* 7번째 요소를 말함*/

/*전,다음달*/	.calendar table td.gray 			{color: #ccc;}			
/*왜안되노*/	.calendar table td.today			{font-weight:700;background: #FFB266;}

/*오늘날짜*/	.calendar .footer					{line-height: 25px;text-align:left;font-size: 12px;}
</style>
</head>
<body>
<div>
<div>
	<div class ="calendar">
		<div class="title">
			<a href="Calendar.jsp?year=<%=year-1 %>&month=<%=month %>">&lt;&lt;</a>	<!-- 1년전 -->
			&nbsp;&nbsp;
			<a href="Calendar.jsp?year=<%=year %>&month=<%=month-1 %>">&lt;</a>
			&nbsp;
			<label><%=year %>년 <%=month %>월</label>
			&nbsp;
			<a href="Calendar.jsp?year=<%=year %>&month=<%=month+1 %>">&gt;</a>
			&nbsp;&nbsp;
			<a href="Calendar.jsp?year=<%=year+1 %>&month=<%=month %>">&gt;&gt;</a><!-- 1년후-->
		</div>
		<table>
			<thead>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody>
				<%
					//1일 앞달
					Calendar preCal =(Calendar) cal.clone();	/*캘린더에 복사 , 붙여넣기 */
					preCal.add(Calendar.DATE, -(week-1));
					int preDate = preCal.get(Calendar.DATE);
					
					out.println("<tr>");
					
					//1일 앞부분
					for(int i = 1 ; i<week; i++){
						out.print("<td class ='gray'>"+(preDate++)+"</td>");
					}
					//1일부터 말일까지 출력
					int lastDay = cal.getActualMaximum(Calendar.DATE);
					String cls;
					for(int i=1; i<=lastDay; i++){
						cls=year==ty && month==tm && i == td ? "today":"";		/*google*/
						
						out.print("<td class='"+cls+"'>"+i+"</td>");
						
						if(lastDay != i && (++week)%7 == 1){
							out.print("</tr><tr>");
						}
					}
					//마지막 주 마지막 일자 다음 처리
					int n =1 ;
					for(int i = (week-1)%7; i<6; i++){	/*하나이상 출력이되야 출력되도록 */
						out.print("<td class='gray'>"+(n++)+"</td>");
					}
					out.print("</tr>");
				
				%>
			</tbody>
		</table>
		<div class="footer">
			<a href="Calendar.jsp">오늘날짜로</a>
		</div>
		
	</div>
</div>
</div>

	



</body>
</html>