<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>주소로 보는 회원목록 </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></link>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
		<script>
					    $(document).ready(function() {
					        var ctx = $("#chart-line");
					        var myLineChart = new Chart(ctx, {
					            type: 'horizontalBar',
					            data: {
					                labels: ['서울', '경기', '강원', '인천', '충남', '충북', '대전', '경북', '대구', '경남', '울산', '부산', '전북', '전남', '광주', '제주', '세종'],
					                datasets: [{
					                    data: ['${AddressList[0]}', '${AddressList[1]}', '${AddressList[2]}', '${AddressList[3]}' ,'${AddressList[4]}', '${AddressList[5]}', 
					                    	'${AddressList[6]}', '${AddressList[7]}', '${AddressList[8]}', '${AddressList[9]}', '${AddressList[10]}', '${AddressList[11]}',
					                    	'${AddressList[12]}', '${AddressList[13]}','${AddressList[14]}','${AddressList[15]}','${AddressList[16]}'],
					                    label: "지역별분포도",
					                    borderColor: "#458af7",
					                    backgroundColor: '#26e4ca',
					                    fill: false
					                }]
					            },
					            options: {
					                title: {
					                    display: true,
					                    text: '주소로 보는 회원목록'
					                }
					            }
					        });
					    });
					</script>
					<style>
					 body {
					     background-color: #f9f9fa
					 }
					
					 .flex {
					     -webkit-box-flex: 1;
					     -ms-flex: 1 1 auto;
					     flex: 1 1 auto
					 }
					
					 @media (max-width:991.98px) {
					     .padding {
					         padding: 1.5rem
					     }
					 }
					
					 @media (max-width:767.98px) {
					     .padding {
					         padding: 1rem
					     }
					 }
					
					 .padding {
					     padding: 5rem
					 }
					
					 .card {
					     background: #fff;
					     border-width: 0;
					     border-radius: .25rem;
					     box-shadow: 0 1px 3px rgba(0, 0, 0, .05);
					     margin-bottom: 1.5rem
					 }
					
					 .card {
					     position: relative;
					     display: flex;
					     flex-direction: column;
						</style>			
				
<!-- Custom fonts for this template -->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">
 <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file="sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <%@ include file="header.jsp" %>
                           
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">주소</h1>
                    <p class="mb-4">
                     <a target="_blank"
                            href="https://datatables.net">민트마켓 회원주소</a>.</p>
                            <div class="dropdown">
                     	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     	카테고리
                     	</button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     		<a class="dropdown-item" href="membergender.mdo">성별</a>
                     		<a class="dropdown-item" href="memberbirth.mdo">년도</a>
                     		<a class="dropdown-item" href="memberaddress.mdo">주소</a>          
                     		<a class="dropdown-item" href="tables-member.mdo">회원목록</a>
                     	</div>
                     </div>

                    <!-- DataTales  -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">민트마켓 회원</h6>
                        </div>                                  
                    </div>
                    <div class="page-content page-container" id="page-content">			   
			        <div class="row">
			            <div class="container-fluid d-flex justify-content-center">
			                <div class="col-sm-8 col-md-6">
			                    <div class="card">
			                        <div class="card-header">주소로 보는 회원목록</div>
			                        <div class="card-body" style="height: 420px">
			                            <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
			                                <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
			                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
			                                </div>
                                <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                </div>
                            </div> <canvas id="chart-line" width="299" height="200" class="chartjs-render-monitor" style="display: block; width: 299px; height: 200px;"></canvas>
                       </div>
                   	 </div>
                	</div>
           		 </div>
        		</div>  
			</div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

       <%@ include file="footer.jsp" %>
          
    <!-- Bootstrap core JavaScript-->
    <script src="admin/vendor/jquery/jquery.min.js"></script>
    <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="admin/js/demo/datatables-demo.js"></script>

</body>

</html>
