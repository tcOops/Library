<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookSign.aspx.cs" Inherits="LIBRARY.UI.bookSign" %>

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
                    <div class="sidebar-tab"><a href="circulationList.aspx">流通信息管理</a></div>
                    <div class="sidebar-tab"><a href="locationList.aspx">馆藏地管理</a></div> 
                    <div class="sidebar-tab"><a href="classList.aspx">班级管理</a></div>
                    <div class="sidebar-tab"><a href="gradeList.aspx">年级管理</a></div> 
                    <div class="sidebar-tab"><a href="dataImport.aspx">数据导入</a></div>      
                    <div class="sidebar-tab-active"><a href="bookSign.aspx">图书标识</a></div> 
                    <div class="sidebar-tab"><a href="bookOnshelf.aspx">图书上架</a></div>   
                    <div class="sidebar-tab"><a href="demo.aspx">演示功能</a></div>
		</div>
		<div class="col-md-10 column">
            <form style="float:right" name="logout" action="logout.aspx" method='post'>
                <%string username = (string)HttpContext.Current.Session["user"]; %>
                用户：<%=username %>
                <button type="submit" class="btn btn-xs btn-primary" >登出</button>
            </form>

		  
            <div style="margin:50px 0 20px 20px">
                <span> 输入图书条形码查询：</span> 
                <input type="text" name="bookSerialCode" id ="bookSerialCode"/>
                <input type="button" class="btn btn-xs btn-primary" name="searchBook" id="serachBook" value="查询" onclick="getBookBySerial()"/>
            </div>
          
            <div id="bookContent">

            </div>
			
            <div class="modal fade" id="bookSign" tabindex="-1" role="dialog"
			  aria-labelledby="myModalLabel" aria-hidden="true" style="margin:30px 0 0 24%; width:60%">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close"
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
			            <h4 class="modal-title" id="myModalLabel">
			               标记图书
			            </h4>
			         </div>

			         <form name="my_form" action="addBookSign.aspx" method='post' onsubmit="return check();">
			             <div class="modal-body">
                             <input style="display:none;" id="bookIdRes" name="bookIdRes"/>
			         	     <div style="margin: 15px 0 0 0px" >
			         	       <span>图书序列号：</span>
                               <label id="bookSerialCodes"></label>
			         	     </div>

			         	     <div style="margin: 15px 0 0 0">
                                <span>图书名称：</span>
			         		    <label id="bookName"></label>
			         	    </div>

                            <div style="margin: 15px 0 0 0">
			         		    <span>作者：</span>
			         		    <label id="bookAuthor"></label>
			         	    </div>

                            <div style="margin: 15px 0 0 0" >
			         		    <span>出版社：</span>
			         		    <label id="bookPublisher"></label>
			         	    </div>

                            <div style="margin: 15px 0 0 0">
			         		    <span>SN Code: </span>&nbsp;&nbsp;
                                <input type="text" id="bookSN" name="bookSN"/>
			         	    </div>

			         	     <div style="margin: 15px 0 0 0">
			         	        <span>RFID Code:</span>
                                <input type="text" id="bookRFID" name="bookRFID"/><span style="color:red">(请使用RFID标签阅读器扫描)</span>
                                 </br></br><span style="">友情提示： 请把RFID标签贴在书籍指定位置</span>
			         	    </div>              
			            </div>
                         <br>

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
