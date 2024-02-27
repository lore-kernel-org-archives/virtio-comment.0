Return-Path: <virtio-comment-return-9154-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A6C5478C
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:33:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1EE702AEDC
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:33:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE85E986531
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 10:33:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BD3C29863DE; Tue, 27 Feb 2024 10:33:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE05E9863E4
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Feb 2024 10:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DugVuzFqPQGa4GXW5EOjKQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709029986; x=1709634786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+1PpiJaA4B76zjzi8tbP8rBINBKSe7xde/kTjdrNe0=;
        b=fvDQzfqt9R2PX/6Bkkqnv4UGce8ViSQi3BFZlgnheR3Fx78HtYD5uNCr082n8va5bL
         tAkmUG4TLWr7MrLBJ7DyT+7yz9D6rp3A3m9mJNfu7w0mG5wNqxT3puDCEH2XR13685FL
         DvfBlNxAZ76VaNJScrsTUNzGsiW4AuqW/501qse6sG56zRniz5iNjm9HTlD+1XwXZgyz
         wQNdEtID5JhkexP9x1epwzqCH1LIktRpLf2HAZp1BSayO3Sx4+Cg2yx/Qk1xpyWu/t+x
         9v8RpaBmoPeXFXN3kw9pxiT/AVtpXob1KNGX97EeExGwByPfHX/Nv/cgHeZKnUVN7f3E
         xICw==
X-Gm-Message-State: AOJu0Yw2q64v/0c+ToONoGkvf0mDuhKlIqK8ZnaHm/Mz3UceIsiOzrpi
	9CcpDVhcBFv+bNBncJzLwEalLtkUezq+1g/B629V3DUxaRv8tn27/WMmXir0gED5MQUFh08lfr6
	r8y+PmVQh3orXPluN3LT7uaZscU4hHZ9p427gyngh4x0NCQWwZ8LACnvcWhXuHejtst63gZs8/j
	ZonGmBl7zASIznCaH5YQJyATZ18+3KpZL+m005s9kniB0vZ21UhCSB18k=
X-Received: by 2002:a05:6214:29ee:b0:68f:ba43:2e77 with SMTP id jv14-20020a05621429ee00b0068fba432e77mr2213231qvb.48.1709029986379;
        Tue, 27 Feb 2024 02:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFae4un+o1NLXRRsOXlyfgq92eQ5ggkRVVN1RRaouLbXUj9qqUqbSOFi8LRlSgAYhEPxO44og==
X-Received: by 2002:a05:6214:29ee:b0:68f:ba43:2e77 with SMTP id jv14-20020a05621429ee00b0068fba432e77mr2213211qvb.48.1709029985986;
        Tue, 27 Feb 2024 02:33:05 -0800 (PST)
Date: Tue, 27 Feb 2024 11:33:02 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
Message-ID: <Zd26Xmh9LqGlwyGJ@fedora>
References: <ZWhq3eOxSZ8a7sd1@fedora>
MIME-Version: 1.0
In-Reply-To: <ZWhq3eOxSZ8a7sd1@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] virtio-sound: use 'data buffer' instead of 'buffer'

On Thu, Nov 30, 2023 at 11:58:37AM +0100, Matias Ezequiel Vara Larsen wrote:
> This commit replaces the wording 'buffer' with 'data buffer' when
> referring to the payload of PCM messages. The virtio specification
> defines the word buffer as a set of zero or more device-readable
> physically-contiguous elements followed by zero or more
> physically-contiguous device-writable elements. In the virtio-sound
> section, the word is used only for the data or payload in a request. In
> this case, the data buffer is sent together with a header, i.e.,
> device-readable, and the status, i.e., device-writable. To not get
> confused with the main definition, this commit replaces those usages
> with the wording 'data buffer'.
> 
> Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  device-types/sound/description.tex | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> index 54c9c8e..97151fa 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
>  
>  \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device Operation / PCM IO Messages}
>  
> -An I/O message consists of the header part, followed by the buffer, and then
> -the status part.
> +An I/O message consists of a buffer that contains a header part, followed by
> +the data buffer, and then the status part.
>  
>  \begin{lstlisting}
>  /* an I/O header */
> @@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  \item[\field{latency_bytes}] indicates the current device latency.
>  \end{description}
>  
> -Since all buffers in the queue (with one exception) should be of the size
> +Since all data buffers in the queue (with one exception) should be of the size
>  \field{period_bytes}, the completion of such an I/O request can be considered an
>  elapsed period notification.
>  
>  \paragraph{Output Stream}
>  
> -In case of an output stream, the header is followed by a device-readable buffer
> -containing PCM frames for writing to the device. All messages are placed into
> -the tx queue.
> +In case of an output stream, the header is followed by a device-readable data
> +buffer containing PCM frames for writing to the device. All messages are placed
> +into the tx queue.
>  
>  \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Device / Device Operation / PCM Output Stream}
>  
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is totally
> +\item The device MUST NOT complete the I/O request until the data buffer is totally
>  consumed.
>  \end{itemize}
>  
> @@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  
>  \begin{itemize}
>  \item The driver SHOULD populate the tx queue with \field{period_bytes} sized
> -buffers. The only exception is the end of the stream.
> -\item The driver MUST NOT place device-writable buffers into the tx queue.
> +data buffers. The only exception is the end of the stream.
> +\item The driver MUST NOT place device-writable data buffers into the tx queue.
>  \end{itemize}
>  
>  \paragraph{Input Stream}
>  
> -In case of an input stream, the header is followed by a device-writable buffer
> +In case of an input stream, the header is followed by a device-writable data buffer
>  being populated with PCM frames from the device. All messages are placed into
>  the rx queue.
>  
> @@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Device / Device Operation / PCM Input Stream}
>  
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is full.
> +\item The device MUST NOT complete the I/O request until the data buffer is full.
>  The only exception is the end of the stream.
>  \end{itemize}
>  
> @@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  
>  \begin{itemize}
>  \item The driver SHOULD populate the rx queue with \field{period_bytes} sized
> -empty buffers before starting the stream.
> -\item The driver MUST NOT place device-readable buffers into the rx queue.
> +empty data buffers before starting the stream.
> +\item The driver MUST NOT place device-readable data buffers into the rx queue.
>  \end{itemize}
>  
>  \subsubsection{Channel Map Control Messages}\label{sec:Device Types / Sound Device / Device Operation / Channel Map Control Messages}
> -- 
> 2.41.0
> 

Dear TC,

I'd like to request a vote on solving issue 190.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/190

Matias


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

