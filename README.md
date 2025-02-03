# Testing Project with Robot Framework 
### Serverest - API Level
- This project uses Robot Framework to test the Serverest API at the API level.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/robot-framework-serverest-api.git
    ```
2. Navigate to the project directory:
    ```sh
    cd robot-framework-serverest-api
    ```
3. Install the required dependencies:
    ```sh
    pip install -r requirements.txt
    ```

## Folder Structure

```
robot-framework-serverest-api/
├── tests/                  # Test cases
│   ├── login_tests.robot   # Login related tests
│   ├── user_tests.robot    # User related tests
│   └── ...                 # Other test files
├── resources/              # Resource files
│   ├── keywords/           # Custom keywords
│   ├── variables/          # Variable files
│   └── ...                 # Other resource files
├── reports/                # Test reports
├── logs/                   # Log files
├── README.md               # Project documentation
└── requirements.txt        # Project dependencies
```