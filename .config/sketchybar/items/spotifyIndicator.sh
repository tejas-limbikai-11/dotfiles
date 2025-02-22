# CURRENT SPOTIFY SONG
	# Adding custom events which can listen on distributed notifications from other running processes
	sketchybar -m --add event spotify_change "com.spotify.client.PlaybackStateChanged" \
		--add item spotifyIndicator center \
		--set spotifyIndicator background.height=18 \
		--set spotifyIndicator background.padding_left=7 \
		--set spotifyIndicator icon=􀑪             \
        --set spotifyIndicator label.max_chars=50 \
        --set spotifyIndicator script="~/.config/sketchybar/plugins/spotifyIndicator.sh" \
	    --set spotifyIndicator click_script="open -a Spotify" \
        --set spotifyIndicator background.drawing=off \
		--subscribe spotifyIndicator spotify_change
