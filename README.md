## Robot Automation Test for Jupiter Toys

### URL: https://jupiter.cloud.planittesting.com

### Test Cases:
1. Validation of error messages for required fields 
2. Running test multiple times to check the stability of the site
3. Verification of product prices and cart computations

## Tools used in this Project:
- I used Robot Framework and python in creating the automation test.
- Library used is Selenium.
- IDE used is PyCharm

## Project Structure: 
I used the Page Object Model design to create the structure of the framework. 
This helps us to maintain page elements in a separate file.

## How to run the code:
#### Pre-requisites
1. Python
2. [RobotFramework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installing-using-pip)
3. [SeleniumLibrary](https://pypi.org/project/robotframework-seleniumlibrary/)

#### Steps
1. Navigate to root folder of the project (ex.`C:\Users\Karla\PycharmProjects\Planit-Karla`)
2. Run the Test Suite using the code below  
`robot .`
3. Once execution is done, the output, logs and reports location will be available in the console
```
Output:  C:\Users\Karla\PycharmProjects\Planit-Karla\output.xml
Log:     C:\Users\Karla\PycharmProjects\Planit-Karla\log.html
Report:  C:\Users\Karla\PycharmProjects\Planit-Karla\report.html
```
** [pabot](https://pabot.org/) can be used to run robot test cases in parallel
    

## CI/CD:
 To demonstrate how the project can be integrated with CI/CD, I created a Jenkins server on my local machine 
and a script that would execute the test suite (`run.bat`).