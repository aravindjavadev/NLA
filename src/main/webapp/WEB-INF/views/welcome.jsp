<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>National Library Demo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<spring:url value="/resources/css/library.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>
				<span> National Library </span>
			</h1>
		</div>
		<div class="row">

			<div class="col-md-12">
				<div class="panel with-nav-tabs panel-primary">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1primary" data-toggle="tab">Person
									Details</a></li>
							<li><a href="#tab2primary" data-toggle="tab">Books
									Details</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1primary">
								<table class="table table-striped">
									<thead>
										<tr id="firstrow">
											<th>Name</th>
											<th>Email</th>
											<th>Phone Number</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty personList}">
											<c:forEach items="${personList}" var="personList">
												<tr>
													<td>${personList.name}</td>
													<td>${personList.email}</td>
													<td>${personList.phoneNo}</td>
													<td><input type="submit" value="Books Lended"
														class="btn btn-info" onclick="doAjax(${personList.id});" />
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							<div id="dialog" title="Book Details"></div>
							<div class="tab-pane fade" id="tab2primary">

								<table class="table table-striped">
									<thead>
										<tr id="firstrow">
											<th>Author</th>
											<th>Title</th>
											<th>ISBN</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty booksList}">
											<c:forEach items="${booksList}" var="booksList">
												<tr>
													<td>${booksList.author}</td>
													<td>${booksList.title}</td>
													<td>${booksList.isbn}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"> 
	 $( function() {
		    $( "#tabs" ).tabs();
	} );
	function doAjax(arg) {
	    $.ajax({
	        type: "GET",
	        url: "/getBooksDetails",
	        cache: false,
	        dataType:"json",
	        data: "userId="+arg,
	        success: function (data) {
	        	if(data){
	                var len = data.length;
	                var txt = "";
	                var txtTable="<table class=\"table table-striped\"><thead><tr id=\"firstrow\"><th>AUTHOR</th><th>TITLE</th><th>ISBN</th></tr></thead><tbody>";
	                $("#dialog").html("");
	                $("#dialog").dialog({ width:650 , top:200 });
	                if(len > 0){
	                	 for(var i=0;i<len;i++){
	                        if(data[i].id && data[i].author &&  data[i].title  && data[i].isbn){
	                            txt += "<tr><td>"+data[i].author+"</td><td>"+data[i].title+"</td><td>"+data[i].isbn+"</td></tr>";
	                        }
	                    }
	                    if(txt != ""){
	                    	 $("#dialog").append(txtTable+txt+"</table>").dialog();
	                    }
	                }else{
                   	 $("#dialog").append(txtTable+"<tr><td colspan=\"3\">Books not Lended by the Person</td></tr></tbody></table>").dialog();
                    }
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	            alert('error: ' + textStatus + ': ' + errorThrown);
	        }
	});
}
</script>
</body>
</html>

