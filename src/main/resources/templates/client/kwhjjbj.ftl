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
    <a class="back" href="#"></a>
    <p>口味和忌口</p>
  </header>
  <!-- 头部 END -->

  <!-- 口味和忌口 -->
  <article class="taste-diet">
    <div class="write">
      <div class="text-box">
        <select>
          <option value="口味">口味</option>
          <option value="忌口">忌口</option>
        </select>
        <input type="text">
      </div>
      <input class="btn-add-taste" type="submit" value="添加">
    </div>
    <ul>
      <li class="common">辣一点<span>X</span></li>
      <li class="delete">不要香菜<span>X</span></li>
      <li>咸一点<span>X</span></li>
      <li class="common">不要大蒜<span>X</span></li>
      <li>咸一点<span>X</span></li>
      <li>不要大蒜<span>X</span></li>
      <li class="delete">辣一点<span>X</span></li>
      <li>不要香菜<span>X</span></li>
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