![Logo](resources/logos/128x128.png) Willow-Playground
======
[![Build Status](https://travis-ci.org/ba-st/Willow-Playground.svg?branch=master)](https://travis-ci.org/ba-st/Willow-Playground)

*Willow-Playground provides examples on how to use [Willow](https://github.com/ba-st/Willow) to develop a complete interactive web application*

## Goals
- Present the different components and features of Willow
- Offer simple interactive applications, that are both useful are clear to understand

### License:
The project source code is [MIT](LICENSE) licensed. Any contribution submitted to the code repository is considered to be under the same license.

The documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)

### Highlights:
- **Supported Platforms**: [Pharo 5 / Pharo 6](http://www.pharo.org/)
- **Source Code Repository** and **Issue Tracking**: In this GitHub repository.

### Get started!

#### Pharo 5/6

Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'WillowPlayground';
  repository: 'github://ba-st/Willow-Playground:master/source';
  load
```

You can now evaluate

```smalltalk
Smalltalks2017Presentation start
```

and go to [localhost:8080/willow101] to find an interactive tutorial.

To learn how to use Willow, you can check the applications included in this repository:
- Live Documentation: start by browsing WPLiveDocumentation. Access the application at [localhost:8080/live-docs]
- Test Runner: start by browsing WPTestRunner. Access the application at [localhost:8080/test-runner-bootstrap3]