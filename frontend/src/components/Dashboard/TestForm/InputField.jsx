const InputField = ({ label, placeholder, value, onChangeFunction=false, disabled = false, ...props }) => {
  return (
    <label className="form-control w-full max-w-xs">
      <div className="label">
        <span className="label-text">{label}</span>
      </div>
      <input
        type="text"
        placeholder={placeholder}
        className="input input-bordered dakr:bg-zinc-900 w-full max-w-xs"
        disabled={disabled}
        value={value}
        onChange={(e) => onChangeFunction && onChangeFunction(e.target.value)}
        {...props}
      />
    </label>
  );
};

export default InputField;
