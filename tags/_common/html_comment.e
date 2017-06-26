class
	HTML_COMMENT

inherit
	HTML_TAG
		export {NONE}
		redefine
			default_create,
			start_tag,
			end_tag
		end

create
	default_create,
	make_with_comment

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			exclude_end_tag := True
			create comment.make_empty
			Precursor
		end

	make_with_comment (a_comment: like comment)
		do
			default_create
			comment := a_comment
		end

feature -- Access

	comment: STRING

feature -- Setters

	set_comment (a_comment: like comment)
		do
			comment := a_comment
		ensure
			set: comment.same_string (a_comment)
		end

feature -- Output

	tag_name: STRING = "!"
			-- <Precursor>

feature {NONE} -- Implementation

	start_tag: STRING
		do
			if not tag_name.is_empty then
				Result := "<"
				Result.append_string_general (tag_name)
				Result.append_character ('-')
				Result.append_character ('-')
				Result.append_character (' ')
				Result.append_string_general (comment)
				Result.append_character ('-')
				Result.append_character ('-')
				Result.append_string_general (">")
			else
				Result := ""
			end
		end

	end_tag: STRING
		do
			create Result.make_empty
		end

end
