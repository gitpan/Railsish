package Railsish::Dispatcher;
our $VERSION = '0.20';

# ABSTRACT: The first handler for requests.

use Mouse;
use Railsish::Router;
use YAML::Any;
use Hash::Merge qw(merge);

sub dispatch {
    my ($class, $request) = @_;
    my $path = $request->path;
    my $matched = Railsish::Router->match($path);

    die "No routing rule for $path" unless $matched;

    my $mapping = $matched->mapping;

    my $c = $mapping->{controller};
    my $a = $mapping->{action} || "index";

    $c = ucfirst(lc($c)) . "Controller";
    my $sub = $c->can($a);

    die "action $a is not defined in $c." unless $sub;
    my %params = %{$request->query_parameters};

    my $params = merge($request->parameters, $mapping);

    my $response = HTTP::Engine::Response->new;

    $Railsish::Controller::params = $params;
    $Railsish::Controller::request = $request;
    $Railsish::Controller::response = $response;

    $sub->();

    return $response;

}

__PACKAGE__->meta->make_immutable;


__END__
=head1 NAME

Railsish::Dispatcher - The first handler for requests.

=head1 VERSION

version 0.20

=head1 DESCRIPTION

This class contains the first handler for requests.

=head1 AUTHOR

  Liu Kang-min <gugod@gugod.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2009 by Liu Kang-min <gugod@gugod.org>.

This is free software, licensed under:

  The MIT (X11) License

