class
	MOCK_JSON_OBJECT

inherit
	JSE_AWARE
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
		do
			my_string.do_nothing
			my_integer := 9_999
			my_real := 9.999
			my_boolean := True
			my_button.do_nothing
			my_checkbox.do_nothing
			my_color.do_nothing
			my_date.do_nothing
			my_datetime_local.do_nothing
			my_email.do_nothing
			my_file.do_nothing
			my_hidden.do_nothing
			my_image.do_nothing
			my_month.do_nothing
			my_number.do_nothing
			my_password.do_nothing
			my_radio.do_nothing
			my_range.do_nothing
			my_reset.do_nothing
			my_search.do_nothing
			my_submit.do_nothing
			my_tel.do_nothing
			my_text.do_nothing
			my_time.do_nothing
			my_url.do_nothing
			my_week.do_nothing
		end

	make_from_json (a_json: STRING)
		do
			default_create
		end

feature -- Access

	my_string: STRING
		attribute
			Result := "some_string"
		end

	my_integer: INTEGER

	my_real: REAL

	my_boolean: BOOLEAN

	my_button: STRING attribute create Result.make_empty end
	my_checkbox: STRING attribute create Result.make_empty end
	my_color: STRING attribute create Result.make_empty end
	my_date: STRING attribute create Result.make_empty end
	my_datetime_local: STRING attribute create Result.make_empty end
	my_email: STRING attribute create Result.make_empty end
	my_file: STRING attribute create Result.make_empty end
	my_hidden: STRING attribute create Result.make_empty end
	my_image: STRING attribute create Result.make_empty end
	my_month: STRING attribute create Result.make_empty end
	my_number: STRING attribute create Result.make_empty end
	my_password: STRING attribute create Result.make_empty end
	my_radio: STRING attribute create Result.make_empty end
	my_range: STRING attribute create Result.make_empty end
	my_reset: STRING attribute create Result.make_empty end
	my_search: STRING attribute create Result.make_empty end
	my_submit: STRING attribute create Result.make_empty end
	my_tel: STRING attribute create Result.make_empty end
	my_text: STRING attribute create Result.make_empty end
	my_time: STRING attribute create Result.make_empty end
	my_url: STRING attribute create Result.make_empty end
	my_week: STRING attribute create Result.make_empty end

feature -- Access: Convertibles

	metadata_refreshed (a_current: ANY): ARRAY [JSON_METADATA]
		do
			Result := <<
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_button ("Button Name"),
						create {JSON_METADATA}.make_checkbox ("vehicle3", "Boat", True),
						create {JSON_METADATA}.make_color ("favcolor", "#28bf34"),
						create {JSON_METADATA}.make_date ("bday", "2017-06-20"),
						create {JSON_METADATA}.make_datetime_local ("bdaytime", "2017-06-20T12:58"),
						create {JSON_METADATA}.make_email ("usremail", "ljr1981@msn.com"),
						create {JSON_METADATA}.make_file ("img"),
						create {JSON_METADATA}.make_hidden ("country", "Norway"),
						create {JSON_METADATA}.make_image ("", "Submit image", 40, 20),
						create {JSON_METADATA}.make_month ("bdaymonth", "2017-06"),
						create {JSON_METADATA}.make_number ("quantity", 1, 5, 3),
						create {JSON_METADATA}.make_password ("pwd", 8),
						create {JSON_METADATA}.make_radio ("gender", "female"),
						create {JSON_METADATA}.make_range ("points", 0, 10, 9),
						create {JSON_METADATA}.make_reset,
						create {JSON_METADATA}.make_search ("googlesearch", "3D Printer"),
						create {JSON_METADATA}.make_submit,
						create {JSON_METADATA}.make_tel ("usrtel", "770-295-9729"),
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_time ("usr_time", "20:42"),
						create {JSON_METADATA}.make_url ("homepage", "www.google.com"),
						create {JSON_METADATA}.make_week ("year_week", "2017-W24")
						>>
		end

	convertible_features (a_current: ANY): ARRAY [STRING]
		do
			Result := <<
					"my_string",
					"my_integer",
					"my_real",
					"my_boolean",
					"my_button",
					"my_checkbox",
					"my_color",
					"my_date",
					"my_datetime_local",
					"my_email",
					"my_file",
					"my_hidden",
					"my_image",
					"my_month",
					"my_number",
					"my_password",
					"my_radio",
					"my_range",
					"my_reset",
					"my_search",
					"my_submit",
					"my_tel",
					"my_text",
					"my_time",
					"my_url",
					"my_week"
					>>
		end

end
