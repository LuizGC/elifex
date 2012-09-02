function inicio_action(data){
	function load(data){
		$('.content').html(data);
		$('.content').attr("id","inicio");
		setup();
	}
	
	function setup(){
		
		$("#loading").remove();
		
		$('a').bind('ajax:beforeSend', function(){
		  $("body").prepend("<div id='loading'>Loading<br/><img src='../loading.gif'></div>");
		});
		
		$('a').bind('ajax:error', function(){
		  alert("Ocorreu algum erro!");
			window.location.reload();
		});
		
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
		
		$('a.concorrer').bind('ajax:complete', function(xhr, result){
					cupom = jQuery.parseJSON(result.responseText);
														
					setDisbled($("#Premio" + cupom.premio_id + " a.concorrer"), "Participando");
					setPontos(parseInt($("#Valor"+cupom.premio_id).text()));
														
					$('.premio').each(function() {
						checkValor($(this))
					});
										
					$("#loading").remove();
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
											
			$('.premio').each(function() {
					count_vote($(this))
			});
											
											
			$("#loading").remove();
		});
	}
	
	function setPontos(valor){
		$("#pontos").text(parseInt($("#pontos").text()) - valor);
	}

	function count_vote(element){
		valor = element.children(".info").children("p").children("span");
		faltam = parseInt(valor.text()) - parseInt($("#pontos").text());
		texto = "Faltam " + faltam + " pontos.";
		element.children(".info").children("a").children("button").text(texto);
		if(parseInt($("#pontos").text()) >=		parseInt(valor.text())){
			link = element.children(".info").children("a");
			link.attr("href", "/cupons?premio_id="+element.attr("id").split("Premio")[1]);
			link.removeClass("disabled").addClass("concorrer");
			link.children("button").text("Concorrer");
		}
		
		
		$('a.concorrer').bind('ajax:complete', function(xhr, result){
													cupom = jQuery.parseJSON(result.responseText);
													
													setDisbled($("#Premio" + cupom.premio_id + " a.concorrer"), "Participando");
													setPontos(parseInt($("#Valor"+cupom.premio_id).text()));
													
													$('.premio').each(function() {
																						checkValor($(this))
																						});
													
													$("#loading").remove();
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
	
	
	return load(data);
}