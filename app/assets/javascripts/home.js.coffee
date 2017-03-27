states = [
  {href: '#tab-before', contentSelector: '.slider-before', anchorSelector: '[href="#tab-before"]'}
  {href: '#tab-during', contentSelector: '.slider-during', anchorSelector: '[href="#tab-during"]'}
  {href: '#tab-after', contentSelector: '.slider-after', anchorSelector: '[href="#tab-after"]'}
]

$(document).ready ->
  $('a.pdf-languages-trigger').click ->
    $(this).toggleClass 'active'
    $('.download-languages').toggleClass 'active'

  window.sliderBefore = $('.slider-before .slider').bxSlider(
    infiniteLoop: false,
    hideControlOnEnd: true,
    responsive: false
  )

  window.sliderDuring = $('.slider-during .slider').bxSlider(
    infiniteLoop: false,
    hideControlOnEnd: true,
    responsive: false
  )

  window.sliderAfter = $('.slider-after .slider').bxSlider(
    infiniteLoop: false,
    hideControlOnEnd: true,
    responsive: false
  )

  showActive states

window.onhashchange = -> showActive states
