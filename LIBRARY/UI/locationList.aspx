<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="locationList.aspx.cs" Inherits="LIBRARY.UI.locationList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>馆藏地信息</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>

    <script type="text/javascript">  
        function checkinput() {          
            var location = $('#location').val()
            var doorIp = $('#doorIp').val()
            var RFID_ip = $('#RFIDIp').val()
            var code = $('#code').val()
            var snCode = $('#snCode').val()
        
            if (location =="") {
                alert("请输入馆藏地终端地址");
                return false;
            }
            if (doorIp == "") {
                alert("请输入门禁IP");
                return false;
            }
            if (RFID_ip == "") {
                alert("请输入RFID IP");
                return false;
            }
            if (code == "") {
                alert("请输入RFID IP的代码编号");
                return false;
            }
            if (snCode == "") {
                alert("请输入SN code");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <%
        List<LIBRARY.Models.bookstoreLocation> locationList = getLocationList();
        int size = locationList.Count();
        int cnt = 0;
    %>
            
<div class="" style="margin:30px 20px 20px 25px">

	<div style="text-align:center; padding-left:92px; background:none repeat scroll 0% 0% #C9F0DD;height:60px">
		<h4 style="text-align:center; padding:20px 0 0 30px;">管理员控制页面</h4>
	</div>
	<div class="row clearfix" style="margin:20px 0 20px 0px">
		<div class="col-md-2 column" style="background:rgba(198, 190, 204, 1)">
					<div class="sidebar-tab"><a href="readerList.aspx">读者管理</a></div>
					<div class="sidebar-tab"><a href="bookList.aspx">图书管理</a></div>
                    <div class="sidebar-tab"><a href="circulationList.aspx">借阅记录</a></div>
                    <div class="sidebar-tab-active"><a href="locationList.aspx">馆藏终端</a></div>
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
		    <h3>馆藏地列表(<%=size%>)</h3>
			<table style="border-width:0px;border-collapse:collapse;width:100%">
				<tr style="background-color:#E0E0E0;height:40px;border-width:0px">
					<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					<td style="width:14%; border-width:0px;font-weight:bold;text-align:center">具体位置</td>
					<td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> 门禁IP </td>
					<td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> RFID IP</td>
					<td style="width:10%; border-width:0px;font-weight:bold;text-align:center"> RFID IP_代码编号</td>
                    <td style="width:10%; border-width:0px;font-weight:bold;text-align:center"> SN Code</td>
					<td style="width:8%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				</tr>
			</table>

            <% foreach (var location in locationList){ %>
            <% cnt = cnt + 1; %>
			    <table id = "locationContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				<% if (cnt % 2 == 1)
                    {%><tr class="row1" style=""> <%} %>
                <% if (cnt % 2 == 0)
                    {%><tr class="row2" style=""> <%} %>
				    <td style="width:8%;border-width:0px;text-align:center"><%=location.Id%></td>
				    <td style="width:14%;border-width:0px;text-align:center;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=location.Location%></td>
				    <td style="width:15%;border-width:0px;text-align:center;border-width:0px;text-align:center"><%=location.Door_ip%></td>
				    <td style="width:15%;border-width:0px;text-align:center"><%=location.RFID_ip%></td>
				    <td style="width:10%;border-width:0px;text-align:center"><%=location.Code%></td>
                    <td style="width:10%;border-width:0px;text-align:center"><%=location.Sn_code%></td>
                    <td style="width:8%;border-width:0px;font-weight:bold;text-align:center">
				        <form action="readerList.aspx" method='post'>
					        <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=location.Id%>" />
					        <input type='submit' disabled="disabled"  value="删除" class="selectNode"/>
				        </form>
                    </td>
                </tr>
			</table>
            <%} %>

			<div style="margin:20px 0 0 20px">
				<button class="btn btn-primary btn-sm" data-toggle="modal"
				   data-target="#addLocation">
				      添加馆藏终端
				</button>
			</div>

				<div class="modal fade" id="addLocation" tabindex="-1" role="dialog"
			  aria-labelledby="myModalLabel" aria-hidden="true" style="margin:30px 0 0 24%; width:60%">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close"
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" id="myModalLabel">
			               添加馆藏终端
			            </h4>
			         </div>

			         <form action="addLocation.aspx" method='post' onsubmit="return checkinput();">
			             <div class="modal-body">
			         	    <div style="margin: 15px 0 0 0">
			         		   馆藏终端位置 :  <input style="margin-left:28px" type='text' name='location' id='location'/>
			         	    </div>

			         	     <div style="margin: 15px 0 0 0px">
			         	        门禁IP： <input style="margin-left:60px" type='text' name='doorIp' id='doorIp'/>
			         	     </div>

			         	     <div style="margin: 15px 0 0 0">
			         		    RFID IP:  <input style="margin-left:63px" type='text' name='RFIDIp' id='RFIDIp'/>
			         	    </div>

                           

                            <div style="margin: 15px 0 0 0">
			         		    RFID IP_代码编号:  <input style="margin-left:10px" type='text' name='code' id='code' value=""/>
			         	    </div>	
                             
                            <div style="margin: 15px 0 0 0">
			         		    SN Code:  <input style="margin-left:55px" type='text' name='snCode' id='snCode' value=""/>
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
