require_relative 'colours'
task default: :listAll

def files_number
  Rake::FileList["#{ROOT}/*"].count * 10
end

def get_id(filename)
  filename[0,2]
end

ROOT = 'tasks'
LAST_ID = files_number
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
      puts files 
    else
      puts "\nNothing to do, buddy! Have fun!\n\n"
    end
  end

  desc "Remove any RackTask list"
  task :clear do
    if Dir.exist?(ROOT) 
      FileUtils::Verbose.remove_dir ROOT
      puts "RackTasks list cleared".red
    else
      puts "No Racktask's list active, at the moment.".yellow
    end
    puts "Use init command to start new Racktask list!"

  end

  namespace :note do

    

    def write_content(file,content)


      File.open(file, "a") do |f|
        f << content
        f << "\n\n"
      end
    end

    # task :create[:title,:id] do
      
    #   title = "#{id}_#{title}"
    #   filename = "#{title}.txt"
    #   sh "touch #{filename}"
    #   write_content(filename, title)

    # end

    # task :askTitle[:id] do
    #   STDOUT.puts "Give me a title"
    #   input = STDIN.gets.strip
    #   Rake::Task["create[input,ids]"].invoke
    # end

    # task :askDescription[:id] do
    #   STDOUT.puts "Ok, what's the stuff?"
    #   input = STDIN.gets.strip
    #   write_content(filename, input)
    # end


    desc 'Crea nuovo task'
    task :new,[:title,:description] do

      #ask for a title
      STDOUT.puts "Give me a title"
      title = STDIN.gets.strip.gsub(/\s+/, '_')
      # Rake::Task["create[input,ids]"].invoke

      #compose title
      filename = "#{LAST_ID}_#{title}"

      file = "#{ROOT}/#{filename}.txt"

      # create the file
      Rake::Task["rt:init"].invoke unless Dir.exist?(ROOT)
      sh "touch #{file}"
      #first line is the title
      write_content(file, title)

      #ask for a description
      #Rake::Task["askDescription[LAST_ID]"].invoke
      STDOUT.puts "Ok, what's the stuff?"
      description = STDIN.gets.strip
      write_content(file, description)

      # insert last edit datetime
      write_content(file, Time.now)

    end

    desc "Elimina task"
    task :delete,[:id]

    desc "Apre nell'editor di default task"
    task :watch,[:id]

    desc "Segnala come iniziato il task"
    task :start,[:id]

    desc "Segnala come completato il task"
    task :complete,[:id]
    
    task :create => [:askTitle,:new]
  end


end