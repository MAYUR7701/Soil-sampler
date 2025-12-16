// filterSlice.js

import { createSlice } from "@reduxjs/toolkit";

export const filterSlice = createSlice({
  name: "filter",
  initialState: {
    filters: {
      page: 1,
      location: "",
      top_depth: "",
      project_no: "",
      sample_no: "",
      selectedStations: [],
      lastLocations: [],
      is_archived: "",
    },
  },
  reducers: {
    updateFilterForm: (state, action) => {
      state.filters = action.payload;
    },
    resetFilters: (state) => {
      state.filters = {
        location: "",
        top_depth: "",
        project_no: "",
        sample_no: "",
        selectedStations: [],
        is_archived: "",
      };
    },
    updatePage: (state,action) => {
        state.filters.page = action.payload;
      },
  },
});

export const { updateFilterForm, resetFilters ,updatePage} = filterSlice.actions;

export default filterSlice.reducer;
