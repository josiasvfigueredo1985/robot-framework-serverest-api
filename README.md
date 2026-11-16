Architecture for API testing with Robot Framework

Target: serverest.dev
Programming Language: Python

## Install dependencies

The pinned dependencies in `requirements.txt` are a snapshot of the project's
virtual environment, tested locally with Python 3.15 on Windows. Use the same
Python version when possible; installation on Linux and macOS has not been
verified with this snapshot.

From the project root, create and activate a virtual environment:

**Windows (PowerShell):**

```powershell
py -3.15 -m venv .venv
.\.venv\Scripts\Activate.ps1
```

**Linux / macOS:**

```bash
python3.15 -m venv .venv
source .venv/bin/activate
```

With the environment active, install and check the pinned packages:

```shell
python -m pip install -r requirements.txt
python -m pip check
robotcode discover info
robotcode robot --dryrun --output NONE --log NONE --report NONE
```

In VS Code, select `.venv` as the Python interpreter so the editor and terminal
resolve the same libraries. To leave the environment, run `deactivate`.

The snapshot includes the Allure Robot Framework listener used by CI. The
standalone Allure CLI is only needed to generate Allure reports; it is not
installed by pip. RobotCode 1.0.0's static analyzer currently crashes with
Robot Framework 7.5.1; the dry-run above checks keyword resolution but is not
a replacement for a successful static analysis or live API tests.

To refresh the snapshot after intentionally changing dependencies, run these
commands from the active project environment:

```shell
python -m pip check
python -c "import pathlib, subprocess, sys; pathlib.Path('requirements.txt').write_bytes(subprocess.check_output([sys.executable, '-m', 'pip', 'freeze']))"
```

Then validate the project and review the diff. `pip freeze` includes every
package installed in that environment, including development tools.

## Code organization and imports

- `src/business` contains API models, factories, requests, schemas, steps, and hooks.
- `src/framework` contains shared REST, test-data, and utility resources.
- `src/tests` contains the Robot Framework suites and shared test resources.

The `python-path` in `robot.toml` exposes `src` as the root for absolute Python
imports. Keep imports rooted at `business` or `framework`; do not modify
`sys.path` inside individual libraries. Import project-owned Robot libraries
by their fully qualified class name (for example,
`framework.utils.rest_api_utils.RestApiUtils`) so keyword discovery works across
Robot Framework and RobotCode versions. Robot resource imports remain relative
to the importing `.resource` or `.robot` file.

Portuguese endpoint paths, JSON keys, and API response messages are retained
where required by the Serverest API contract.

