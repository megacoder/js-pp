// vi: noet sw=4 ts=4

var	beautify = require( 'js-beautify' ).js_beautify;
var	fs = require('fs');

if( process.argv.length == 2 )	{
	process.argv[2] = '/dev/stdin';
}

var	todo = process.argv.slice(2);

for( arg in todo )	{
	fs.readFile( todo[arg], 'utf8', function( err, data )	{
		if( err )	{
			throw err;
		}
		console.log( beautify( data, { indent_size:4 } ) )
	} );
}
