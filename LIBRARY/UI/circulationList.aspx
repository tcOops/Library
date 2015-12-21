<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="circulationList.aspx.cs" Inherits="LIBRARY.UI.circulationList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ATM图书管理系统主页</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
</head>


<body>
     <%
        List<LIBRARY.Models.circulation> circulationList =  getCirculationList();
    %>
            
    <div class="" style="margin:30px 20px 20px 25px">

	<div style="text-align:center; padding-left:92px; background:none repeat scroll 0% 0% #C9F0DD;height:60px">
		<h4 style="text-align:center; padding:20px 0 0 30px;">管理员控制页面</h4>
	</div>
	<div class="row clearfix" style="margin:20px 0 20px 0px">
		<div class="col-md-2 column" style="background:rgba(198, 190, 204, 1)">
					<div class="sidebar-tab-active"><a href="readerList.aspx">读者管理</a></div>
					<div class="sidebar-tab"><a href="bookList.aspx">图书管理</a></div>
                    <div class="sidebar-tab"><a href="circulationList.aspx">流通信息管理</a></div>
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
		</div>
		<div class="col-md-10 column">
		<h3>借阅记录</h3>
			<div style="margin:15px 0 10px 5px">
				<button class="btn btn-sm" onclick="choseAll()">
				      全选
				</button>
				&nbsp;&nbsp;
				<button class="btn btn-sm" onclick="choseReverse()">
				      反选
				</button>
			</div>


			<table style="border-width:0px;border-collapse:collapse;width:100%">
				<tr style="background-color:#E0E0E0;height:40px;border-width:0px">
					<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">选中</td>
					<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					<td style="width:14%; border-width:0px;font-weight:bold;text-align:center">读者姓名</td>
					<td style="width:25%; border-width:0px;font-weight:bold;text-align:center"> 书籍名称 </td>
					<td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> 读者卡号</td>
					<td style="width:10%; border-width:0px;font-weight:bold;text-align:center">操作时间</td>
					<td style="width:12%;border-width:0px;font-weight:bold;text-align:center">操作类型</td>
                    <td style="width:12%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				</tr>
			</table>

            <% foreach (var circulation in circulationList) {
                    if (circulation.Is_deleted == false) {%>
			<table id = "dnsContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				<tr class="{% cycle row1,row2 %}" style="">
				<td style="width:8%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=circulation.Id%>" class="selectNode"/></td>
				<td style="width:8%;border-width:0px;text-align:center"><%=circulation.Id%></td>
				<td style="width:14%;border-width:0px;text-align:center;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=circulation.Reader_name%></td>
				<td style="width:25%;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=circulation.Book_name%></td>
				<td style="width:15%;border-width:0px;text-align:center"><%=circulation.Signal_code%></td>
				<td style="width:10%;border-width:0px;text-align:center"><%=circulation.Action_time%></td>
				<td style="width:12%;border-width:0px;text-align:center"><%=circulation.Action_type%></td>
				<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">
                    <form action="index.aspx" method='post'>
					    <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=circulation.Id%>" />
					    <input type='submit' value="删除" class="selectNode"/>
				    </form>
                </td>
			</table>
            <%} } %>

			</div>
	</div>
</div>
        
</body>
</html>