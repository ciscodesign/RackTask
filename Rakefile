require_relative 'colours'
require_relative 'note'

task default: :listAll

def files_number
  Rake::FileList["#{ROOT}/*"].count * 10
end

def get_id(filename)
  filename[0,2]
end

def write_content(file,content)
  File.open(file, "a") do |f|
    f << content
    f << "\n\n"
  end
end

def find_task(id)
  puts "searching for #{id}..."
  result = false
  Rake::FileList["#{ROOT}/*"].each do |f| 
    compare = f
    compare.slice!("tasks/")
    if get_id(compare).eql? id
      result = f
      break
    end

  end
  result
end

def delete_folder(foldername)

  #Are you sure?
  # Loop until the user supplies a valid option
  begin
    STDOUT.puts "Are you sure to delete #{foldername}? (y/n)"
    input = STDIN.gets.strip.downcase
  end until %w(y n).include?(input)

  if input == 'y'
    folder_path = (foldername.equal? ROOT) ? ROOT : "#{ROOT}/#{foldername}"
    FileUtils::Verbose.remove_dir folder_path
    puts "#{foldername} deleted".red
  else
    # We know at this point that they've explicitly said no, 
    # rather than fumble the keyboard
    STDOUT.puts "So sorry for the confusion"
  end
end


ROOT = 'tasks'
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