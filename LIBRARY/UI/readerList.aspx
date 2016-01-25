<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="readerList.aspx.cs" Inherits="LIBRARY.UI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ATM图书管理系统主页</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
</head>

<body>
    <%
        List<LIBRARY.Models.reader> readerList = getReaderList();
        int size = readerList.Count();
        int cnt = 0;
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
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏地管理</a></div> 
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div>      
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
		</div>
		<div class="col-md-10 column">
		    <h3>读者列表(<%=size %>)</h3>
		
			<table style="border-width:0px;border-collapse:collapse;width:100%">
				<tr style="background-color:#E0E0E0;height:40px;border-width:0px">
					<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					<td style="width:15%; border-width:0px;font-weight:bold;text-align:center">姓名</td>
					<td style="width:16%; border-width:0px;font-weight:bold;text-align:center"> 班级 </td>
					<td style="width:27%; border-width:0px;font-weight:bold;text-align:center"> 身份证件卡号</td>
					<td style="width:12%; border-width:0px;font-weight:bold;text-align:center">读者身份</td>
					<td style="width:13%;border-width:0px;font-weight:bold;text-align:center">读者状态</td>
					<td style="width:9%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				</tr>
			</table>

            <% foreach (var reader in readerList){ %>
			    <% cnt = cnt + 1; %>
			    <table id = "locationContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				<% if (cnt % 2 == 1)
                    {%><tr class="row1" style=""> <%} %>
                <% if (cnt % 2 == 0)
                    {%><tr class="row2" style=""> <%} %>
				   <!-- <td style="width:8%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=reader.Id%>" class="selectNode"/></td>-->
				    <td style="width:8%;border-width:0px;text-align:center"><%=reader.Id%></td>
				    <td style="width:15%;border-width:0px;text-align:center;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=reader.Name%></td>
				    <td style="width:16%;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=reader.Class_id%></td>
				    <td style="width:27%;border-width:0px;text-align:center"><%=reader.Student_card_number%></td>
				    <td style="width:12%;border-width:0px;text-align:center"><%=reader.Role_id%></td>
				    <td style="width:13%;border-width:0px;text-align:center"><%=reader.Reader_status%></td>
                    <td style="width:9%;border-width:0px;font-weight:bold;text-align:center">
				        <form action="readerList.aspx" method='post'>
					        <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=reader.Id%>" />
					        <input type='submit' value="删除" class="selectNode"/>
				        </form>
                    </td>
                </tr>
			</table>
            <%} %>

			<div style="margin:20px 0 0 20px">
				<button class="btn btn-primary btn-sm" data-toggle="modal"
				   data-target="#addReader">
				      添加读者
				</button>
			</div>

			<div class="modal fade" id="addReader" tabindex="-1" role="dialog"
			  aria-labelledby="myModalLabel" aria-hidden="true" style="margin:30px 0 0 24%; width:60%">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close"
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" id="myModalLabel">
			               添加读者
			            </h4>
			         </div>

			         <form action="addReader.aspx" method='post' onsubmit="return checkinput();">
			             <div class="modal-body">
			         	    <div style="margin: 10px 0 0 0">
			         		    姓名 :  <input style="margin-left:15px" type='text' name='reader_name' id='reader_name'/>
			         	    </div>

			         	     <div style="margin: 25px 0 0 0px">
			         	        性别： &nbsp;<select id="sex_select" name="sex">
                                     <option value="男">男</option>
                                     <option value="女">女</option>
			         	            </select>
			         	     </div>

			         	     <div style="margin: 20px 0 0 0">
			         		    班级:  <input style="margin-left:17px" type='text' name='class_id' id='class_id'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         		    学籍号:  <input style="margin-left:12px" type='text' name='student_code' id='student_code'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         		    学生卡号:  <input style="margin-left:8px" type='text' name='student_card_number' id='student_card_number' value="1"/>
			         	    </div>

			         	     <div style="margin: 20px 0 0 0">
			         	        读者身份:   <select id="role_id" name="role_id">
                                     <option value="1">校长</option>
                                     <option value="2">年级主任</option>
                                     <option value="3">班主任</option>
                                     <option value="4">任课老师</option>
                                     <option value="5">学生</option>
			         	            </select>
			         	    </div>

                            <div style="margin: 20px 0 0 0">
			         		    初始密码:  <input style="margin-left:8px" type='password' name='password' id='password' />
			         	    </div>

                            <div style="margin: 20px 0 0 0">
                                上传头像：<input id="File1" runat="server" name="UpLoadPicture" type="file" /> 
                            </div>
			            </div>

			             <div class="modal-footer">
			                <button type="button" class="btn btn-default"
			                   data-dismiss="modal">取消
			                </button>
			                <button type="submit" class="btn btn-primary">
			          	        确定添加
			                </button>
			             </div>
			        </form>
			      </div>
			</div>
		   </div>
		</div>
	</div>
</div>
</body>
</html>
