package Railsish::Bootstrap;
our $VERSION = '0.20';

# ABSTRACT: Wuu huu huu

use strict;
use warnings;
use Railsish::CoreHelpers;

sub read_config_route {
    # XXX: is it to oldie to use .pl for config :-)
    my $config = app_root(config => "route.pl");
}

1;



__END__
=head1 NAME

Railsish::Bootstrap - Wuu huu huu

=head1 VERSION

version 0.20

=head1 DESCRIPTION

This class reads application configurations.

=head1 AUTHOR

  Liu Kang-min <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Liu Kang-min <gugod@gugod.org>.

This is free software, licensed under:

  The MIT (X11) License

