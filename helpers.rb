
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
  
    f.slice!("tasks/")
    compare = f.dup
    tag_purge(compare)

    if get_id(compare).eql? id
      result = f
      puts "founded #{result}"
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


def tag_purge(foldername)
  if STATES.any? {|status| foldername.start_with? status}
    STATES.any? {|status| foldername.slice! status}
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