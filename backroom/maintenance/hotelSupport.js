	function localareaSelect( supnbr, agt_cd ){
		var cal = "/backroom/maintenance/hotel/localarea/updateUp.jsp?supnbr=" + supnbr + "&agt_cd=" + agt_cd
	  remoteWins = window.open("","localarea",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=200,left=0,top=0,alwaysRaised=1')
	  if (remoteWins != null) {
	   	remoteWins.location = cal;
	  }
	  remoteWins.focus();
	}
	function categorySelect( supnbr, agt_cd ){
		var cal = "/backroom/maintenance/hotel/htlcat/updateUp.jsp?supnbr=" + supnbr + "&agt_cd=" + agt_cd;
	  remoteWins = window.open("","localarea",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=200,left=0,top=0,alwaysRaised=1')
	  if (remoteWins != null) {
	   	remoteWins.location = cal;
	  }
	  remoteWins.focus();
	}