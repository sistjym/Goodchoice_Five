<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

	.highcharts-figure,
	.highcharts-data-table table {
	    min-width: 320px;
	    max-width: 800px;
	    margin: 1em auto;
	}
	
	.highcharts-data-table table {
	    font-family: Verdana, sans-serif;
	    border-collapse: collapse;
	    border: 1px solid #ebebeb;
	    margin: 10px auto;
	    text-align: center;
	    width: 100%;
	    max-width: 500px;
	}
	
	.highcharts-data-table caption {
	    padding: 1em 0;
	    font-size: 1.2em;
	    color: #555;
	}
	
	.highcharts-data-table th {
	    font-weight: 600;
	    padding: 0.5em;
	}
	
	.highcharts-data-table td,
	.highcharts-data-table th,
	.highcharts-data-table caption {
	    padding: 0.5em;
	}
	
	.highcharts-data-table thead tr,
	.highcharts-data-table tr:nth-child(even) {
	    background: #f8f8f8;
	}
	
	.highcharts-data-table tr:hover {
	    background: #f1f7ff;
	}
	
	input[type="number"] {
	    min-width: 50px;
	}
	
   div#table_container table {width: 100%}
   div#table_container th, div#table_container td {border: solid 1px gray; text-align: center;} 
   div#table_container th {background-color: #595959; color: white;} 
</style>

<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/highcharts.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/exporting.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/export-data.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/accessibility.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/series-label.js"></script> 
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/data.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/drilldown.js"></script>



<div style="display: flex;">   
<div style="width: 80%; min-height: 1100px; margin:auto; ">

   <h2>통계정보(차트)</h2>
   
   <form name="searchFrm" style="margin: 20px 0 50px 0; ">
      <select name="searchType" id="searchType" style="height: 30px;">
         <option value="">통계선택하세요</option>
         <option value="acommTotalByDistrict">지역별 숙소 통계</option>
         <option value="totalAcommByspec">스펙별 숙소등록 건수</option>
         <option value="acommTotalByCity">하위 지역 도시별 숙소 비율</option>
         <!-- <option value="genderHireYear">평점 높은 숙소 top5</option>
         <option value="genderHireYear">달별 예약률</option> -->
      </select>
   </form>
   
   <div id="chart_container"></div>
   <div id="table_container" style="margin: 40px 0 0 0;"></div>

</div>
</div>
<script>
	$(document).ready(function(){
		$("select#searchType").change(function(){
			func_choice($(this).val()); // 어떤 차드를 볼건지 선택
			// $(this).val() 은 "" 또는 "deptname" 또는 "gender" 또는 "genderHireYear" 또는 "deptnameGender" 이다.

		});
	}); // end of $(document).ready(function()) ------------------------
	
	
	   // Function Declaration
	   function func_choice(searchTypeVal){
	      
	      switch (searchTypeVal) {
	      case "":       // 통계선택하세요 를 선택한 경우
	         $("div#chart_container").empty();
	         $("div#table_container").empty();
	         $("div.highcharts-data-table").empty();
	         
	         break;
	         
	       case "acommTotalByDistrict": // 지역별 숙소통계 를 선택한 경우
		         
		      $.ajax({
		         url:"<%= ctxPath%>/acommCntByDistrict.gc",
		         dataType:"json",
		         // 전송할 데이터는 없고, 기본방식인 get방식 쓸것
		         success:function(json){
		            console.log(JSON.stringify(json));
		            

		            let resultArr = [];
		            
		            for(let i=0; i<json.length; i++){
		               let obj;
		               if(i==0){
		                  obj = {name : json[i].district,
		                        y : Number(json[i].percentage), //Number()나 parsetfloat(맞나?, 소수부있으니까 float)  꼭 해야하나봐 숫자타입이라서 문제생긴대
		                        sliced: true, 
		                        selected: true}; 
		                  
		               }
		               else{
		                  obj = {name : json[i].district,
		                           y : Number(json[i].percentage)}; // 이게 자바스크립트의 객체
		                     
		               }
		               
		               resultArr.push(obj);
		                     
		               
		            }// end of for ---------------------------
		            
		            /////////////////////////////////////////////////////////////////////////////////////////               
		            // Data retrieved from https://netmarketshare.com
		            Highcharts.chart('chart_container', {
		                chart: {
		                    plotBackgroundColor: null,
		                    plotBorderWidth: null,
		                    plotShadow: false,
		                    type: 'pie'
		                },
		                title: {
		                    text: '지역별 숙소통계',
		                    align: 'center'
		                },
		                tooltip: {
		                    pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
		                },
		                accessibility: {
		                    point: {
		                        valueSuffix: '%'
		                    }
		                },
		                plotOptions: {
		                    pie: {
		                        allowPointSelect: true,
		                        cursor: 'pointer',
		                        dataLabels: {
		                            enabled: true,
		                            format: '<b>{point.name}</b>: {point.percentage:.2f} %'
		                        }
		                    }
		                },
		                series: [{
		                    name: '숙소비율',
		                    colorByPoint: true,
		                    data: resultArr 
		                }]
		            });
		         /////////////////////////////////////////////////////////////////////////////////////////   
		            
		            var html =  "<table>";
		                html += "<tr>" +
		                          "<th>지역명</th>" +
		                          "<th>숙소수</th>" +
		                          "<th>퍼센티지</th>" +
		                        "</tr>";
		                        
		                $.each(json, function(index, item){
		                   html += "<tr>" +
		                            "<td>"+ item.district +"</td>" +
		                            "<td>"+ item.cnt +"</td>" +
		                            "<td>"+ item.percentage +"</td>" +
		                         "</tr>";
		                });    
		                
		                html += "</table>";
		                
		                $("div#table_container").html(html);
		                
		         
		         },
		         error: function(request, status, error){
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		             }
		      });
		      
		         
		         break;

	     
	      case "totalAcommByspec": // 스펙 별 숙소통계 를 선택한 경우
	      
	    	    $.ajax({
	   	         url:"<%= ctxPath%>/totalAcommByspec.gc",
	   	         dataType:"json",
	   	         // 전송할 데이터는 없고, 기본방식인 get방식 쓸것
	   	         success:function(json){
	   	            console.log(JSON.stringify(json));
	   	            $("div#chart_container").empty();
		            $("div#table_container").empty();
		            $("div.highcharts-data-table").empty();
	   	             let resultArr = [];
	   	            
	   	            for(let i=0; i<json.length; i++){

	   	                 let obj = {name : json[i].spec,
	   	                            y : Number(json[i].percentage)}; // 이게 자바스크립트의 객체
	   	                    
	   	               resultArr.push(obj); 
	   	                     
	   	               
	   	            }// end of for ---------------------------
	   	            
	   	            /////////////////////////////////////////////////////////////////////////////////////////               
	   	            // Data retrieved from https://netmarketshare.com
	   	            Highcharts.chart('chart_container', {
	   	                chart: {
	   	                    plotBackgroundColor: null,
	   	                    plotBorderWidth: null,
	   	                    plotShadow: false,
	   	                    type: 'pie'
	   	                },
	   	                title: {
	   	                    text: '스펙 별 숙소의 갯수',
	   	                    align: 'center'
	   	                },
	   	                tooltip: {
	   	                    pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
	   	                },
	   	                accessibility: {
	   	                    point: {
	   	                        valueSuffix: '%'
	   	                    }
	   	                },
	   	                plotOptions: {
	   	                    pie: {
	   	                        allowPointSelect: true,
	   	                        cursor: 'pointer',
	   	                        dataLabels: {
	   	                            enabled: true,
	   	                            format: '<b>{point.name}</b>: {point.percentage:.2f} %'
	   	                        }
	   	                    }
	   	                },
	   	                series: [{
	   	                    name: '숙소비율',
	   	                    colorByPoint: true,
	   	                    data: resultArr 
	   	                }]
	   	            });
	   	         /////////////////////////////////////////////////////////////////////////////////////////   
	   	            
	   	            var html =  "<table>";
	   	                html += "<tr style='height:30px;'>" +
	   	                          "<th>스펙</th>" +
	   	                          "<th>숙소 수</th>" +
	   	                          "<th>퍼센티지</th>" +
	   	                        "</tr>";
	   	                        
	   	                $.each(json, function(index, item){
	   	                   html += "<tr style='height:20px;'>" +
	   	                            "<td>"+ item.spec+"</td>" +
	   	                            "<td>"+ item.cnt +" 개"+"</td>" +
	   	                            "<td>"+ item.percentage + " (%)" +"</td>" +
	   	                         "</tr>";
	   	                });    
	   	                
	   	                html += "</table>";
	   	                
	   	                $("div#table_container").html(html);
	   	                
	   	         
	   	         },
	   	         error: function(request, status, error){
	   	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	   	             }
	   	      });
	         
	         break;
	  
	      
	      case "acommTotalByCity":  // 지역별 숙소 통계 를 선택한 경우

	      	 $.ajax({
	      		 url:"<%= ctxPath%>/acommCntByDistrict.gc" , // 지역 가져오기
	      		 dataType:"json",
	      		 success:function(json1){
	      			 $("div#chart_container").empty();
	    	         $("div#table_container").empty();
	    	         $("div.highcharts-data-table").empty();
	    	         
	      			 let districtArr = [];// 지역별
	      			 
	      			 $.each(json1, function(index,item){
	      				districtArr.push({
	      					 name: item.district,
	                         y: Number(item.percentage),
	                         drilldown: item.district
	      				});
	      			 });
	      			 
	      			let cityArr = [];// 특정 부서명에 근무하는 직원들의 성별 인원수 퍼센티지 객체 배열 
	      			
	      			$.each(json1, function(index1,item1){
	      				
	      				$.ajax({
	      					url:"<%= ctxPath%>/acommTotalByCity.gc",
	      					type:"get",
	      					data:{"district":item1.district},
	      					dataType:"json",
	      					success:function(json2){
	      						console.log(JSON.stringify(json2));
	      						let subArr = [];
	      						
	      						$.each(json2, function(index2, item2){
	      							subArr.push([item2.city,
	      								         Number(item2.percentage)
	      								        ]);
	      						});// end of $.each(json2, function(index2, item2)
	      						
	      						cityArr.push({
	      							name: item1.district,
	      			                id: item1.district,
	      			                data: subArr
	      						});
	      					},
	      					error: function(request, status, error){
	      	   	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	      	   	            } 
	      				});
	      			});
	      			 
	      			/////////////////////////////////////////
	      			Highcharts.chart('chart_container', {
	      			    chart: {
	      			        type: 'column'
	      			    },
	      			    title: {
	      			        align: 'center',
	      			        text: '하위 지역 도시별 숙소 비율'
	      			    },
	      			    subtitle: {
	      			        align: 'left',
	      			        text: 'Click the columns to view versions. Source: <a href="http://localhost:9090/board/emp/chart.action" target="_blank">HR.employees</a>'
	      			    },
	      			    accessibility: {
	      			        announceNewData: {
	      			            enabled: true
	      			        }
	      			    },
	      			    xAxis: {
	      			        type: 'category'
	      			    },
	      			    yAxis: {
	      			        title: {
	      			            text: '구성비율(%)'
	      			        }

	      			    },
	      			    legend: {
	      			        enabled: false
	      			    },
	      			    plotOptions: {
	      			        series: {
	      			            borderWidth: 0,
	      			            dataLabels: {
	      			                enabled: true,
	      			                format: '{point.y:.1f}%'
	      			            }
	      			        }
	      			    },

	      			    tooltip: {
	      			        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	      			        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	      			    },

	      			    series: [
	      			        {
	      			            name: "지역명",
	      			            colorByPoint: true,
	      			            data: districtArr // **** 위에서 구한 값을 대입시킴. 부서명별 인원수 퍼센티지 객체 배열  ****
	      			        }
	      			    ],
	      			    drilldown: {
	      			        breadcrumbs: {
	      			            position: {
	      			                align: 'right'
	      			            }
	      			        },
	      			        series:cityArr // **** 위에서 구한 값을 대입시킴. 특정 부서명에 근무하는 직원들의 성별 인원수 퍼센티지 객체 배열  ****
	      			    }
	      			});
	      			 
	      		 },
	      		 error: function(request, status, error){
   	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
   	             } 
	      		 
	      	 });
	         break;

	      default:
	         break;
	      }
	      
	   } // end of function func_choice(searchTypeVal)

	
	
	
	

</script>

