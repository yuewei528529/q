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
    <title>项目台账</title>
 
</head>
<body>
 <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
 
    <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
            	
                url: 'http://localhost:8081/GzMavenSSM/student/getJsonPageInfoBootstraptable1',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: '电力合同号', name:'hetongh',index:'hetongh',  },
                    { label: '类别',  index:'leibie',  name: 'leibie'},
                    { label: '项目简称', name: 'xmjc'},
                    { label: '项目经理', name: 'xmjl',  },
                    { label: '合同总额', name: 'htje', key: true,  },
                    { label: '回款比例', name: 'hkbl',  },
                    { label: '供应商名称', name: 'gys',  },
                    { label: '货物名称', name: 'hwmc',  },
                    { label: '单位', name: 'danw', key: true,  },
                    { label: '数量', name: 'shul', },
                    { label: '单价(万元)', name: 'danj' },
                    { label: '合同总金额(万元', name: 'htze'},
                    { label: '开票日期', name: 'kprq', key: true,  },
                    { label: '开票金额', name: 'kpje'},
                    { label: '已付金额', name: 'yif',  },
                    { label: '余额', name: 'yue',  },
                    { label: '付款比例', name: 'fkbl', key: true,  },
                    { label: '合同交货期', name: 'jhq',  },
                    { label: '交货情况', name: 'jhqk',  },
                    { label: '合同状态', name: 'htzt',  },
                    { label: '总控备注', name: 'zk', key: true, },
                    { label: '付款方式', name: 'fkfs', },
                    { label: '前期', name: 'qq', }
     
                ],
/*                 autoScroll: false,//当autoScroll和shrinkToFit均为false时，会出现行滚动条
                shrinkToFit: false, */
				viewrecords: true,
                width: 1900,
                height: 950,
                rowNum: 600,
                pager: "#jqGridPager",
                grouping:true, 
                groupingView : {
                	groupField : ['xmjc'], //需要分组的列
                	groupSummary : [true], //是否显示汇总 如果为true需要在colModel中进行配置 如： 

                	groupColumnShow:[true],
                	groupText : ['<b>{0}</b>'],
                	groupCollapse : true, //该属性表示在加载数据的时候是否只显示分组信息，false表示既显示分组信息也显示每个分组里面的详细信息，true则只显示分组信息
                    groupDataSorted: true, // 分组中的数据是否排序
                    groupOrder: ['asc'], // 分组后的排序
                    groupSummary: [true], // 是否显示汇总.如果为true需要在colModel中进行配置
                    summaryType: 'sum', // 运算类型，可以为max,sum,avg</div>
                    summaryTpl: '<b>规范化股份: {0}</b>',

                    groupSummaryPos: ['footer'], //汇总数据显示位置，footer或header。默认是footer
                    showSummaryOnHide: false //是否显示汇总信息并且当收起表格时是否隐藏下面的分组

                	}, //统计 footerrow:true, //开启统计 userDataOnFooter : true, //在页脚显示统计 altRows : true ,
                    footerrow:true,                   //开启统计
                    userDataOnFooter : true,          //在页脚显示统计
                    altRows : true , 	                  
                   gridComplete:function(){ 
                	   
                	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
                	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
                	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(11).html());
                	       if(isNaN(bb)){bb=0};
                	  //    console.log(bb);

                	      aa=aa+bb;

                	 }
                	 $(".jqfoot").eq(a).children("td").eq(11).html("小计:"+aa)
                	 };
              	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
            	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
            	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(4).html());
            	       if(isNaN(bb)){bb=0};
            	  //    console.log(bb);

            	      aa=aa+bb;

            	 }
            	 $(".jqfoot").eq(a).children("td").eq(4).html("小计:"+aa)
            	 };
            	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
            	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
            	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(5).html());
            	       if(isNaN(bb)){bb=0};
            	  //    console.log(bb);

            	      aa=aa+bb;

            	 }
            	 $(".jqfoot").eq(a).children("td").eq(5).html("小计:"+aa)
            	 };
          	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
        	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
        	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(14).html());
        	       if(isNaN(bb)){bb=0};
        	  //    console.log(bb);

        	      aa=aa+bb;

        	 }
        	 $(".jqfoot").eq(a).children("td").eq(14).html("小计:"+aa)
        	 
        	 };
        	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
        	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
        	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(15).html());
        	       if(isNaN(bb)){bb=0};
        	  //    console.log(bb);

        	      aa=aa+bb;

        	 }
        	 $(".jqfoot").eq(a).children("td").eq(15).html("小计:"+aa)
        	 
        	 };
      	   for(a=0;a<$(".jqGridghead_0").length;a++){aa=0;
    	   for(i=0;i<$(".jqGridghead_0").eq(a).nextUntil(".jqfoot").length;i++){
    	       bb=parseFloat($(".jqGridghead_0").eq(a).nextUntil(".jqfoot").eq(i).children("td").eq(13).html());
    	       if(isNaN(bb)){bb=0};
    	  //    console.log(bb);

    	      aa=aa+bb;

    	 }
    	 $(".jqfoot").eq(a).children("td").eq(13).html("小计:"+aa)
    	 
    	 };
                   } 
        		//公共调用方法合并单元格（无需修改）

            });
        });

        $("#jqGrid").jqGrid('setFrozenColumns');
        $("#jqGrid").css("overflow-x","hidden");
      //  jQuery("#jqGrid").filterToolbar(options);  

       // jQuery("#jqGrid").jqGrid('filterToolbar',options);
		function MergerRowspan(gridName, CellName) {
			//得到显示到界面的id集合
			var mya = $("#" + gridName + "").getDataIDs();
			//当前显示多少条
			var length = mya.length;
			for (var i = 0; i < length; i++) {
				//从上到下获取一条信息
				var before = $("#" + gridName + "").jqGrid('getRowData', mya[i]);
				//定义合并行数
				var rowSpanTaxCount = 1;
				for (j = i + 1; j <= length; j++) {
					//和上边的信息对比 如果值一样就合并行数+1 然后设置rowspan 让当前单元格隐藏
					var end = $("#" + gridName + "").jqGrid('getRowData', mya[j]);
					if (before[CellName] == end[CellName]) {
						rowSpanTaxCount++;
						$("#" + gridName + "").setCell(mya[j], CellName, '', { display: 'none' });
					} else {
						rowSpanTaxCount = 1;
						break;
					}
					$("#" + CellName + "" + mya[i] + "").attr("rowspan", rowSpanTaxCount);
				}
			}
		};
  
		//公共调用方法合并单元格（根据需要修改修改）
		function MergerColspan(gridName,rowId,id,CellName) {
			
			$("#" + gridName + "").setCell(rowId, id, '', { display: 'none' });
			$("#" + CellName + "" + rowId + "").attr("colspan", 2);
			
		}
   </script>
 
</body>
</html>
