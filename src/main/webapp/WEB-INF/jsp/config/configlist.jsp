<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
		<!-- Basic -->
    	<meta charset="UTF-8" />

        <title>Backyard</title>
	 
		<!-- Mobile Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png" />
		<link rel="apple-touch-icon" sizes="57x57" href="assets/ico/apple-touch-icon-57x57.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png" />
		<link rel="apple-touch-icon" sizes="76x76" href="assets/ico/apple-touch-icon-76x76.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png" />
		<link rel="apple-touch-icon" sizes="120x120" href="assets/ico/apple-touch-icon-120x120.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="assets/ico/apple-touch-icon-144x144.png" />
		<link rel="apple-touch-icon" sizes="152x152" href="assets/ico/apple-touch-icon-152x152.png" />
		
	    <!-- start: CSS file-->
		
		<!-- Vendor CSS-->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		<link href="assets/vendor/css/pace.preloader.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->
		<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />	
		<link href="assets/plugins/jquery-datatables-bs3/css/datatables.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-datepicker/css/datepicker-theme.css" rel="stylesheet" />

		
		<!-- Theme CSS -->
		<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/add-ons.min.css" rel="stylesheet" />
		
		<!-- end: CSS file-->	
	    
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->		
		
	</head>
	
	<body>

        <%@ include  file="../header.jsp"%>
		
		<!-- Start: Content -->
		<div class="container-fluid content">	
			<div class="row">

                <%@ include  file="../menu.jsp"%>
						
				<!-- Main Page -->
				<div class="main ">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="panel panel-default bk-bg-white">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-hand-o-right"></i><span class="break"></span>系统配置列表</h6>							
									<div class="panel-actions">
										<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
										<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
									</div>
								</div>
								<div class="panel-body">
					 <form action="/configlist" id="editForm" method="post">
                        <input type="hidden" id="page" name="page" value='<c:out value="${pager.pageNumber}"/>'/>
                        <div class="row datatables-header form-inline">
                            <div class="col-sm-12 col-md-12">
                                <table class="col-md-12">
                                    <tbody>
                                    <tr>
                                        <td >
                                            ClientID：<input type="text" class="form-control" name="client_id" value='<c:out value="${client_id}"/>'/>
                                            &nbsp;
                                            K值：<input type="text" class="form-control" name="k" value='<c:out value="${k}"/>' />
                                        </td>
                                        <td align="right">
                                            <button type="button" class="bk-margin-5 btn btn-success" onclick="doSubmit();">&nbsp;查 询&nbsp;</button>
                                            <a href="/configIndex.html" class="bk-margin-5 btn btn-success" >&nbsp;添 加&nbsp;</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
												
												
									<table class="table table-bordered table-striped" id="datatable-default">
										<thead>
											<tr>
												<th style="text-align:center;width:120px;">客户端ID</th>
												<th style="text-align:center;width:100px;">系统</th>
												<th style="text-align:center;width:100px;">版本</th>
												<th style="text-align:center;width:100px;">K</th>
												<th style="text-align:center;">V</th>
												<th style="text-align:center;width:180px;">操作</th>
											</tr>
										</thead>
										<tbody style="text-align:center;">
	                                        <c:forEach var="config" items="${configlist}">
	                                            <tr class="gradeX">
	                                                <td style="vertical-align: middle;"><c:out value="${config.client_id}"/></td>
	                                                <td style="vertical-align: middle;"><c:out value="${config.os}"/></td>
	                                                <td style="vertical-align: middle;"><c:out value="${config.version}"/></td>
	                                                <td style="vertical-align: middle;"><c:out value="${config.k}"/></td>
	                                                <td style="vertical-align: middle;"><c:out value="${config.v}"/></td>
	                                                <td class="actions">
	                                               		<a href='configdetail.html?configId=<c:out value="${config.id}"/>' class="btn btn-info"><i class="fa fa-edit ">编辑</i></a>
                                                		<a href="javascript:void(0)" onclick="del(<c:out value="${config.id}"/>)" class="btn btn-danger"><i class="fa fa-trash-o ">删除</i></a>
	                                               	</td>
	                                            </tr>
	                                        </c:forEach>
										</tbody>
									</table>	
									<%@ include  file="../pager.jsp"%>
								</div>
							</div>
						</div>
					</div>		
				</div>
				<!-- End Main Page -->
			
			</div>
		</div><!--/container-->
		
		
		<div class="clearfix"></div>		
		
		
		<!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/vendor/skycons/js/skycons.js"></script>
		<script src="assets/vendor/js/pace.min.js"></script>
		
		<!-- Plugins JS-->
		<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

		<script src="assets/js/pages/form-elements.js"></script>
		
		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- end: JavaScript-->
		 <script type="text/javascript">
           function del(id){
        	   var a=confirm("确认删除此配置？");
        	   if(a==true){
        		   $.get("/configDel.html?configId="+id,function(data){
        			    var json=JSON.parse(data);
        			    if(json.code==0){
        			    	alert("操作成功");
        			    	location.href="/configlist.html";
        			    }else{
        			    	alert("操作失败");
        			    	return false;
        			    }
        			  });
        	   }
           }
           function doSubmit(){
        	   $("#page").attr("value","1");
               $("#editForm").submit();
           }
        </script>
	</body>
	
</html>