Architecture for API testing with Robot Framework

Target: serverest.dev
Programming Language: Python

## Install dependencies

On Windows and Linux, install the cross-platform dependencies with:

```shell
python -m pip install -r requirements.txt
```

On macOS, install the macOS dependencies with:

```shell
python -m pip install -r requirements-macos.txt
```

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

