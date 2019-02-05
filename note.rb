namespace :rt do

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

    ask_for('description', full_filepath)
    puts "A folder #{foldername} is been created. You can save all task-related files here. \n 
      Remember: by deleting a task, the entire folder will be erased.\n
      If you want, you can tag the task as 'archived', so files and folder won't be deleted\n\n".yellow
  end

  desc "Delete task"
  task :delete,[:id] do |t, args|
    id = args[:id]
    foldername = find_task(id)
    if foldername
      delete_folder(foldername)
    else
      puts "#{"No task with that id.".yellow}\nRun rt:list for a full tasks list!"
    end
  end

  desc "Open in terminal the task"
  task :watch, [:id] do |t, args|
    foldername = find_task(args[:id])
    if foldername
      puts "------------------------------------------------"
      sh "cat #{ROOT}/#{foldername}/task.txt"
      puts "------------------------------------------------"
    else
      puts "File not found"
    end
  end

  desc "Tag a task as #{STATES[0]}"
  task :start, [:id] do |t, args|
    tag_with_state(args[:id],STATES[0])
    puts "Task is started, buddy! Let's do it".yellow

  end

  desc "Tag a task as #{STATES[1]}"
  task :complete, [:id] do |t, args|
    tag_with_state(args[:id],STATES[1])
    puts "Task is completed! You rock man!".green

  end

  desc "Tag a task as #{STATES[2]}"
  task :archive,[:id] do |t, args|
    tag_with_state(args[:id],STATES[2])
    puts "Task is Archived! Forget about it"

  end

  desc "Remove STATES tag"
  task :reset, [:id] do |t, args|
    foldername = find_task(args[:id])
    if foldername
      fullpath = "#{ROOT}/#{foldername}"
      tag_purge(foldername)
      new_path = "#{ROOT}/#{foldername}"
      FileUtils.mv(fullpath, new_path)
    end
  end  
end