jQuery ->
  $(document).on 'click', 'ul.navbar-nav a[href*=#]:not([href="#"])', (event) ->
    $anchor = $(this)
    $('html, body').stop().animate {
      scrollTop: $($anchor.attr('href')).offset().top },
      1500,
      'easeInOutExpo'
    event.preventDefault()
    return
