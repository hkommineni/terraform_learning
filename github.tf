terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

}