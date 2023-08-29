Return-Path: <virtio-comment-return-7226-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6390AC71153
	for <virtio-comment@archiver.kernel.org>; Tue, 29 Aug 2023 22:21:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EC5B942C22
	for <virtio-comment@archiver.kernel.org>; Tue, 29 Aug 2023 22:21:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BC7D9867DA
	for <virtio-comment@archiver.kernel.org>; Tue, 29 Aug 2023 22:21:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED77C986633; Tue, 29 Aug 2023 22:21:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C81049840BB
	for <virtio-comment@lists.oasis-open.org>; Tue, 29 Aug 2023 22:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: mb9YdQ4cNP2tQWtp5lcAXw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693347700; x=1693952500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu7V0ePLcaShI0tBfiRxcbnlQz+HWlAtwpMfUn9Uxqo=;
        b=MRwNwjv1Qb5cbhM+i24+Yc6n9m5veH+LuLWOkAPZGAbsBKkRJBsVDps+q6fTAkvn1N
         U2welXgC8wwHEhBztEZlr7RQfEzSIvv0FkJ7ODrd2x6CcNw8VKzsfItG1QRdBCZhmWP5
         y23loJqxOL7FzwWW1mn6uJ7I0CZCE3TDolvyyaIsA/DVg3IiS6fIy9mc11j/rHetjQEQ
         AhiTJsORIbIsYkZDjb6qG1kyF1H2W6ujrGwqMbE0ZYUGxxk//EpeB43d7QfE/Q8g+23h
         Uh3MQQvLY2E1EULgrS0zvyK9rSNIqkfDQaK/fOOx0oCEKCpMTm3lOZKGb6B7aMNx3/F9
         zx3Q==
X-Gm-Message-State: AOJu0Yw2uFeF6WKgOoOkmfI43sBooxVBYt0thoT+gIdejRGwUO3vMcFs
	DdJ7+53KHNrQO1OqHj5nCLH1RvtwfBKgNzFKmYBpXomfJbwdummfiMsKm7Ng45TZg/Rc0gYnWRC
	7je0TCEIF0XnjMRiW0BwVINTegqeiEclfjA==
X-Received: by 2002:a05:6512:3113:b0:4f6:3677:54e with SMTP id n19-20020a056512311300b004f63677054emr155116lfb.36.1693347700260;
        Tue, 29 Aug 2023 15:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/X8qmx8ebiElNKKVk8tCX2u7VhtGOVy45JqOvHAtGV9oCr27xjdgHLEYci2c30JOJOzIuJg==
X-Received: by 2002:a05:6512:3113:b0:4f6:3677:54e with SMTP id n19-20020a056512311300b004f63677054emr155097lfb.36.1693347699770;
        Tue, 29 Aug 2023 15:21:39 -0700 (PDT)
Date: Tue, 29 Aug 2023 18:21:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	bobbyeshleman@gmail.com, cong.wang@bytedance.com,
	sgarzare@redhat.com, stefanha@redhat.com, jiang.wang@bytedance.com,
	arseny.krasnov@kaspersky.com,
	virtualization@lists.linux-foundation.org, cohuck@redhat.com
Message-ID: <20230829181549-mutt-send-email-mst@kernel.org>
References: <20230829212945.3420727-1-bobby.eshleman@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230829212945.3420727-1-bobby.eshleman@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] virtio-vsock: add VIRTIO_VSOCK_F_DGRAM feature bit

On Tue, Aug 29, 2023 at 09:29:45PM +0000, Bobby Eshleman wrote:
> This adds support for datagrams to the virtio-vsock device.
> 
> virtio-vsock already supports stream and seqpacket types. The existing
> message types and header fields are extended to support datagrams.
> Semantic differences between the flow types are stated, as well as any
> additional requirements for devices and drivers implementing this
> feature.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
> ---
>  device-types/vsock/description.tex | 95 +++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 7 deletions(-)
> 
> diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> index 7d91d159872f..638dca8e5da1 100644
> --- a/device-types/vsock/description.tex
> +++ b/device-types/vsock/description.tex
> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> +\item[VIRTIO_VSOCK_F_DGRAM (3)] datagram socket type is supported.
>  \end{description}
>  
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> @@ -167,17 +168,22 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>  
> -Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> -for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> +
> +Currently stream, seqpacket, and datagram sockets are supported. \field{type} is
> +1 (VIRTIO_VSOCK_TYPE_STREAM) for stream socket types, 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for
> +seqpacket socket types, and 3 (VIRTIO_VSOCK_TYPE_DGRAM) for datagram socket types.
>  
>  \begin{lstlisting}
>  #define VIRTIO_VSOCK_TYPE_STREAM    1
>  #define VIRTIO_VSOCK_TYPE_SEQPACKET 2
> +#define VIRTIO_VSOCK_TYPE_DGRAM     3
>  \end{lstlisting}
>  
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>  without message boundaries. Seqpacket sockets provide in-order, guaranteed,
> -connection-oriented delivery with message and record boundaries.
> +connection-oriented delivery with message and record boundaries. Datagram
> +sockets provide connection-less, best-effort delivery of messages, with no
> +order or reliability guarantees.
>  
>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> @@ -203,16 +209,19 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>  previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
>  communicating updates any time a change in buffer space occurs.
>  
> +\field{buf_alloc} and \field{fwd_cnt} are reserved for future use by datagram
> +sockets. These fields are not used for datagram buffer space management.

no limits on datagram size?

also with no flow control at all there's a performance problem:
imagine queue gets full. now buffers begin to be dropped.
problem is, dropping is faster than delivering to application.
so now application sees its packets consumed super quickly
and starts sending even faster.
not good for performance.

yes datagram expects some way to drop packets but just disabling flow
control completely is not the right thing to do I think.


> +
>  \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> -sufficient free buffer space for the payload.
> +For stream and seqpacket flows, VIRTIO_VSOCK_OP_RW data packets MUST only be
> +transmitted when the peer has sufficient free buffer space for the payload.
>  
>  All packets associated with a stream flow MUST contain valid information in
>  \field{buf_alloc} and \field{fwd_cnt} fields.
>  
>  \devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> -sufficient free buffer space for the payload.
> +For stream and seqpacket flows, VIRTIO_VSOCK_OP_RW data packets MUST only be
> +transmitted when the peer has sufficient free buffer space for the payload.
>  
>  All packets associated with a stream flow MUST contain valid information in
>  \field{buf_alloc} and \field{fwd_cnt} fields.
> @@ -299,6 +308,78 @@ \subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Devic
>  #define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
>  \end{lstlisting}
>  
> +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> +
> +\drivernormative{\paragraph}{Device Operation: Packet Fragmentation}{Device Types / Socket Device / Datagram Sockets / Fragmentation}
> +
> +Drivers MAY disassemble packets into smaller fragments. If drivers fragment a
> +packet, they MUST follow the fragmentation rules described in section
> +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> +
> +Drivers MUST support assembly of received packet fragments according to the
> +fragmentation rules described in section
> +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> +
> +\devicenormative{\paragraph}{Device Operation: Packet Fragmentation}{Device Types / Socket Device / Datagram Sockets / Fragmentation}
> +
> +Devices MAY disassemble packets into smaller fragments. If devices fragment a
> +packet, they MUST follow the fragmentation rules described in section
> +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> +
> +Devices MUST support assembly of received packet fragments according to the
> +fragmentation rules described in section
> +\ref{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}.
> +
> +\drivernormative{\paragraph}{Device Operation: Packet Dropping}{Device Types / Socket Device / Datagram Sockets / Dropping}
> +
> +The driver MAY drop received packets with no notification to the device. This
> +can happen if, for example, there are insufficient resources or no socket
> +exists for the destination address.
> +
> +\devicenormative{\paragraph}{Device Operation: Packet Dropping}{Device Types / Socket Device / Datagram Sockets / Dropping}
> +
> +The device MAY drop received packets with no notification to the driver. This
> +can happen if, for example, there are insufficient resources or no socket
> +exists for the destination address.
> +
> +\paragraph{Datagram Fragmentation}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets / Fragmentation}
> +
> +\field{flags} may have the following bit set:
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_DGRAM_EOM (1 << 0)
> +\end{lstlisting}
> +
> +When the header \field{flags} field bit VIRTIO_VSOCK_DGRAM_EOM (bit 0) is set,
> +it indicates that the current payload is the end of a datagram fragment OR that
> +the current payload is an entire datagram packet.
> +
> +Datagram fragmentation is subject to the following rules:
> +
> +The fragments for a datagram packet MUST be added to the virtqueue in
> +sequential order.
> +
> +If a packet is not a fragment, then the VIRTIO_VSOCK_DGRAM_EOM bit (bit 0) of
> +\field{flags} MUST be set.
> +
> +If a packet is the last fragment of a fragment sequence, then the
> +VIRTIO_VSOCK_DGRAM_EOM bit (bit 0) of \field{flags} MUST be set.
> +
> +If a packet is any fragment except the last fragment of a fragment sequence,
> +then the VIRTIO_VSOCK_DGRAM_EOM bit (bit 0) of \field{flags} MUST NOT be set.
> +
> +If a driver or device has already placed a fragment of a packet on the
> +virtqueue, it MUST add the remaining fragments of the packet to the virtqueue
> +before adding any additional packets or fragments to the virtqueue.
> +
> +If fragments for a packet are only partially received after an
> +implementation-specific amount of time, then the destination device or driver
> +MAY drop the fragments.

and how to detect this partial situation?

and if not then what happens?

> +Each buffer containing a fragment MUST begin with a valid struct
> +virtio_vsock_hdr. \field{len} MUST equal the length of the fragment payload
> +only.

what does this mean exactly?

>  \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
>  
>  Certain events are communicated by the device to the driver using the event
> -- 
> 2.20.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

