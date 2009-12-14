// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function init() {
	handleMessages();
};

function handleMessages() {
	fades = $$(".fade");
	fades.each(function(fade) {
		if(fade.hasClassName('notice')) {
			new Effect.Highlight(fade, { startcolor: '#99ff99', endcolor: '#e0ffe0', restorecolor: '#e0ffe0' });
		} else if(fade.hasClassName('warning')) {
			new Effect.Highlight(fade, { startcolor: '#ffff99', endcolor: '#ffffe0', restorecolor: '#ffffe0' });
		} else if(fade.hasClassName('error')) {
			new Effect.Highlight(fade, { startcolor: '#ff9999', endcolor: '#ffe0e0', restorecolor: '#ffe0e0' });
		}
	});
	setTimeout("fades.invoke('fade')", 3000);
}
