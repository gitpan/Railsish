package Railsish::ControllerHelpers;
our $VERSION = '0.20';

use strict;
use warnings;

use Exporter::Lite;
our @EXPORT = qw(notice_stickie);

our @notice_stickies = ();

sub notice_stickie {
    my ($text) = @_;

    push @notice_stickies, { text => $text };
}

1;

__END__
=head1 NAME

Railsish::ControllerHelpers

=head1 VERSION

version 0.20

=head1 AUTHOR

  Liu Kang-min <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Liu Kang-min <gugod@gugod.org>.

This is free software, licensed under:

  The MIT (X11) License

