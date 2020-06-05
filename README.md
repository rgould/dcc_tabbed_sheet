# DccTabbedSheet

Maintain and compile the DCC Tabbed Sheet for Roll20. The original HTML file on Roll20 is 11k lines long and is difficult to maintain. This project uses some libraries from Ruby on Rails (ActionView specifically), to make it possible to build the HTML for the character sheet using ERB. This lets us break the file up into multiple files, organize it in a maintainable manner, and reuse sections without duplicating the code.

## Usage

Fork this repo, then look at the files in `views/` to see how the HTML is built. Make changes as you see fit, and then run `./bin/compile` to compile the source files into one single HTML file. This file will then be available in the `build/` directory. Copy this file into your game in roll20 to test it. If you want to publish your changes to the main roll20 repo itself, then you can copy this file into that repo, and make a pull request as normal.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

## TODO

* Separate the compilation mechanism from the DCC Tabbed Sheet specifically. This should be something any sheet can use, not just the DCC one
* A script to quickly copy the build result into the roll20-character-sheets repo and push it to GitHub
* A mechanism to quickly upload the build result to a game on roll20 (faster testing!)
* An "emulator" so that you can run the character sheet locally while developing
* A similar mechanism for compiling CSS files

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rgould/dcc_tabbed_sheet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rgould/dcc_tabbed_sheet/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

The original code for the character sheet itself is pulled from the [roll20-character-sheets repository](https://github.com/Roll20/roll20-character-sheets).

## Code of Conduct

Everyone interacting in the DccTabbedSheet project's codebases and issue trackers is expected to follow the [code of conduct](https://github.com/rgould/dcc_tabbed_sheet/blob/master/CODE_OF_CONDUCT.md).
