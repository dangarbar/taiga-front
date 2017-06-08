import { Action } from "@ngrx/store";
import * as Immutable from "immutable";

export class FetchBacklogUserStoriesAction implements Action {
  readonly type = "FETCH_BACKLOG_USER_STORIES";
  payload: any;

  constructor(projectId: number, appliedFilters: any) {
      this.payload = {
          projectId,
          appliedFilters,
      };
  }
}

export class MoveBacklogUsAction implements Action {
  readonly type = "MOVE_BACKLOG_US";
  payload: any;

  constructor(usId: number, newStatusId: number, newIndex: number) {
      this.payload = {usId, newStatusId, newIndex};
  }
}

export class SetBacklogUserStoriesAction implements Action {
  readonly type = "SET_BACKLOG_USER_STORIES";

  constructor(public payload: Immutable.List<any>) { }
}

export class AppendBacklogUserStoriesAction implements Action {
  readonly type = "APPEND_BACKLOG_USER_STORIES";

  constructor(public payload: Immutable.List<any>) { }
}

export class FetchBacklogFiltersDataAction implements Action {
  readonly type = "FETCH_BACKLOG_FILTERS_DATA";
  payload: any;

  constructor(projectId: number, appliedFilters: any) {
      this.payload = {
          projectId,
          appliedFilters,
      };
  }
}

export class SetBacklogFiltersDataAction implements Action {
  readonly type = "SET_BACKLOG_FILTERS_DATA";

  constructor(public payload: Immutable.Map<string, any>) { }
}

export class FetchBacklogAppliedFiltersAction implements Action {
  readonly type = "FETCH_BACKLOG_APPLIED_FILTERS";

  constructor(public payload: number) {}
}

export class SetBacklogAppliedFiltersAction implements Action {
  readonly type = "SET_BACKLOG_APPLIED_FILTERS";

  constructor(public payload: Immutable.Map<string, any>) { }
}

export class FetchBacklogStatsAction implements Action {
  readonly type = "FETCH_BACKLOG_STATS";

  constructor(public payload: number) {}
}

export class SetBacklogStatsAction implements Action {
  readonly type = "SET_BACKLOG_STATS";

  constructor(public payload: Immutable.Map<string, any>) { }
}

export class ChangeBacklogZoom implements Action {
  readonly type = "CHANGE_BACKLOG_ZOOM";

  constructor(public payload: number) {}
}

export class SetBacklogZoom implements Action {
  readonly type = "SET_BACKLOG_ZOOM";

  constructor(public payload: number) {}
}

export class AddBacklogFilter implements Action {
  readonly type = "ADD_BACKLOG_FILTER";
  payload: any;

  constructor(category: string, filter: string) {
      this.payload = {category, filter};
  }
}

export class RemoveBacklogFilter implements Action {
  readonly type = "REMOVE_BACKLOG_FILTER";
  payload: any;

  constructor(category: string, filter: string) {
      this.payload = {category, filter};
  }
}

export class CleanBacklogDataAction implements Action {
  readonly type = "CLEAN_BACKLOG_DATA";
  payload = null;
}

export class SetBulkCreateLightboxDataAction implements Action {
  readonly type = "SET_BULK_CREATE_LIGHTBOX_DATA";

  constructor(public payload: number) {}
}

export class SetNewUsLightboxDataAction implements Action {
  readonly type = "SET_NEW_US_LIGHTBOX_DATA";
  payload: any;

  constructor(statusId: number, us: Immutable.Map<string, any>) {
      this.payload = {statusId, us};
  }
}

export class USBulkCreateAction implements Action {
  readonly type = "US_BULK_CREATE";
  payload: any;

  constructor(projectId: number, statusId: number, stories: string) {
      this.payload = {projectId, statusId, stories};
  }
}
