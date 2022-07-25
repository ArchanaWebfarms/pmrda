function NumbersInEngToMar(time){
	var hr="";
	
	for(var i=0;i<time.length;i++){
		switch(time[i]){
			case '1':hr=hr.concat('१');
					break;
			case '2':hr=hr.concat('२');
					break;
			case '3':hr=hr.concat('३');
					break;
			case '4':hr=hr.concat('४');
					break;
			case '5':hr=hr.concat('५');
					break;
			case '6':hr=hr.concat('६');
					break;
			case '7':hr=hr.concat('७');
					break;
			case '8':hr=hr.concat('८');
					break;
			case '9':hr=hr.concat('९');
					break;			
			case '0':hr=hr.concat('०');
					break;
		}
	}	
	return hr;
}