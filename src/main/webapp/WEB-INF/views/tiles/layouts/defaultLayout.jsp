<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	
		<script>
			var rootContext="<c:url value='/' />";
		</script>
	
		<title><tiles:insertAttribute name="title" /> 관리</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<link rel="stylesheet" href="<c:url value='/res/css/common.css' />"></link>
		<link rel="stylesheet" href="<c:url value='/res/css/dtree.css' />"></link>
		<link rel="stylesheet" href="<c:url value='/res/css/listing_table.css' />"></link>
		<link rel="stylesheet" href="<c:url value='/res/css/jquery.datetimepicker.css' />"></link>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"></link>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		
		<script src="<c:url value='/res/js/jquery.blockUI.js' />"></script>
		<script src="<c:url value='/res/js/wizAjaxCommon.js' />"></script>

		<script src="<c:url value='/res/js/common.js' />"></script>
		<script src="<c:url value='/res/js/dtree.js' />"></script>
		<script src="<c:url value='/res/js/listing_table.js' />"></script>
		<script src="<c:url value='/res/js/bignumber.js' />"></script>
		<script src="<c:url value='/res/js/jquery.datetimepicker.full.min.js' />"></script>
	</head>

	<body>
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<tbody>
				<tr>
					<td style="text-align:center;">
					</td>
				</tr>
				<tr>
					<td style="padding-top:10px;">
						<table cellpadding="0" cellspacing="0" style="width:100%;">
							<tbody>
								<tr>
									<td class="layout-header" style="width:200px; vertical-align:top;">
										<tiles:insertAttribute name="header" />
									</td>
									<td style="padding:0 10px; vertical-align:top;">
										<tiles:insertAttribute name="body" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;"></td>
				</tr>
			</tbody>
		</table>
		<div style="height:50px;"></div>
	</body>
</html>