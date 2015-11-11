/**
 * Created by emmanuelmaldonado on 09/07/15.
 */
var compressor = require('node-minify');

new compressor.minify({
    type: 'uglifyjs',
    fileIn: 'public/javascripts/vendor.js',
    fileOut: 'public/javascripts/vendor-min.js',
    callback: function(err, min){
        if(!err){
            console.log("VENDOR FILE HAS BEEN MINIFIED!! :)");
        } else{
            console.log(["AN ERROR OCCURRED WHEN TRY TO MINIFY VENDOR, :(" , err] );
        }
    }
});

new compressor.minify({
    type: 'uglifyjs',
    fileIn: 'public/javascripts/app.js',
    fileOut: 'public/javascripts/app-min.js',
    callback: function(err, min){
        if(!err){
            console.log("APP FILE HAS BEEN MINIFIED!! :)" );
        }else{
            console.log(["AN ERROR OCCURRED WHEN TRY TO MINIFY APP, :(", err]);
        }
    }
});