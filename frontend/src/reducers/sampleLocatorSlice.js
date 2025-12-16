// reducers/authSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

//Fetch sample Location details
export const fetchSampleLocationDetails = createAsyncThunk(
  "sampleLocation/fetchSampleLocationDetails",
  async (data, { rejectWithValue }) => {

    try {
      const response = await axios.get(
        `/api/sample/locate/${data?.sampleId}/${
          data?.filter ? `?filter=${data?.filter}` : ""
        }`
      );
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);
export const updateSampleLocationIsCompleted = createAsyncThunk(
  "sampleLocation/updateSampleLocationIsCompleted",
  async (data, { rejectWithValue }) => {
    try {
      const response = await axios.put(
        `/api/sample/locate/${data?.sampleLocatorId}/`,
        { is_completed: data?.isCompleted }
      );
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Initial state
const initialState = {
  loading: false,
  error: null,
  sampleLocation: null,
  sampleLocations: [],
  // pagination: {},
};

// Create sampleLocatorSlice
const sampleLocatorSlice = createSlice({
  name: "sampleLocation",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Reducer for fetching sample locations
      .addCase(fetchSampleLocationDetails.pending, (state) => {
        state.loading = true;
      })
      .addCase(fetchSampleLocationDetails.fulfilled, (state, action) => {
        state.loading = false;
        if (action.payload?.sampleLocation)
          state.sampleLocation = action.payload?.sampleLocation;
        if (action.payload?.sampleLocations)
          state.sampleLocations = action.payload?.sampleLocations;
        // state.pagination = action.payload?.pagination;
      })
      .addCase(fetchSampleLocationDetails.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
        state.sampleLocations = [];
      })
      .addCase(updateSampleLocationIsCompleted.pending, (state) => {
        state.loading = true;
      })
      .addCase(updateSampleLocationIsCompleted.fulfilled, (state, action) => {
        state.loading = false;
        if (action.payload?.sampleLocation)
          state.sampleLocation = action.payload?.sampleLocation;
        if (action.payload?.sampleLocations)
          state.sampleLocations = action.payload?.sampleLocations;
        state.message = action.payload?.message;
        // state.pagination = action.payload?.pagination;
      })
      .addCase(updateSampleLocationIsCompleted.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
        state.sampleLocations = [];
      });
  },
});
export const { resetNotificationState } = sampleLocatorSlice.actions;

export default sampleLocatorSlice.reducer;
