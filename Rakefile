
ROOT    = 'tasks'
STATES  = ["[STARTED]_", "[COMPLETED]_", "[ARCHIVED]_"] 

require_relative 'colours'
require_relative 'helpers'
require_relative 'note'

task default: :listAll
LAST_ID = files_number + 10

namespace :rt do

  desc "RackTasks list init!"
  task :init do
    unless Dir.exist?(ROOT)
      FileUtils::Verbose.mkdir_p ROOT
      puts "RackTasks list initialized!".green
    else
      puts "You already have a task list!\nUse <list> command to see all tasks"
    end
  end

  desc "List all tasks"
  task :list do
    files = Rake::FileList["#{ROOT}/*"]

    if files.count > 0 
      puts files.each{|f| f.slice!("tasks/")} 
    else
      puts "\nNothing to do, buddy! Have fun!\n\n"
    end
  end

  desc "Remove any RackTask list"
  task :clear do
    if Dir.exist?(ROOT) 
      delete_folder(ROOT)
    else
      puts "No Racktask's list active, at the moment.".yellow
    end
    puts "Use init command to start a new Racktask list!"

  end


end