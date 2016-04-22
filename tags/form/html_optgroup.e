note
	description: "[
		Representation of an {HTML_OPTGROUP}.
		]"

class
	HTML_OPTGROUP

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_OPTGROUP}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "optgroup"
			-- <Precursor>

;note
	design: "[
		The <optgroup> is used to group related options in a drop-down list.

		If you have a long list of options, groups of related options are
		easier to handle for a user.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_optgroup.asp"

end
