package Railsish::Logger;
our $VERSION = '0.20';

use Mouse;
use Railsish::CoreHelpers ();
use Log::Dispatch;
use Log::Dispatch::File;

has 'logger' => (
    is => "rw",
    isa => "Log::Dispatch",
    lazy_build => 1
);

sub _build_logger {
    my ($self) = @_;

    my $logger = Log::Dispatch->new;
    $logger->add(
	Log::Dispatch::File->new(
	    name => "development",
	    min_level => "debug",
	    filename => Railsish::CoreHelpers::app_root(log => "development.log")));

    return $logger;
}

sub debug {
    my ($self, $message) = @_;
    $self->logger->log(
	level => "debug",
	message => $message . "\n"
    );
}

__PACKAGE__->meta->make_immutable;

__END__
=head1 NAME

Railsish::Logger

=head1 VERSION

version 0.20

=head1 AUTHOR

  Liu Kang-min <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Liu Kang-min <gugod@gugod.org>.

This is free software, licensed under:

  The MIT (X11) License

