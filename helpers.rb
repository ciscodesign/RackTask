def find_task(id)
  # puts "searching for #{id}..."
  result = false

  Rake::FileList["#{ROOT}/*"].each do |f| 

    f.slice!("#{ROOT}/")
    compare = f.dup
    tag_purge(compare)

    if get_id(compare).eql? id
      result = f
      # puts "founded #{result}"
      break
    end
  end
  result
end

def files_number
  Rake::FileList["#{ROOT}/*"].count * 10
end

def get_id(filename)
  filename[0, 2]
end

def show_with_color(task)
  case task_status(task)
    when STATES[0]
      puts task.yellow
    when STATES[1] 
      puts task.green
    when STATES[2]
      puts task.light_blue  
  else
    puts task
  end
  
end

def task_status(foldername)
  if STATES.any? do |status| 
      return status if foldername.start_with? status 
    end
  end
end

def write_content(file, content)
  File.open(file, 'a') do |f|
    f << content
    f << "\n\n"
  end
end

def delete_folder(foldername)

  # Loop until the user supplies a valid option
  begin
    STDOUT.puts "Are you sure to delete #{foldername}? (y/n)"
    input = STDIN.gets.strip.downcase
  end until %w[y n].include?(input)

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


def tag_purge(foldername)
  if STATES.any? { |status| foldername.start_with? status }
    STATES.any? { |status| foldername.slice! status }
  end
end

def tag_with_state(id, state)
  foldername = find_task(id)
  if foldername
    fullpath = "#{ROOT}/#{foldername}"
    tag_purge(foldername)
    new_path = "#{ROOT}/#{foldername.prepend(state)}"
    FileUtils.mv(fullpath, new_path)
  end
end

def get_file_path(foldername)
  "#{ROOT}/#{foldername}/task.txt"
end

def get_user_input(question)
  STDOUT.puts question
  STDIN.gets.strip
end

def ask_for(obj,full_filepath)
  
  case obj
    when 'title'

    when 'description'
      question  = "Ok, what's the stuff?".light_blue
      ok_answer = "Task created!".green

      content = get_user_input(question)
      write_content(full_filepath, content)
      write_content(full_filepath, Time.now)
      puts ok_answer
      
    when 'statement'  
      ok_answer = "Statement saved!".green
      question  = "Got an update? Let's see:".light_blue 

      content = get_user_input(question)
      write_content(full_filepath, "========\n\nStatement #{Time.now}")
      write_content(full_filepath, content)
      puts ok_answer
  end

end

