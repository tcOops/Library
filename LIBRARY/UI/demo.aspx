﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="LIBRARY.UI.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/demo.js"></script>
</head>

<body>
<div class="" style="margin:30px 20px 20px 25px">
	<div style="text-align:center; padding-left:92px; background:none repeat scroll 0% 0% #C9F0DD;height:60px">
		<h4 style="text-align:center; padding:20px 0 0 30px;">管理员控制页面</h4>
	</div>
    <div class="row clearfix" style="margin:20px 0 20px 0px">  
        <div class="col-md-2 column" style="background:rgba(198, 190, 204, 1)">
				    <div class="sidebar-tab-active"><a href="readerList.aspx">读者管理</a></div>
				    <div class="sidebar-tab"><a href="bookList.aspx">图书管理</a></div>
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
	    </div>
        <div class="col-md-10 column">
            <div  style="text-align:center;">
                <table background="/static/img/cube.jpg" width="780px" align="center" style="height:613px" >
                        <tr >
                            <th align="center" colspan="2" >
                                <span style="font-size:30px">智定图书ATM系统</span>
                            </th>
                        </tr>

                        <tr>
                            <th align="center" colspan="2"  class="more">
                                <span style="font-size:30px">演示功能</span>
                            </th>
                        </tr>

                        <tr>
                            <td>
                                <%
                                    string student_card_number = "115033910047";
                                    LIBRARY.Models.reader reader = getReaderInfo(student_card_number);
                                    string name = reader.Name;
                                    string borrowTime=DateTime.Now.ToString();
                                %>
                                <div id="rtcontent">

                                </div>
                            </td>
                            <td align="center">
                                <%                                                              
                                string str = "/Avatar/" + student_card_number+".jpg";          
                                %>
                                <img border="0" src=<%=str%> width="150" height="200" />
                            </td>
                        </tr>
                </table>        
            </div>
        </div>
    </div>
</div>
</body>
</html>