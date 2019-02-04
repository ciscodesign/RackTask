namespace :rt do

  #insert statement at the bottom of the file
  task :statement, [:id] do |t, args|

    foldername = find_task(args[:id])
    
    if foldername
      full_filepath = get_file_path(foldername)
      ask_for('statement', full_filepath)
    else
      puts "File not found".red
    end

  end
end