#! /usr/bin/perl
my %patches;

while (<>) {
    my ( $file, $num, $content) = split ':', $_, 3;
    $patches{ $file }{ $num } = $content;
}

while (my ($path, $do) = each %patches ) {
    my $fh;
    my @lines = do {
        open $fh, '<', $path or die;
        <$fh>
    };
    while (my ($line, $content) = each %$do ) {
        $lines[ $line - 1 ] = $content
    }
    open $fh, '>', $path or die;
    print $fh @lines;
}

__END__

=SYNOPSIS

when you C<grep -n> something into a vim buffer, it is tempting to edit the output

    :r !grep -Hn lines %

    setlines:12:    my @lines = $file->lines;
    setlines:14:        $lines[ $line - 1 ] = $content
    setlines:16:    $file->spew( @lines);

so let's do it then use

    :%!setlines

so the changes are applied on multiple lines of multiple files (when the rest
of the files are unchanged).


