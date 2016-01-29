<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookOnShelf.aspx.cs" Inherits="LIBRARY.UI.bookOnShelf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ATM图书管理系统主页</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/index.js"></script>
    <script src="/static/js/library.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>

    <script type="text/javascript">  
        function check() {          
            var passwd1=document.my_form.pwd1.value;  
            var passwd2=document.my_form.pwd2.value;
        
            if (passwd1 =="") {
                document.getElementById("explain1").innerText = "密码空，请输入";
                return false;
            }
            if (passwd1 != passwd2) {
                document.getElementById("explain1").innerText = "";
                document.getElementById("explain2").innerText = "密码不一致，请输入";
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <%
        
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
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏终端</a></div> 
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div> 
                    <div class="sidebar-tab"><a href="dataImport.aspx">数据导入</a></div>      
                    <div class="sidebar-tab"><a href="bookSign.aspx">图书标识</a></div> 
                    <div class="sidebar-tab-active"><a href="bookOnshelf.aspx">图书上架</a></div>   
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
		</div>
		<div class="col-md-10 column">
            <form style="float:right" name="logout" action="logout.aspx" method='post'>
                <%string username = (string)HttpContext.Current.Session["user"]; %>
                用户：<%=username %>
                <button type="submit" class="btn btn-xs btn-primary" >登出</button>
            </form>

		  
            <div style="margin:10px 0 20px 20px">
                <span> 输入图书编码范围：</span> 
                <div style="margin:20px 0 0 50px">
                    <span>起始的SN CODE： &nbsp;</span>
                    <input type="text" name="snCodeBeg" id ="snCodeBeg"/> </br></br>
                    <span>结束的SN CODE： &nbsp;</span>
                    <input type="text" name="snCodeEnd" id ="snCodeEnd"/> &nbsp;&nbsp;
                    <input type="button" class="btn btn-xs btn-primary" name="searchBookList" id="serachBookList" value="查询" onclick="getBookInfoBySNRange()"/>
                </div>

            </div>
          
            <div id="bookContents">

            </div>
			
            <div style="margin:20px 0 0 20px">
				<!-- 按钮触发模态框 -->
			</div>

            <div class="modal fade" id="addBookLocation" tabindex="-1" role="dialog"
			  aria-labelledby="myModalLabel" aria-hidden="true" style="margin:30px 0 0 24%; width:60%">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close"
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" id="myModalLabel">
			               图书上架
			            </h4>
			         </div>
                     
                     
			        <div class="modal-body">
                        <div style="margin:50px 0 50px 100px">
                            <span>请选择上架地点：</span>
                            <select id="location" name="location" style="width:200px">

                            </select>
                        </div>
			        </div>  

                    <input style="display:none;" id="reserveData" name="bookIds" />

			        <div class="modal-footer">
			        <button type="button" class="btn btn-default"
			            data-dismiss="modal">取消
			        </button>
			        <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="updateLocation()">
			          	确定添加
			        </button>
			        </div>

			      </div>
			    </div>
		   </div>
		</div>
	</div>
</div>
</body>
</html>