# TLDR

We started this [while
pairin'](https://www.youtube.com/watch?v=bmi-SWeH4MA&t=2) after imagining a test
runner for Ruby that helped make sure people's test suites didn't grow into
really slow distractions by refusing to run suites longer than 1.8 seconds.

## Install

Either `gem install tldr` or add it to your Gemfile:

```
gem "tldr"
```

## Usage

Here's what a test looks like:

```ruby
class MyTest < TLDR
  def test_truth
    assert true
  end
end
```

Stick your tests in `test/**/*_test.rb` (and/or `test/**/test_*.rb`) files
and they'll be found automatically.  Same goes for a `test/helper.rb` file,
which will be loaded prior to your tests by the CLI if it exists.

Then just run the CLI:

```
$ bundle exec tldr
```

You can, of course, also just run a specific test file or glob:

```
$ bundle exec tldr test/this/one/in/particular.rb
```

### Options

Here are the CLI options:

```
$ tldr --help
Usage: tldr [options] path1 path2 ...
    -s, --seed SEED                  Seed for randomization
    -r, --reporter REPORTER          Custom reporter class (Default: "TLDR::Reporters::Default")
    -l, --load-path PATH             Add one or more paths to the $LOAD_PATH (Default: ["test"])
        --helper HELPER              Path to a test helper to load before any tests (Default: "test/helper.rb")
        --skip-test-helper           Don't try loading a test helper before the tests
    -v, --verbose                    Print stack traces for errors
```
