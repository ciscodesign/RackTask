require_relative 'colours'
task default: :listAll

ROOT = 'RackTasks'

namespace :todo do

  desc "RackTasks list init!"
  task :init do
    FileUtils.mkdir_p ROOT
    puts "RackTasks list initialized!".green
  end

  desc "List all tasks"
  task :listAll

  desc "Remove any RackTask list"
  task :clear do
    if Dir.exist?(ROOT) 
      FileUtils.remove_dir(ROOT) 
      puts "RackTasks list cleared".red
    else
      puts "No Racktask's list active, at the moment.".yellow
    end
    puts "Use init command to start new Racktask list!"

  end

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