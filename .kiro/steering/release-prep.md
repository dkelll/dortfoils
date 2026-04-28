---
inclusion: manual
---

# Release Manifest Prep

## Instructions

Use the `glab` CLI to pull all MRs tied to a specific GitLab label.

Before starting:
1. Ask the user which **GitLab label** to filter MRs by
2. Confirm the manifest file to use — currently detected at `manifest/sgv_package.xml`
3. Ask the user which **target branch** the release MR should merge into
4. Comment all metadata members in the manifest from #2. The types and names can remain uncommented.

## Goal

Merge all uncommented lines from the MR manifest files into the local branch manifest. Commented lines (`<!--` or `#`-prefixed) must be excluded. The result is a unified manifest with every deployable component from all MRs.

## Steps

1. **Prep the manifest**
   - Fetch all open MRs with the specified label via `glab`
   - For each MR, retrieve its version of the manifest file
   - Collect all uncommented lines across all MR manifests
   - Update the local manifest to include all those lines (no duplicates, no commented lines)

2. **Commit and push**
   - Commit the manifest changes with a clear message, using the commit format `[major|minor|patch](release): [version] Release`, ex minor(release): 2026.3.0 Release
   - Push to remote

3. **Create the MR**
   - Create a GitLab MR targeting the specified release branch via `glab`
   - Monitor the pipeline for success or error
   - Create a list of all squash commit messages on the branch, but only if they were tagged with our tag
   - Add this list of commit messages to the MR Description

4. **Iterate on errors**
   - If the pipeline fails, report the errors to the user
   - Ask before making any changes
   - After approval: fix, commit, push, monitor pipeline
   - Repeat until pipeline succeeds

## Tools
- `glab` — GitLab CLI (MR listing, file retrieval, MR creation, pipeline monitoring)
- `git` — commits and pushes
- `sf` — Salesforce CLI if needed for validation
