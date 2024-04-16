<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Takhfifan.Default1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3l_banner_nav_left">
			<section class="slider">
				<div class="flexslider" dir=ltr>
					<ul class="slides">
						<li>
							<div class="w3l_banner_nav_left_banner">
								<h3>درست کردن<span>غذای</span>تند</h3>
								<div class="more">
									<a href="products.html" class="button--saqui button--round-l button--text-thick" data-text="Shop now">
فروشگاه در حال حاضر</a>
								</div>
							</div>
						</li>
						<li>
							<div class="w3l_banner_nav_left_banner1">
								<h3>درست کردن<span>غذای</span>تند</h3>
								<div class="more">
									<a href="products.html" class="button--saqui button--round-l button--text-thick" data-text="Shop now">
فروشگاه در حال حاضر</a>
								</div>
							</div>
						</li>
						<li>
							<div class="w3l_banner_nav_left_banner2">
								<h3>تا<i>50%</i> off.</h3>
								<div class="more">
									<a href="products.html" class="button--saqui button--round-l button--text-thick" data-text="Shop now">
فروشگاه در حال حاضر</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<!-- flexSlider -->
				<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
				<script defer src="js/jquery.flexslider.js"></script>
				<script type="text/javascript">
				$(window).load(function(){
				  $('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
					  $('body').removeClass('loading');
					}
				  });
				});
                </script>
			<!-- //flexSlider -->
		</div>
</asp:Content>
