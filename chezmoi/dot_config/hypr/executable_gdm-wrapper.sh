#!/usr/bin/sh

if [ "x$XDG_SESSION_TYPE" = "xwayland" ] &&
	[ "x$XDG_SESSION_CLASS" != "xgreeter" ] &&
	[ -n "$SHELL" ] &&
	grep -q "$SHELL" /etc/shells &&
	! (echo "$SHELL" | grep -q "false") &&
	! (echo "$SHELL" | grep -q "nologin"); then
	if [ "$1" != '-l' ]; then
		exec bash -c "exec -l '$SHELL' -c '$0 -l $*'"
	else
		shift
	fi
fi

SETTING=$(G_MESSAGES_DEBUG='' gsettings get org.gnome.system.locale region)
REGION=${SETTING#\'}
REGION=${REGION%\'}

if [ -n "$REGION" ]; then
	unset LC_TIME LC_NUMERIC LC_MONETARY LC_MEASUREMENT LC_PAPER

	if [ "$LANG" != "$REGION" ]; then
		# LC_CTYPE
		export LC_NUMERIC=$REGION
		export LC_TIME=$REGION
		# LC_COLLATE
		export LC_MONETARY=$REGION
		# LC_MESSAGES
		export LC_PAPER=$REGION
		# LC_NAME
		export LC_ADDRESS=$REGION
		export LC_TELEPHONE=$REGION
		export LC_MEASUREMENT=$REGION
		# LC_IDENTIFICATION
	fi
fi

exec Hyprland
