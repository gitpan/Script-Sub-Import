package Script::Sub::Import;

use warnings;
use strict;

sub import {
    my ($self, $file, $package) = @_;
    
    # Package
    $package ||= 'main';
    
    # Open
    open my $fh, '<', $file
      or die "Cannot open '$file': $!";
    
    # Script
    my $script = join '', <$fh>;
    
    # Join die
    my $message = 'Script::Sub::Import die';
    $script = "package $package;\n" . $script . "BEGIN{die '$message'}\n";
    
    # Eval
    eval $script;
    
    # Real error
    if ($@ && $@ !~ /$message/) {
        die "$@\n";
    }
    
    # Close
    close $fh;
}

=head1 NAME

Script::Sub::Import - Import only subroutines from perl script

=head1 VERSION

Version 0.0201

=cut

our $VERSION = '0.0201';


=head1 SYNOPSIS

    use Script::Sub::Import 'script.pl';

    use Script::Sub::Import 'script.pl' => 'Some::Package';

=head1 Description

'Script::Sub::Import' can import only subroutine in perl scrit;

This is very useful at automatic test because you can test only subroutine.

If you want to import subroutines to main package, do this.

    use Script::Sub::Import 'script.pl';

If you want to import subroutines to specified package, do this.

    use Script::Sub::Import 'script.pl' => 'Some::Package';
    
This module can be used from command line.

    perl -MScript::Sub::Import=script.pl basic.t

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki Kimoto, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
