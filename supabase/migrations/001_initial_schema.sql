-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- ENUMS
-- ============================================

CREATE TYPE product_status AS ENUM (
  'available',
  'reserved',
  'sold',
  'returned',
  'with_craftsman'
);

CREATE TYPE sell_channel AS ENUM (
  'offline',
  'whatsapp',
  'instagram',
  'website'
);

CREATE TYPE custom_order_status AS ENUM (
  'inquiry',
  'quotation_sent',
  'approved',
  'in_progress',
  'quality_check',
  'ready',
  'delivered',
  'cancelled'
);

CREATE TYPE payment_type AS ENUM (
  'advance',
  'partial',
  'full',
  'refund',
  'token'
);

CREATE TYPE metal_type AS ENUM (
  'gold',
  'silver',
  'platinum',
  'white_gold',
  'rose_gold'
);

CREATE TYPE purity_type AS ENUM (
  '24k',
  '22k',
  '18k',
  '14k',
  '10k',
  '925_silver',
  '999_silver',
  '950_platinum'
);

-- ============================================
-- CORE TABLES
-- ============================================

-- Products (Ready-made inventory)
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  sku TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  description TEXT,
  
  -- Metal details
  metal_type metal_type NOT NULL,
  purity purity_type NOT NULL,
  gross_weight_grams DECIMAL(10,3) NOT NULL,
  net_weight_grams DECIMAL(10,3) NOT NULL,
  
  -- Diamond/Stone details
  diamond_details JSONB,
  other_stones JSONB,
  
  -- Pricing (in paise)
  making_charges INTEGER NOT NULL,
  stone_charges INTEGER DEFAULT 0,
  other_charges INTEGER DEFAULT 0,
  base_price INTEGER NOT NULL,
  selling_price INTEGER NOT NULL,
  reseller_price INTEGER,
  
  -- Status & availability
  status product_status DEFAULT 'available',
  locked_for_channel sell_channel,
  locked_at TIMESTAMPTZ,
  locked_by UUID,
  
  -- Metadata
  category TEXT,
  tags TEXT[],
  reseller_id UUID,
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Customers
CREATE TABLE customers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  phone TEXT NOT NULL UNIQUE,
  email TEXT,
  whatsapp_number TEXT,
  instagram_handle TEXT,
  address JSONB,
  notes TEXT,
  total_purchases_amount INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Sales
CREATE TABLE sales (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  sale_number TEXT NOT NULL UNIQUE,
  product_id UUID REFERENCES products(id),
  custom_order_id UUID,
  customer_id UUID NOT NULL REFERENCES customers(id),
  reseller_id UUID,
  channel sell_channel NOT NULL,
  sold_price INTEGER NOT NULL,
  discount_amount INTEGER DEFAULT 0,
  final_amount INTEGER NOT NULL,
  commission_amount INTEGER DEFAULT 0,
  sold_by UUID NOT NULL,
  sold_at TIMESTAMPTZ DEFAULT NOW(),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Custom Orders
CREATE TABLE custom_orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_number TEXT NOT NULL UNIQUE,
  customer_id UUID NOT NULL REFERENCES customers(id),
  reference_images TEXT[],
  requirements TEXT NOT NULL,
  estimated_metal_weight DECIMAL(10,3),
  estimated_price INTEGER,
  quoted_price INTEGER,
  final_price INTEGER,
  craftsman_id UUID,
  assigned_at TIMESTAMPTZ,
  status custom_order_status DEFAULT 'inquiry',
  expected_delivery_date DATE,
  actual_delivery_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Payments
CREATE TABLE payments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  payment_number TEXT NOT NULL UNIQUE,
  sale_id UUID,
  custom_order_id UUID,
  customer_id UUID,
  type payment_type NOT NULL,
  amount INTEGER NOT NULL,
  payment_method TEXT,
  reference_number TEXT,
  notes TEXT,
  received_by UUID,
  payment_date TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_products_status ON products(status);
CREATE INDEX idx_products_sku ON products(sku);
CREATE INDEX idx_customers_phone ON customers(phone);
CREATE INDEX idx_sales_channel ON sales(channel);
CREATE INDEX idx_sales_customer ON sales(customer_id);
