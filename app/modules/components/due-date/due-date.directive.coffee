###
# Copyright (C) 2014-2017 Taiga Agile LLC <taiga@taiga.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: belong-to-epics.directive.coffee
###


DueDateDirective = (lightboxFactory, $translate)->
    link = ($scope, $el, $attrs, $model) ->
        item = null

        $el.on "click", "a", (event) ->
            event.preventDefault()
            item = $model.$modelValue.clone()
            return if isClosed(item)

            lightboxFactory.create(
                "tg-lb-set-due-date",
                {"class": "lightbox lightbox-set-due-date"},
                {"object": item}
            )

        render = (item) ->
            $scope.isClosed = isClosed(item)
            $scope.status = getStatus(item)
            $scope.title = getTitle(item)

        isClosed = (item) ->
            return item.is_closed

        getStatus = (item) ->
            if (item.is_closed == true)
                return 'closed'
            else if (item.due_status == 'due soon')
                return 'due-soon'
            else if (item.due_status == 'past due')
                return 'past-soon'
            else if (item.due_status == 'due set')
                return 'due-set'
            return ''

        getTitle = (item) ->
            if not item.due_date?
                return $translate.instant("COMMON.DUE_DATE.TITLE_ACTION_SET_DUE_DATE")

            prettyDate = $translate.instant("COMMON.PICKERDATE.FORMAT")
            title = moment(item.due_date).format(prettyDate)
            if (item.is_closed == true)
                return "#{title} (#{$translate.instant("COMMON.DUE_DATE.NO_LONGER_APPLICABLE")})"
            else if (item.due_status == 'due soon')
                return "#{title} (#{$translate.instant("COMMON.DUE_DATE.DUE_SOON")})"
            else if (item.due_status == 'past due')
                return "#{title} (#{$translate.instant("COMMON.DUE_DATE.PAST_DUE")})"
            return title

        $scope.$watch $attrs.ngModel, (instance) ->
            return if not item?
            render($model.$modelValue)

    templateUrl = (el, attrs) ->
        format = if attrs.format then attrs.format else 'icon'
        return "components/due-date/due-date-#{format}.html"

    return {
        link: link
        require: "ngModel"
        templateUrl: templateUrl
    }

angular.module('taigaComponents').directive("tgDueDate", ["tgLightboxFactory", "$translate"
                                                          DueDateDirective])