import * as React from 'react'
import { Check } from 'lucide-react'
import { clsx, type ClassValue } from 'clsx'
import { twMerge } from 'tailwind-merge'

function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

// Simplified fully controlled Checkbox
export const Checkbox = React.forwardRef<HTMLInputElement, React.InputHTMLAttributes<HTMLInputElement>>(
  ({ className, checked, onChange, ...props }, ref) => (
    <div className="relative flex items-center justify-center">
      <input
        type="checkbox"
        className={cn(
          "peer h-5 w-5 appearance-none rounded border border-gray-300 shadow-sm transition-all",
          "hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2",
          "checked:border-green-500 checked:bg-green-500",
          "disabled:cursor-not-allowed disabled:opacity-50",
          className
        )}
        ref={ref}
        checked={!!checked}
        onChange={onChange}
        {...props}
      />
      <Check className="pointer-events-none absolute h-3.5 w-3.5 text-white opacity-0 transition-opacity peer-checked:opacity-100" />
    </div>
  )
)
Checkbox.displayName = 'Checkbox'
