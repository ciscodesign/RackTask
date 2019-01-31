
# SimpleToDo
The idea is simple: rake commands to build a todo list
Il comando di CREA nuovo task, crea un nuovo file txt con la descrizione base del task.
Per vedere i task listo i file della cartella
per mettere un task come fatto, come aggiungo il prefisso [DONE] al task
per mettere un task come iniziato, come aggiungo il prefisso [STARTED] al task
ogni volta che aggiorno il file, aggiungo alla fine una riga di testo con la datetime attuale

CLEAN = FileList['deployment_dir/**/*'].exclude('*.txt')



## ROADMAP

[] add basic features
[] release 1.0 
[] add git configuration
[] add colours! 



# rake-notes

`rake notes` task for non-Rails' projects (heavily based on Rails' one ;)

## Installation

Add this line to your application's Gemfile:

    gem 'rake-notes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-notes

And add this line to your project's Rakefile:

    require 'rake/notes/rake_task'


## Acknowledgement

Special thanks to everyone that contributed to the original
[Rails' code](https://github.com/rails/rails/blob/master/railties/lib/rails/source_annotation_extractor.rb)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request