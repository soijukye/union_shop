# Requirements: union_shop

## 1. FooterWidget

### Description
The footer should appear at the bottom of the page, using a layout that keeps it at the bottom of the screen even when the content is short. This is achieved using Flutter's LayoutBuilder, ConstrainedBox, and Expanded widgets. The footer must not overlap or obstruct other elements.

### User Stories
- **As a user**, I want the footer to be visible only when I reach the end of the page so that it does not block any content while browsing.
- **As a developer**, I want the footer to be consistently placed across all pages for a professional look.

### Acceptance Criteria
- The footer is always visible at the bottom of the About and Cart pages, even when the content does not fill the viewport.
- The footer does not overlap with page content.
- The footer is present on all main pages where required.
- The layout uses LayoutBuilder, ConstrainedBox, and Expanded to ensure correct footer placement.



## 4. Cart Functionality

### Description
Implements a cart where users can add products only from the product details page, adjust quantities, and remove items. Cart state is managed globally.

### User Stories
- **As a user**, I want to add products to my cart only from the product details page so I can review options before purchase.
- **As a user**, I want to adjust quantities and remove items in my cart so I have control over my order.
- **As a developer**, I want cart state to be managed in a single model for consistency.

### Acceptance Criteria
- Cart page displays all added items, allows quantity adjustment and removal.
- CartModel and CartItem are used for state management.
- Navigation between product and cart pages works as expected.

---

## 5. Checkout Flow

### Description
Implements a checkout page accessible from the cart, allowing users to complete their purchase.

### User Stories
- **As a user**, I want to proceed to checkout from the cart page to complete my purchase.

### Acceptance Criteria
- Checkout page is accessible from the cart and completes the purchase flow.

---

## 6. Product Details Page

### Description
Adds a dedicated product details page with product option selectors (size, color, quantity) and add-to-cart logic.

### User Stories
- **As a user**, I want to view detailed information about a product so I can make informed decisions.
- **As a user**, I want to select product options (size, color, quantity) before adding to cart.
- **As a developer**, I want a reusable product details page for all products.

### Acceptance Criteria
- Product details page displays all relevant product information and options.
- Option selectors for size, color, and quantity are present and functional.
- Add-to-cart logic works from the product details page.

---

## 7. Sale Price Display

### Description
Sale prices are displayed with strikethrough for old prices where applicable.

### User Stories
- **As a user**, I want to see sale prices clearly marked with the original price struck through.

### Acceptance Criteria
- Sale prices are shown with strikethrough for the old price and highlight for the new price.

---

## 6. Layout and Overflow Handling

### Description
Ensures all main pages handle scroll, overflow, spacing, and sizing correctly. Prevents content from overflowing the viewport and maintains a visually consistent layout.

### User Stories
- **As a user**, I want all content to be visible and never overflow the screen so I can browse comfortably.
- **As a user**, I want consistent spacing and sizing for a professional look.
- **As a developer**, I want to prevent layout errors and overflows across all pages.

### Acceptance Criteria
- No RenderFlex or overflow errors on any page.
- Spacing and sizing are consistent across all main pages.
- Scroll/overflow is handled for About Us, Cart, and other content-heavy pages.
- Layout is responsive and adapts to different screen sizes.

## 2. Top Navigation Bar

### Description
A reusable top navigation bar widget is implemented and used across all pages, providing a consistent look and feel. It includes a logo, search button, shopping bag button, and menu button.

### User Stories
- **As a user**, I want the navigation bar to look the same on every page so I can easily navigate the site.
- **As a developer**, I want to use a single widget for the navigation bar to avoid code duplication and simplify maintenance.

### Acceptance Criteria
- The navigation bar is implemented as a reusable widget.
- All main pages use the same navigation bar widget.
- The navigation bar includes a logo, search, shopping bag, and menu buttons.
- The navigation bar does not obstruct other UI elements.

---

## 3. Dropdown Menu Placement and Behavior

### Description
The dropdown menu, triggered from the navigation bar, should appear below the navbar and banner, never overlapping or obstructing them. The menu should be visually consistent and easy to use.

### User Stories
- **As a user**, I want the dropdown menu to appear below the navigation bar so it does not block the navbar or banner.
- **As a user**, I want to easily access navigation links from the dropdown menu.
- **As a developer**, I want the dropdown menu to use a fixed offset for reliable placement.

### Acceptance Criteria
- The dropdown menu appears below the navbar and banner, never overlapping them.
- The dropdown menu is triggered by the menu button in the navigation bar.
- The dropdown menu contains navigation links (Home, Shop Collections, About).
- The dropdown menu closes when clicking outside or selecting a link.

---


