---
name: playwright-e2e
description: End-to-end testing with Playwright for browser automation, user journey validation, and visual regression testing. Use when writing E2E tests, automating user flows, or when user mentions Playwright, E2E, end-to-end, browser testing, or visual regression.
license: MIT
metadata:
  version: 1.0.0
  category: testing
  domain: e2e-testing
  platforms: Web
  techStack: Playwright, TypeScript
---

# Playwright E2E Testing

End-to-end testing that validates real user journeys through your application.

## Core Philosophy

E2E tests should:
- Test **user journeys**, not implementation details
- Run fast enough to be part of CI
- Be resilient to minor UI changes
- Catch real bugs, not flaky failures

## Quick Start

### Setup
```bash
npm init playwright@latest
```

### Basic Test Structure
```typescript
import { test, expect } from '@playwright/test';

test('user can complete checkout', async ({ page }) => {
  // Navigate
  await page.goto('/products');

  // Interact
  await page.getByRole('button', { name: 'Add to cart' }).click();
  await page.getByRole('link', { name: 'Checkout' }).click();

  // Fill form
  await page.getByLabel('Email').fill('test@example.com');
  await page.getByRole('button', { name: 'Complete order' }).click();

  // Assert
  await expect(page.getByText('Order confirmed')).toBeVisible();
});
```

## Locator Best Practices

### Preferred (Resilient)
```typescript
// Role-based (best)
page.getByRole('button', { name: 'Submit' })
page.getByRole('heading', { name: 'Welcome' })
page.getByRole('link', { name: 'Sign in' })

// Label-based (forms)
page.getByLabel('Email address')
page.getByPlaceholder('Enter your email')

// Text-based (content)
page.getByText('Order confirmed')
page.getByTitle('Close dialog')

// Test ID (last resort)
page.getByTestId('submit-button')
```

### Avoid (Fragile)
```typescript
// ❌ CSS selectors
page.locator('.btn-primary')
page.locator('#submit-btn')

// ❌ XPath
page.locator('//button[@class="submit"]')

// ❌ Implementation details
page.locator('[data-reactid="123"]')
```

## Page Object Model

### Define Page Objects
```typescript
// pages/checkout.page.ts
import { Page, Locator } from '@playwright/test';

export class CheckoutPage {
  readonly page: Page;
  readonly emailInput: Locator;
  readonly submitButton: Locator;
  readonly confirmationMessage: Locator;

  constructor(page: Page) {
    this.page = page;
    this.emailInput = page.getByLabel('Email');
    this.submitButton = page.getByRole('button', { name: 'Complete order' });
    this.confirmationMessage = page.getByText('Order confirmed');
  }

  async fillEmail(email: string) {
    await this.emailInput.fill(email);
  }

  async submit() {
    await this.submitButton.click();
  }

  async expectConfirmation() {
    await expect(this.confirmationMessage).toBeVisible();
  }
}
```

### Use in Tests
```typescript
import { CheckoutPage } from './pages/checkout.page';

test('checkout flow', async ({ page }) => {
  const checkout = new CheckoutPage(page);

  await page.goto('/checkout');
  await checkout.fillEmail('test@example.com');
  await checkout.submit();
  await checkout.expectConfirmation();
});
```

## User Journey Patterns

### Authentication Flow
```typescript
test('user can sign in', async ({ page }) => {
  await page.goto('/login');

  await page.getByLabel('Email').fill('user@example.com');
  await page.getByLabel('Password').fill('password123');
  await page.getByRole('button', { name: 'Sign in' }).click();

  // Verify logged in state
  await expect(page.getByRole('button', { name: 'Account' })).toBeVisible();
});
```

### Form Submission
```typescript
test('user can submit contact form', async ({ page }) => {
  await page.goto('/contact');

  await page.getByLabel('Name').fill('John Doe');
  await page.getByLabel('Email').fill('john@example.com');
  await page.getByLabel('Message').fill('Hello!');
  await page.getByRole('button', { name: 'Send' }).click();

  await expect(page.getByText('Message sent')).toBeVisible();
});
```

### Navigation Flow
```typescript
test('user can navigate to product details', async ({ page }) => {
  await page.goto('/products');

  await page.getByRole('link', { name: 'Blue T-Shirt' }).click();

  await expect(page).toHaveURL(/\/products\/blue-t-shirt/);
  await expect(page.getByRole('heading', { name: 'Blue T-Shirt' })).toBeVisible();
});
```

## Visual Regression Testing

### Screenshot Comparison
```typescript
test('homepage visual regression', async ({ page }) => {
  await page.goto('/');

  // Full page screenshot
  await expect(page).toHaveScreenshot('homepage.png');

  // Element screenshot
  await expect(page.getByRole('navigation')).toHaveScreenshot('nav.png');
});
```

### Update Snapshots
```bash
npx playwright test --update-snapshots
```

## Configuration

### playwright.config.ts
```typescript
import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,

  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },

  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'firefox', use: { ...devices['Desktop Firefox'] } },
    { name: 'webkit', use: { ...devices['Desktop Safari'] } },
    { name: 'mobile', use: { ...devices['iPhone 13'] } },
  ],

  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:3000',
    reuseExistingServer: !process.env.CI,
  },
});
```

## Running Tests

```bash
# Run all tests
npx playwright test

# Run specific file
npx playwright test checkout.spec.ts

# Run in headed mode (see browser)
npx playwright test --headed

# Run in UI mode (interactive)
npx playwright test --ui

# Debug mode
npx playwright test --debug

# Generate report
npx playwright show-report
```

## Anti-Patterns to Avoid

### ❌ Testing Implementation
```typescript
// Bad: Testing React state
await expect(page.locator('[data-state="open"]')).toBeVisible();

// Good: Testing user-visible behavior
await expect(page.getByRole('dialog')).toBeVisible();
```

### ❌ Arbitrary Waits
```typescript
// Bad
await page.waitForTimeout(3000);

// Good: Wait for specific condition
await page.waitForResponse('/api/data');
await expect(page.getByText('Loaded')).toBeVisible();
```

### ❌ Overly Specific Selectors
```typescript
// Bad
page.locator('div.container > ul.list > li:nth-child(2) > button');

// Good
page.getByRole('listitem').filter({ hasText: 'Item 2' }).getByRole('button');
```

## CI Integration

### GitHub Actions
```yaml
- name: Run Playwright tests
  run: npx playwright test
  env:
    CI: true

- name: Upload report
  if: always()
  uses: actions/upload-artifact@v3
  with:
    name: playwright-report
    path: playwright-report/
```

## References

- `references/user-journey-patterns.md` - Common test patterns
- `references/debugging-guide.md` - Debugging flaky tests

## Keywords

Playwright, E2E, end-to-end testing, browser testing, visual regression, user journey, test automation, Page Object Model, web testing
