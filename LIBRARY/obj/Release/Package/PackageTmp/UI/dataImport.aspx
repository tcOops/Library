<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataImport.aspx.cs" Inherits="LIBRARY.UI.dataImport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>数据导入</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <Link Rel="SHORTCUT ICON" href="/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>

    <script>
        function checkinput1() {
            if (!$("#file1").val()) {
                alert("请选择文件！");
                location.reload();
                return false;
            }
        }

        function checkinput2() {
            if (!$("#file2").val()) {
                alert("请选择文件！");
                location.reload();
                return false;
            }
        }
    </script>
</head>
   
<body>
    <%
    
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
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div>   
                    <div class="sidebar-tab-active"><a href="dataImport.aspx">数据导入</a></div>
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
            <div>
               	<form action="importStudentInfo.aspx" method="post" enctype="multipart/form-data" onsubmit="return checkinput1();" >
					<div class="submit-frame" style="background-color:#EFEFEF; color:black">
                        <div class="row-fluid">
                            <div class="col-md-7" >
                                <div class="page-header tag-frame1-title">
                                        导入学生信息
                                </div>
                                <div class="row-fluid">
                                    <div class="col-md-3 tag-frame1-subtitle">
                                        <p class="text-left">
                                            选择学生信息表格
                                        </p>
                                    </div>
                                    <div class="col-md-5" style="margin-top:30px;">
                                            <input class="input" name="file1" type="file" id="file1"/><br>
                                                                
                                            <input class="submit-button" type="submit" name="submit" value="导入">
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
				</form>
            </div>

            <br>
           <div>
               	<form action="importBookInfo.aspx" method="post" enctype="multipart/form-data" onsubmit="return checkinput2();" >
					<div class="submit-frame" style="background-color:#EFEFEF; color:black">
                        <div class="row-fluid">
                            <div class="col-md-7" >
                                <div class="page-header tag-frame1-title">
                                        导入图书信息
                                </div>
                                <div class="row-fluid">
                                    <div class="col-md-3 tag-frame1-subtitle">
                                        <p class="text-left">
                                            选择图书信息表格
                                        </p>
                                    </div>
                                    <div class="col-md-5" style="margin-top:30px;">
                                            <input class="input" name="file2" type="file" id="file2"/><br>
                                                                
                                            <input class="submit-button" type="submit" name="submit" value="导入">
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
				</form>
            </div>      
		</div>
	</div>
</div>
</body>
</html>
