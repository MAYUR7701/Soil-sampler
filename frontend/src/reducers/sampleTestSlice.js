// reducers/authSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

// Create async thunk for adding a new sample test
export const addNewSampleTest = createAsyncThunk(
  "sampleTest/addNewSampleTest",
  async (sampleTestData, { rejectWithValue }) => {
    try {
      const response = await axios.post("/api/sample/test/", sampleTestData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);
// edit sample test
export const editNewSampleTest = createAsyncThunk(
  "sampleTest/editNewSampleTest",
  async (sampleTestData, { rejectWithValue }) => {
    try {
      const response = await axios.put("/api/sample/test/", sampleTestData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);
// get all samples tests on station
export const getAllSampleTests = createAsyncThunk(
  "sampleTest/getAllSampleTests",
  async (data, { rejectWithValue }) => {
    try {
      const response = await axios.get(
        `/api/sample/test/?sample_station_locator_id=${data?.locatorId}${
          data?.page ? "&page=" + data?.page : ""
        }${data?.filter !== undefined ? "&is_completed=" + data?.filter : ""}`
      );
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// get sample test details by id
export const getSampleTestDetails = createAsyncThunk(
  "sampleTest/getSampleTestDetails",
  async (id, { rejectWithValue }) => {
    try {
      const response = await axios.get(`/api/sample/get/${id}/`);
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
  message: null,
  sampleTest: null,
  sampleTests: [],
  scannedSample: {},
  pagination: {},
};

// Create authSlice
const SampleSlice = createSlice({
  name: "sampleTest",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
          // Reducer for edit sample
          .addCase(addNewSampleTest.pending, (state) => {
            state.loading = true;
          })
          .addCase(addNewSampleTest.fulfilled, (state, action) => {
            state.loading = false;
            state.sampleTest = action.payload.data.sampleTest;
            state.message = action.payload.data.message;
          })
          .addCase(addNewSampleTest.rejected, (state, action) => {
            state.loading = false;
            state.error = action.payload.error;
          })
      // Reducer for edit sample
      .addCase(editNewSampleTest.pending, (state) => {
        state.loading = true;
      })
      .addCase(editNewSampleTest.fulfilled, (state, action) => {
        state.loading = false;
        state.sampleTest = action.payload.data.sampleTest;
        state.message = action.payload.data.message;
      })
      .addCase(editNewSampleTest.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
      })
      // Reducer for get all sample tests
      .addCase(getAllSampleTests.pending, (state) => {
        state.loading = true;
      })
      .addCase(getAllSampleTests.fulfilled, (state, action) => {
        state.loading = false;
        state.sampleTests = action.payload.data;
        state.pagination = action.payload.pagination;
      })
      .addCase(getAllSampleTests.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
      })
      // Reducer for get sample test details
      .addCase(getSampleTestDetails.pending, (state) => {
        state.loading = true;
      })
      .addCase(getSampleTestDetails.fulfilled, (state, action) => {
        state.loading = false;
        state.sampleTest = action.payload.data;
      })
      .addCase(getSampleTestDetails.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
      })
  },
});
export const { resetNotificationState } = SampleSlice.actions;

export default SampleSlice.reducer;
