<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LIBRARY.UI.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>login</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/static/css/admin.css"/>
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
</head>


<body> 
  <div class="container-fluid fr">

    <div class="row-fluid">
      <div class="col-md-12 header">
      </div>
    </div>

  <div style="margin:15% 0 -50px 39%;">
    <h3>
      欢迎进入ATM图书管理系统管理界面 
    </h3>
  </div>

    <div class="row-fluid">

      <div class="col-md-4">
      </div>

      <div class="col-md-4 fr login-frame">
        <div class="login-header"></div>
         <div style="text-align:center;">
            <form class="form-horizontal" action="login.aspx" method='post'>
             <div class="control-group" style="margin-top:50px;">
              
               <div class="controls input-frame">
                Username<input type="text" name="username" style="margin-left:20px;" />
              </div>
            </div>
            <div class="control-group">
              
               <div class="controls input-frame">
                Password<input type="password" name='password' style="margin-left:20px;" />
               </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-default" style="margin-top:20px;">Login</button>
              </div>
            </div>
          </form>
         </div>
     </div>

     <div class="col-md-4">
     </div>

  </div>
</div>

</body>
</html>
