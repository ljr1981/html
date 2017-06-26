note
	description: "[
		Representation of an {HTML_SUPPORTED}.
		]"
	design: "See notes at the end of this class."

class
	HTML_SUPPORTED

feature -- Access

	javascript_file_scripts: ARRAYED_LIST [HTML_SCRIPT]
			-- A list of `javascript_files', which will appear as <script>s with src="*.js" and type="type/javascript" in the <head>
		attribute
			create Result.make (10)
		end

feature -- Contents

	supported_contents: ARRAYED_LIST [attached like supported_content_anchor] attribute create Result.make (10) end

	supported_content_anchor: detachable HTML_SUPPORTED

feature -- Hashes

	-- <title>
	-- <meta>
	-- <link>
	link_items: HASH_TABLE [HTML_LINK, INTEGER]
			-- `link_items' as external CSS and JS {HTML_LINK} elements.
		attribute
			create Result.make (10)
		end

	link_items_refresh
			-- Refresh of `link_items' from `link_items_get'.
		do
			link_items.wipe_out
			link_items_get (link_items)
		end

	link_items_get (a_list: like link_items)
		do
				-- Gather local `link_items' into `a_list'
			across
				link_items as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
				-- Recursively gather `link_items' from `supported_contents' into `a_list'
			across
				supported_contents as ic
			loop
				ic.item.link_items_get (a_list)
			end
		end

	-- <script>
	script_items: HASH_TABLE [HTML_SCRIPT, INTEGER]
			-- `script_items' as internal JS {HTML_SCRIPT} elements.
		attribute
			create Result.make (10)
		end

	script_items_refresh
			-- Refresh of `script_items' from `script_items_get'.
		do
			script_items.wipe_out
			script_items_get (script_items)
		end

	script_items_get (a_list: like script_items)
		do
				-- Gather local `script_items' into `a_list'
			across
				script_items as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
				-- Recursively gather `script_items' from `supported_contents' into `a_list'
			across
				supported_contents as ic
			loop
				ic.item.script_items_get (a_list)
			end
		end

	-- <style>
	style_items: HASH_TABLE [HTML_STYLE, INTEGER]
			-- `style_items' as internal CSS {HTML_STYLE} elements.
		attribute
			create Result.make (10)
		end

	style_items_refresh
			-- Refresh of `style_items' from `style_items_get'.
		do
			style_items.wipe_out
			style_items_get (style_items)
		end

	style_items_get (a_list: like style_items)
		do
				-- Gather local `style_items' into `a_list'
			across
				style_items as ic
			loop
				a_list.force (ic.item, ic.item.hash_code)
			end
				-- Recursively gather `style_items' from `supported_contents' into `a_list'
			across
				supported_contents as ic
			loop
				ic.item.style_items_get (a_list)
			end
		end

note
	design: "[
		A web product consists of four distinct parts: HTML + CSS + JS + MEDIA. 
		This library handles the HTML part with support for <style> (e.g. CSS) 
		and <script> (e.g. JS). Supporting MEDIA is handled through "href" attributes
		on various HTML element tags.
		
		The purpose of this class is to provide a framework for:
		
		(1) Inclusion of external references to CSS and JS files (i.e. *.css and 
			*.js by way of <head> or <body> <link> elements).
		
		(2) Inclusion of internal (i.e. "inline") CSS and JS in the form of:
		
			(a) <style> elements for raw CSS and 
			
			(b) <script> elements for raw JS.
			
			(c) This does NOT include any templated CSS or JS. Only CSS and JS 
				templates, which have been "tag-replaced" and are ready for 
				sending to the client.
				
		(3) Recursive gathering: HTML elements are held in a recursive tree
			structure with a common root (i.e. <html> contains <head> and <body>).
			The classes of this library are not a tree structure, but free-standing
			classes (and later object instances of those classes). As such, each
			class can be given its very own relative CSS and JS. The idea is
			to recursively "walk" the tree, gathering the CSS and JS of the elements
			in the tree, passing those as a distinct (hashed) list up to an
			appropriate root element. At the root element, the hashed list is
			then added as <link>, <meta>, <script>, and <style> to either the
			<head> or <body>.
		]"

end
