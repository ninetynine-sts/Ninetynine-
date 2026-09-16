# Make websites by asking

You do not need to know how to code to use this. You just describe what you
want, and it gets built.

## Try it right now

Open Claude in this folder and type this:

```
make me a website about penguins
```

That is the whole thing. That is a complete instruction. Claude will pick the
colours, pick the fonts, write the words, build the page, and then give you a
link to click.

## Things you can say

Copy any of these. They all work:

- `make me a website about my dog`
- `build a page for my school project on volcanoes`
- `make a birthday invitation page for my friend Sam`
- `I want a website that lists my favourite games`

Once a website exists, you can change it by saying what is wrong with it:

- `make it blue instead`
- `the title is too small`
- `add a photo of a penguin here`
- `put a button at the bottom that says Contact Me`
- `make it look more serious`
- `it looks weird on my phone`

You never have to be precise. "Make it look cooler" is a real instruction and
Claude will do something sensible with it.

## Seeing your website

Say `show me my website` and Claude will open it for you.

If you would rather do it yourself, type this and click the link it prints:

```
./preview.sh
```

Press `Ctrl` and `C` together in that window to stop it.

## Where your websites live

Each website is one folder inside `websites/`, and each folder has one file
called `index.html`. That single file *is* the website — you can double-click it
to open it, email it to someone, or put it on the internet.

```
websites/
  my-first-website/
    index.html       <- a starter page, so you can see something immediately
  penguins/
    index.html       <- whatever you ask for next
```

You can delete `my-first-website` whenever you like. It is only there so the
folder is not empty on your first day.

## If something goes wrong

Say `it's broken` and explain what you saw, in normal words. For example:

- `the page is blank`
- `the link you gave me doesn't work`
- `the pictures aren't showing up`

That is enough information. You do not need to find an error message or know
what caused it.

## What's under the hood

You can safely ignore this section — it is here for grown-ups and curious people.

This project has the [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
skill installed in `.claude/skills/`. It is a searchable design database — 79 UI
styles, 192 colour palettes, 74 font pairings, 119 UX guidelines — that Claude
consults before designing anything, so the results follow real design and
accessibility rules instead of being guessed.

`CLAUDE.md` is the instruction sheet that makes all of the above happen: it tells
Claude to use the design skill automatically, to never ask technical questions,
to build plain single-file HTML with no build step, and to meet an accessibility
bar (contrast, keyboard focus, reduced motion, responsive layouts) on every page
without being asked.

Requires Python 3 — already installed on most computers.
