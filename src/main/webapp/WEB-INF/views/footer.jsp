	<!-- Core Scripts - Include with every page -->
	<script src="resources/assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="resources/assets/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/assets/plugins/pace/pace.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="resources/assets/plugins/morris/raphael-2.1.0.min.js"></script>
	

	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="/resources/assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="/resources/assets/js/custom.js"></script>
	<script type="text/javascript">
	var infoIcon = function(value, data, cell, row, options){ 
        return "<img class='infoImage' src='/resources/assets/img/click.png'>";
};
		$("#person-table").tabulator({
			fitColumns : true, //fit columns to width of table (optional)
			pagination : "local",
			paginationSize :8,
			columns : [ //Define Table Columns
				{formatter:infoIcon, width:40, align:"center", onClick:function(e, cell, val, data){}},
			{
				title : "Name",
				field : "name",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, {
				title : "Email",
				field : "email",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, {
				title : "Phone Number",
				field : "phoneNo",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, 
			],
			rowClick : function(e, id, data, row) { //trigger an alert message when the row is clicked
			    $.ajax({
			        type: "GET",
			        url: "/getBooksDetails",
			        cache: false,
			        dataType:"json",
			        data: "userId="+id,
			        success: function (data) {
			        	if(data){
			        		$("#dialog").tabulator({
			        			height : "auto", // set height of table (optional)
			        			width:"auto",
			        			fitColumns : true, //fit columns to width of table (optional)
			        			columns : [ //Define Table Columns
			        			{
			        				title : "Author",
			        				field : "author",
			        				sorter : "string",
			        				align : "left",
			        				headerFilter : true
			        			}, {
			        				title : "Title",
			        				field : "title",
			        				sorter : "string",
			        				align : "left",
			        				headerFilter : true
			        			}, {
			        				title : "ISBN",
			        				field : "isbn",
			        				sorter : "string",
			        				align : "left",
			        				headerFilter : true
			        			}, ],
			        		});
			        		
			        		$("#dialog").tabulator("setData", data).dialog({
			        			  dialogClass: "no-close",
			        			  width:"auto",
			        			  buttons: [
			        			    {
			        			      text: "OK",
			        			      click: function() {
			        			        $( this ).dialog( "close" );
			        			      }
			        			    }
			        			  ]
			        			});
			            }
			        },
			        error: function(jqXHR, textStatus, errorThrown){
			            alert('error: ' + textStatus + ': ' + errorThrown);
			        }
			});
			},
		});
		//define some sample data
		var personData = ${personList};

		//load sample data into the table
		$("#person-table").tabulator("setData", personData);
		//Set initial page
		$("#person-table").tabulator("setPage", 1);
		
		$("#books-table").tabulator({
			fitColumns : true, //fit columns to width of table (optional)
			pagination : "local",
			paginationSize : 10,
			columns : [ //Define Table Columns
			{
				title : "Author",
				field : "author",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, {
				title : "Title",
				field : "title",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, {
				title : "ISBN",
				field : "isbn",
				sorter : "string",
				align : "left",
				headerFilter : true
			}, ],
			rowClick : function(e, id, data, row) { //trigger an alert message when the row is clicked
			},
		});
		//define some sample data
		var booksData = ${booksList};

		//load sample data into the table
		$("#books-table").tabulator("setData", booksData);
		//Set initial page
		$("#books-table").tabulator("setPage", 1);
		
	</script>