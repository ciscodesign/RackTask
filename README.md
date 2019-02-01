
# RackTask
The idea is simple: rake commands to build and manage a todo list

## NEXT FEATURES
- add git configuration to save tasks on private repo
- add projects

`RackTask` is a minimal task manager, built in rake. For Geek only :P

## Available commands
`rake -T`

- `archive[id]`   # Tag a task as [ARCHIVED]_
- `clear `        # Remove any RackTask list
- `complete[id]`  # Tag a task as [COMPLETED]_
- `delete[id]`    # Delete task
- `init`          # RackTasks list init
- `list`          # List all tasks
- `new`           # Crea nuovo task
- `reset[id]`     # Remove STATES tag
- `start[id]`    # Tag a task as [STARTED]_
- `watch[id]`     # Open in terminal the task

## IMPORTANT
To run rake tasks with parameters on zsh terminal you have to use syntax like:
` rake "rt:complete[id]"`


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Requests
Feel free to ask for new features, I will try to do my best! ;)

