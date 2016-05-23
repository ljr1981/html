note
	description: "[
		Representation of an {HTML_VIDEO}.
		]"

class
	HTML_VIDEO

inherit
	HTML_TAG
		redefine
			start_tag
		end

create
	default_create,
	make_with_height_width,
	make_height_width_with_controls,
	make_height_width_without_controls,
	make_with_video_and_controls,
	make_with_video_and_not_controls

feature {NONE} -- Initialization

	make_with_video_and_controls (a_src, a_type: STRING; a_height, a_width: INTEGER)
			-- `make_with_video_and_controls' using `a_src', `a_type', `a_height', and `a_width'.
			-- Video/Audio controls will be displayed in the browser.
			-- Example:
			--	<video width="320" height="240" controls>
			--	  <source src="movie.mp4" type="video/mp4">
			--	  <source src="movie.ogg" type="video/ogg">
			--	  Your browser does not support the video tag.
			--	</video>
		local
			l_source: HTML_SOURCE
		do
			create l_source
			l_source.set_src (a_src)
			l_source.set_type (a_type)
			make_height_width_with_controls (a_height, a_width)
			add_content (l_source)
		end

	make_with_video_and_not_controls (a_src, a_type: STRING; a_height, a_width: INTEGER)
			-- `make_with_video_and_controls' using `a_src', `a_type', `a_height', and `a_width'.
			-- Video/Audio controls will NOT be displayed in the browser.
			-- Example:
			--	<video width="320" height="240" controls>
			--	  <source src="movie.mp4" type="video/mp4">
			--	  <source src="movie.ogg" type="video/ogg">
			--	  Your browser does not support the video tag.
			--	</video>
		local
			l_source: HTML_SOURCE
		do
			create l_source
			l_source.set_src (a_src)
			l_source.set_type (a_type)
			make_height_width_without_controls (a_height, a_width)
			add_content (l_source)
		end

	make_height_width_with_controls (a_height, a_width: INTEGER)
			-- `make_height_width_with_controls' using `a_height' and `a_width'
			-- Example: <video width="320" height="240" controls>
			-- Video/audio controls will be displayed in browser.
		do
			make_with_height_width (a_height, a_width, True)
		end

	make_height_width_without_controls (a_height, a_width: INTEGER)
			-- `make_height_width_without_controls' using `a_height' and `a_width'
			-- Example: <video width="320" height="240">
			-- No video/audio controls will be displayed in browser.
		do
			make_with_height_width (a_height, a_width, False)
		end

	make_with_height_width (a_height, a_width: INTEGER; a_is_with_controls: BOOLEAN)
			-- `make_with_height_width' using `a_height' and `a_width'.
			-- Example: <video width="320" height="240" controls>
			-- Where: `a_is_with_controls' specifies if the "controls" keyword
			-- 	is displayed or not, which controls if video/audio controls
			--	are displayed in the browser.
		do
			set_height_width (a_height.out, a_width.out)
			is_with_controls := a_is_with_controls
		end

feature -- Setters

	set_src_type_height_width_with_controls (a_src, a_type: STRING; a_height, a_width: INTEGER)
			-- `set_src_type_height_width_with_controls'
			-- Sets the video source, type (e.g. MP4), height, and width.
			-- Also makes video/audio controls viewable.
		do
			make_with_video_and_controls (a_src, a_type, a_height, a_width)
		end

	set_auto_play
			-- `set_auto_play' (`is_auto_play') True.
		do
			is_auto_play := True
		end

	reset_auto_play
			-- `reset_auto_play' (`is_auto_play') False.
		do
			is_auto_play := False
		end

	toggle_auto_play
			-- `toggle_auto_play' (`is_auto_play') True or False.
		do
			is_auto_play := not is_auto_play
		end

	set_looped
			-- `set_looped' (`is_looped') True.
		do
			is_looped := True
		end

	reset_looped
			-- `reset_looped' (`is_looped') False.
		do
			is_looped := False
		end

	toggle_looped
			-- `toggle_looped' (`is_looped') True or False.
		do
			is_looped := not is_looped
		end

	set_muted
			-- `set_muted' (`is_muted') True.
		do
			is_muted := True
		end

	reset_muted
			-- `reset_muted' (`is_muted') False.
		do
			is_muted := False
		end

	toggle_muted
			-- `toggle_muted' (`is_muted') True or False.
		do
			is_muted := not is_muted
		end

feature -- Status Report

	has_start_tag_commands: BOOLEAN
			-- `has_start_tag_commands' in <video> tag?
		do
			Result := is_with_controls or
						is_auto_play or
						is_looped or
						is_muted
		end

	is_with_controls: BOOLEAN
			-- `is_with_controls' determines if Current {HTML_VIDEO} is
			-- rendered with video/audio controls keyword in <video> start
			-- tag.

	is_auto_play: BOOLEAN
			-- `is_auto_play'?

	is_looped: BOOLEAN
			-- `is_looped'?

	is_muted: BOOLEAN
			-- `is_muted'?

feature -- Output

	tag_name: STRING = "video"
			-- <Precursor>

feature {NONE} -- Implementation

	start_tag: STRING
			-- <Precursor>
		do
			Result := Precursor
			if has_start_tag_commands then
				Result.remove_tail (1)
				if is_with_controls then
					Result.append_character (' ')
					Result.append_string (Controls_kw)
				end
				if is_auto_play then
					Result.append_character (' ')
					Result.append_string (Auto_play_kw)
				end
				if is_looped then
					Result.append_character (' ')
					Result.append_string (Looped_kw)
				end
				if is_muted then
					Result.append_character (' ')
					Result.append_string (Muted_kw)
				end
				Result.append_character ('>')
			end
		end

	Muted_kw: STRING = "muted"
	Looped_kw: STRING = "looped"
	Auto_play_kw: STRING = "autoplay"
	Controls_kw: STRING = "controls"

;note
	design: "[

		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_video.asp"

end
