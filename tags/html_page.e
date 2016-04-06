note
	description: "[
		Representation of an {HTML_PAGE}.
		]"
	design: "[
		See class notes at the end of the class.
		]"

class
	HTML_PAGE

inherit
	HTML_ANY

	HTML_TAG
		export {NONE}
			html_content_items
		undefine
			default_create,
			out
		redefine
			html_out,
			make_with_content
		end

create
	default_create,
	make_with_content

feature {NONE} -- Initialization

	make_with_content (a_content: ARRAY [attached like content_anchor])
			-- <Precursor>
		do
			check has_body: attached (create {HTML_BODY}.make_with_content (a_content)) as al_body then
				body := al_body
			end
		end

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			Result.append_string (Precursor)
		end

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_PAGE}.
		do
			create Result.make_empty
			if attached head as al_head then Result.append_string (al_head.html_out) end
			if attached body as al_body then Result.append_string (al_body.html_out) end
		end

	tag_name: STRING = "html"
			-- <Precursor>

feature -- Settings

	set_head (a_head: like head)
			-- `set_head' with `a_head' into `head'.
		do
			head := a_head
		ensure
			set: head ~ a_head
		end

	set_body (a_body: like body)
			-- `set_body' with `a_body' into `body'.
		do
			body := a_body
		ensure
			set: body ~ a_body
		end

feature {NONE} -- Implementation

	doctype: STRING = "<!DOCTYPE html>"
			-- `doctype' for HTML-5 (not 4.x or XML or other).
			-- This may (later on) need to be a class.

	head: detachable HTML_HEAD
			-- `head' of Current {HTML_PAGE}.

	body: detachable HTML_BODY
			-- `body' of Current {HTML_PAGE}.

invariant
	no_content: html_content_items.count = 0

;note
	design: "[
Tag    Description
<head>    Defines information about the document
<title>    Defines the title of a document
<base>    Defines a default address or a default target for all links on a page
<link>    Defines the relationship between a document and an external resource
<meta>    Defines metadata about an HTML document
<script>    Defines a client-side script
<style>    Defines style information for a document
		]"
	EIS: "name=doctype", "src=http://www.w3schools.com/tags/tag_doctype.asp"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"
	EIS: "name=title", "src=http://www.w3schools.com/tags/tag_title.asp"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_base.asp"
	EIS: "name=link", "src=http://www.w3schools.com/tags/tag_link.asp"
	EIS: "name=meta", "src=http://www.w3schools.com/tags/tag_meta.asp"
	EIS: "name=script", "src=http://www.w3schools.com/tags/tag_script.asp"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end
