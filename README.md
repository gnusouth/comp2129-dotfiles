COMP2129 Dotfiles
=================

I've collated a selection of configuration files that should make working at the command-line more pleasant. Using these config files, you can get a nice coloured prompt for your shell, coloured output for shell commands like `ls`, and syntax highlighting for the code you write in `nano`!

## Background

Most UNIX tools have a configuration file that lives in the user's home directory ("~" for short). For a program called say, `basil`, the config file is typically `~/.basilrc`. Program configuration is a very personal thing, and as you continue to use UNIX you will no doubt accumulate a whole bunch of "dotfiles" (so called because of the dot at the beginning of each filename, which makes the file hidden). The configuration files provided here are minimal, but should serve as a solid foundation for anything else you want to do.

## Configuring Bash

Bash is the *shell* that you use to input commands. By editing its config, you can set-up a coloured prompt, as well as coloured output for commands. Most people find that a few colours make it easier to distinguish the output of commands from the prompt itself.

The prompt string (the bit on the left of where you type) is controlled by an [environment variable] called PS1. In our bashrc, we first define a bunch of [ANSI colour escape codes], which can be used to tell our terminal to print in colour. We're using variables with nice names like BLACK, so that the configuration file remains somewhat readable. Once a colour appears in the PS1 string, it will colour all the characters that follow, until either the string ends or the colour is changed again. We use the export command to set the PS1 variable globally.

```
export PS1="$GREENBOLD\u$WHITE: $BLUEBOLD\W$WHITE \$ "
```

PS1 strings support a number of useful variables - like your username (\u) and the name of the current working directory (\W). A full list can be found [here](http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html). The above PS1 string leads to a terminal that looks like this:

```
mspr3743: ~ $
```

Where mspr3743 (my username) is rendered in green, ~ (the current directory) is rendered blue and everything else is white.

The bashrc provided also includes some *aliases* which make `ls` and `grep` use colour when appropriate. Whenever you type `ls <stuff>` the shell will instead run `ls --color=auto <stuff>`. As well as aliases for colour, I've included some ones for `cp` and `mv` to make them safer. By default, `cp` and `mv` will silently overwrite files, which is often not what you want! Do not fear, for both commands come with a `-i` option, which makes the overwriting of files *interactive*. If you ever need the un-aliased version of a command, you can get it by typing a backslash before the name of the command like so:

```
$ \ls ~ | \grep "Documents"
```

Bash's main configuration file is `~/.bashrc`. If you're logging into a server however (like ucpu1), this configuration file won't be read! Instead, a file called `~/.bash_profile` will be used. To avoid duplication, I usually [symlink] `.bash_profile` to `.bashrc`.

```
$ rm ~/.bash_profile
$ ln -s ~/.bashrc ~/.bash_profile
```

See the installation section below for more on how to install config files.

## Configuring the Terminal

Another file, `~/.inputrc` allows us to customise the behaviour of the terminal generally. In my opinion, the most useful thing you can do with this file is enable partial history completion.

Imagine you've just spent 15 seconds typing out `gcc -W -Wall -pedantic -std=c99 -o program program.c`.
You then run a couple of other commands (nano, ls, etc). To get back to your gcc command, you could press the up arrow a bunch of times. The only problem is, the more commands you've run in between, the longer you'll have to hold down that arrow. With our custom `.inputrc` you needn't ever go through this hassle again. If you type `gcc` and press the up arrow, the terminal will cycle through all the commands you've inputted that begin with `gcc`!

## Configuring Nano

By default, `nano` won't give you any syntax highlighting, which makes code pretty hard to read. Thankfully, it's really easy to enable syntax highlighting. On Linux you just need to "include" a syntax file which comes pre-installed.

```
# ~/.nanorc
include /usr/share/nano/c.nanorc
```

Unfortunately the Mac version of nano doesn't come with these syntax files, so I've had to bundle them with the other config files.

## Installation

To install this bundle of configuration files you'll be using Git (which is like Mercurial) and the shell!

If you're on a uni computer, you'll first need to set up the proxy.

```
$ export HTTP_PROXY=web-cache.usyd.edu.au:8080
```

You can then clone the repository to ~/.files

```
$ git clone https://github.com/gnusouth/comp2129-dotfiles.git ~/.files
```

Finally, run the install script to place links from the correct places to your set of files (yay for symbolic links). You can copy the files manually if you wish, but my personal preference is for symbolic links.

```
$ cd ~/.files
$ ./install.sh
```

Remember not to include the dollar sign at the beginning of commands, that's just there to show you it's a prompt.

[environment variable]: https://en.wikipedia.org/wiki/Environment_variable
[ANSI colour escape codes]: https://en.wikipedia.org/wiki/ANSI_escape_code
[symlink]: https://en.wikipedia.org/wiki/Symbolic_link
