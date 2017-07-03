note
	EIS: "src=https://www.w3schools.com/html/html5_svg.asp"
class
	HTML_SVG

inherit
	HTML_TAG
		export {ANY}
			
		end

create
	default_create

feature -- Output

	tag_name: STRING = "svg"
			-- <Precursor>

end
