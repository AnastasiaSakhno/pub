# /etc/skel/.bashrc
# rails environment
unset RUBYOPT
#export GEM_HOME="$HOME/.gems"
#export GEM_PATH="$GEM_HOME:$HOME/opt/ruby/current/lib/ruby/gems/1.9.1:/opt/ruby/current/lib/ruby/gems/1.9.1"
#export PATH="$GEM_HOME/bin:$HOME/opt/ruby/current/bin:/opt/ruby/current/bin:$PATH"
export GEM_HOME="$HOME/.rvm/gems/ruby-1.9.3-p362"
export GEM_PATH="$GEM_HOME:$HOME/.rvm/rubies/ruby-1.9.3-p362/lib/ruby/gems/1.9.1"
export PATH="$GEM_HOME/bin:$HOME/.rvm/rubies/ruby-1.9.3-p362/bin:/.rvm/rubies/ruby-1.9.3-p362/bin:$PATH"

#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Midnight Commander chdir enhancement
if [ -f /usr/share/mc/mc.gentoo ]; then
    . /usr/share/mc/mc.gentoo
fi

# Put your fun stuff here.

export PERL5LIB=${HOME}/perl/lib64/perl5:${HOME}/perl/lib64/perl5/site_perl:${HOME}/perl/lib64/perl5/vendor_perl

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
