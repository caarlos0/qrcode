# QRCoder - Development Notes

## Project Overview
A clean, no-bullshit static site for generating QR codes. Built with vanilla HTML/CSS/JavaScript.

## Design Decisions

### Visual Design
- Gradient background (purple theme: #667eea to #764ba2)
- Clean, modern UI with rounded corners and shadows
- Responsive design with mobile support
- Minimal, focused interface - no unnecessary features

### Technical Decisions
- **SVG Generation**: Using `qrcode-generator` library to generate QR codes as SVG instead of canvas/PNG
  - Better quality and scalability
  - Smaller file sizes
  - Clean vector output
- **Fixed Size**: QR codes generate and display at 256x256px
  - Removed size slider to keep interface simple
  - Consistent, predictable output
- **High Error Correction**: Using 'H' level (30% recovery capacity) for durability

## Dependencies
- [qrcode-generator](https://cdnjs.cloudflare.com/ajax/libs/qrcode-generator/1.4.4/qrcode.min.js) - SVG QR code generation

## Features
- Text/URL input with auto-focus
- Enter key support for quick generation
- SVG download functionality
- Responsive design for mobile/desktop
- Empty state messaging

## Styling Philosophy
- No frameworks - pure CSS
- System fonts for native look
- Gradient accents for visual interest
- Hover effects for interactivity
- Clean, spacious layout with proper padding

## Footer
Attribution link to https://caarlos0.dev
