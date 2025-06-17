// Global type definitions for Laravel + React project

export interface User {
  id: number;
  name: string;
  email: string;
  email_verified_at?: string;
  created_at: string;
  updated_at: string;
}

export interface BasePageProps {
  auth: {
    user: User;
  };
  flash?: {
    message?: string;
    error?: string;
    success?: string;
  };
  errors?: Record<string, string>;
}

export type PageProps<T = Record<string, unknown>> = BasePageProps & T;

// Inertia.js types
export interface InertiaPageProps {
  component: string;
  props: PageProps;
  url: string;
  version: string;
}

// API Response types
export interface ApiResponse<T = any> {
  data: T;
  message?: string;
  status: 'success' | 'error';
  errors?: Record<string, string[]>;
}

export interface PaginatedResponse<T> {
  data: T[];
  current_page: number;
  first_page_url: string;
  from: number;
  last_page: number;
  last_page_url: string;
  next_page_url: string | null;
  path: string;
  per_page: number;
  prev_page_url: string | null;
  to: number;
  total: number;
}

// Form types
export interface FormErrors {
  [key: string]: string;
}

export interface FormData {
  [key: string]: any;
}

// Common component props
export interface BaseComponentProps {
  className?: string;
  children?: React.ReactNode;
}

// Laravel validation error structure
export interface ValidationErrors {
  [field: string]: string[];
}

// Laravel route helper types
declare global {
  function route(name: string, params?: any): string;
  
  interface Window {
    Laravel: {
      csrfToken: string;
    };
  }
}
