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


DueDateIconDirective = ($log, lightboxFactory, $translate)->
    link = ($scope, $el, $attrs, $model) ->
        statusAttrs = {
            'closed': { class: 'closed', title: 'COMMON.DUE_DATE.NO_LONGER_APPLICABLE' },
            'due soon': { class: 'due-soon', title: 'COMMON.DUE_DATE.DUE_SOON', },
            'past due': { class: 'past-due', title: 'COMMON.DUE_DATE.PAST_DUE' },
            'due set': {  class: 'due-set' },
        }

        render = (dueDate, dueDateStatus) ->
            dueDateAttrs = statusAttrs[dueDateStatus]
            if not dueDateAttrs
                $log.error("Invalid due date status \"#{dueDateStatus}\"")
                return

            setClass(dueDateAttrs.class)
            setTitle(dueDate, dueDateAttrs.title)

        setClass = (dueDateClass) ->
            $el.addClass(dueDateClass)

        setTitle = (dueDate, dueDateTitle) ->
            prettyDate = $translate.instant("COMMON.PICKERDATE.FORMAT")
            formatedDate = moment(dueDate).format(prettyDate)
            title = if dueDateTitle\
                then "#{formatedDate} (#{$translate.instant(dueDateTitle)})"\
                else formatedDate
            
            $el.attr('title', title)

        $scope.$watch $scope.dueDate, (dueDate) ->
            return if not dueDate?
            render($scope.dueDate, $scope.dueDateStatus)

    return {
        link: link
        templateUrl: "components/due-date-icon/due-date-icon.html",
        scope: {
            dueDate: '=',
            dueDateStatus: '='
        }
    }

angular.module('taigaComponents').directive("tgDueDateIcon",
["$log", "tgLightboxFactory", "$translate", DueDateIconDirective])