<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<link href="//cdn.bootcss.com/jqueryui/1.12.0-rc.2/jquery-ui.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/jqgrid/4.6.0/css/ui.jqgrid.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/i18n/grid.locale-en.js"></script>
<script src="//cdn.bootcss.com/jqgrid/4.6.0/js/jquery.jqGrid.min.js"></script>

<meta charset="utf-8" />
    <title>jqGrid Loading Data - Million Rows from a REST service</title>
 
</head>
<body>
 <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
 
    <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                mtype: "GET",
                datatype: "jsonp",
                colModel: [
                    { label: 'OrderID', name: 'OrderID', key: true, width: 75 },
                    { label: 'Customer ID', name: 'CustomerID', width: 150 },
                    { label: 'Order Date', name: 'OrderDate', width: 150 },
                    { label: 'Freight', name: 'Freight', width: 150 },
                    { label:'Ship Name', name: 'ShipName', width: 150 }
                ],
				viewrecords: true,
                width: 780,
                height: 250,
                rowNum: 20,
                pager: "#jqGridPager"
            });
        });
 
   </script>
 
</body>
</html>
