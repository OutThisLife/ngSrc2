# Proper source change with indicator
app.directive 'ngSrc2', ->
	restrict: 'A'
	link: (scope, el, attrs) ->
		el = angular.element el

		loadImage = ->
			el.addClass 'loading'
			el.removeAttr 'src'

			img = new Image()
			img.src = attrs.ngSrc2

			img.onload = ->
				el.attr 'src', img.src
				el.removeClass 'loading'

		scope.$watch ->
			attrs.ngSrc2
		, (nv, ov) -> loadImage() unless nv is ov