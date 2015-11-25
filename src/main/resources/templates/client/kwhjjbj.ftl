<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!--css-->
<link rel="stylesheet" type="text/css" href="/client/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
<title>叫个厨子</title>
</head>
<body class="bgc-f2">
  <!-- 头部 -->
  <header>
    <a class="back" href="/kwhjj"></a>
    <p>口味和忌口</p>
  </header>
  <!-- 头部 END -->

  <!-- 口味和忌口 -->
  <article class="taste-diet">
    <div class="write">
    <form id="form1" action="/user/kwhjj" method="post">
      <div class="text-box">
        <input type="text" placeholder="口味和忌口" name="kwhjj">
      </div>
     <input class="btn-add-taste" type="submit" value="添加" >
     </form>
    </div>
    <ul>
    
      
    </ul>
    <script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $(".taste-diet ul li span").click(function(){
          $(this).parent().hide();
        });
      });
    </script>
  </article>
  <!-- 口味和忌口 END-->


</body>
</html>