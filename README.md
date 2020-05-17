<p align="center"><img src="assets/logos/128x128.png">
 <h1 align="center">Willow-Playground</h1>
  <p align="center">
    Willow-Playground provides examples on how to use <a href="https://github.com/ba-st/Willow">Willow</a> to develop a complete interactive web application
    <br>
    <a href="docs/"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/ba-st/Willow-Playground/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/ba-st/Willow-Playground/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![GitHub release](https://img.shields.io/github/release/ba-st/Willow-Playground.svg)](https://github.com/ba-st/Willow-Playground/releases/latest)
[![Build Status](https://github.com/ba-st/Willow-Playground/workflows/Build/badge.svg?branch=release-candidate)](https://github.com/ba-st/Willow-Playground/actions?query=workflow%3ABuild)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)

## Goals
- Present the different components and features of Willow
- Offer simple interactive applications, that are both useful are clear to understand

## License
- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Quick Start

- Download the latest [Pharo 32](https://get.pharo.org/) or [64 bits VM](https://get.pharo.org/64/).
- Load the latest playground version with

```smalltalk
Metacello new
	baseline: 'WillowPlayground';
	repository: 'github://ba-st/Willow-Playground:release-candidate/source';
	load.
```

You can now evaluate

```smalltalk
Smalltalks2017Presentation start
```

and go to [localhost:8080/willow101](http://localhost:8080/willow101) to find an interactive tutorial.

To learn how to use Willow, you can check the applications included in this repository:
- Live Documentation: start by browsing WPLiveDocumentation. Access the application at [localhost:8080/live-docs](http://localhost:8080/live-docs)
- Test Runner (Boostrap 3): start by browsing WPB3TestRunner. Access the application at [localhost:8080/test-runner-bootstrap3](http://localhost:8080/test-runner-bootstrap3)
- Test Runner (Boostrap 4): start by browsing WPB4TestRunner. Access the application at [localhost:8080/test-runner-bootstrap4](http://localhost:8080/test-runner-bootstrap4)

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)
