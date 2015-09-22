 function add_topic_to_group(){
	 var check_boxes = document.getElementsByName("topic_check");
	 var check_boxes_values = new Array();
	 var count = $('.topic_item').length ;
	 $(check_boxes).each(function(){
 		if ($(this).is(':checked'))
		 {
		   var topic_id = $(this).val().split('_')[0]
    		   var topic_name = $(this).val().split('_')[1]
		   var input ='<div id="topic_item">'+
                               ' <div class="li_g"><li class="topic_item">'+topic_name+'</li></div>'+
                               '<div class="del_g"><img class="hand_cursor" src="/assets/delete_icon.png" onclick="del_topic(this);"></div>'+'</div>'+
                     		'<input id="group_topics_attributes_'+count+'_id" name="group[topics_attributes]['+count+'][id]" type="hidden" value= '+topic_id+'>'
                   $('#group_topics_div').append($(input));
		   count++;	
     		}
		
	 });
   }

  function show_topic_list(){
    var url = '/get_topic_list';
			    $.ajax({
				url:url,
				type:'get',
                                success:function (data) {
				    { 
  					$('#student_list_div').hide();
				 	$('#topic_list_div').html(data).toggle();
		   		    }
				}
			    });
        
   }

  function del_topic(_this){
            $(_this).parent().parent().next().remove();
            $(_this).parent().parent().remove();
       }
