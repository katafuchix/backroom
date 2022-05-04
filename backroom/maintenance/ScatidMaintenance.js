function PopUpScatMaintenace( jancd, catid ){
	var cal = "/backroom/maintenance/scatid/meintenance.jsp?jan_cd=" + jancd + "&catid=" + catid ;
  remoteWins = window.open("","scatidmaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=550,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}
function PopUpWrite( product_seq, catClass ){
	var cal = "/backroom/maintenance/product/meintenance.jsp?product_seq=" + product_seq + "&catClass=" + catClass ;
  remoteWins = window.open("","productmaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=550,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}
function PopUpWriteHotel( supnbr, agt_cd, catClass ){
	var cal = "/backroom/maintenance/product/meintenanceHotel.jsp?supnbr=" + supnbr + "&agt_cd="+ agt_cd + "&catClass=" + catClass ;
  remoteWins = window.open("","productmaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=650,height=650,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}
function PopUpCategoryHotel( supnbr, agt_cd ){
	var cal = "/backroom/maintenance/product/meintenanceScatidHotel.jsp?supnbr=" + supnbr + "&agt_cd="+ agt_cd;
	remoteWins = window.open("","categorymaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=520,height=680,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}
function PopUpWriteGift( product_seq, catClass ){
	var cal = "/backroom/maintenance/product/meintenance.jsp?product_seq=" + product_seq + "&catClass=" + catClass ;
  remoteWins = window.open("","productmaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=618,height=540,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}



