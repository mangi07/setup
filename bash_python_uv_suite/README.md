# Bash Python UV Suite

A collection of Bash functions for organizing, selecting, monitoring, and using Python virtual environments managed through `uv`.

The suite is designed around the idea that a virtual environment is associated with a dedicated directory under:

```text
$HOME/.venvs
```

Rather than creating environments ad hoc throughout the filesystem, this suite provides a consistent workflow for:

- Creating environment directories
- Selecting the active environment location
- Displaying the current environment configuration
- Checking environment status
- Fuzzy-selecting environments with `fzy`
- Activating environments when needed

## Philosophy

This suite distinguishes between:

1. An environment directory
2. A Python virtual environment

Creating an environment directory does not automatically create a Python virtual environment.

For example:

```bash
uv-env-create assetdb
```

creates:

```text
~/.venvs/assetdb
```

and sets:

```bash
UV_PROJECT_ENVIRONMENT=~/.venvs/assetdb
```

However, the directory remains empty until a UV command such as:

```bash
uv sync
```

or

```bash
uv venv
```

creates and populates the actual virtual environment.

## Included Commands

```text
uv-env-create
uv-env-set
uv-env-pick
uv-env-current
uv-env-status
uv-env-activate
```

### uv-env-create

Creates a new environment directory under `$HOME/.venvs`.

### uv-env-set

Sets `UV_PROJECT_ENVIRONMENT` to the selected environment directory.

### uv-env-pick

Interactively selects an environment using `fzy` and then calls `uv-env-set`.

### uv-env-current

Displays the current value of `UV_PROJECT_ENVIRONMENT`.

### uv-env-status

Displays information such as:

- Current environment directory
- Whether the directory exists
- Whether a virtual environment has been created
- Whether a virtual environment is currently activated

### uv-env-activate

Activates the currently selected virtual environment.

## Requirements

### UV

Install and configure `uv`.

### fzy

Install `fzy` for fuzzy environment selection.

## Recommended Load Chain

Example layout:

```text
~/.bashrc
~/.bash_functions
~/.bash_uv_env
```

### .bashrc

```bash
source ~/.bash_functions
```

### .bash_functions

```bash
[[ -f ~/.bash_uv_env ]] && source ~/.bash_uv_env
```

### .bash_uv_env

Contains all functions belonging to this suite.

Benefits:

- Better organization
- Easier maintenance
- Easier syntax checking
- Independent reloading during development

Syntax check:

```bash
bash -n ~/.bash_uv_env
```

Reload after edits:

```bash
source ~/.bash_uv_env
```

## Typical Workflow

```bash
uv-env-create assetdb
uv-env-current
uv sync
uv-env-activate
nvim
```

Or switch environments interactively:

```bash
uv-env-pick
```

