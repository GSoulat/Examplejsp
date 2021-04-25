$(document).ready(function (){
	function business(){
	if (document.getElementById('business').checked){
		document.getElementById('fedid').placeholder="12-3456789";
	}
	
	if (document.getElementById('individu').checked){
		document.getElementById('fedid').placeholder="123-45-6789";
	}}
	business();
});

