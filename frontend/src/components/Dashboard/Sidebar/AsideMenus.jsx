import ToggleButton from "../../Theme/ToggleButton";

const menus = [
  {
    id: "dashboard",
    route: "/dashboard",
    label: "Dashboard",

    icon: (
      <svg className="-ml-1 h-6 w-6" viewBox="0 0 24 24" fill="none">
        <path
          d="M6 8a2 2 0 0 1 2-2h1a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V8ZM6 15a2 2 0 0 1 2-2h1a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2v-1Z"
          className=" fill-current text-cyan-400"
        ></path>
        <path
          d="M13 8a2 2 0 0 1 2-2h1a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2V8Z"
          className="fill-current "
        ></path>
        <path
          d="M13 15a2 2 0 0 1 2-2h1a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2h-1a2 2 0 0 1-2-2v-1Z"
          className="fill-current"
        ></path>
      </svg>
    ),
  },
  {
    id: "search",
    route: "/dashboard/search",
    label: "Search",

    icon: (
      <svg
        xmlns="http://www.w3.org/2000/svg"
        className="h-5 w-5"
        viewBox="0 0 20 20"
        fill="currentColor"
      >
        <path
          className="fill-current text-cyan-400"
          fillRule="evenodd"
          d="M2 6a2 2 0 012-2h4l2 2h4a2 2 0 012 2v1H8a3 3 0 00-3 3v1.5a1.5 1.5 0 01-3 0V6z"
          clipRule="evenodd"
        />
        <path
          className="fill-current "
          d="M6 12a2 2 0 012-2h8a2 2 0 012 2v2a2 2 0 01-2 2H2h2a2 2 0 002-2v-2z"
        />
      </svg>
    ),
  },
  {
    id: "scan",
    route: "/dashboard/scan",
    label: "Scan",
    icon: (
      <svg
        xmlns="http://www.w3.org/2000/svg"
        className="h-5 w-5"
        viewBox="0 0 20 20"
        fill="currentColor"
      >
        <path
          className="fill-current text-cyan-400"
          fillRule="evenodd"
          d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z"
          clipRule="evenodd"
        />
        <path
          className="fill-current"
          d="M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z"
        />
      </svg>
    ),
  },
  {
    id: "upload",
    route: "/dashboard/upload",
    label: "Upload",
    icon: (
<svg className="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
	<g fill="none" strokeLinejoin="round" strokeWidth={4}>
		<path fill="#22d3ee" stroke="#000" d="M5 8C5 6.89543 5.89543 6 7 6H19L24 12H41C42.1046 12 43 12.8954 43 14V40C43 41.1046 42.1046 42 41 42H7C5.89543 42 5 41.1046 5 40V8Z"></path>
		<path stroke="#fff" strokeLinecap="round" d="M30 25.9867L24 20L18 26"></path>
		<path stroke="#fff" strokeLinecap="round" d="M24 20V34"></path>
	</g>
</svg>
      
    ),
  },
];

export default menus;
