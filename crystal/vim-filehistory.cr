(File.read_lines ENV["HOME"]+"/.viminfo").each { |l|
    puts l if l.size > 2 && puts l.chars[1,2]
}

