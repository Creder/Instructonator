$('#paginator').html('<%= escape_javascript(paginate(@steps, :remote => true).to_s) %>'); 
$('#anystep').html('<%= escape_javascript render(@steps) %>');