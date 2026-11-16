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

## Test reports

Robot Framework writes its output, log, and HTML report to `reports`. To also
produce an Allure report locally, install the Allure 2 CLI and Java 8 or later.
The Python listener is already included in `requirements.txt`. See the
[Allure installation guide](https://allurereport.org/docs/v2/install/) for
platform-specific instructions.

Run the following from the project root with the virtual environment active.
Each run uses a separate Allure results directory to avoid mixing old results.
These commands execute the real API tests, which create and delete test data;
use `--dryrun` only to check configuration, not to report actual test results.

**Windows (PowerShell):**

```powershell
$runId = [guid]::NewGuid().ToString("N")
$results = "output\allure\$runId"
$report = "allure-report\$runId"
robotcode robot --listener "allure_robotframework:$results"
$testExitCode = $LASTEXITCODE
if (-not (Get-ChildItem -Path $results -Filter "*-result.json" -ErrorAction SilentlyContinue)) {
    throw "No Allure test results were generated. Check the Robot output."
}
allure generate --single-file $results -o $report
if ($LASTEXITCODE -ne 0) { throw "Allure report generation failed." }
allure open $report
```

**Linux / macOS:**

```bash
run_id=$(python -c 'import uuid; print(uuid.uuid4().hex)')
results="output/allure/$run_id"
report="allure-report/$run_id"
if robotcode robot --listener "allure_robotframework:$results"; then
    test_exit_code=0
else
    test_exit_code=$?
fi
if [ ! -d "$results" ] || [ -z "$(find "$results" -name '*-result.json' -print -quit)" ]; then
    echo "No Allure test results were generated. Check the Robot output." >&2
else
    allure generate --single-file "$results" -o "$report" && allure open "$report"
fi
```

Generate the report even if tests fail; the saved test exit code indicates the
test outcome independently of report generation. CI publishes the Allure HTML
report to GitHub Pages for runs on `main`, even after test failures when results
are available. The deployment job summary links to the report; a newer run
replaces the previous report. Pull requests do not publish to the shared site.
Set the repository's Pages source to **GitHub Actions** and ensure the
`github-pages` environment permits deployments from `main`. Published reports
may be public and may contain test data.

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

