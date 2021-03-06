{
    title : {
        text: '付费趋势'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['付费人数']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : [
            	<#list list as item> 
	        	   '${item.time}' 
	        	   <#if item_has_next>,</#if>
				</#list>
            ]
        }
    ],
    yAxis : [
        {
            type : 'value',
            type : '人数'
        }
    ],
    series : [
    	{
            name:'付费人数',
            type:'line',
            smooth:true,
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data:[
	            <#list list as item> 
	    	   		${item.pay_num} 
	    	   		<#if item_has_next>,</#if>
				</#list>
            ],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        }
    ]
}