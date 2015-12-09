jQuery ->
	$(window).scroll ->
		if $(window).scrollTop() > $(document).height() - $(window).height() - 50
			alert "near" 
