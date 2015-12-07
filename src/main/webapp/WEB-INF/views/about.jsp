<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Smart - UI Elements</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
		<!-- DataTables http://www.datatables.net/  -->
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
		<script src="${pageContext.request.contextPath}/js/problem.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
	});
</script>
	</head>
<body>
<%@include file="./header.jsp" %>
<div class="container main">
        <ul class="nav nav-tabs nav-tabs-google">
            <li role="presentation" class="active">
                <a href="${pageContext.request.contextPath}/about">帮助</a>
            </li>
        </ul>
        <div>
            <h2 class="text-center">术语解释</h2>
            <h4>空气质量指数</h4>
            <ul>
                <li>空气质量指数（Air Quality Index，简称AQI）是定量描述空气质量状况的无量纲指数。
针对单项污染物的还规定了空气质量分指数。参与空气质量评价的主要污染物为细颗粒物、可吸入颗粒物、二氧化硫、二氧化氮、臭氧、一氧化碳等六项。</li>
                <li>AQI范围从0到500，大于100的污染物为超标污染物。例如PM2.5日均浓度35微克/立方米对应的分指数为50，75微克/立方米（就是通常所说的限值），折算为分指数是100，而500微克/立方米对应的IAQI值是500。</li>
                <li>第一步是对照各项污染物的分级浓度限值(AQI的浓度限值参照（GB3095-2012），API的浓度限值参照（GB3095-1996）)，以细颗粒物（PM2.5）、可吸入颗粒物（PM10）、二氧化硫（SO2）、二氧化氮（NO2）、臭氧（O3）、一氧化碳（CO）等各项污染物的实测浓度值（其中PM2.5、PM10为24小时平均浓度）分别计算得出空气质量分指数（Individual Air Quality Index，简称IAQI）；</li>
                <li>根据《环境空气质量指数（AQI）技术规定（试行）》（HJ 633—2012）规定：空气污染指数划分为0－50、51－100、101－150、151－200、201－300和大于300六档，对应于空气质量的六个级别，指数越大，级别越高，说明污染越严重，对人体健康的影响也越明显。[2] </li>
            </ul>

            <h4>PM.25</h4>
            <ul>
                <li>2013年2月，全国科学技术名词审定委员会将PM2.5的中文名称命名为细颗粒物。细颗粒物的化学成分主要包括有机碳（OC）、元素碳（EC）、硝酸盐、硫酸盐、铵盐、钠盐（Na+）等。</li>
                <li>颗粒物的成分很复杂，主要取决于其来源。主要有自然源和人为源两种，但危害较大的是后者。在学术界的分为一次气溶胶（Primary aerosol）和二次气溶胶（Secondary aerosol）两种。</li>
                <li>自然源包括土壤扬尘（含有氧化物矿物和其他成分）海盐（颗粒物的第二大来源，其组成与海水的成分类似）、植物花粉、孢子、细菌等。自然界中的灾害事件，如火山爆发向大气中排放了大量的火山灰，森林大火或裸露的煤原大火及尘暴事件都会将大量细颗粒物输送到大气层中。</li>
   <li>人为源包括固定源和流动源。固定源包括各种燃料燃烧
PM2.5细颗粒物
PM2.5细颗粒物 (6张)
 源，如发电、冶金、石油、化学、纺织印染等各种工业过程、供热、烹调过程中燃煤与燃气或燃油排放的烟尘。流动源主要是各类交通工具在运行过程中使用燃料时向大气中排放的尾气。</li>

            </ul>
        </div>
    </div>
    <%@include file="./foot.jsp" %>
</body>
</html>