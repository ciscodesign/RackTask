require 'rake/clean'
task default: :listAll

namespace :todo do
  desc "Crea la cartella TASKS se non esiste già una"
  task :createList do
    # esiste la cartella Tasks?
    # se non esiste => la creo
  end

  desc "Lista tutti i task"
  task :listAll

  desc "Elimina tutti i task"
  task :cleanAll

  namespace :note do

    desc 'Crea nuovo task'
    task :new,[:description]

    desc "Elimina task"
    task :delete,[:id]

    desc "Apre nell'editor di default task"
    task :watch,[:id]

    desc "Segnala come iniziato il task"
    task :start,[:id]

    desc "Segnala come completato il task"
    task :complete,[:id]

  end


end