﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="LIBRARY.UI.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/demo.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
</head>

<body>
<div class="" style="margin:30px 20px 20px 25px">
    <div class="row clearfix" style="margin:20px 0 20px 0px">  
        <div class="col-md-2 column" style="background:rgba(198, 190, 204, 1)">
				    <div class="sidebar-tab"><a href="readerList.aspx">读者管理</a></div>
				    <div class="sidebar-tab"><a href="bookList.aspx">图书管理</a></div>
                    <div class="sidebar-tab"><a href="circulationList.aspx">借阅记录</a></div>
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏终端</a></div>
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div>
                    <div class="sidebar-tab"><a href="dataImport.aspx">数据导入</a></div> 
                    <div class="sidebar-tab"><a href="bookSign.aspx">图书标识</a></div> 
                    <div class="sidebar-tab"><a href="bookOnshelf.aspx">图书上架</a></div> 
                    <div class="sidebar-tab-active"><a href="demo.aspx">演示功能</a></div>
	    </div>
        <div class="col-md-10 column">
            <div  style="text-align:center;">
                <table background="/static/img/cube.jpg" width="780px" align="center" style="height:613px" >
                        <tr>
                            <th align="center" colspan="2"  >
                                <img border="0" src="/static/img/LibraryLogo.png"/>
                                <p></p>
                                <span style="font-size:30px;"><%="智定图书ATM系统 功能演示"%></span>
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
                                <div id="rtcontent" style="font-size:30px;background:rgba(198, 190, 204, 1)">

                                </div>
                            </td>
                            <td align="center">
                                <%                                                              
                                string str = "/static/Avatar/" + "1348189797"+".jpg";          
                                %>                             
                            </td>
                        </tr>
                </table>        
            </div>
        </div>
    </div>
</div>
</body>
</html>