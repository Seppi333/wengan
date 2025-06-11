# Proposed Code Improvements

The following tasks could improve the maintainability and usability of Wengan:

1. **Automated testing** - Integrate the existing `t/` tests with a continuous integration service such as GitHub Actions so tests run on every commit.
2. **Containerized environment** - Provide a Dockerfile or Conda recipe to simplify installing all dependencies and running the pipeline.
3. **Enhanced documentation** - Expand usage instructions and document each pipeline mode in more detail.
4. **Scalability enhancements** - Add support for genomes larger than 4&nbsp;Gb, relaxing the current limitation.
5. **Improved error handling** - Validate required binaries and provide clearer messages when dependencies are missing.
6. **Additional unit tests** - Increase test coverage for modules under `perl/Wengan` to catch regressions.
7. **Refined build system** - Consider replacing the generated makefile with a more robust build process.

