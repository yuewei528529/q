<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/commons/global.jsp" %>
 <%@ include file="/WEB-INF/common/head.jspf"%>
 <%@ include file="/WEB-INF/common/foot.jspf"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 
 <%@ include file="/commons/base.jsp" %>
      
<!-- 引入bootstrap,jquery已导入 -->
<script type="text/javascript" src="${staticPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
<link href="${staticPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<title>首页</title>
</head>
<body>
<<table id="example" class="display table table-bordered" cellspacing="0" width="600" style="margin-top: 50px">
    <thead>
    <tr>
        <th>Name</th>
        <th>Position</th>
        <th>Age</th>
    </tr>
    </thead>
</table>
</body>
<script type="text/javascript">
function Employee ( name, position, salary, office ) {
    this.name = name;
    this.position = position;
    this.salary = salary;
    this._office = office;

    this.office = function () {
        return this._office;
    }
};



//证照属性设置表

 var dataSet = [
        [ "Tiger Nixon",  "Edinburgh",20,1  ],
        [ "Tiger Nixon", "Tokyo",22,2],
        [ "Ashton Cox", "Tokyo",21,0 ]
            ];

    $('#example').DataTable({
        data: dataSet,
        paging: true,
        searching:false, //搜索栏
        lengthChange : false, //是否允许改变每页显示的数据条数
        ordering:false,
        columnDefs: [{
            targets: 1,
            createdCell: function (td, cellData, rowData, row, col) {
                var rowspan = rowData[4];
                if (rowspan > 1) {
                    $(td).attr('rowspan', 3)
                }
                if (rowspan == 0) {
                    $(td).remove();
                }
            }
        }]
    });


</script>
</html>