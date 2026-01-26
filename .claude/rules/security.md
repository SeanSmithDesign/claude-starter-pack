# Security Rules (Always Active)

These rules enforce Privacy by Design and secure coding practices.

## Secrets & Credentials

- **NEVER** hardcode: API keys, passwords, tokens, credentials, private keys
- **ALWAYS** use: Environment variables, keychain, secrets managers
- **Flag patterns**: `api_key = "`, `password = "`, `secret = "`, `token = "`

### Swift/iOS Specifics
- Use Keychain Services for sensitive data
- Never store secrets in UserDefaults
- Use App Transport Security (ATS) - no HTTP exceptions without justification

### Environment Variables
```swift
// ✅ Good
guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
    fatalError("API_KEY not set")
}

// ❌ Bad
let apiKey = "sk-1234567890abcdef"
```

## PII (Personally Identifiable Information)

- **NEVER** log: Email, phone, SSN, IP addresses, location, biometrics
- **ALWAYS**: Redact before logging, hash identifiers, use pseudonymization
- **Flag patterns**: Email regex `\S+@\S+`, phone patterns, SSN format

### Before Sending to LLMs
- Tokenize or redact PII before any AI/LLM processing
- Never include raw user data in prompts or logs

## Authentication & Authorization

- Use httpOnly cookies for web tokens
- Implement proper session management
- Hash passwords with bcrypt (cost >= 10) or Argon2
- Never store plaintext passwords
- Validate authorization on every request

## Data Protection

- Encrypt sensitive data at rest (AES-256)
- Use TLS 1.3 for data in transit
- Implement proper key rotation
- Follow data minimization - collect only what's needed

## Input Validation

- Validate all user input at system boundaries
- Sanitize before database queries (prevent SQL injection)
- Encode output to prevent XSS
- Use parameterized queries

## iOS/macOS Specifics

- Enable App Sandbox
- Request only necessary permissions
- Use Data Protection API for sensitive files
- Implement certificate pinning for critical APIs

## Quick Checklist

- [ ] No hardcoded secrets
- [ ] PII redacted from logs
- [ ] Passwords properly hashed
- [ ] Input validated at boundaries
- [ ] Data encrypted at rest
- [ ] TLS for all network calls
- [ ] Minimal permission requests
