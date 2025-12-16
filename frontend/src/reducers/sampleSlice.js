// reducers/sampleSLice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { useSelector } from "react-redux";

// Create async thunk for adding a new sample
export const addNewSample = createAsyncThunk(
  "sample/addNewSample",
  async (sampleData, { rejectWithValue }) => {
    try {
      const response = await axios.post("/api/sample/generate/", sampleData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Create async thunk for adding a new sample
export const updateSample = createAsyncThunk(
  "sample/updateSample",
  async (sampleData, { rejectWithValue }) => {
    try {
      const response = await axios.put("/api/sample/generate/", sampleData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);


export const getAllSamples = createAsyncThunk(
  "sample/getAllSamples",
  async (filters, { rejectWithValue }) => {
    try {
      const response = await axios.post(`/api/sample/search/station-staff/`, filters);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// get all samples on station
// export const getAllSamples = createAsyncThunk(
//   "sample/getAllSamples",
//   async (filters, { rejectWithValue }) => {
//     try {

//       // const response = await axios.get(
//       //   `/api/sample/search/station-staff/?page=${
//       //     filters?.page || ""
//       //   }&is_archived=${filters?.filter || ""}&search_query=${
//       //     filters?.searchQuery || ""
//       //   }`
//       // );
//       const response = await axios.get('/api/sample/search/station-staff/', {
//         params: filters,
//       });

//       return response.data;
//     } catch (error) {
//       return rejectWithValue(error.response.data);
//     }
//   }
// );

// get sample details by id
export const getSampleDetails = createAsyncThunk(
  "sample/getSampleDetails",
  async (id, { rejectWithValue }) => {
    try {
      const response = await axios.get(`/api/sample/get/${id}/`);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

//search sample
export const searchSamples = createAsyncThunk(
  "sample/searchSamples",
  async (search, { rejectWithValue }) => {
    try {
      const response = await axios.get(`/api/sample/search/?q=${search}`);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

//search sample
export const searchSample = createAsyncThunk(
  "sample/searchSample",
  async (sampleId, { rejectWithValue }) => {
    try {
      const response = await axios.get(`/api/sample/get/${sampleId}/`);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

//scan sample
export const scanSample = createAsyncThunk(
  "sample/scanSample",
  async (id, { rejectWithValue }) => {
    try {
      const response = await axios.post(`/api/sample/scan/`, id);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);
//Dispatch Sample
export const dispatchSample = createAsyncThunk(
  "sample/dispatchSample",
  async (sample_station_locator_id, { rejectWithValue }) => {
    try {
      const response = await axios.put(`/api/sample/dispatch/`, {
        sample_station_locator_id,
      });
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
  sample: null,
  scannedSample: {},
  samples: [],
  searchResult: [],
  pagination: {},
  isNew:false
};

// Create sample Slice
const SampleSlice = createSlice({
  name: "sample",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Reducer for add new sample
      .addCase(addNewSample.pending, (state) => {
        state.loading = true;
      })
      .addCase(addNewSample.fulfilled, (state, action) => {
        state.loading = false;
        state.sample = action.payload.data.sample;
        state.message = action.payload.data.message;
      })
      .addCase(addNewSample.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.sample = null;
      })
      // Reducer for add new sample
      .addCase(updateSample.pending, (state) => {
        state.loading = true;
      })
      .addCase(updateSample.fulfilled, (state, action) => {
        state.loading = false;
        state.sample = action.payload.data.sample;
        state.message = action.payload.data.message;
      })
      .addCase(updateSample.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.sample = null;
      })
      // Reducer for get all samples
      .addCase(getAllSamples.pending, (state) => {
        state.loading = true;
      })
      .addCase(getAllSamples.fulfilled, (state, action) => {
        state.loading = false;
        state.samples = action.payload.data;
        state.pagination = action.payload.pagination;
      })
      .addCase(getAllSamples.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.samples = [];
        state.pagination = {};
      })
      // Reducer for get sample details
      .addCase(getSampleDetails.pending, (state) => {
        state.loading = true;
      })
      .addCase(getSampleDetails.fulfilled, (state, action) => {
        state.loading = false;
        state.sample = action.payload.data;
      })
      .addCase(getSampleDetails.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.sample = null;
      })
      // Reducer for search samples
      .addCase(searchSamples.pending, (state) => {
        state.loading = true;
      })
      .addCase(searchSamples.fulfilled, (state, action) => {
        state.loading = false;
        state.searchResult = action.payload.data;
      })
      .addCase(searchSamples.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.searchResult = [];
      })
      // Reducer for scan sample
      .addCase(scanSample.pending, (state) => {
        state.loading = true;
      })
      .addCase(scanSample.fulfilled, (state, action) => {
        state.loading = false;
        state.scannedSample = action.payload?.data?.sample;
        state.message = action.payload?.data?.message;
        state.isNew = action.payload?.data?.isNew? true : false;

      })
      .addCase(scanSample.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.scannedSample = {};
      })
      // Reducer for search sample
      .addCase(searchSample.pending, (state) => {
        state.loading = true;
      })
      .addCase(searchSample.fulfilled, (state, action) => {
        state.loading = false;
        state.scannedSample = action.payload.data;
        state.message = action.payload.data.message;
      })
      .addCase(searchSample.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.scannedSample = null;
      })
      //reducer for dispatch sample
      .addCase(dispatchSample.pending, (state) => {
        state.loading = true;
      })
      .addCase(dispatchSample.fulfilled, (state, action) => {
        state.loading = false;
        state.scannedSample = action.payload.data;
        state.message = action.payload.data.message;
      })
      .addCase(dispatchSample.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
        state.scannedSample = null;
      });
  },
});
export const { resetNotificationState } = SampleSlice.actions;

export default SampleSlice.reducer;
