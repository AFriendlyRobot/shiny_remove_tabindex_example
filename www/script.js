window.onload = function(event) {
	// Remove modal 'tabindex' listener if the modal is already open on page load
	document.getElementById('shiny-modal').removeAttribute('tabindex');

	// Add event listener for whenever the modal is opened
	document.getElementById('shiny-modal').addEventListener('shown', function(event) {
		document.getElementById('shiny-modal').removeAttribute('tabindex');
	});
};