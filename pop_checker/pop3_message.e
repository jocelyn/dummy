note
	description: "Summary description for {POP3_MESSAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POP3_MESSAGE

create
	make,
	make_with_uid

feature {NONE} -- Implementation

	make_with_uid (a_index: like index; a_uid: like uid)
		require
			valid_index: a_index > 0
			valid_id: a_uid /= Void and then not a_uid.is_empty
		do
			uid := a_uid
			make (a_index)
		end

	make (a_index: like index)
		require
			valid_index: a_index > 0
		do
			index := a_index
			create headers.make (5)
			truncated_lines := -1
		end

feature -- Access

	index: INTEGER
			-- Message index in POP3's list

	size: INTEGER
			-- Message size

	truncated_lines: INTEGER

	uid: detachable STRING
			-- Message UID

	message: detachable STRING
			-- Message's body

	headers_text: detachable STRING

	headers: HASH_TABLE [STRING, STRING]
			-- All information concerning each headers

	header (h: STRING): detachable STRING
			-- Retrieve the content of the header 'h'
		do
			Result := headers.item (h)
		end

feature -- Access: header

	header_subject: like header do Result := header ("Subject") end
	header_from: like header do Result := header ("From") end
	header_return_path: like header do Result := header ("Return-Path") end
	header_to: like header do Result := header ("To") end
	header_date: like header do Result := header ("Date") end
	header_content_type: like header do Result := header ("Content-Type") end
	header_importance: like header do Result := header ("Importance") end
	header_message_id: like header do Result := header ("Message-ID") end
	header_mime_version: like header do Result := header ("MIME-Version") end
	header_delivered_to: like header do Result := header ("Delivered-To") end

feature -- status report

	raw_string: STRING
		local
			l_headers: like headers
			m: like message
			h: like headers_text
		do
			m := message
			if m /= Void then
				create Result.make_from_string (m)
			else
				create Result.make (100)
			end
			h := headers_text
			if h /= Void then
				Result.prepend_string ("%N%N")
				Result.prepend_string (h)
			end
		end

	to_string: STRING
		local
		do
			create Result.make_empty
			if attached header_subject as l_subject then
				Result.append_string ("SUBJECT=%"" + l_subject + "%"" )
			end
			if attached header_from as l_from then
				Result.append_string (" FROM [" + l_from + "]" )
			end
			if attached header_date as l_date then
				Result.append_string (" (DATE:" + l_date + ")" )
			end
		end

	retrieved: BOOLEAN
		do
			Result := not headers.is_empty
		end

	truncated: BOOLEAN
		do
			Result := truncated_lines >= 0
		end

feature -- Element change

	update_index (a_index: like index)
		require
			a_index_valid: a_index > 0
		do
			index := a_index
		end

	set_truncated (a_nb_of_lines: INTEGER)
		do
			truncated_lines := a_nb_of_lines
		end

	set_size (a_size: like size)
		require
			vaid_size: a_size > 0
		do
			size := a_size
		end

	set_header_lines (a_lines: LIST [STRING])
		local
			s, hk, hv, hv_k: detachable STRING
			h: like headers_text
			p: INTEGER
		do
			from
				create h.make (a_lines.count * 72)
				a_lines.start
			until
				a_lines.after
			loop
				s := a_lines.item
				h.append_string (s)
				h.append_string ("%N")
				if not s.item (1).is_space then
					check s[1] /= ' ' or s[1] /= '%T' end
					p := s.index_of (':', 1)
					check p > 0 end
					hk := s.substring (1, p - 1)
					hv := s.substring (p + 1 + 1, s.count) --| there is a space after the ':'
					if headers.has_key (hk) then
						hv_k := headers.found_item
						check hv_k /= Void end -- implied by `has_key'
						headers.force (hv_k + "%N" + hv, hk)
					else
						headers.force (hv, hk)
					end
--					print (" - " + hk + "%N")
				else
					check hv /= Void end
					hv.append_character ('%N')
					hv.append_string (s)
				end
				a_lines.forth
			end
			headers_text := h.string
		end

	set_message (s: like message)
		do
			if s = Void or else s.is_empty then
				message := Void
			else
				message := s
			end
		end

	reset_headers
		do
			headers.wipe_out
			headers_text := Void
		end

	reset_message
		do
			message := Void
		end

end
