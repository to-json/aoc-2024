# Day 2: Janet

i knew i was gonna like this one so i gave myself plenty of time to make silly
little utility fns for getting the input and making sure my code builds and
such. i really really really enjoy this lil language. probably gonna make it
part of my day to day and use it for strange shell tools since it builds
executables but i can also spit it out fluently. liking the lsp, might try to
contribute to 'go to definition' bc i really want it, but, having fun with
just docs, namespace completion, and formatting.

if i use this for additional days, i should be able to copy in the `aoc` dir
and just update `year` and `day` as appropriate. feedback loop is lovely, and
i don't even have conjure set up right yet (i should go do that)

ok back from that, some goofy localleader thing. this is delightful, `,e<textobj>`
and `,E<motion>` to evaluate expressions is good, everything is fast, nrepl
works the way it obv should. user install story sucks, but also you can just
run the binary, it's more jpm that's an issue.

i think i finally might move `~/.nvim` to aniseed so that i have more reason
to use conjure, it feels very good to me.

# Delays

got distracted by fun floss shit. also deterred briefly by an off-by-1 (forgot
to strip the closing newline) it's a good little lisp. quick. easy to work in.
conjure is soooooo good with it. gotta do the whole nrepl bit to get the real
good shit but it boots a fresh namespace for each nrepl session (expected) so
you can just murk a buffer and reload and start playing again. i cannot emphasize
enough how pleasurable it was. probably gonna do more of them in lisps just bc
i prefer this to all the other workflows i get (exception; ruby and python are
acceptable lisps)

not gonna clean up my solution or split it out properly because the difference
between the days is calling `safe?` vs `multiversally-safe?`. you can see where
i started to try to make a 'performant' version of testing for each absence
by building a scoring system and then nah, fuckit, 1000*max(len(line)) is just an
acceptable number of inputs at this speed so who tf cares.
