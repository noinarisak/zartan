# Contains the Terraform Scripts for Zartan in UDP Infrastructure

> WARNING: Work in Progress.

## Prereq

* [direnv](https://direnv.net/)
* [Terraform](https://www.terraform.io/docs/index.html)
* AWS

## Quick Start

Copy `.envrc.sample` to `.envrc`, update the .envrc file, and execute direnv to load environment variable

```bash
# Copy
cp .envrc.sample .envrc

# Update
vim .envrc  # Or your favorite editor

# Allow the usage
direnv allow .
```

## Usage

```bash
make help
```
