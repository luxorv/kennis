$('.main').addClass('animated zoomIn')

doSomething = () ->
    $('.main').addClass('animated bounceInRight')
    console.log('hey')

$('.main').one(
        'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        doSomething
)
