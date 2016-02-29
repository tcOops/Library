<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="circulationList.aspx.cs" Inherits="LIBRARY.UI.circulationList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>借阅详情</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <Link Rel="SHORTCUT ICON" href="/static/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
</head>

<body>
     <%
         List<LIBRARY.Models.circulation> circulationList =  getCirculationList();
         int size = circulationList.Count();
         int cnt = 0;
    %>
            
    <div class="" style="margin:30px 20px 20px 25px">

	<div style="text-align:center; padding-left:92px; background:none repeat scroll 0% 0% #C9F0C3;height:60px">
		<h4 style="text-align:center; padding:20px 0 0 30px;">管理员控制页面</h4>
	</div>
	<div class="row clearfix" style="margin:20px 0 20px 0px">
		<div class="col-md-2 column" style="background:#C9F0C3">
					<div class="sidebar-tab"><a href="readerList.aspx">读者管理</a></div>
					<div class="sidebar-tab"><a href="bookList.aspx">图书管理</a></div>
                    <div class="sidebar-tab-active"><a href="circulationList.aspx">借阅记录</a></div>
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏终端</a></div>
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div>
                    <div class="sidebar-tab"><a href="dataImport.aspx">数据导入</a></div>
                    <div class="sidebar-tab"><a href="bookSign.aspx">图书标识</a></div> 
                    <div class="sidebar-tab"><a href="bookOnshelf.aspx">图书上架</a></div>     
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
		</div>

		<div class="col-md-10 column">
            <form style="float:right" name="logout" action="logout.aspx" method='post'>
                <%string username = (string)HttpContext.Current.Session["user"]; %>
                用户：<%=username %>
                <button type="submit" class="btn btn-xs btn-primary" >登出</button>
            </form>
		    <h3>借阅记录(<%=size %>)</h3>
		    <table style="border-width:0px;border-collapse:collapse;width:100%">
				<tr style="background-color:#E0E0E0;height:40px;border-width:0px">
					<td style="width:6%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					<td style="width:14%; border-width:0px;font-weight:bold;text-align:center">读者姓名</td>
					<td style="width:20%; border-width:0px;font-weight:bold;text-align:center"> 书籍名称 </td>
					<td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> 读者卡号</td>
                    <td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> 馆藏地</td>
					<td style="width:9%; border-width:0px;font-weight:bold;text-align:center">操作时间</td>
					<td style="width:13%;border-width:0px;font-weight:bold;text-align:center">操作类型</td>
                    <td style="width:8%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				</tr>
			</table>

            <% foreach (var circulation in circulationList) {%>
			   <% cnt = cnt + 1; %>
			    <table id = "locationContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				<% if (cnt % 2 == 1)
                    {%><tr class="row1" style=""> <%} %>
                <% if (cnt % 2 == 0)
                    {%><tr class="row2" style=""> <%} %>
				<!--<td style="width:8%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=circulation.Id%>" class="selectNode"/></td>-->
				<td style="width:6%;border-width:0px;text-align:center"><%=circulation.Id%></td>
				<td style="width:14%;border-width:0px;text-align:center;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=circulation.Reader_name%></td>
				<td style="width:20%;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=circulation.Book_name%></td>
				<td style="width:15%;border-width:0px;text-align:center"><%=circulation.Signal_code%></td>
                <td style="width:15%;border-width:0px;text-align:center"><%=circulation.Location_name%></td>
				<td style="width:9%;border-width:0px;text-align:center"><%=circulation.Action_time%></td>
				<td style="width:13%;border-width:0px;text-align:center"><%=circulation.Action_type%></td>
				<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">
                    <form action="index.aspx" method='post'>
					    <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=circulation.Id%>" />
					    <input type='submit' disabled="disabled" value="删除" class="selectNode"/>
				    </form>
                </td>
			</table>
            <%}%>
		</div>
	</div>
</div>
        
</body>
</html>