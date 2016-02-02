<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LIBRARY.UI.login" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>login</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/static/css/admin.css"/>
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
</head>


<body style="background-image:url(/static/img/152309805.jpg);background-repeat:round;height:70%"> 

  <div style="margin:4% 0 0 12%">
      <img border="0" src="/static/img/LibraryLogo.png"/>
  </div>
  <div style="margin:-1% 0 -50px 30%;">
    <h3>
      欢迎进入智定图书ATM管理系统平台
    </h3>
  </div>


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
</body>
</html>
