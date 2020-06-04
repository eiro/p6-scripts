seen = {} of String => Hash(Int32,String)

ARGF
.gets_to_end
.split("\n")
.tap( &.pop )
.map { |change|
    path,num,content = change.split(':',3)
    ( seen[path] ||= {} of Int32 => String )[num.to_i] = content
}

seen.each { |path,changes|
    lines = File.read_lines path
    changes.each { |no,content| lines[no-1] = content }
    lines = File.write(path, lines.join "\n")
}

