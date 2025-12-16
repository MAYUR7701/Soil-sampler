import InputField from "./InputField";

const TestFormFields = ({ sample,remarks ,setRemarks, station_name, sampleTestDetailsId }) => {
  return (
    <>

      {sampleTestDetailsId ?
        <InputField
          value={sampleTestDetailsId}
          label="Sample Test Id"
          placeholder="Type here"
          disabled
          name="sample_test_id"
        /> : <>    <InputField
          value={sample?.id}
          label="Soil ID"
          placeholder="Type here"
          disabled
          name="sample_id"
        />
          <InputField
            value={station_name}
            label="Station Name"
            placeholder="Type here"
            disabled
            name="station_name"
          />
        </>}
      {/* <InputField
        value={sample?.top_depth}
        label="Top Depth"
        placeholder="Type here"
        disabled
        name="top_depth"
      />
      <InputField
        value={sample?.location}
        label="Location"
        placeholder="Type here"
        disabled
        name="location"
      />
      <InputField
        label="Test Number"
        placeholder="You can't touch this"
        disabled
        name="test_no"
      /> */}
      <InputField
        label="Remarks"
        placeholder="Type here"
        onChangeFunction={setRemarks}
        name="remarks"
        value={remarks}
      />
    </>
  );
};

export default TestFormFields;
