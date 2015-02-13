package Mojolicious::Plugin::OAuth::Tokens;

use Mojo::Base 'Mojolicious::Controller';

sub show {
    my $self = shift;

    $self->render(json => {});
}

1;
