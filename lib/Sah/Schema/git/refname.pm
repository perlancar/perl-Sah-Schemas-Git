package Sah::Schema::git::refname;

# DATE
# VERSION

my $comp_re = '(?!\.)[^/]+(?!\.lock)(?!\.)';

our $schema = [
    "str", {
        summary => "git reference name",
        clset => [
            {
                match => qr!\A(?:$comp_re)(?:/$comp_re)+\z!,
            },
            {
                match => qr!\.\.|[\0-\037\177]|[ ~^:?*\[\\]|@\{!,
                'match.op' => 'not',
            },
            {
                match => qr!\A(?:@)\z!,
                'match.op' => 'not',
            },
        ],
        'clset.op' => 'and',
    },
    {},
];

1;

# ABSTRACT:

=head1 SEE ALSO

The rules for a reference name is documented in the manual page of
L<git-check-ref-format> command,
L<https://git-scm.com/docs/git-check-ref-format>.

TODO: reorganize so we can display better error message

TODO: if --refsec-pattern is used, refname is allowed to have a single *, e.g.
foo/bar*/baz or foo/bar*baz but not foo/bar*/baz*

TODO: add normalize coercion rule to remove leading / and duplicate adjacent /.
