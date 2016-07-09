note
	description: "[
		Representation of an effected {HTML_HEAD_ITEM_GENERATOR}.
		]"
	design: "[
		An entity representing a package of items, such as:
		
		(1) One or more *.js javascript files required for operating.
		(2) One or more *.css files required for rendering.
		(3) One or more js <script> snippets to embed in the $("document").ready(function(){<<CONTENT>>});
		(4) One or more css <script> snippets to embed at the end of the </html> file.
		]"

deferred class
	HTML_HEAD_ITEM_GENERATOR

inherit
	HTML_JS_OPERATED

	HTML_CSS_RENDERED

feature -- Access

	hand_coded_script: attached like generated_script_type_anchor
			-- `hand_coded_script'
		deferred
		end

	generated_script: attached like generated_script_type_anchor
			--`generated_script' of Current.

feature -- Setters

	set_generated_script (a_generated_script: like generated_script)
			-- `set_generated_script' with `a_generated_script'
		do
			generated_script := a_generated_script
		ensure
			set: generated_script ~ a_generated_script
		end

feature {NONE} -- Type anchors

	generated_script_type_anchor: detachable STRING
			-- `generated_script_type_anchor' for `generated_script' and `set_generated_script'.

;note
	design_intent: "[
		Your_text_goes_here
		]"

end
