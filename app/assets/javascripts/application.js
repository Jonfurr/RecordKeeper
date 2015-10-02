// ...
//= require jquery
//= require_tree
// console.log("test")
// $('#album_tracklist').on('click', function(){
// 	alert("hi")
// });

// $('document').on('click', function(){
// 	alert("hi")
// })


var valueHolder = [];

$('#button-tracklist').on('click', function(){

 valueHolder.push($('#album_tracklist').val());

 $('#album_tracklist').val("");

}) 