<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookList.aspx.cs" Inherits="LIBRARY.UI.bookList" %>

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
        List<LIBRARY.Models.book> bookList = getBookList();
    %>
            
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
		    <h3>图书列表</h3>
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
				    <tr style="background-color:#E0E0E0;border-width:0px">
					    <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">选中</td>
					    <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					    <td style="width:6%; border-width:0px;font-weight:bold;text-align:center">ISBN</td>
					    <td style="width:6%; border-width:0px;font-weight:bold;text-align:center"> 标识码 </td>
					    <td style="width:6%; border-width:0px;font-weight:bold;text-align:center"> 书名</td>
					    <td style="width:6%; border-width:0px;font-weight:bold;text-align:center">作者</td>
					    <td style="width:10%;border-width:0px;font-weight:bold;text-align:center">出版社</td>
					    <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">出版社ID</td>
                        <td style="width:12%;border-width:0px;font-weight:bold;text-align:center">出版日期</td>
                        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">价格</td>
                        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">语言</td>
                        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">是否借出</td>
                        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">位置</td>
                        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				    </tr>
			

                <% foreach (var book in bookList){
                     if (book.Is_deleted==false) {%>
                    <tr style="background-color:#E0E0E0;border-width:0px">
				        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=book.Id%>" class="selectNode"/></td>
				        <td style="width:6%;border-width:0px;text-align:center"><%=book.Id%></td>
				        <td style="width:6%;border-width:0px;text-align:center"><%=book.ISBN%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Signal_code%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Name%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Author%></td>
                        <td style="width:10%;border-width:0px;text-align:center"><%=book.Publisher_name%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Publisher_id%></td>
                        <td style="width:12%;border-width:0px;text-align:center"><%=book.Publish_date%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Price%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Language%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Status%></td>
                        <td style="width:6%;border-width:0px;text-align:center"><%=book.Location_id%></td>

				        <form action="bookList.aspx" method='post'>
					        <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=book.Id%>" />
					        <td style="width:6%;border-width:0px;font-weight:bold;text-align:center"><input type='submit' value="删除" class="selectNode"/></td>
				        </form>
                    </tr>
			
                <%}} %>
                </table>
			    <div style="margin:20px 0 0 20px">
				    <!-- 按钮触发模态框 -->
				    <button class="btn btn-primary btn-sm" data-toggle="modal"
				       data-target="#addBook">
				          添加图书
				    </button>
			    </div>

			    <div class="modal fade" id="addBook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin:30px 0 0 24%; width:60%">
			       <div class="modal-dialog">
			          <div class="modal-content">
			             <div class="modal-header">
			                <button type="button" class="close"
			                   data-dismiss="modal" aria-hidden="true">
			                      &times;
			                </button>
			                <h4 class="modal-title" id="myModalLabel">
			                   添加图书
			                </h4>
			             </div>

			             <form action="addBook.aspx" method='post' onsubmit="return checkinput();">
			             <div class="modal-body">
			         	    <div style="margin: 20px 0 0 0">
			         		    图书ISBN :  <input style="margin-left:22px" type='text' name='ISBN' id='ISBN'/>
			         	    </div>

			         	     <div style="margin: 20px 0 0 10px">
			         	        标识码 :  <input style="margin-left:22px" type='text' name='signal_code' id='signal_code'/>
			         	     </div>

			         	     <div style="margin: 20px 0 0 0">
			         		    书名:  <input style="margin-left:22px" type='text' name='name' id='name'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         		    作者:  <input style="margin-left:22px" type='text' name='author' id='author'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        出版商:  <input style="margin-left:22px" type='text' name='publisher_name' id='publisher_name'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        出版商ID:  <input style="margin-left:22px" type='text' name='publisher_id' id='publisher_id'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        出版日期:  <input style="margin-left:22px" type='text' name='publish_date' id='publish_date'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        价格:  <input style="margin-left:22px" type='text' name='price' id='price'/>
			         	    </div>

                         
			         	     <div style="margin: 20px 0 0 0">
			         	        语言:   <select id="language" name="language">
                                     <option value="Chinese">中文</option>
                                     <option value="English">英文</option>
			         	            </select>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        保存状态:  <input style="margin-left:22px" type='text' name='status' id='status'/>
			         	    </div>

                             <div style="margin: 20px 0 0 0">
			         	        地点:  <input style="margin-left:22px" type='text' name='location_id' id='location_id'/>
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