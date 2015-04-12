# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
#= require _app-base

pumpBox.coursesPathDescriptionOverlayWindowFunction = ()->
  showOverlayWindow = (node)->
    node.siblings('.description').fadeIn('fast').addClass 'active'
  hideAllOverlayWindow = (openedOverlayWindow)->
    openedOverlayWindow.fadeOut('fast').removeClass 'active'

  $('.course-item .point').on 'mouseenter', ->
    node = $(@)
    showOverlayWindow(node)
  $('.course-item .point').on 'mouseleave', ->
    openedOverlayWindow = $('.course-item .active')
    hideAllOverlayWindow(openedOverlayWindow)
  return

pumpBox.singleSelectOptionFunction = ()->
  $('section.test-unit .options-wrapper a').on 'click', (event)->
    event.preventDefault();
    thisOption = $(@)
    optionScope = thisOption.parent()
    prevOption = optionScope.find('.selected')
    fadeoutedOptions = optionScope.find('fadeout')

    prevOption.removeClass('selected')
    thisOption.addClass('selected').removeClass('fadeout').siblings().addClass('fadeout')
    return
