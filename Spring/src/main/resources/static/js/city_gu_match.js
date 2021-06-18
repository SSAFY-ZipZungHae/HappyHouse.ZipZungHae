

$(document).ready(function(){
	
    $('#sido').append(fn_option('','선택')); //
  $.each(dong_name.sido, function(idx, code){
    $('#sido').append(fn_option(code.sido, code.codeNm));
  });
  $('#sido').change(function(){
    $('#sigugun').show();
    $('#sigugun').empty();
    $('#sigugun').append(fn_option('','선택')); //

    $.each(dong_name.sigugun, function(idx, code){
      if($('#sido > option:selected').val() == code.sido)
        $('#sigugun').append(fn_option(code.sigugun, code.codeNm));
    });
 
  });
 
  $('#sigugun').change(function(){
    $('#dong').empty();
    $.each(dong_name.dong, function(idx, code){
      if($('#sido > option:selected').val() == code.sido && $('#sigugun > option:selected').val() == code.sigugun)
        $('#dong').append(fn_option(code.dong, code.codeNm));
    });
    $('#dong').prepend(fn_option('','선택'));
    $('#dong option:eq("")').attr('selected', 'selected');
 
  });
 
  $('#dong').change(function(){
    var sido = $('#sido option:selected').val();
    var sigugun = $('#sigugun option:selected').val();
    var dong = $('#dong option:selected').val();
    var dongCode = sido + sigugun + dong + '00';
    
    var target_sido = document.getElementById("sido");
    $("#sidotext").val(target_sido.options[target_sido.selectedIndex].text);
    var target_gugun = document.getElementById("sigugun");
    $("#siguguntext").val(target_gugun.options[target_gugun.selectedIndex].text);
    var target = document.getElementById("dong");
    $("#dongtext").val(target.options[target.selectedIndex].text);
    
  });
  
  geocoder = new google.maps.Geocoder();
  
  apart_all();
  dasede_all();
  
  
});

var geocoder;

function fn_option(code, name){
  return '<option value="' + code +'">' + name +'</option>';
}


//function submit_button(){
//	var sidoIdx=dong_name.sido.findIndex(i=>i.sido==$("#sido").val());
//	var sigunguIdx=dong_name.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
//	var dongIdx=dong_name.dong.findIndex(i=>i.dong==$("#dong").val()&&i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
//	
//	var sido = dong_name.sido[sidoIdx].codeNm;//시
//	var sigungu = dong_name.sigugun[sigunguIdx].codeNm;//시군구
//	var dong = dong_name.dong[dongIdx].codeNm;//동
//	
//	
//	var address = sido + " "+ sigungu + " "+dong;
//	
//	// geocoder
//	geocoder.geocode({'address':address }, function(results, status) {
//		if (status == google.maps.GeocoderStatus.OK) {
//            map.setCenter(results[0].geometry.location);
//            
//
//        } else {
//            alert("Geocode was not successful for the following reason: " + status);
//        }
//	}) 
//	apart_part()
//	dasede_part();
//	
//}

//function apart_all(){
//	
//	var url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest.jsp";
//
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//            
//
//        	var apart_list = ``;
//            $(res).find("item").each(function(index, item) {
//            	apart_list+=`
//            		<tr>
//            			<td>${$(this).find('아파트').text().trim()}</td>
//            			<td>${$(this).find('법정동').text().trim()}</td>
//            			<td>${$(this).find('거래금액').text().trim()}</td>
//            			<td>${$(this).find('전용면적').text().trim()}</td>
//            		</tr>
//            	`;
//
//            	
//			});
//            
//            $("#apartall").find("tbody").append(apart_list);
//            
//        }
//    });                
//
//	
//}
//
//
//function dasede_all(){
//	var url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest2.jsp";
//
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//            
//
//        	var dasede_list = ``;
//            $(res).find("item").each(function(index, item) {
//            	dasede_list+=`
//            		<tr>
//            			<td>${$(this).find('연립다세대').text().trim()}</td>
//            			<td>${$(this).find('법정동').text().trim()}</td>
//            			<td>${$(this).find('거래금액').text().trim()}</td>
//            			<td>${$(this).find('전용면적').text().trim()}</td>
//            		</tr>
//            	`;
//
//			});
//            
//            $("#dasedeall").find("tbody").append(dasede_list);
//            
//        }
//    });   
//}
//
//function apart_part(){
//	var dongIdx=dong_name.dong.findIndex(i=>i.dong==$("#dong").val()&&i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
//	
//	var dong = dong_name.dong[dongIdx].codeNm;//동
//	
//	var url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest.jsp";
//	
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//
//        	var apart_list = `
//        		<tr>
//					<th>이름</th>
//					<th>위치</th>
//					<th>가격</th>
//					<th>면적</th>
//				</tr>
//        	`;
//            $(res).find("item").each(function(index, item) {
//            	if(dong==$(this).find('법정동').text().trim()){
//            		apart_list+=`
//            		<tr>
//            			<td>${$(this).find('아파트').text().trim()}</td>
//            			<td>${$(this).find('법정동').text().trim()}</td>
//            			<td>${$(this).find('거래금액').text().trim()}</td>
//            			<td>${$(this).find('전용면적').text().trim()}</td>
//            		</tr>
//            	`;
//                	
//                	geocoder.geocode({'address':$(this).find('법정동').text()}, function(results, status) {
//                		if (status == google.maps.GeocoderStatus.OK) {
//                            map.setCenter(results[0].geometry.location);
//                            marker = new google.maps.Marker({
//                                            map: map,
//                                            title: $(this).find('아파트').text().trim(), // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
//                                            position: results[0].geometry.location
//                                        });
//                            
//                        } else {
//                            alert("Geocode was not successful for the following reason: " + status);
//                        }
//                	}) 
//            		
//            		
//            	}
//			});
//            $("#apartName").html(dong+" 지역 아파트 정보")
//            $("#apartall").find("tbody").empty().append(apart_list);
//            
//        }
//    });   
//}
//
//
//function dasede_part(){
//	var dongIdx=dong_name.dong.findIndex(i=>i.dong==$("#dong").val()&&i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
//	
//	var dong = dong_name.dong[dongIdx].codeNm;//동
//	
//	var url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest2.jsp";
//
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//            
//
//        	var dasede_list = `
//        		<tr>
//					<th>이름</th>
//					<th>위치</th>
//					<th>가격</th>
//					<th>면적</th>
//				</tr>
//        	`;
//            $(res).find("item").each(function(index, item) {
//            	if(dong==$(this).find('법정동').text().trim()){
//	            	dasede_list+=`
//	            		<tr>
//	            			<td>${$(this).find('연립다세대').text().trim()}</td>
//	            			<td>${$(this).find('법정동').text().trim()}</td>
//	            			<td>${$(this).find('거래금액').text().trim()}</td>
//	            			<td>${$(this).find('전용면적').text().trim()}</td>
//	            		</tr>
//	            	`;
//	            	
//	            	geocoder.geocode({'address':$(this).find('법정동').text()}, function(results, status) {
//                		if (status == google.maps.GeocoderStatus.OK) {
//                            map.setCenter(results[0].geometry.location);
//                            marker = new google.maps.Marker({
//                                            map: map,
//                                            title: $(this).find('아파트').text().trim(), // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
//                                            position: results[0].geometry.location
//                                        });
//                            
//                        } else {
//                            alert("Geocode was not successful for the following reason: " + status);
//                        }
//                	}) 
//	            	
//            	}
//			});
//            $("#dasedeName").html(dong+" 지역 다세대 정보")
//            $("#dasedeall").find("tbody").empty().append(dasede_list);
//            
//        }
//    });   
//}
//
//function searchbybuildingname() {
//	var form = document.searchbyname;
//	
//	var url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest.jsp";
//	
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//
//        	var apart_list = `
//        		<tr>
//					<th>이름</th>
//					<th>위치</th>
//					<th>가격</th>
//					<th>면적</th>
//				</tr>
//        	`;
//            $(res).find("item").each(function(index, item) {
//            	if($(this).find('아파트').text().trim().includes(form.buildingName.value)){
//            		apart_list+=`
//            		<tr>
//            			<td>${$(this).find('아파트').text().trim()}</td>
//            			<td>${$(this).find('법정동').text().trim()}</td>
//            			<td>${$(this).find('거래금액').text().trim()}</td>
//            			<td>${$(this).find('전용면적').text().trim()}</td>
//            		</tr>
//            	`;
//                	
//            		
//            		
//            	}
//			});
//            $("#apartName").html("아파트 이름 검색 정보")
//            $("#apartall").find("tbody").empty().append(apart_list);
//            
//        }
//    });   
//	
//	url_request="http://localhost:8080/%EA%B4%80%ED%86%B5_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%9B%B9/AjaxRequest2.jsp";
//
//	$.ajax({
//        type : "GET" //"POST", "GET"
//        , url : url_request
//        , dataType : "xml" //전송받을 데이터의 타입
//        , success : function(res) {
//            
//
//        	var dasede_list = `
//        		<tr>
//					<th>이름</th>
//					<th>위치</th>
//					<th>가격</th>
//					<th>면적</th>
//				</tr>
//        	`;
//            $(res).find("item").each(function(index, item) {
//            	if($(this).find('연립다세대').text().trim().includes(form.buildingName.value)){
//	            	dasede_list+=`
//	            		<tr>
//	            			<td>${$(this).find('연립다세대').text().trim()}</td>
//	            			<td>${$(this).find('법정동').text().trim()}</td>
//	            			<td>${$(this).find('거래금액').text().trim()}</td>
//	            			<td>${$(this).find('전용면적').text().trim()}</td>
//	            		</tr>
//	            	`;
//	            	
//	            	
//	            	
//            	}
//			});
//            $("#dasedeName").html("다세대 이름 검색 정보")
//            $("#dasedeall").find("tbody").empty().append(dasede_list);
//            
//        }
//    });   
//}