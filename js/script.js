/*
    Page transition - horizontal scrolling
*/

$(function() {
                $('ul.nav a').bind('click',function(event){
                    var $anchor = $(this);

                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 1800,'easeInOutExpo');

                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 700);
                    event.preventDefault();
                });
            });
