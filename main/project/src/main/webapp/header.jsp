<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/*header_box css*/
	#header_box .flex{display: flex; justify-content: space-between;align-items: center;flex-wrap: wrap; border-bottom: 1px solid #000;}
	#header_box .flex li a img{width: 50px;padding:10px;}
    #header_box .m_menu{display:flex; padding-right: 20px}
	

	/*m-menu css*/
    .m-menu{width: 25px; height: 20px; position: relative;padding-right:30px;}
    .flex .m_menu .logo{padding-left:20px;}
    .m-menu span{display: block; background: #000; height: 2px; position: absolute; width: 50%; transition: all 0.3s;}
    .m-menu .top{top: 0px;}
    .m-menu .middle{top: 9px;}
    .m-menu .bottom{bottom: 0px;}


	/*메뉴에 올렸을때 X자만들기*/
    .m-menu.active .top{transform: rotate(45deg);top: 10px;}
    .m-menu.active .middle{opacity: 0;}
    .m-menu.active .bottom{transform: rotate(-45deg); bottom: 8px;}


    /*메뉴눌렀을때 사이드바 */
    .m-menu .sidebar {width: 200px;height: 100%;background:#eee; opacity:0.7;top: 82px;right: -300px;transition: all .35s; position: fixed;}
    .m-menu.active .sidebar{right:0;}
        
    /*사이드바 메뉴*/
    .sidebar ul {text-align: center;}
   	.menu_box li{margin-top:30px;}
   	.menu_box #search{width: 130px;padding:10px;background-image:url(img/search_basic.png); background-size:13px; background-position:right;background-repeat:no-repeat;}
</style>
<header>
	<div>
		<div class="wrap">
			<div id="header_box">
				<ul class="flex">
					<li><a href=""><img src="img/ooguLogoS.png" alt=""></a></li>
					<ul class="m_menu">
						<li class="logo">
                            <div class="m-menu">
                                <a href="#none" class="m-menu_bt" >
                                <div>
                                    
                                      <span class="top"></span>
                                      <span class="middle"></span>
                                      <span class="bottom"></span>
                                    
                                </div>
                                </a>                                    
                                <div class="sidebar" id="sidebar">
                                    <ul class="menu_box">
                                        <li>
                          					<input type="text" size="10" placeholder="search" name="search" id="search">											
                                        </li>
                                        <li><a href="#">메뉴1</a></li>
                                        <li><a href="#">메뉴2</a></li>
                                        <li><a href="#">메뉴3</a></li>
                                        <li><a href="#">메뉴4</a></li>
                                    </ul>
                                </div>						
                            </div>
						</li>
						<a href="login.jsp"><li><b>LOGIN</b></li></a>
					</ul>
				</ul>
                
			</div>
		</div>
	</div>
    <div class="wrap">
</header>
<script>
    $(document).ready(function () { 				//document >이페이지 
      $('.m-menu_bt').click(function(){
        $('.m-menu').toggleClass('active');      
      });
    });
    
    const menubutton = document.getElementById('')
  </script>
</html>