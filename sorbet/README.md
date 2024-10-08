
## About Sorbet

Sorbet is a fast, powerful type checker designed for Ruby, providing gradual static type checking to improve code safety and readability. It allows developers to annotate their Ruby code with types, which Sorbet then uses to catch type errors and inconsistencies at compile time, before code is run.


### RBI files

> RBI files are purely annotations files, separate from Ruby source code. While tapioca init can automatically create these files, it’s not a perfect process. To eliminate constant errors, sometimes Sorbet requires hand-written RBI files. -- https://sorbet.org/docs/adopting#step-4-fix-constant-resolution-errors

#### Checking for missing RBI files

```bash
  $ bin/tapioca gem --verify
```

Followed by `bundle exec srb tc` for a thorough type checking.


#### A note about vendoring RBIs

> **You might have noticed that we** vendor all gems’ RBI files into the current directory, and **commit them to version control**. Why? When developing RBI files for Sorbet, we referenced the prior art that Flow developed. Our reasoning is the same as theirs:
>
> When an RBI is improved or updated, there’s some chance that the change could introduce new Sorbet errors into the project. As good as it is to find new issues, **we also want to make sure that Sorbet errors in a project are consistent and predictable over time**.
>
> So if/when we wish to upgrade an RBI that we’ve already checked in to our project’s version control, we can do so explicitly with the related Tapioca command. -- https://sorbet.org/docs/rbi#a-note-about-vendoring-rbis


## Initializing with Tapioca

> All files generated by tapioca init (including bin/tapioca) should be committed to source control, including the entire sorbet directory. Optionally, sorbet/rbi/hidden-definitions/errors.txt can be ignored (eg. .gitignore). It is essentially a debug log for sorbet maintainers and is not needed at runtime. -- https://sorbet.org/docs/adopting#step-6-source-control
>

### Post-init notice

```bash
$ bundle exec tapioca init

...

The sorbet/ folder should exist and look something like this:

├── config             # Default options to be passed to Sorbet on every run
└── rbi/
  ├── annotations/     # Type definitions pulled from the rbi-central repository
  ├── gems/            # Autogenerated type definitions for your gems
  └── todo.rbi         # Constants which were still missing after RBI generation
└── tapioca/
  ├── config.yml       # Default options to be passed to Tapioca
  └── require.rb       # A file where you can make requires from gems that might be needed for gem RBI generation

Please check this folder into version control.

🤔 What's next

1. Many Ruby applications use metaprogramming DSLs to dynamically generate constants and methods.
  To generate type definitions for any DSLs in your application, run:

  bin/tapioca dsl

2. Check whether the constants in the sorbet/rbi/todo.rbi file actually exist in your project.
  It is possible that some of these constants are typos, and leaving them in todo.rbi will
  hide errors in your application. Ideally, you should be able to remove all definitions
  from this file and delete it.

3. Typecheck your project:

  bundle exec srb tc

  There should not be any typechecking errors.

4. Upgrade a file marked "# typed: false" to "# typed: true".
  Then, run: bundle exec srb tc and try to fix any errors.

  You can use Spoom to bump files for you:

  spoom bump --from false --to true

  To learn more about Spoom, visit: https://github.com/Shopify/spoom

5. Add signatures to your methods with sig. To learn how, read: https://sorbet.org/docs/sigs

Documentation
We recommend skimming these docs to get a feel for how to use Sorbet:
- Gradual Type Checking: https://sorbet.org/docs/gradual
- Enabling Static Checks: https://sorbet.org/docs/static
- RBI Files: https://sorbet.org/docs/rbi
```

### The TODO RBI file

> If after inspecting a constant in the TODO RBI file you’re sure it should always exist at runtime, **feel free to move it out of the TODO RBI file** and into a hand-written RBI file. -- https://sorbet.org/docs/rbi#the-todo-rbi-file


## References

### Links

- https://sorbet.org/docs/overview
- [Sorbet: Stripe's Type Checker for Ruby](https://stripe.com/blog/sorbet-stripes-type-checker-for-ruby) - [discussion](https://news.ycombinator.com/item?id=30833555)
- [Adopting Sorbet in an Existing Codebase](https://sorbet.org/docs/adopting)
- [Playground for Sorbet Type Checker](https://sorbet.run/#%23%20typed%3A%20true%0Amodule%20A%3B%20end%0Amodule%20B%3B%20end%0A%20%20%0Adef%20x%0A%20%20rand.round%20%3D%3D%200%20%3F%20A%20%3A%20B%0Aend%0A%20%20%0Aclass%20Main%0A%20%20include%20x%0Aend)
-

## Hacks

### Updating RBI files for new gems

Run `bin/tapioca gem` to create and/or update RBI files for new ruby dependencies. If there no missing RBI files, the command fast-exits. If there are and it continues to load the require.rb file you may encounter a `LoadError: cannot load such file -- onetime` error. To fix this, add the following code to the top of the require.rb file:

```ruby
# Add the lib directory to the $LOAD_PATH explicitly using a relative path
lib_path = File.expand_path('../../../lib', __FILE__)
$LOAD_PATH.unshift(lib_path)

# Debugging output to verify $LOAD_PATH
puts "Current $LOAD_PATH:"
puts $LOAD_PATH[0..2], '...'
```

**Error example**
```
 ❯ bundle exec tapioca gem
Removing RBI files of gems that have been removed:

  Nothing to do.

Generating RBI files of gems that are added or updated:

Requiring all gems to prepare for compiling...

LoadError: cannot load such file -- onetime

Tapioca could not load all the gems required by your application.
If you populated sorbet/tapioca/require.rb with `bin/tapioca require`
you should probably review it and remove the faulty line.
```
