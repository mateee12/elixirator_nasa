# install dependencies
- install ruby specified in Gemfile
- make sure correct ruby version is active `ruby -v`
- install gems `bundle install`
- make sure `./app.rb` file is executable, e.g.: `chmod +x ./app.rb`
- run tests to check local env setup is correct `bundle exec rspec`

# example of usages
It is possible to customize directive options in this script.
You can pass list of desired directives for fuel consumption calculation

### see list of accessible commands
command `./app.rb`

### details of specific calculate_consumption action
command `./app.rb help calculate_consumption`


output
```
Usage:
  app.rb calculate_consumption -d, --directive=DIRECTIVE ARG1 ARG2 -m, --input-mass=MASS

Options:
  -m, --input-mass=MASS                
  -d, --directive=DIRECTIVE ARG1 ARG2  # Repeatable, name of directive and its arguments
	DIRECTIVE enum: (launch, land)
	example: launch 9.807

calculate fuel consumption for space mission
example: `calculate_consumption -m 28801 -d launch 9.807 -d land 1.62`                                                                                              # Describe available commands or one specific command
```

### Example of Task command!!!
`calculate_consumption` is default action so you can skip its name entirely
- `./app.rb -m 28801 -d launch 9.807 -d land 1.62 -d launch 1.62 -d land 9.807`


# Application Architecture

## Layered Architecture
app.rb and content in /lib folder is following **layered architectural pattern**.
![Alt text](elixirator_nasa.drawio.png?raw=true "Application Layered pattern")

## Design Patterns
- Pipeline - used for fuel consumption calculation as main class component
- Template Method - used in CumulativeBase class where `process` method  
  represents template method and `calculate_iteration` required operation
  for override
