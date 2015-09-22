function add_student_to_group(){
	 var check_boxes = document.getElementsByName("student_check");
	 var check_boxes_values = new Array();
	 var count = $('.student_item').length ;
	 $(check_boxes).each(function(){
 		if ($(this).is(':checked'))
		 {//var input = document.createElement("input");
		   var student_id = $(this).val().split('_')[0]
    		   var student_name = $(this).val().split('_')[1]
		   var input ='<div id="student_item">'+
                               '<div class="li_g"><li class="student_item">'+student_name+'</li></div>'+
                               '<div class="del_g"><img  class="hand_cursor" src="/assets/delete_icon.png"  onclick="del_student(this);"></div>'+
        			'Mark as leader'+
                                '<input class="student_leader" id="radio_'+student_id+'" name="leader_id" type="radio" value="'+student_id+'" onclick = "mark_as_leader('+student_id+');" >'+'</div>'+
      				'<input id="group_group_students_attributes_'+count+'_student_attributes_id" name="group[group_students_attributes]['+count+'][student_attributes][id]" type="hidden" value= '+student_id+' >'
                   $('#group_students_div').append($(input));
		   count++;	
     		}
		
	 });
   }

  function show_student_list(){
    var url = '/get_student_list';
			    $.ajax({
				url:url,
				type:'get',
        			success:function (data) {
				    { 
					$('#topic_list_div').hide();
				 	$('#student_list_div').html(data).toggle();
		   		    }
				}
			    });
  }

   function del_student(_this){
             var id = ($(_this).parent().parent().next().attr("id")); //e.g. group_group_students_attributes_0_student_attributes_id
            other_id_to_be_removed = id.split("_student_attributes_id")[0]
            // Removing set of elements for student
            $("#"+id).remove();
            $("#"+other_id_to_be_removed+"_id").remove();
            $(_this).parent().parent().remove();
   }

  function mark_as_leader(_val){
            var input ='<input id="group_leader_id" name="group[leader_id]" type="hidden" value="'+_val+'">'
            $('#group_students_div').append($(input));
 }
