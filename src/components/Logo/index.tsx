import React from 'react';
import brandLogo from '../../assets/yai_logo.svg';
import neutralLogo from '../../assets/yai_logo_neutral.svg';
import darkLogo from '../../assets/yai_logo_dark.svg';
import lightLogo from '../../assets/yai_logo_light.svg';
import yellowLogo from '../../assets/yai_logo_yellow.svg';
import darkYellowLogo from '../../assets/yai_logo_dark_yellow.svg';

interface LogoProps extends React.HTMLAttributes<HTMLDivElement> {
  showText?: boolean;
  size?: number;
  variant?: 'brand' | 'neutral' | 'dark' | 'light' | 'yellow' | 'dark-yellow';
}

export function Logo({ showText = true, size = 40, variant = 'brand', className, ...props }: LogoProps) {
  
  const getLogoSrc = () => {
    switch (variant) {
      case 'neutral': return neutralLogo;
      case 'dark': return darkLogo;
      case 'light': return lightLogo;
      case 'yellow': return yellowLogo;
      case 'dark-yellow': return darkYellowLogo;
      case 'brand':
      default: return brandLogo;
    }
  };

  return (
    <div className={`flex items-center select-none ${className}`} {...props}>
      <img 
        src={getLogoSrc()} 
        alt={`Yai Logo (${variant})`} 
        width={size} 
        height={size}
        className="flex-shrink-0 object-contain"
        style={{ width: size, height: size }}
      />
      
      {/* 
         Note: The new logo includes the text "Yai" inside the geometry/group naturally.
         If 'showText' implies an external text label like "Serviços", we can add it here.
         But visually the logo IS the text "Yai".
      */}
    </div>
  )
}
