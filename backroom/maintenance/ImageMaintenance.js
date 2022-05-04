function PopImageMaintenace( filename, path ){
	var cal = "/backroom/maintenance/files/file_up.jsp?fileName=" + filename + "&pathName=" + path ;
  remoteWins = window.open("","imagemaintenance",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=350,height=350,left=0,top=0,alwaysRaised=1')
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}