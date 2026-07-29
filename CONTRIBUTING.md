# Contributing

Thank you for your interest in contributing.

## Development Workflow

1. Fork the repository.
2. Create a feature branch from `main`.
3. Implement your changes.
4. Run local validation.
5. Commit using clear commit messages.
6. Open a Pull Request.

## Branch Naming

Examples:

- feat/add-vpc-module
- fix/security-group-validation
- docs/update-readme
- chore/update-dependencies

## Commit Messages

This project follows Conventional Commits.

Examples:

- feat: add VPC module
- fix: correct IAM policy validation
- docs: improve README
- chore: update tooling

## Before Opening a Pull Request

Ensure the following pass successfully:

- Terraform formatting
- Terraform validation
- tflint
- pre-commit hooks

## Pull Requests

Please include:

- Summary of changes
- Motivation
- Testing performed
- Related issue (if applicable)

## Code Style

- Write reusable modules.
- Keep documentation updated.
- Prefer simplicity over complexity.
- Follow Terraform best practices.
