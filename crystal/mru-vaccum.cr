

seen = {} of String => Bool

puts ARGF
.gets_to_end
.split("\n")
.tap( &.pop )
.reverse
.select { |f|
    if seen[f]? ; false
    else        ; seen[f] = true ; File.exists?(f)
    end
}
.reverse
.join("\n")
