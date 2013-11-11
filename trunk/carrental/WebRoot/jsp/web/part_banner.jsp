<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="banner">
	<div style="position: relative; height: 427px; overflow: hidden; width: 956px;" id="pic">
		<img src="<%=basePath%>images/web/banner.png" width="956" height="70" class="tran_bg" />
		<div class="banner_letter">
			<h1 id="letter1">点到点代驾</h1>
			<h1 id="letter2" style="display: none">机场及车站接机</h1>
			<h1 id="letter3" style="display: none">机场及车站送机</h1>
			<h1 id="letter4" style="display: none">市用全日租</h1>
			<h1 id="letter5" style="display: none">会务车辆安排</h1>
			<h1 id="letter6" style="display: none">周边省市包车</h1>
		</div>
		<div class="num">
			<a onmouseover="javascript:showit(1)" onmouseout="playit()" class="current" id="num1">01</a>
			<a onmouseover="javascript:showit(2)" onmouseout="playit()" class="link" id="num2">02</a>
			<a onmouseover="javascript:showit(3)" onmouseout="playit()" class="link" id="num3">03</a>
			<a onmouseover="javascript:showit(4)" onmouseout="playit()" class="link" id="num4">04</a>
			<a onmouseover="javascript:showit(5)" onmouseout="playit()" class="link" id="num5">05</a>
			<a onmouseover="javascript:showit(6)" onmouseout="playit()" class="link" id="num6">06</a>
		</div>
		<div class="banner_img">
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner01.jpg" id="pic1" />
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner02.jpg" id="pic2" />
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner03.jpg" id="pic3" />
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner04.jpg" id="pic4" />
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner05.jpg" id="pic5" />
			<img onmouseover="stopit()" onmouseout="playit()" src="<%=basePath%>images/web/banner06.jpg" id="pic6" />
		</div>
	</div>
</div>