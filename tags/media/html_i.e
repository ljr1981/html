class
	HTML_I

inherit
	HTML_TAG
		export {ANY}
			alt, set_alt
		end

feature -- Output

	tag_name: STRING = "i"
			-- <Precursor>

end
