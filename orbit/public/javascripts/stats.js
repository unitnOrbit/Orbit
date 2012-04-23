/**
   Get List of main categories
*/
function getCategoryList() {
    var url_category_list = "/category/list";
    var msgError = "<b>Error: </b> pagina o dati non trovati.\nUrl: " + url_category_list;
    var msgSuccess = "<b>Success from '" + url_category_list + "': </b>";
    var msgComplete = "<b>Complete: </b>eseguo altro. ";


    // test con: $.ajax
    $.ajax({
        url: url_category_list,
        dataType: 'json',
        data: '', // vuoto per il momento
        success: function(data) {
            //$("#test_ajax").append('<div class="alert alert-success">' + 
            //			   msgSuccess + '<ul id="testList">');
		    
            $.each(data['list'], function(index, val) {
                $("#cat_list_container").append( 
                    $("#cat_item_template").clone().css('display','block').each(function (i,elem) {
                        $(this).removeAttr('id');
                        $(this).find('h2').text(val);
                    })
						);
            });
		    
            $("#cat_item_template").remove(); // MOLTO SPORCO!! DA CAMBIARE
            //$.each(data, function(chiave, valore) {
            //    $("#testList").append('<li id="' + chiave + '">' + 
            //        chiave + ' => ' +  valore + '</li>');
            //});
        },
        error: function() {
            $("body").prepend('<div class="alert alert-error">' + msgError + '</div>');
        },
        complete: function() { 
            //$("body").prepend('<div class="alert alert-info">' + msgComplete + '</div>');
        }
    });
    
}


