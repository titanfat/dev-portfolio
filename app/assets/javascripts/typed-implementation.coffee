
ready = ->
  Typed.new '.element',
    strings: [
      'Software development is the closest concept we have to magic.'
      "Learning programming can't be taught to be an expert, just as learning brushes and colors can't turn someone into an artist."
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready