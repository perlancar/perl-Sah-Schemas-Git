package Sah::Schema::git::refname;

# AUTHORITY
# DATE
# DIST
# VERSION

use Regexp::Pattern::Git;

our $schema = [
    "str", {
        summary => "git reference name",
        match => $Regexp::Pattern::Git::RE{ref}{pat},

        examples => [
            # some taken from Regexp::Pattern::Git
            {value=>'foo/bar', valid=>1},
            {value=>'.foo/bar', valid=>0, summary=>'A slash-separated component begins with dot (rule 1)'},
        ],
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
