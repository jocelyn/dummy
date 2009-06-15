indexing
	description : "bug_paul_dbg_local application root class"
	date        : "$Date: 2008-12-29 15:41:59 -0800 (Mon, 29 Dec 2008) $"
	revision    : "$Revision: 76432 $"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			s: STRING
		do
			--| Add your code here
			s := url_response ("http://www.twitter.com/statuses/user_timeline/eiffelstudio.json", Void)
		end

	url_response (
	    a_url: READABLE_STRING_8;
	    a_args: detachable HASH_TABLE [STRING, STRING]): detachable STRING
	        -- Fetch contents of a URL.
	        --
	        -- `a_url': A request URL to fetch the contents for.
	        -- `a_args': Any URL parameters.
	        -- `Result': The response of the URL.
	    require
	        a_url_attached: a_url /= Void
	        not_a_url_is_empty: not a_url.is_empty
	        a_url_is_correct: (create {HTTP_URL}.make (
	            a_url.as_string_8.string)).is_correct
	        not_a_args_is_empty: a_args /= Void implies not a_args.is_empty
	    local
	        l_url_string: STRING
	        l_protcol: HTTP_PROTOCOL
	        l_url: HTTP_URL
	        l_buffer: STRING
	        retried: BOOLEAN
	    do
	        if not retried then
	                -- Create URL string
	            create l_url_string.make_from_string (a_url)
	            if a_args /= Void and then not a_args.is_empty then
	                l_url_string.append_character ('?')
	                from a_args.start until a_args.after loop
	                    if
	                        attached a_args.item_for_iteration as l_value
	                    then
	                        l_url_string.append_string (
	                            a_args.key_for_iteration)
	                        l_url_string.append_character ('=')
	                        l_url_string.append_string (l_value)
	                        l_url_string.append_character ('&')
	                    end
	                    a_args.forth
	                end
	            end

	            create l_url.make (l_url_string)
	            create l_protcol.make (l_url)
	            l_protcol.set_connect_timeout (30)
	            l_protcol.set_timeout (60)
	            l_protcol.set_port (80)
	            l_protcol.set_read_mode
	            l_protcol.open
	            if l_protcol.is_open then
	                l_protcol.initiate_transfer
	                if l_protcol.transfer_initiated then
	                    create Result.make (256)
	                    l_protcol.set_read_buffer_size (256)
	                    from
	                        l_protcol.read
	                    until
	                        l_protcol.error or not
	                        l_protcol.is_packet_pending
	                    loop
	                        if
	                            attached l_protcol.last_packet as l_packet
	                        then
	                            Result.append (l_packet)
	                        end
	                        if l_protcol.is_packet_pending then
	                            l_protcol.read
	                        end
	                    end
	                    if attached l_protcol.last_packet as l_packet then
	                        Result.append (l_packet)
	                    end
	                else
	                    -- Not good
	                end
	                l_protcol.close
	            else
	                -- Time out
	            end
	        end
	    rescue
	        if attached l_protcol and then l_protcol.is_open then
	            l_protcol.close
	        end
	        retried := True
	        retry
	    end


end
