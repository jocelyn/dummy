class
	APPLICATION

inherit
	DT_SHARED_SYSTEM_CLOCK

	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			connect
			from count := 1 until count > 150 loop
				communicate
				count := count + 1
			end

			print ("%N%NAverage: ")
			print (avg)
			print ("%N%N")

			client.close
			server.close
		end

	communicate
		local
			l_tick, l_tack: DT_TIME
			l_diff: INTEGER
		do

			client.independent_store (create {STRING}.make_filled ('%%', string_size))

			l_tick := system_clock.time_now

			if not attached server.retrieved then
				check not_received: False end
			end

			l_tack := system_clock.time_now
			l_diff := l_tack.minus (l_tick).millisecond_count

			avg := (count*avg + l_diff)/(count + 1)

			print (l_diff)
			print (" ")
		end

	count: NATURAL
	avg: DOUBLE

	port: INTEGER = 50000

	string_size: INTEGER = 1_000

	server, client: NETWORK_STREAM_SOCKET

	connect
		local
			l_listener: like server
		do
			create l_listener.make_loopback_server_by_port (port)
			l_listener.set_blocking
			l_listener.listen (1)

			create client.make_client_by_address_and_port ((create {INET_ADDRESS_FACTORY}).create_loopback, port)
			client.connect
			client.set_blocking

			l_listener.accept
			if attached l_listener.accepted as l_server then
				server := l_server
				server.set_blocking
			else
				check no_connection: False end
			end
		ensure
			server_connected: server.is_open_read and server.is_open_write
			client_connected: client.is_open_write and client.is_open_read
		end

end
