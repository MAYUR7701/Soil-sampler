import React from 'react';
import IconTemplate from './Icons/IconTemplate';

type ColumnHeading = {
  icon: string;
  label: string;
};

type TableProps = {
  columnHeadings: ColumnHeading[];
  children: React.ReactNode;
};

const Table = ({ columnHeadings, children }: TableProps) => {
  return (
<div className="overflow-x-auto overflow-y-auto min-h-[38rem]">
  <table className="table border pt-1 pb-3 w-full border-gray-700 overflow-hidden flex-grow-0  text-center">
    <thead className="text-center bg-[#191919] table-head">
      <tr className="lg:text-lg text-white">
        {columnHeadings.map((columnHeading, index) => (
          <th key={index} className="min-w-[140px]">
            <span className="flex items-center justify-center gap-3">
              <IconTemplate icon={columnHeading.icon} className="w-5 h-5" />
              {columnHeading.label}
            </span>
          </th>
        ))}
      </tr>
    </thead>
    <tbody className="text-center table-body">{children}</tbody>
  </table>
</div>

  );
};

export default Table;
