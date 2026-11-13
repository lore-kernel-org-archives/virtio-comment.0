Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583798;
	b=r8YdPOp1O19G1cAuFP7/xDBeT69gxgjnWNedH+Ta/099wL7so8bpy+GkFKwlCMkGZySc
	 EX23TFJkQD9m2DGWHyggfAAc8/W3CXD02lWHAMXf+KkKg/1cjViricL7QyOh94cTqUzVj
	 j2Fd2uaqufibSuKghMdgJ82pva5634P0ecMIxqy2izgvVPq+5G82BQUJjAFv8luV7xqJc
	 u7KQJLulPcp7zq6GpWkB+QMiBI71M3arwUbtYlClBJmlnIdqdzwizI60KSoqpZ69/iT9d
	 VGKZxRyFTl4ecvB/r4YmxcnFW3xwU5NClghURb4tJeghuGAkl7z29VmTaZ0LOrLEU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583798;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YGptdVGT4AiCuoX1TdgqeIZdomZ7vQOP8a0R/PidWgw=;
	b=AOm4pfXeKwMqZjQ4LJStTz3KqwRzi1P0E5pX1IzdrleCAKLAadTB3hBYLY5CPLUkSvL2
	 SHKGTQP1H3QcBJUKqB7fD9QmVcWvjlGR40tzcD8m6/uR6PRR4LbQnZVzou3XLnqVdbtC3
	 44p/izCJRA8CbmAFkhnNvYmPOFRjK7vf3W/s8QEoUqDLlnD7kUljrNLX3lTh3O/ktpspS
	 8Y6JVzFs/WDGusUenKZqY9sBiO6hIvKlqldQMQ+2SzJj6s6OwxHRdn9BcXX46gq3nPDux
	 /g6v0g05wNBqrKzb1mKijRrv6tXZWtfl+UfPILz5uvM4b76z/e/kTLZqAsaObXTm9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YS822eqy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D7606A32E
	for <virtio-comment@lists.linux.dev>; Fri, 13 Nov 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YS822eqy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D971C1F000C5;
	Fri, 13 Nov 2026 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794583798;
	bh=YGptdVGT4AiCuoX1TdgqeIZdomZ7vQOP8a0R/PidWgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YS822eqyh5hoopjNca1fa3utSr3N6zWCR82BiwgipiYmYu4VukBdl/dGjZNWvUiW3
	 PM/Gvm1ocTWEUctkZwkOiLwKOkruxGuIuRjodOu2BmgcOBNglZ8Jyi92qC9d/y5pUq
	 3nXyOp1xY7K1YYUPH/3LvvHH4Kwuxb5eieYUpoOZHcV73J6ehj2gbLR4VAWc4YTyI2
	 REYkpImP7SlF5NTr6LmWbqOkDRcHq5l/G3MW1HeENWGxSaJFWChcqn8zWqscq1YOGD
	 +G0iKNZc99nJeHSlOxgKdXhhCycWWQdt0QSqjoGzW3RQvVC37Bm8Sruxf9myRdTrKq
	 tZzzGF+yLAw4Q==
Message-ID: <b65955a6-d17e-4712-940f-447d068545de@kernel.org>
Date: Fri, 13 Nov 2026 16:29:52 +0100
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 virtio-comment@lists.linux.dev
Cc: "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>,
 Bill Mills <bill.mills@linaro.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <a375ad8958031fdfd3dc483812ae0231d64c2cb5.1781514628.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is pretty impressive work.

In general, this looks very good to me. Mostly nits and some questions on
added/removed events.

> +\busnormative{\paragraph}{Bus Message Implementation}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Bus Messages}
> +\begin{itemize}
> +  \item A bus implementation MAY support any subset of \busref{GET_DEVICES},
> +        \busref{PING}, and \busref{EVENT_DEVICE}.
> +  \item If a bus implementation supports one of these bus messages, it MUST
> +        conform to the normative definition for that message.
> +\end{itemize}
> +
> +\busnormative{\paragraph}{Transport Message Forwarding}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Relationship between bus and transport / Transport Message Forwarding}
> +\begin{itemize}
> +  \item A bus implementation MUST validate the device number in each transport
> +        message before forwarding it.
> +  \item A bus implementation MUST relay each transport message to the device
> +        number identified in the message header, regardless of how it
> +        discovered or enumerated that device.
> +  \item A bus implementation SHOULD treat transport messages as opaque apart
> +        from enforcing generic transport limits, such as the advertised maximum
> +        message size, and SHOULD NOT modify the transport payload.
> +  \item If a bus implementation cannot validate or route a transport request
> +        that expects a response, it MUST surface a transport-visible failure
> +        for that request.
> +  \item If a bus implementation cannot validate or route a one-way transport
> +        event, it MAY drop the event or handle it according to
> +        message-specific bus requirements.
> +\end{itemize}
> +
> +\subsubsection{Known Bus Implementation Examples}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Known Bus Implementation Examples}
> +
> +This subsubsection lists informative examples of bus implementations and related
> +work for virtio-msg.
> +
> +\begin{itemize}
> +  \item \textbf{Virtio Message Bus over FF-A}: specified by Arm in
> +        \hyperref[intro:FFA-BUS]{[FFA-BUS]}.
> +  \item \textbf{Virtio Message Bus over PCI for AMP}: under development; proof
> +        of concept:
> +        \url{https://github.com/wmamills/hvac-demo}.
> +  \item \textbf{Virtio Message Bus over Xen grant tables and events}: under
> +        discussion.
> +\end{itemize}

I don't know if it's common to include such PoC/discussions in the spec. I'd
have moved that to the patch description. In any case, it's very helpful + nice
to see how this will be used.


> +\paragraph{virtio-msg transport revisions}
> +
> +The following table lists the currently defined virtio-msg transport revisions
> +and their protocol-defined maximum message sizes. Transport feature bits are
> +defined separately in
> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Transport Feature Bits}.
> +
> +\begin{tabular}{ |l|l|l| }
> +\hline
> +\field{revision} & \field{maximum size} & remarks \\
> +\hline \hline
> +1        & 52-65535    & Virtio Message Revision 1 \\
> +\hline
> +\end{tabular}

Not sure if that table really adds a lot of value, hard to tell what else should
be mentioned if there is no rev 2 yet. But maybe that's just the common way of
doing it.

> +The table reflects the protocol-defined maximum size; the recommended
> +advertised maximum remains 264 bytes for interoperability.
> +
> +Note that a change in the virtio standard does not necessarily
> +correspond to a change in the virtio-msg transport revision.
> +
> +The maximum message size is specified from the transport-layer point of view
> +and includes the 8-byte common header plus payload. Any extra encapsulation
> +imposed by the underlying bus (for example, a framing header) does not count
> +against this limit. Today the largest practical inline configuration payload is
> +244 bytes: messages such as GET_CONFIG and SET_CONFIG use 12 bytes of
> +message-specific fields, leaving up to 244 bytes for device configuration data
> +in one transfer when the recommended 264-byte maximum message size is used.
> +Larger configuration regions can be accessed through multiple exchanges without
> +requiring a larger per-message limit.
> +
> +\busnormative{\paragraph}{Message Size Bounds}{Virtio Transport Options / Virtio Over Messages / Basic Concepts / Revisions / Message Size}
> +\begin{itemize}
> +  \item A bus implementation MUST advertise a maximum message size of at least
> +        52 bytes.
> +  \item A bus implementation SHOULD NOT advertise a maximum message size that
> +        exceeds 264 bytes (256-byte payload plus the common header).

Ah, that points back at the recommendation mentioned above.

> +\end{itemize}
> +
> +\paragraph{Versioning and Forward Compatibility}
> +
> +A higher transport revision or additional transport feature bits extend the
> +protocol with new messages or capabilities. Implementations are expected to
> +remain interoperable across revisions: devices and drivers designed for a newer
> +revision still implement the mandatory messages and semantics defined in prior
> +revisions.

"are expected" -- do we want to make that stricter and turn it into a MUST, or
an informal "will", or what is the reason why this phrasing was chosen?

Because below, I read a lot of "MUST" :)

[...]

> +Each virtio-msg bus instance contains zero or more \emph{devices}, identified
> +by a 16-bit \textbf{device number}. The device number is a bus-assigned
> +identifier and is distinct from the virtio device ID (device type) returned by
> +\msgref{GET_DEVICE_INFO}. 

Good.

[...]
> +The 16-bit device-number space provides roughly 65k device slots per bus
> +instance. Deployments that require more devices can instantiate multiple bus
> +instances and distribute devices across those instances.

:)

[...]

> +
> +Some bus implementations may reject requests that violate their local policy
> +or that are not valid for the current device state. In such cases, the bus may
> +return a bus-specific error indication to the transport, which can then surface
> +that failure to the driver.
> +
> +\subsubsection{Endianness}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Endianness}
> +
> +Unless otherwise stated, all numeric fields defined for virtio-msg messages use
> +little-endian encoding.

Hurray :)

[...]

> +
> +\subsubsection{Message Ordering}
> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Concepts / Ordering}
> +
> +Transport messages fall into two classes: requests (which expect responses) and
> +events (which are one-way). Drivers and devices do not interpret the
> +\field{token} field directly. A bus implementation MAY have multiple
> +outstanding requests for the same device number and MAY use the bus-owned
> +\field{token} field to correlate each response with its originating request.
> +The device copies the received request token into the matching response, and

yeah, that's a clear MUST. Is that covered somewhere and I missed it? (it's a
lot of text for a Friday evening ...)?

[...]


> +\msgdef{GET_SHM}
> +
> +\msgref{GET_SHM} returns the location and size of a device-owned shared memory
> +region. The request carries the shared-memory region identifier
> +\field{shmid}; the response echoes \field{shmid} and provides the base
> +physical \field{address} and \field{length}. A \field{length} of zero
> +indicates that the specified \field{shmid} is not supported by the device.
> +
> +\begin{lstlisting}
> +struct virtio_msg_get_shm_req {
> +        le32 shmid; /* shared memory region identifier */
> +};
> +
> +struct virtio_msg_get_shm_resp {
> +        le32 shmid;     /* echoed region identifier */
> +        le32 reserved;  /* must be zero */
> +        le64 length;    /* region length (0 if nonexistent) */
> +        le64 address;   /* region physical address */
> +};
> +\end{lstlisting}
> +
> +\devicenormative{\paragraph}{GET\_SHM}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_SHM / Device}
> +\begin{itemize}
> +  \item A device MUST return zero \field{length} if the requested
> +        \field{shmid} is not supported and MUST report accurate physical
> +        \field{address}/\field{length} information for regions it supports.
> +  \item A device MUST set the \field{reserved} field in \msgref{GET_SHM}
> +        responses to zero.
> +\end{itemize}

Don't we need some statements that the device MUST echo the shmid etc?

[...]

> +
> +\drivernormative{\paragraph}{EVENT\_AVAIL}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Driver}
> +\begin{itemize}
> +  \item A driver MUST identify the target virtqueue in \field{vq_index}.
> +  \item If VIRTIO\_F\_NOTIFICATION\_DATA has not been negotiated, a driver MUST
> +        set \field{next_offset} to zero in \msgref{EVENT_AVAIL} messages. If it
> +        has been negotiated, the driver MUST encode core \field{next_off} in
> +        \field{next_offset}[30:0] and core \field{next_wrap} in
> +        \field{next_offset}[31], using split-queue or packed-queue derivation
> +        as defined by core virtio.
> +\end{itemize}
> +
> +\busnormative{\paragraph}{EVENT\_AVAIL}{Virtio Transport Options / Virtio Over Messages / Transport Messages / VIRTIO_MSG_EVENT_AVAIL / Bus}
> +\begin{itemize}
> +  \item If a bus implementation cannot preserve
> +        VIRTIO\_F\_NOTIFICATION\_DATA semantics for \msgref{EVENT_AVAIL}, it
> +        MUST prevent negotiation of VIRTIO\_F\_NOTIFICATION\_DATA.
> +\end{itemize}

Don't we need some statements about the device setting the virtiqueue in
\field{vq_index} etc?

[...]

> +
> +\busnormative{\paragraph}{GET\_DEVICES}{Virtio Transport Options / Virtio Over Messages / Bus Messages / GET_DEVICES / Bus}
> +\begin{itemize}
> +  \item The responding bus implementation MUST interpret \field{count} as a
> +        number of
> +        device-number slots and MUST return a \field{bitmap} of
> +        \textbf{(\field{count} + 7) / 8} bytes, packed least-significant-bit
> +        first.
> +  \item A request with \field{count}=0 is valid. In response to such a request,
> +        the responding bus implementation MUST return \field{count}=0 and an
> +        empty \field{bitmap}.
> +  \item The responding bus implementation MUST NOT return a \field{count} value
> +        greater
> +        than the \field{count} value from the request.

Is that early line break intentional? I assume not :) (latex won't care)

> +  \item If \field{count} is not a multiple of 8, the responder MUST set unused
> +        bits in the last \field{bitmap} byte (positions at or above
> +        \field{count}) to zero.
> +  \item For a terminal response, the responding bus implementation MUST set
> +        \field{next\_offset} to 0.
> +  \item For a nonterminal response, the responding bus implementation MUST set
> +        \field{next\_offset} to a value strictly greater than the request
> +        \field{offset}.
> +  \item Responders SHOULD return the requested \field{count} unless constrained
> +        (e.g., by maximum message size) or when trailing parts of the requested
> +        window contain no present device numbers; if a smaller \field{count} is
> +        returned, the \field{bitmap} MUST still represent the window defined by
> +        the echoed \field{offset} and \field{count}.
> +  \item If no devices are present in the requested window, a responder MAY
> +        return \field{count}=0 with an empty \field{bitmap}.
> +\end{itemize}
> +
> +\busdef{PING}
> +
> +\busref{PING} is a simple liveness check that can be sent by either side of the
> +bus; the response echoes the 32-bit data value from the request.

Why would one need a liveness check and when do we expect them to be used? How
frequently?

> +
> +\begin{lstlisting}
> +struct virtio_bus_msg_ping_req {
> +        le32 data; /* arbitrary value chosen by the sender */
> +};
> +
> +struct virtio_bus_msg_ping_resp {
> +        le32 data; /* echoed request data */
> +};
> +\end{lstlisting}
> +
> +Drivers or bus implementations can use \busref{PING} as a liveness check. If a
> +reply is missing or delayed beyond local policy, the initiator can verify
> +device status (for example, with \msgref{GET_DEVICE_STATUS}) and perform
> +recovery as needed.
> +
> +\busnormative{\paragraph}{PING}{Virtio Transport Options / Virtio Over Messages / Bus Messages / PING / Bus}
> +\begin{itemize}
> +  \item The responding bus implementation MUST echo the 32-bit data field from
> +        the request exactly in the \busref{PING} response.
> +\end{itemize}
> +
> +\busdef{EVENT_DEVICE}
> +
> +\busref{EVENT_DEVICE} signals device-level hotplug changes as a bus-originated
> +control-plane event. The bus instance on the driver side receives these
> +indications from the peer bus instance; the table below lists the defined
> +device bus states.
> +
> +\begin{lstlisting}
> +struct virtio_bus_msg_event_device {
> +        le16 device_number;
> +        le16 device_bus_state; /* see table below */
> +};
> +\end{lstlisting}
> +
> +\begin{tabular}{|l|l|p{7cm}|}
> +\hline
> +Constant & Value & Meaning \\
> +\hline
> +DEVICE\_BUS\_STATE\_ADDED    & 0x0001 & Device is present and ready. \\
> +DEVICE\_BUS\_STATE\_REMOVED  & 0x0002 & Device is no longer present. \\

Is there no "REMOVING" or "Request for removal" request mechanism?

Other unplug mechanisms (iirc ACPI) avoid this kind of surprise removal, as it's
not particularly nice to handle.

I guess for such surprise removal, any concurrent message to the device will
silently get lost? Or how is that supposed to work?


> +Reserved                    & 0x0003-0x7FFF & Reserved for standard use. \\
> +Implementation-defined      & 0x8000-0xFFFF & MAY be used by the bus implementation. \\
> +\hline
> +\end{tabular}
> +
> +Upon receiving DEVICE\_BUS\_STATE\_ADDED, drivers typically probe the device
> +with \msgref{GET_DEVICE_INFO} before continuing initialization. Upon receiving
> +DEVICE\_BUS\_STATE\_REMOVED, drivers typically stop queueing new work, quiesce
> +the device instance, tear down local driver state, and release resources.
> +Duplicate or out-of-order events can occur and can be handled with additional
> +bus-level monitoring, such as \busref{PING}.

What if we get a fast sequence of ADDED+REMOVE, REMOVING the device while still
probing the driver etc? Isn't that a concern if it's architected like that?

> +
> +\busnormative{\paragraph}{EVENT\_DEVICE}{Virtio Transport Options / Virtio Over Messages / Bus Messages / EVENT_DEVICE / Bus}
> +\begin{itemize}
> +  \item A bus implementation that sends \busref{EVENT_DEVICE} MUST set
> +        \field{device\_number} to a valid bus device number exposed to the
> +        driver side.
> +  \item A bus implementation that sends \busref{EVENT_DEVICE} with
> +        DEVICE\_BUS\_STATE\_ADDED MUST do so only when the referenced device is
> +        accessible for transport-message processing.

Right, but what prevents immediate removal?


-- 
Cheers,

David
