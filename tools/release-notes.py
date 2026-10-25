#!/usr/bin/env python3
"""Formats an en-US changelog for GitHub (--md) or Telegram (--html) (#265).

A changelog is sections in this order, each a heading line and "- " bullets:
    New games:
    - ...
    Bug fixes:
    - ...
    Improvements:
    - ...
--check validates that shape instead and exits 1 with the reason.
--thanks a,b adds a line thanking those GitHub users, each linked to their
profile (#530): a contributor whose work is in a release is named in it.
Usage: tools/release-notes.py --md|--html|--check <changelog.txt> [--thanks login,...]
"""
import html
import re
import sys

SECTIONS = ['New games', 'Bug fixes', 'Improvements']


def parse(text):
    sections, current = [], None
    for n, raw in enumerate(text.splitlines(), 1):
        line = raw.strip()
        if not line:
            continue
        if line.endswith(':') and not line.startswith('- '):
            name = line[:-1]
            if name not in SECTIONS:
                raise ValueError('line %d: unknown heading "%s" (use %s)' % (n, name, ', '.join(SECTIONS)))
            if sections and SECTIONS.index(name) <= SECTIONS.index(sections[-1][0]):
                raise ValueError('line %d: "%s" is out of order or repeated (order: %s)' % (n, name, ', '.join(SECTIONS)))
            current = (name, [])
            sections.append(current)
        elif line.startswith('- ') and current is not None:
            current[1].append(line[2:].strip())
        else:
            raise ValueError('line %d: expected a heading or a "- " bullet under one: %s' % (n, line[:60]))
    if not sections:
        raise ValueError('no sections')
    for name, items in sections:
        if not items:
            raise ValueError('"%s" has no bullets' % name)
    return sections


def thanks_line(logins, fmt):
    links = []
    for login in logins:
        url = 'https://github.com/' + login
        links.append('[@%s](%s)' % (login, url) if fmt == '--md' else '<a href="%s">@%s</a>' % (url, login))
    names = links[0] if len(links) == 1 else ', '.join(links[:-1]) + ' and ' + links[-1]
    return ('**Thanks to** ' if fmt == '--md' else '<b>Thanks to</b> ') + names


def main():
    args = sys.argv[1:]
    logins = []
    if len(args) == 4 and args[2] == '--thanks':
        logins = [x for x in args[3].split(',') if x]
        # a login goes into a link, so only GitHub's own login characters pass
        if not all(re.fullmatch(r'[A-Za-z0-9](?:[A-Za-z0-9-]{0,38})', x) for x in logins):
            print('--thanks: not a GitHub login in "%s"' % args[3], file=sys.stderr)
            return 2
        args = args[:2]
    if len(args) != 2 or args[0] not in ('--md', '--html', '--check'):
        print(__doc__.strip().splitlines()[-1], file=sys.stderr)
        return 2
    sys.argv = [sys.argv[0]] + args
    try:
        text = open(sys.argv[2], encoding='utf-8').read()
        sections = parse(text)
    except (OSError, ValueError) as e:
        print('%s: %s' % (sys.argv[2], e), file=sys.stderr)
        return 1
    if sys.argv[1] == '--check':
        # F-Droid and Google Play show the same file and stop at 500 characters
        if len(text) > 500:
            print('%s: %d characters, over 500' % (sys.argv[2], len(text)), file=sys.stderr)
            return 1
        return 0
    out = []
    for name, items in sections:
        if sys.argv[1] == '--md':
            out.append('- **%s**' % name)
            out.extend('  - %s' % i for i in items)
        else:
            out.append('<b>%s</b>' % html.escape(name))
            out.extend('• %s' % html.escape(i) for i in items)
            out.append('')
    if logins:
        if sys.argv[1] == '--md':
            out.append('')
        out.append(thanks_line(logins, sys.argv[1]))
    print('\n'.join(out).rstrip())
    return 0


if __name__ == '__main__':
    sys.exit(main())
