# Agnos-Assignment-TC-LOG
Robot Framework test scripts for login and logout functionality of the AI Dashboard at Agnos Health.

**Environment Setup**

1. Make sure that Python is installed on your machine by checking through the command `python --version`. If it is not installed, you can download it from: [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Install Robot Framework using the command: `pip install robotframework`
3. Verify Robot Framework installation using the command: `robot --version`
4. Install SeleniumLibrary for web testing using the command: `pip install robotframework-seleniumlibrary`
5. Once everything is installed, clone the repository for use
6. Run the test script using the command: `robot TC-LoginLogout.robot` in the terminal

**Test Results**
The test results will include the following three files:
* `report.html` – Summary report
* `log.html` – Detailed execution steps
* `output.xml` – For integration/CI tools
