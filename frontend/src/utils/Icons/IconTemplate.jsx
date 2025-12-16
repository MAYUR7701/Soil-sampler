import React from 'react'
import { Icon } from '@iconify/react';

const IconTemplate = ({icon,className}) => {
  return (
    <div >
      <Icon icon={icon} className={className} />
    </div>
  )
}

export default IconTemplate
