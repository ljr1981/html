note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	testing: "type/manual"

class
	HTML_FORM_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

	HTML_CONSTANTS
		undefine
			default_create
		end

feature -- Testing: Forms

	form_tests
			-- `form_tests'
		local
			l_form: HTML_FORM
			l_button: HTML_BUTTON
			l_check_group: HTML_CHECKBOX_GROUP
			l_fieldset: HTML_FIELDSET
			l_input: HTML_INPUT
			l_label: HTML_LABEL
			l_legend: HTML_LEGEND
			l_optgroup: HTML_OPTGROUP
			l_option: HTML_OPTION
			l_radio: HTML_RADIO_INPUT_FIELD
			l_radio_group: HTML_RADIO_INPUT_FIELD_GROUP
			l_select: HTML_SELECT
			l_textarea: HTML_TEXTAREA
			l_text: HTML_TEXT_INPUT_FIELD
			l_text_group: HTML_TEXT_INPUT_FIELD_GROUP
		do
			create l_form
			l_form.add_h2 ("Form")
			l_form.add_text_input_field_group (<<
					["First Name:", "fname", maxlength_equals (12), size_equals (12), include_break],
					["Last Name:", "lname", maxlength_equals (36), size_equals (12), include_break]
					>>)
			l_form.add_radio_input_field_group ("Gender:",
						<<
						["Male:", "gender", "Male", include_break],
						["Female:", "gender", "Female", include_break]
						>>)
			l_form.add_checkbox_group ("Favorite Foods:", "favorite_foods",
					<<"Steak", "Pizza", "Chicken", "Pasta", "Cat-food", "Dog-food">>, include_break)
			l_form.add_textarea ("physical", "quote", "Enter your favorite quote!", cols_equals (20).to_integer, rows_equals (5).to_integer, include_break)
			l_form.add_select_with_options ("Select a Level of Education", "education",
					0, <<"Jr. High", "High School", "College", "Post-Grad", "Doctoral">>, include_break)
			l_form.add_select_with_options ("Select your favorite time of day", "tofd",
					3, <<"Morning", "Day", "Night">>, include_break)
			l_form.extend (create {HTML_P}.make_with_content (<<
					create {HTML_INPUT}.make_as_submit_button>>))
			l_form.set_method ("POST")
--			assert_strings_equal ("form", "", l_form.html_out)
		end

feature {NONE} -- Testing: Forms Support

	sample_form: STRING = "[
<h2>Form</h2>
<form action="" method="post">
	First Name:<input type="text" name="fname" maxlength="12" size="12"/> <br/>
	Last Name:<input type="text" name="lname" maxlength="36" size="12"/> <br/>

	Gender:<br/>
	Male:<input type="radio" name="gender" value="Male"/><br/>
	Female:<input type="radio" name="gender" value="Female"/><br/>

	Favorite Food:<br/>
	Steak:<input type="checkbox" name="favorite_foods" value="Steak"/><br/>
	Pizza:<input type="checkbox" name="favorite_foods" value="Pizza"/><br/>
	Chicken:<input type="checkbox" name="favorite_foods" value="Chicken"/><br/>
	Pasta:<input type="checkbox" name="favorite_foods" value="Pasta"/><br/>
	Cat-food:<input type="checkbox" name="favorite_foods" value="Cat-food"/><br/>
	Dog-food:<input type="checkbox" name="favorite_foods" value="Dog-food"/><br/>

	<textarea wrap="physical" cols="20" name="quote" rows="5">Enter your favorite quote!</textarea><br/>

	Select a Level of Education:<br/>
	<select name="education">
		<option value="Jr.High">Jr.High</option>
		<option value="HighSchool">HighSchool</option>
		<option value="College">College</option><br/>
		<option value="PostGrad">Post-Grad</option>
		<option value="Doctoral">Doctoral</option>
	</select><br/>

	Select your favorite time of day:<br/>
	<select size="3" name="tofd">
		<option value="Morning">Morning</option>
		<option value="Day">Day</option>
		<option value="Night">Night</option>
	</select>

	<p><input type="submit" /></p>
</form>
]"

end


