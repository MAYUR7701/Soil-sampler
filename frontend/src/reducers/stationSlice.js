// reducers/stationSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

// Create async thunk station slice
export const getStation = createAsyncThunk(
  "station/fetch",
  async (_, { rejectWithValue }) => {
    try {
      const response = await axios.get("/api/station/");
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);


// Initial state
const initialState = {
stations: [],
loading: false,
error: null,
message: null,
};

// Create station slice 
const stationSlice = createSlice({
  name: "station",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(getStation.pending, (state) => {
        state.loading = true;
      })
      .addCase(getStation.fulfilled, (state, action) => {
        state.loading = false;
        state.stations = action.payload?.data || [];
      })
      .addCase(getStation.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
      })
  },
});
export const { resetNotificationState } = stationSlice.actions;

export default stationSlice.reducer;
