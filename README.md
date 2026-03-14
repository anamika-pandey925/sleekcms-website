# SleekCMS — Modern CMS-Style Website

> **SleekCMS Internship Assignment** · React + Vite · TailwindCSS · Framer Motion

A production-ready, CMS-style website where pages are rendered from structured JSON content instead of hardcoded HTML. Features a stunning modern SaaS UI with glassmorphism, dark mode, smooth animations, and a complete blog system.

---

## ✨ Features

- 🎨 **Modern SaaS UI** — glassmorphism cards, soft gradients, premium dark theme
- 📐 **CMS-Driven Pages** — page sections defined in JSON, rendered dynamically
- 📝 **Full Blog System** — listing with tag filters, detail page, related posts
- 🌙 **Dark/Light Mode** — persistent, flicker-free theme toggle
- 📱 **Fully Responsive** — mobile-first with animated bottom sheet navigation
- ⚡ **Framer Motion** — hero entrances, card hovers, staggered section reveals
- 🔍 **SEO Ready** — proper meta tags, Open Graph, semantic HTML

---

## 🛠️ Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| React | 18+ | UI framework |
| Vite | 7+ | Build tool + dev server |
| TailwindCSS | 4+ | Utility-first CSS |
| Framer Motion | 11+ | Animations |
| React Router | 6+ | Client-side routing |
| React Icons | 5+ | Icon library |

---

## 🚀 Installation

### Prerequisites
- Node.js 18+
- npm or yarn

### Steps

```bash
# 1. Clone or download the project
cd "assignment 1"

# 2. Install dependencies
npm install

# 3. Start the development server
npm run dev

# 4. Open in browser
# http://localhost:5173
```

---

## 📁 Folder Structure

```
src/
├── components/
│   ├── Navbar.jsx          # Top nav with dark mode toggle + mobile menu
│   ├── Hero.jsx            # Hero section with animated headline
│   ├── Features.jsx        # 6-card feature grid
│   ├── Testimonials.jsx    # Customer testimonial cards
│   ├── Pricing.jsx         # 3-tier pricing section
│   ├── BlogCard.jsx        # Reusable blog post card
│   ├── BlogPreview.jsx     # Homepage blog preview section
│   ├── Footer.jsx          # Footer with links + social icons
│   └── SectionRenderer.jsx # CMS section-to-component mapper
│
├── pages/
│   ├── Home.jsx            # CMS-driven landing page
│   ├── Blog.jsx            # Blog listing with tag filter
│   └── BlogPost.jsx        # Individual post detail page
│
├── layouts/
│   └── MainLayout.jsx      # Navbar + Footer wrapper
│
├── context/
│   └── ThemeContext.jsx    # Dark/light mode state + localStorage
│
├── data/
│   ├── posts.json          # Blog post content (CMS data)
│   └── pages.json          # Page section definitions (CMS data)
│
├── utils/
│   └── helpers.js          # Date formatting, slug lookup, content parsing
│
├── App.jsx                 # Router setup
├── main.jsx                # React entry point
└── index.css               # Global styles + Tailwind import
```

---

## 🧩 How CMS Content Works

This project uses a **JSON-driven page architecture** — the core concept behind modern headless CMS platforms.

### 1. Define pages in `pages.json`

```json
[
  {
    "slug": "home",
    "sections": [
      { "type": "hero" },
      { "type": "features" },
      { "type": "testimonials" },
      { "type": "pricing" },
      { "type": "blogPreview" }
    ]
  }
]
```

### 2. `Home.jsx` reads the page definition

```jsx
const page = getPageBySlug(pages, 'home')

return page.sections.map((section, index) => (
  <SectionRenderer key={index} section={section} index={index} />
))
```

### 3. `SectionRenderer.jsx` maps types to components

```jsx
switch (section.type) {
  case 'hero':       return <Hero />
  case 'features':   return <Features />
  case 'pricing':    return <Pricing />
  // ...
}
```

### ✅ To add a new section:
1. Create `src/components/MySection.jsx`
2. Add a `case` in `SectionRenderer.jsx`
3. Add `{ "type": "mySection" }` to `pages.json`

**No other changes needed.**

---

## 📝 Blog System

Blog posts are defined in `src/data/posts.json`:

```json
{
  "id": 1,
  "slug": "my-post-slug",
  "title": "My Post Title",
  "author": "Author Name",
  "authorAvatar": "https://...",
  "date": "2026-01-01",
  "readTime": "5 min read",
  "tags": ["React", "CMS"],
  "coverImage": "https://images.unsplash.com/...",
  "excerpt": "Short description shown on listing page.",
  "content": "Full markdown-style content here.\n\n## Heading\n\nParagraphs..."
}
```

### Content format
The `content` field supports:
- `## Heading 2` and `### Heading 3`
- ` ```code blocks``` `
- Inline `` `code` `` within paragraphs
- Plain paragraphs separated by double newlines

---

## 🚢 Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Or connect your GitHub repo at vercel.com
# Vercel auto-detects Vite. Framework: Vite, build: npm run build, output: dist
```

Add a `vercel.json` for SPA routing:
```json
{
  "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }]
}
```

### Netlify

```bash
# Build the project
npm run build

# Option 1: Drag & drop the `dist/` folder to app.netlify.com/drop

# Option 2: CLI
npm i -g netlify-cli
netlify deploy --prod --dir=dist
```

Add a `_redirects` file in the `public/` folder:
```
/*    /index.html   200
```

---

## 🎨 Design System

| Token | Value |
|---|---|
| Primary accent | `#7c3aed` (violet) |
| Secondary accent | `#2563eb` (blue) |
| Background (dark) | `#0f0f1a` |
| Surface (dark) | rgba(255,255,255,0.05) + blur |
| Text primary | `#f0f0f0` |
| Text secondary | `#a0a0b0` |
| Border | rgba(255,255,255,0.1) |
| Font | Inter (Google Fonts) |

---

## 🌙 Dark Mode

Toggle button in the navbar switches between dark (default) and light themes. The preference is saved to `localStorage` and applied before React mounts to prevent any flash.

---

## 📱 Responsive Breakpoints

| Breakpoint | Behaviour |
|---|---|
| < 768px | Mobile: hamburger menu → full-screen animated overlay |
| 768px–1200px | Tablet: 2-column grids |
| > 1200px | Desktop: 3-column grids, full navbar |

---

## 👤 Author

Built as a **SleekCMS Internship Assignment** demonstrating CMS architecture, modern React patterns, and premium UI/UX design.
