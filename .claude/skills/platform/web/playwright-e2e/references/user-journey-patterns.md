# User Journey Test Patterns

Common E2E test patterns for real user workflows.

## Authentication Journeys

### Sign Up Flow
```typescript
test('new user can create account', async ({ page }) => {
  await page.goto('/signup');

  // Fill registration form
  await page.getByLabel('Full name').fill('Jane Doe');
  await page.getByLabel('Email').fill('jane@example.com');
  await page.getByLabel('Password').fill('SecurePass123!');
  await page.getByLabel('Confirm password').fill('SecurePass123!');

  // Accept terms
  await page.getByLabel('I agree to the terms').check();

  // Submit
  await page.getByRole('button', { name: 'Create account' }).click();

  // Verify success
  await expect(page.getByText('Welcome, Jane!')).toBeVisible();
  await expect(page).toHaveURL('/dashboard');
});
```

### Login Flow
```typescript
test('existing user can sign in', async ({ page }) => {
  await page.goto('/login');

  await page.getByLabel('Email').fill('user@example.com');
  await page.getByLabel('Password').fill('password123');
  await page.getByRole('button', { name: 'Sign in' }).click();

  await expect(page.getByRole('button', { name: 'Account' })).toBeVisible();
});
```

### Logout Flow
```typescript
test('user can sign out', async ({ page }) => {
  // Start logged in (use auth state)
  await page.goto('/dashboard');

  await page.getByRole('button', { name: 'Account' }).click();
  await page.getByRole('menuitem', { name: 'Sign out' }).click();

  await expect(page).toHaveURL('/');
  await expect(page.getByRole('link', { name: 'Sign in' })).toBeVisible();
});
```

### Password Reset
```typescript
test('user can reset password', async ({ page }) => {
  await page.goto('/login');
  await page.getByRole('link', { name: 'Forgot password?' }).click();

  await page.getByLabel('Email').fill('user@example.com');
  await page.getByRole('button', { name: 'Send reset link' }).click();

  await expect(page.getByText('Check your email')).toBeVisible();
});
```

---

## E-Commerce Journeys

### Browse and Search
```typescript
test('user can search for products', async ({ page }) => {
  await page.goto('/');

  await page.getByRole('searchbox').fill('blue shirt');
  await page.getByRole('searchbox').press('Enter');

  await expect(page).toHaveURL(/search\?q=blue\+shirt/);
  await expect(page.getByRole('heading', { name: /results for "blue shirt"/i })).toBeVisible();
});
```

### Add to Cart
```typescript
test('user can add item to cart', async ({ page }) => {
  await page.goto('/products/blue-shirt');

  // Select options
  await page.getByLabel('Size').selectOption('Medium');
  await page.getByLabel('Quantity').fill('2');

  // Add to cart
  await page.getByRole('button', { name: 'Add to cart' }).click();

  // Verify cart updated
  await expect(page.getByTestId('cart-count')).toHaveText('2');
});
```

### Complete Checkout
```typescript
test('user can complete purchase', async ({ page }) => {
  // Add item to cart first
  await page.goto('/products/blue-shirt');
  await page.getByRole('button', { name: 'Add to cart' }).click();

  // Go to checkout
  await page.getByRole('link', { name: 'Checkout' }).click();

  // Shipping info
  await page.getByLabel('Address').fill('123 Main St');
  await page.getByLabel('City').fill('New York');
  await page.getByLabel('ZIP').fill('10001');
  await page.getByRole('button', { name: 'Continue to payment' }).click();

  // Payment info (use test card)
  await page.getByLabel('Card number').fill('4242424242424242');
  await page.getByLabel('Expiry').fill('12/25');
  await page.getByLabel('CVC').fill('123');

  // Complete order
  await page.getByRole('button', { name: 'Place order' }).click();

  // Verify confirmation
  await expect(page.getByRole('heading', { name: 'Order confirmed' })).toBeVisible();
  await expect(page.getByText(/order #/i)).toBeVisible();
});
```

---

## Form Journeys

### Multi-Step Form
```typescript
test('user can complete multi-step form', async ({ page }) => {
  await page.goto('/application');

  // Step 1: Personal info
  await page.getByLabel('First name').fill('John');
  await page.getByLabel('Last name').fill('Doe');
  await page.getByRole('button', { name: 'Next' }).click();

  // Step 2: Contact info
  await expect(page.getByText('Step 2 of 3')).toBeVisible();
  await page.getByLabel('Email').fill('john@example.com');
  await page.getByLabel('Phone').fill('555-1234');
  await page.getByRole('button', { name: 'Next' }).click();

  // Step 3: Review
  await expect(page.getByText('Step 3 of 3')).toBeVisible();
  await expect(page.getByText('John Doe')).toBeVisible();
  await page.getByRole('button', { name: 'Submit' }).click();

  // Confirmation
  await expect(page.getByText('Application submitted')).toBeVisible();
});
```

### Form Validation
```typescript
test('form shows validation errors', async ({ page }) => {
  await page.goto('/contact');

  // Submit empty form
  await page.getByRole('button', { name: 'Send' }).click();

  // Check validation messages
  await expect(page.getByText('Name is required')).toBeVisible();
  await expect(page.getByText('Email is required')).toBeVisible();

  // Fix errors
  await page.getByLabel('Name').fill('John');
  await page.getByLabel('Email').fill('invalid-email');
  await page.getByRole('button', { name: 'Send' }).click();

  // Check email format validation
  await expect(page.getByText('Enter a valid email')).toBeVisible();
});
```

---

## Navigation Journeys

### Breadcrumb Navigation
```typescript
test('user can navigate via breadcrumbs', async ({ page }) => {
  await page.goto('/products/electronics/phones/iphone');

  // Click breadcrumb
  await page.getByRole('link', { name: 'Electronics' }).click();

  await expect(page).toHaveURL('/products/electronics');
});
```

### Tab Navigation
```typescript
test('user can switch tabs', async ({ page }) => {
  await page.goto('/account');

  // Default tab
  await expect(page.getByRole('tabpanel', { name: 'Profile' })).toBeVisible();

  // Switch tab
  await page.getByRole('tab', { name: 'Orders' }).click();
  await expect(page.getByRole('tabpanel', { name: 'Orders' })).toBeVisible();
});
```

---

## Error Handling Journeys

### 404 Page
```typescript
test('shows 404 for missing page', async ({ page }) => {
  await page.goto('/this-page-does-not-exist');

  await expect(page.getByRole('heading', { name: /not found/i })).toBeVisible();
  await expect(page.getByRole('link', { name: 'Go home' })).toBeVisible();
});
```

### Network Error
```typescript
test('handles network failure gracefully', async ({ page }) => {
  // Block API request
  await page.route('/api/data', route => route.abort());

  await page.goto('/dashboard');

  await expect(page.getByText(/failed to load/i)).toBeVisible();
  await expect(page.getByRole('button', { name: 'Retry' })).toBeVisible();
});
```

---

## Mobile-Specific Journeys

### Mobile Menu
```typescript
test('mobile menu works', async ({ page }) => {
  // Set mobile viewport
  await page.setViewportSize({ width: 375, height: 667 });
  await page.goto('/');

  // Open menu
  await page.getByRole('button', { name: 'Menu' }).click();
  await expect(page.getByRole('navigation')).toBeVisible();

  // Navigate
  await page.getByRole('link', { name: 'Products' }).click();
  await expect(page).toHaveURL('/products');
});
```

### Swipe Actions
```typescript
test('user can swipe to delete', async ({ page }) => {
  await page.goto('/inbox');

  const message = page.getByRole('listitem').first();

  // Swipe gesture
  await message.dragTo(message, {
    sourcePosition: { x: 300, y: 25 },
    targetPosition: { x: 50, y: 25 },
  });

  await page.getByRole('button', { name: 'Delete' }).click();
  await expect(message).not.toBeVisible();
});
```

---

## Accessibility Journeys

### Keyboard Navigation
```typescript
test('user can navigate with keyboard', async ({ page }) => {
  await page.goto('/');

  // Tab to first link
  await page.keyboard.press('Tab');
  await expect(page.getByRole('link', { name: 'Skip to content' })).toBeFocused();

  // Tab to navigation
  await page.keyboard.press('Tab');
  await page.keyboard.press('Tab');

  // Enter to activate
  await page.keyboard.press('Enter');
});
```

### Screen Reader Landmarks
```typescript
test('page has proper landmarks', async ({ page }) => {
  await page.goto('/');

  await expect(page.getByRole('banner')).toBeVisible();
  await expect(page.getByRole('main')).toBeVisible();
  await expect(page.getByRole('navigation')).toBeVisible();
  await expect(page.getByRole('contentinfo')).toBeVisible(); // footer
});
```
