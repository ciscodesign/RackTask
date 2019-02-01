namespace :rt do
  namespace :note do

    desc 'Crea nuovo task'
    task :new do

      # ask for a title
      STDOUT.puts "Give me a title".light_blue
      title = STDIN.gets.strip.gsub(/\s+/, '_')

      # compose title
      foldername = "#{LAST_ID}_#{title}"
      file = "task.txt"
      full_filepath = "#{ROOT}/#{foldername}/#{file}"

      # create the folder and file
      Rake::Task["rt:init"].invoke unless Dir.exist?(ROOT)
      FileUtils::Verbose.mkdir_p "#{ROOT}/#{foldername}"
      sh "cd #{ROOT}/#{foldername} && touch #{file}"
      
      # first line is the title
      write_content(full_filepath, title)

      # ask for a description and save into the file
      STDOUT.puts "Ok, what's the stuff?".light_blue
      description = STDIN.gets.strip
      write_content(full_filepath, description)

      # insert last edit datetime
      write_content(full_filepath, Time.now)
      puts "Task created!".green
      puts "A folder #{foldername} is been created. You can save all task-related files here. \n 
      Remember: by deleting a task, the entire folder will be erased.\n
      If you want, you can tag the task as 'archived', so files and folder won't be deleted\n\n".yellow
    end

    desc "Delete task"
    task :delete,[:id] do |t, args|
      id = args[:id]
      foldername = find_task(id)
      puts foldername
      if foldername 
        puts "founded #{foldername}"
        delete_folder(foldername)
       else
        puts "No task with that id.\n Run rt:list for a full tasks list!"
      end
    end

    desc "Apre nell'editor di default task"
    task :watch,[:id]

    desc "Segnala come iniziato il task"
    task :start,[:id]

    desc "Segnala come completato il task"
    task :complete,[:id]
    
    task :create => [:askTitle,:new]
  end
end