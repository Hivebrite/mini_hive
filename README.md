# Mini Hive

## Getting Started
on replit:
- click on "create Repl"
- choose option to "Import from github"
- copy this repo's url `github.com/Hivebrite/mini_hive`
- once the repl is imported, run this command in the shell tab `bin/setup_replit`

## Things to watchout for maintenance
- Watchout for CPU and memory usage
- avoid adding gems to the project, especially ones with C dependencies. since it consumes memory, increase boot time, and C compilation is slow, and taxing on the CPU

## Replit considerations

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. We only made a couple changes to make to run it on Replit:

- bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
- allow `*.repl.co` hosts (see `config/environments/development.rb`)
- allow the app to be iframed on `replit.com` (see `config/application.rb`)

### Running the app

Simply hit run! You can edit the run command from the `.replit` file.

### Running commands

Start every command with `bundle exec` so that it runs in the context of the installed gems environment. The console pane will give you output from the server but you can run arbitrary commands from the shell without stopping the server.
