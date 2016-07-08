note
	description: "[
		Representation of an effected {HTML_JS_OPERATED}.
		]"
	design: "[
		An entity representing a package of items, such as:
		
		(1) One or more *.js javascript files required for operating.
		(2) One or more js <script> snippets to embed in the $("document").ready(function(){<<CONTENT>>});
		]"

class
	HTML_JS_OPERATED

feature -- Access

	javascript_file_scripts: ARRAYED_LIST [HTML_SCRIPT]
			-- A list of `javascript_files', which will appear as <script>s with src="*.js" and type="type/javascript" in the <head>
		attribute
			create Result.make (10)
		end

;note
	design_intent: "[
		Your_text_goes_here
		]"

end
