<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/logo_icon.png" />
<title>��Ʈ����� ���񽺼���</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/store_service_center.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<jsp:include page="../template/header.jsp"></jsp:include>

</head>
<body>
<article>
	<!-- ī�װ� -->
	<div class="contents_all">
		<div class="category_list">
			<div>
				<a class="category_title" href="storeServiceCenter.do">NOTICE</a>
			</div>
			<div>
				<a class="category_title" href="storeServiceCenterFAQ.do">FAQ</a>
			</div>
		</div>
	</div>
	<!-- �������� -->
		<div class="store_review_all">
			<div class="store_review">
				<table>
					<tr>
						<td id="news_num">
							<img src="../img/megaphone.png" width=23px; height=23px>
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">��Ʈ����� �ù���� �� ���� ��� ���� �ȳ�</a>
							</div>
						</td>
						<td id="down_arrow" style="color:gray">
							<input type="button" class="slider" value="��" style="background: none; border:0px; color:gray; cursor:pointer;">
						</td>
					</tr>
									
					
					
					
					<tr  id="contents_all" style=" display: none">
						<td></td>
						
						<td>
							<div style="text-align: right">
								2020-08-14
							</div>
							
							<pre><br>							
�ȳ��ϼ���.

�������Դϴ�.

8/14(��)�� �ڷγ� ���� �ؽ��� �뵿���� ������� ������ �ִ� �ù� �뵿�ڸ� ���� '�ù���� ��'�Դϴ�.

��� �ù�뵿�ںе��� ��������� �츮�� �󸶳� ���� ��Ȱ�� �ϰ� �ִ��� �� �������� �����ϴ�.
������ �ù���� ���� ���� �ҿ�ұ��� �ù� �ֹ��� ���ϰ� �ֺ� ���� �� ��������� �̿��Ͻðų� ���ֿ� �̿��Ͻñ⸦ ���� �帳�ϴ� :)

�ƿ﷯ �ù���� �� ���Ϻ��� �ù�뵿���� �޽��� �����ϰ��� 8/12 ���� 3�� ���� �ֹ� �Ǻ��ʹ� �ù�뵿�ںе��� ���ް� ���� ���� �� 8/17(��)�� ���˴ϴ�.
�̿뿡 ���� �ٶ��ϴ�.

8/12(��) ���� 3�� ���� �ֹ� �� : ���� �߼�

�����մϴ�.
					
							<br></pre>
						</td>
						
						<td></td>
					</tr>
					
					
					<tr>
						<td id="news_num">
							2
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">ä�����</a>
							</div>
						</td>
						<td style="color:gray">					
							<input type="button" class="slider" value="��" style="background: none; border:0px; color:gray; cursor:pointer">
						</td>
					</tr>										
										
					<tr>
						<td id="news_num">
							1
						</td>
						<td id="news_title">
							<div id="news_title_content">
								 <a id="news_title_detail" href="#">Ȩ������ ���� ��� ���� �̺�Ʈ</a>
							</div>
						</td>
						<td style="color:gray">
							<input type="button" class="slider" value="��" style="background: none; border:0px; color:gray; cursor:pointer">
						</td>
					</tr>
					
				</table>
			</div>	
				
	</div><!-- end contents_all -->
</article>
<script>
$( document ).ready( function() {	
	$(".slider").click(function(){
		if($(this).parent().parent().next().is(":visible")){
			$(this).parent().parent().next().slideUp(400);
	      	$(this).val("��");
	    } else{
	    	$(this).parent().parent().next().slideDown(400);
	    	$(this).val("��");
	   	}
	});
 });
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>