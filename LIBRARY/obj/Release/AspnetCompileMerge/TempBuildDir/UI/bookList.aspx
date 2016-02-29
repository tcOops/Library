<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookList.aspx.cs" Inherits="LIBRARY.UI.bookList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书详情</title>
    <script src="/static/js/jquery-1.11.3.min.js"></script>
    <link href="/static/css/bootstrap.css" media="all" rel="stylesheet"/>
	<script src="/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
	<script src="/static/js/index.js"></script>
    <Link Rel="SHORTCUT ICON" href="/static/img/favicon.ico">
</head>
<body>
    <%
        List<LIBRARY.Models.book> bookList = getBookList();
        int size = bookList.Count();
        int cnt = 0;
    %>
            
    <div class="" style="margin:30px 20px 20px 25px">
	    <div style="text-align:center; padding-left:92px; background:none repeat scroll 0% 0% #C9F0C3;height:60px">
		    <h4 style="text-align:center; padding:20px 0 0 30px;">管理员控制页面</h4>
	    </div>
	    <div class="row clearfix" style="margin:20px 0 20px 0px">
		    <div class="col-md-2 column" style="background:#C9F0C3">
					    <div class="sidebar-tab"><a href="readerList.aspx">读者管理</a></div>
					    <div class="sidebar-tab-active"><a href="bookList.aspx">图书管理</a></div>
                        <div class="sidebar-tab"><a href="circulationList.aspx">借阅记录</a></div>
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
		        <h3>图书列表(<%=size%>)</h3>

			    <table style="border-width:0px;border-collapse:collapse;width:100%">
				    <tr style="background-color:#E0E0E0;height:40px;border-width:0px">
					    <td style="width:7%;border-width:0px;font-weight:bold;text-align:center">标号</td>
					    <td style="width:15%; border-width:0px;font-weight:bold;text-align:center"> 标识码 </td>
					    <td style="width:24%; border-width:0px;font-weight:bold;text-align:center"> 书名</td>
					    <td style="width:11%; border-width:0px;font-weight:bold;text-align:center">作者</td>
                        <td style="width:14%; border-width:0px;font-weight:bold;text-align:center">出版社</td>
                        <td style="width:8%;border-width:0px;font-weight:bold;text-align:center">价格</td>
                        <td style="width:11%;border-width:0px;font-weight:bold;text-align:center">是否借出</td>
                        <td style="width:10%;border-width:0px;font-weight:bold;text-align:center">操作</td>
				    </tr>
                </table>
			

                <% foreach (var book in bookList){%>
                <% cnt = cnt + 1; %>
			    <table id = "locationContent" style="border-width:0px;border-collapse:collapse;width:100%;table-layout:fixed;word-wrap:break-word;word-break:break-all;">
				    <% if (cnt % 2 == 1)
                        {%><tr class="row1" style=""> <%} %>
                    <% if (cnt % 2 == 0)
                        {%><tr class="row2" style=""> <%} %>
				    <!--  <td style="width:3%;border-width:0px;font-weight:bold;text-align:center"><input type='checkbox' value="<%=book.Id%>" class="selectNode"/></td> -->
				    <td style="width:7%;border-width:0px;text-align:center"><%=book.Id%></td>
                    <td style="width:15%;border-width:0px;text-align:center"><%=book.Serial_code%></td>
                    <td style="width:24%;border-width:0px;text-align:center"><%=book.Name%></td>
                    <td style="width:11%;border-width:0px;text-align:center"><%=book.Author%></td>
                    <td style="width:14%;border-width:0px;text-align:center"><%=book.Publisher_name%></td>
                    <td style="width:8%;border-width:0px;text-align:center"><%=book.Price%>元</td>
                    <td style="width:11%;border-width:0px;text-align:center"><%=book.Status%></td>
                  
                    <td style="width:10%;border-width:0px;font-weight:bold;text-align:center">
				        <form action="bookList.aspx" method='post'>
					        <input style="display:none;" id="nodeIdRes" name="nodeIdRes" value="<%=book.Id%>" />
					        <input type='submit' disabled="disabled"  value="删除" class="selectNode"/>
				        </form>
                    </td>		
                <%} %>
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
			         	    <div style="margin: 15px 0 0 0">
			         		    图书ISBN:<input style="margin-left:12px" type='text' name='ISBN' id='ISBN'/>
			         	    </div>

			         	     <div style="margin: 15px 0 0 0px">
			         	        标识码:<input style="margin-left:28px" type='text' name='signal_code' id='signal_code'/>
			         	     </div>

			         	     <div style="margin: 15px 0 0 0">
			         		    书名:<input style="margin-left:40px" type='text' name='name' id='name'/>
			         	    </div>

                             <div style="margin: 15px 0 0 0">
			         		    作者:<input style="margin-left:40px" type='text' name='author' id='author'/>
			         	    </div>

                             <div style="margin: 15px 0 0 0">
			         	        出版商:<input style="margin-left:28px" type='text' name='publisher_name' id='publisher_name'/>
			         	    </div>

                            <!--<div style="margin: 15px 0 0 0">
			         	        出版商ID:<input style="margin-left:16px" type='text' name='publisher_id' id='publisher_id'/>
			         	    </div>-->

                             <div style="margin: 15px 0 0 0">
			         	        出版日期:<input style="margin-left:16px" type='text' name='publish_date' id='publish_date'/>
			         	    </div>

                             <div style="margin: 15px 0 0 0">
			         	        价格:<input style="margin-left:40px" type='text' name='price' id='price'/>
			         	    </div>

                         
			         	     <div style="margin: 15px 0 0 0">
			         	        语言:<select  style="margin-left:40px" id="language" name="language">
                                     <option value="Chinese">中文</option>
                                     <option value="English">英文</option>
			         	            </select>
			         	    </div>

                           <!--  <div style="margin: 15px 0 0 0">
			         	        保存状态:<input style="margin-left:16px" type='text' name='status' id='status'/>
			         	    </div>-->

                            <div style="margin: 15px 0 0 0">
			         	        索引号:<input style="margin-left:29px" type='text' name='index_id' id='index_id'/>
			         	    </div>

                              <div style="margin: 15px 0 0 0">
			         	        页码数:<input style="margin-left:29px" type='text' name='page_number' id='page_number'/>
			         	    </div>

                           <!--  <div style="margin: 15px 0 0 0">
			         	        地点:<input style="margin-left:40px" type='text' name='location_id' id='location_id'/>
			         	    </div>-->
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