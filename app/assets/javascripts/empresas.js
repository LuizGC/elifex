function setup(){
  
  setLoading();
  
  
  
  $('a[rel*=facebox]').facebox();
  
  
  $('.aviso_loga').click(function(){
								 facebook_path();
								 });
  
  
  $('.pagination span a').bind('ajax:complete', function(xhr, result){
										 load(result.responseText);
										 });
  
  $('#usuario a').bind('ajax:complete', function(xhr, result){
							  load(result.responseText);
							  });
  
  
  
  $('a.votar').bind('ajax:complete', function(xhr, result){
						  avaliacao = jQuery.parseJSON(result.responseText)
						  $("#"+avaliacao.empresa_id+" div #"+!avaliacao.status).remove();
						  $("#"+avaliacao.empresa_id+" div #"+avaliacao.status).attr("href", "#");
						  var avaliado = $("#"+avaliacao.empresa_id+" div.avaliado div."+avaliacao.status);
						  avaliado.text(parseInt(avaliado.text())+1);
						  $("#pontos").css("color", "#E68642" );
						  $("#pontos").text(parseInt($("#pontos").text())+1);
						  setTimeout(function(){$("#pontos").css("color", "#4A4A4A" );}, 1500);
						  
						  
						  next_action($("#" + avaliacao.empresa_id).next());
						  
						  $("#loading").remove();
						  });
  
  
  function setCurrentlyAction(element){
	 element.css("border-color", "#DE7E3B");
	 element.children(".info").children("h3").css("color", "#DE7E3B");
  }
  
  function cleanAction(){
	 $(".empresa").attr("style", "");
	 $(".empresa").children(".info").children("h3").attr("style", "");
  }
  
  function next_action(element){
	 cleanAction();
	 if(element.length > 0){
		info =element.children(".info");
		if(info.children(".avaliado").children().length > 2){
		  setCurrentlyAction(element);
		}else
		  next_action(element.next());
	 }else{
		votou_em_tudo = true;
		$(".empresa").each(function(index) {
		 info = $(this).children(".info");
		 if(info.children(".avaliado").children().length > 2){
			  setCurrentlyAction($(this));
			  alert("Você não votou em todas as empresas!");
			  votou_em_tudo = false;
			  return false;
		 }
		 });
		showPremio(votou_em_tudo);
	 }
  }
  next_action($(".empresa").first());
  
  
  function showPremio(votou_em_tudo){
	 if(votou_em_tudo){
		jQuery.facebox(function(){
							jQuery.get('premios', function(data) {
										  jQuery.facebox(data);
										  $('a.concorrer').bind('ajax:complete', function(xhr, result){
																		cupom = jQuery.parseJSON(result.responseText);
																		setDisbled($("#Premio" + cupom.premio_id + " a.concorrer"), "Participando");
																	    $("#loading").remove();
																		});
										  setLoading();
										  });
							});
	 }
	 
  }
  
  function setPontos(valor){
	 $("#pontos").text(parseInt($("#pontos").text()) - valor);
  }
  
  function setLoading(){
	 
	 $('a').bind('ajax:beforeSend', function(){
					 $("body").prepend("<div id='loading'>Loading<br/><img src='../loading.gif'></div>");
					 });
	 
	 $('a').bind('ajax:error', function(){
					 alert("Ocorreu algum erro!");
					 window.location.reload();
					 });
  }
  
  
  function checkValor(element){
	 valor = element.children(".info").children("p").children("span")
	 if(valor.attr("id") != "Valor"+cupom.premio_id){
		if(parseInt($("#pontos").text()) < parseInt(valor.text())){
		  faltam = parseInt(valor.text()) - parseInt($("#pontos").text());
		  texto = "Faltam " + faltam + " pontos.";
		  setDisbled(element.children(".info").children("a"), texto);
		}
	 }
  }
  
  function setDisbled(element, text){
	 element.attr("href", "javascript:avoid(0);").removeClass("concorrer").addClass("disabled");
	 element.children("button").attr("disabled", "disabled");
	 element.children("button").text(text);
  }
}