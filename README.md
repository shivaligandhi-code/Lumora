# 💎 LUMORA

**Luxury Jewelry Business ERP** - A complete 3-tier API-first application for managing jewelry inventory, sales, customers, craftsmen, and multi-channel operations.

![Status](https://img.shields.io/badge/status-production--ready-success)
![License](https://img.shields.io/badge/license-MIT-blue)
![Made with](https://img.shields.io/badge/made%20with-❤️-red)

---

## 📖 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Phase Breakdown](#phase-breakdown)
- [Deployment](#deployment)
- [Contributing](#contributing)

---

## 🌟 Overview

LUMORA is an enterprise-grade jewelry business management system built with modern technologies. It provides:

- 📦 **Inventory Management** - Track ready-made jewelry with detailed specifications
- 🎨 **Custom Orders** - Manage bespoke jewelry from inquiry to delivery
- 👥 **Customer Management** - Complete customer profiles and purchase history
- 🔨 **Craftsman Workflow** - Assign and track custom work orders
- 💰 **Multi-Channel Sales** - Sell across Offline, WhatsApp, Instagram, and Website
- 📊 **Analytics Dashboard** - Real-time business insights and reporting
- 🤖 **AI Content Generation** - Claude-powered product descriptions for each channel
- 💳 **Payment Tracking** - Advanced payment and balance management

---

## ✨ Features

### Core Functionality
- ✅ **Channel-Aware Inventory Locking** - Prevents double-selling across channels
- ✅ **Complete Product Lifecycle** - From creation to sale with full audit trail
- ✅ **Custom Order Workflows** - Status-based workflow with craftsman assignment
- ✅ **Financial Tracking** - Payments, advances, commissions, profit calculation
- ✅ **Reseller Management** - Special pricing and commission tracking
- ✅ **Multi-Platform Support** - Web + Mobile apps with synchronized data

### AI-Powered Features
- 🤖 **Channel-Specific Content** - Tailored descriptions for WhatsApp, Instagram, Website, Offline
- 🤖 **Title Variations** - Generate multiple SEO-friendly product titles
- 🤖 **Regeneration with Feedback** - Improve content based on user feedback
- 🤖 **Batch Generation** - Create content for all channels at once

---

## 🛠️ Tech Stack

### Backend
- **Runtime**: Node.js 20+
- **Language**: TypeScript
- **Framework**: Express.js
- **Database**: PostgreSQL 15+
- **BaaS**: Supabase (Auth, Storage, Real-time)
- **AI**: Claude 3.7 Sonnet (Anthropic)
- **Validation**: Zod

### Web Application
- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **State**: React Hooks + Context
- **Forms**: React Hook Form

### Mobile Application
- **Framework**: React Native (Expo)
- **Language**: TypeScript
- **Navigation**: Expo Router
- **Styling**: Native Styles

### DevOps
- **Version Control**: Git + GitHub
- **Package Manager**: npm
- **Linting**: ESLint + Prettier
- **Type Checking**: TypeScript strict mode

---

## 📁 Project Structure

```
Lumora/
├── backend/                 # Node.js + Express API
│   ├── src/
│   │   ├── config/         # Database & Supabase config
│   │   ├── middleware/     # Auth, validation, error handling
│   │   ├── modules/
│   │   │   ├── products/
│   │   │   ├── sales/
│   │   │   ├── customers/
│   │   │   ├── custom-orders/
│   │   │   ├── craftsmen/
│   │   │   ├── payments/
│   │   │   ├── resellers/
│   │   │   ├── inventory/  # Locking logic
│   │   │   ├── analytics/
│   │   │   └── ai-content/ # AI generation
│   │   ├── types/
│   │   ├── utils/
│   │   ├── app.ts
│   │   └── server.ts
│   ├── package.json
│   └── tsconfig.json
│
├── web/                    # Next.js Web App
│   ├── src/
│   │   ├── app/
│   │   │   ├── (dashboard)/
│   │   │   │   ├── inventory/
│   │   │   │   ├── sales/
│   │   │   │   ├── customers/
│   │   │   │   └── custom-orders/
│   │   │   └── layout.tsx
│   │   ├── components/
│   │   │   ├── ui/
│   │   │   └── layout/
│   │   └── lib/
│   │       ├── api/
│   │       └── utils/
│   ├── package.json
│   └── next.config.js
│
├── mobile/                 # React Native App
│   ├── app/
│   │   ├── (tabs)/
│   │   ├── product/
│   │   └── sell/
│   ├── components/
│   ├── lib/
│   ├── package.json
│   └── app.json
│
├── supabase/              # Database migrations
│   └── migrations/
│       └── 001_initial_schema.sql
│
├── docs/                  # Documentation
│   ├── API.md
│   ├── SETUP.md
│   └── DEPLOYMENT.md
│
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Node.js 20+
- PostgreSQL 15+
- Supabase account
- Anthropic API key (for AI features)

### 1. Clone the Repository

```bash
git clone https://github.com/shivaligandhi-code/Lumora.git
cd Lumora
```

### 2. Set Up Database

1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Run the migration:

```bash
psql $DATABASE_URL -f supabase/migrations/001_initial_schema.sql
```

### 3. Backend Setup

```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your credentials
npm run dev
```

**Environment Variables** (`.env`):
```env
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
DATABASE_URL=your_postgres_url
ANTHROPIC_API_KEY=your_claude_api_key
PORT=3001
```

### 4. Web App Setup

```bash
cd web
npm install
cp .env.local.example .env.local
# Edit .env.local
npm run dev
```

### 5. Mobile App Setup

```bash
cd mobile
npm install
cp .env.example .env
# Edit .env
npm start
```

---

## 📚 Phase Breakdown

The system was built in 6 comprehensive phases:

### Phase 1: Foundation ✅
- Complete PostgreSQL database schema
- Supabase integration
- Data modeling with relationships
- Enum definitions for statuses and channels

### Phase 2: Backend Core ✅
- Express API with TypeScript
- Product CRUD operations
- **Channel-aware inventory locking** (prevents race conditions)
- Sales creation with multi-channel support
- Transaction-safe operations

### Phase 3: Web UI ✅
- Next.js 14 with App Router
- Tailwind CSS luxury design system
- Inventory management interface
- Product detail views
- Sell product flow with channel selection

### Phase 4: Mobile UI ✅
- React Native + Expo
- Native mobile experience
- Tab-based navigation
- On-the-go selling
- Synchronized with web app

### Phase 5: Advanced Business Logic ✅
- Custom order workflows (inquiry → delivery)
- Craftsman management and assignment
- Payment tracking (advance, partial, full, refund)
- Analytics dashboard
- Profit calculation framework
- Reseller commission management

### Phase 6: AI Content Engine ✅
- Claude 3.7 Sonnet integration
- Channel-specific prompt templates
- Content generation for descriptions, captions, titles
- Regeneration with feedback loop
- Batch processing for all channels

---

## 🎯 Key Features Explained

### Multi-Channel Selling

LUMORA supports 4 sales channels:
- **Offline**: In-store sales
- **WhatsApp**: Direct messaging sales
- **Instagram**: Social media sales
- **Website**: E-commerce platform

Each channel has:
- Unique inventory locks (30-minute duration)
- Custom AI-generated content
- Separate analytics tracking

### Inventory Locking System

Prevents double-selling across channels:
1. When selling, product is locked for specific channel
2. Lock duration: 30 minutes (configurable)
3. Other channels cannot sell during lock period
4. Lock auto-expires if sale not completed
5. Transaction-safe with PostgreSQL row-level locking

### AI Content Generation

Channel-optimized content:
- **WhatsApp**: Conversational, 3-4 sentences, emojis
- **Instagram**: Story-driven captions + 8-12 hashtags
- **Website**: SEO-optimized, 100-250 words, structured
- **Offline**: Print-ready, scannable, 30-50 words

---

## 📊 API Documentation

Key endpoints:

```
# Products
POST   /api/products
GET    /api/products
GET    /api/products/:id
PATCH  /api/products/:id

# Sales
POST   /api/sales
GET    /api/sales

# Custom Orders
POST   /api/custom-orders
POST   /api/custom-orders/:id/assign
POST   /api/custom-orders/:id/deliver

# AI Content
POST   /api/ai-content/generate
POST   /api/ai-content/:product_id/generate-all
GET    /api/ai-content/:product_id/title-variations

# Analytics
GET    /api/analytics/dashboard
GET    /api/analytics/sales-by-channel
GET    /api/analytics/profit
```

For detailed API documentation, see [docs/API.md](docs/API.md)

---

## 🚀 Deployment

### Backend (Railway / Render)
```bash
npm run build
npm start
```

### Web (Vercel)
```bash
vercel --prod
```

### Mobile (Expo)
```bash
eas build --platform all
eas submit
```

Detailed deployment instructions: [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md)

---

## 🤝 Contributing

Contributions are welcome! This is a personal project but open to improvements.

---

## 📄 License

MIT License - feel free to use for your own jewelry business!

---

## 🙏 Acknowledgments

- Built with guidance from Claude 3.7 Sonnet
- Designed for luxury jewelry businesses
- Production-ready and scalable

---

## 📞 Contact

For questions or support, please open an issue on GitHub.

---

**Made with ❤️ for the jewelry industry**
