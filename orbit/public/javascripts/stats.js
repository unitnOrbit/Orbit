function createLoadingMsg(title, msg) {
    $('#modalMsg').find('h3').text(title);
    $('#modalMsg').find('p').text(msg);
    $('#modalMsg').removeClass('modal-footer');

    // mostra il messaggio di caricamento
    $('#modalMsg').modal('show');    
}


/**
   Ritorna la lista dei grafici appartenenti alla categoria selezionata
   elem: id elemento o classe in cui stampare le stringhe
*/
function getListOfCharts(category_id, main_container) {
    var url_chart_list = "";

    $.ajax({
        url: url_chart_list,
        dataType: 'json',
        data: { cat_id: category_id }, // vuoto per il momento
	beforeSend: function() {
	    // test loading
	    createLoadingMsg("Loading..", "Please wait..");
	},
        success: function(data) {
            $.each(data['list'], function(index, val) {
		$("#" + main_container).append(
		    $("#" + main_container).children().clone().css("display", "block").each(
			function(k, val) {
			    $(this).find("h2").text(val);
			}
		    ));		
            });		    
        },
        error: function() {},
        complete: function() {}
    });    
}


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


