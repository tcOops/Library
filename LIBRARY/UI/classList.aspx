<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="classList.aspx.cs" Inherits="LIBRARY.UI.classList" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>班级管理</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
</head>

<body>
    <%
        List<LIBRARY.Models.Class> classList = getClassList();
        List<LIBRARY.Models.grade> gradeList = getGradeList();
        int size = classList.Count();
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
                    <div class="sidebar-tab"><a href="circulationList.aspx">借阅记录</a></div>
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏终端</a></div>
                    <div class="sidebar-tab-active"><a href="classList.aspx">班级管理</a></div>
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
	        <h3>班级列表(<%=size %>)</h3>

	    <table style="border-width:0px;border-collapse:collapse;width:100%">
		<tr style="background-color:#E0E0E0;height:40px;border-width:0px">
			<td style="width:12%;border-width:0px;font-weight:bold;text-align:center">班级序号</td>
			<td style="width:27%; border-width:0px;font-weight:bold;text-align:center">班级名称</td>
            <td style="width:17%; border-width:0px;font-weight:bold;text-align:center">班级代号</td>
            <td style="width:22%; border-width:0px;font-weight:bold;text-align:center">年级序号</td>
		    <td style="width:22%;border-width:0px;font-weight:bold;text-align:center">操作</td>
        </tr>
	    </table>

        <% foreach (var Class in classList) {%>
		   <% cnt = cnt + 1; %>
			    <table id = "locationContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				<% if (cnt % 2 == 1)
                    {%><tr class="row1" style=""> <%} %>
                <% if (cnt % 2 == 0)
                    {%><tr class="row2" style=""> <%} %>
			   <!-- <td style="width:10%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=Class.Id%>" class="selectNode"/></td>-->
				<td style="width:12%;border-width:0px;text-align:center"><%=Class.Id%></td>
				<td style="width:27%;border-width:0px;text-align:center"><%=Class.Name%></td>
                <td style="width:17%;border-width:0px;text-align:center"><%=Class.Code_number%></td>
				<td style="width:22%;border-width:0px;text-align:center"><%=Class.Grade_id%></td>
				<td style="width:22%;border-width:0px;font-weight:bold;text-align:center">
                <form action="index.aspx" method='post'>
					 <input style="display:none;" id="nodeIdRes"  name="nodeIdRes" value="<%=Class.Id%>" />
					 <input type='submit' value="删除" disabled="disabled" class="selectNode"/>
			    </form>
                </td>
            </tr>
		</table>
        <%} %>
    

	    </div>

        <div class="col-md-8 column" style="text-align:center;margin-left:20%;margin-top:10%">
        <form action="addClass.aspx" method='post' onsubmit="">
			 <div style="text-align:center">
			   添加:
               <select name='grade_id'>
                    <% foreach (var grade in gradeList)
                       {%>
                     <option value ="<%=grade.Id %>"><%=grade.Name %></option>
                    <% } %>
               </select>
                <input  type='text' name='class_number'/>
               班
               <br />
               <br />
               班级代号:
               <input  type='text' name='code_number'/>
			  </div>

			  <div  style="margin-top:3%;text-align:center">
			     <button type="reset" class="btn btn-default">
                     取消
			     </button>
			     <button type="submit" class="btn btn-primary">
			       确定添加
			     </button>
              </div>
	    </form>
        </div>
    </div>
</div>
</body>
</html>
