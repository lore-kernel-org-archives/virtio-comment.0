Return-Path: <virtio-comment-return-8240-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3BCC4167D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D7E7542D77
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD99B986BE5
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C0BD5986800; Tue,  7 Nov 2023 10:44:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B36A79867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PV-vCDSLN8Cn7VVXAaodOg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353892; x=1699958692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nRR9G8WiKkLAoXmuL0aL/1n+wm768oczADpW6YhuLo=;
        b=cwYU/1EmlvzuoEC9CoRfVhJIzXEs1/KV5XXrPCcw4aJPF+2PJDn/ZwdWuZfH9sZJHG
         JEutsaMl5WKiW1yLWWUPTW+k5IiB+mNRE/u/STxEVKzTiK5G58VvKIWfBvyIIGs+NGC9
         fOKOg/qIt/LaaBtDquEd9E4ABwsONQLXbashF6PBKBEOVFC/O/6J9y8mi2k3mkopIqEV
         rGmbWymADShImEjb4KhJiLnr3oWbC/F5mpnyjTVCmVgHK9nYIYRIpeNif/TaJYoDlqXe
         xi7iaadUwxCO6l/vrEZ8LvnbsEwPFAM/C+/W4wja9qQ5XpOfWvcy1we/Ll6RMbPY+qm+
         ACVA==
X-Gm-Message-State: AOJu0Ywp4DU9V7mKFEL1ot6wfnEATK0OewYnDrScFM44R94zeGTGiDvE
	arC5AZ/mahw5etBZbJA32nr7hINl8q+8HbpZZjRdP+aUcohSHCjWW50Yh+lDdSpF7iAr4jNR7bx
	Fx3tNIHxWX0swlbXIcstSbigWCyBLD16SwdZ2m4hCiWbKYmwClrYYr3pdlw==
X-Received: by 2002:a05:6122:21a8:b0:4ac:2054:6a27 with SMTP id j40-20020a05612221a800b004ac20546a27mr998182vkd.2.1699353892562;
        Tue, 07 Nov 2023 02:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMC0CZv1JlOOlXR9Oc095ULRlw2gtlX+rFrK1F4ZCBWq+Pc71oK28/pRjA8W++SY4b3sj4XLCcM8gBoJPxFBw=
X-Received: by 2002:a05:6122:21a8:b0:4ac:2054:6a27 with SMTP id
 j40-20020a05612221a800b004ac20546a27mr998179vkd.2.1699353892304; Tue, 07 Nov
 2023 02:44:52 -0800 (PST)
MIME-Version: 1.0
References: <ZNSke4Vs0jUSr3Jb@fedora>
In-Reply-To: <ZNSke4Vs0jUSr3Jb@fedora>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Tue, 7 Nov 2023 11:44:41 +0100
Message-ID: <CAHYGQ0zUyf8Cz_bFXQktf+YTy3PtcR40RRV=3Y-0nKzyXj5EvQ@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH] virtio-sound: use 'data buffer' instead of 'buffer'

Ping Anton.

Thanks.

On Thu, Aug 10, 2023 at 10:49=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> This RFC replaces the wording 'buffer' with 'data buffer' when referring
> to the payload of PCM messages. The virtio specification defines the
> word buffer as a set of zero or more device-readable
> physically-contiguous elements followed by zero or more
> physically-contiguous device-writable elements. In the virtio-sound
> section, the word is used only for the data or payload in a request. In
> this case, the data buffer is sent together with a header, i.e.,
> device-readable, and the status, i.e., device-writable. To not get
> confused with the main definition, this rfc replaces those usages
> with the wording 'data buffer'.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  device-types/sound/description.tex | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/device-types/sound/description.tex b/device-types/sound/desc=
ription.tex
> index 54c9c8e..97151fa 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
>
>  \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device /=
 Device Operation / PCM IO Messages}
>
> -An I/O message consists of the header part, followed by the buffer, and =
then
> -the status part.
> +An I/O message consists of a buffer that contains a header part, followe=
d by
> +the data buffer, and then the status part.
>
>  \begin{lstlisting}
>  /* an I/O header */
> @@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device T=
ypes / Sound Device / Device
>  \item[\field{latency_bytes}] indicates the current device latency.
>  \end{description}
>
> -Since all buffers in the queue (with one exception) should be of the siz=
e
> +Since all data buffers in the queue (with one exception) should be of th=
e size
>  \field{period_bytes}, the completion of such an I/O request can be consi=
dered an
>  elapsed period notification.
>
>  \paragraph{Output Stream}
>
> -In case of an output stream, the header is followed by a device-readable=
 buffer
> -containing PCM frames for writing to the device. All messages are placed=
 into
> -the tx queue.
> +In case of an output stream, the header is followed by a device-readable=
 data
> +buffer containing PCM frames for writing to the device. All messages are=
 placed
> +into the tx queue.
>
>  \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Devi=
ce / Device Operation / PCM Output Stream}
>
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is t=
otally
> +\item The device MUST NOT complete the I/O request until the data buffer=
 is totally
>  consumed.
>  \end{itemize}
>
> @@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device T=
ypes / Sound Device / Device
>
>  \begin{itemize}
>  \item The driver SHOULD populate the tx queue with \field{period_bytes} =
sized
> -buffers. The only exception is the end of the stream.
> -\item The driver MUST NOT place device-writable buffers into the tx queu=
e.
> +data buffers. The only exception is the end of the stream.
> +\item The driver MUST NOT place device-writable data buffers into the tx=
 queue.
>  \end{itemize}
>
>  \paragraph{Input Stream}
>
> -In case of an input stream, the header is followed by a device-writable =
buffer
> +In case of an input stream, the header is followed by a device-writable =
data buffer
>  being populated with PCM frames from the device. All messages are placed=
 into
>  the rx queue.
>
> @@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Typ=
es / Sound Device / Device
>  \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Devic=
e / Device Operation / PCM Input Stream}
>
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is f=
ull.
> +\item The device MUST NOT complete the I/O request until the data buffer=
 is full.
>  The only exception is the end of the stream.
>  \end{itemize}
>
> @@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Typ=
es / Sound Device / Device
>
>  \begin{itemize}
>  \item The driver SHOULD populate the rx queue with \field{period_bytes} =
sized
> -empty buffers before starting the stream.
> -\item The driver MUST NOT place device-readable buffers into the rx queu=
e.
> +empty data buffers before starting the stream.
> +\item The driver MUST NOT place device-readable data buffers into the rx=
 queue.
>  \end{itemize}
>
>  \subsubsection{Channel Map Control Messages}\label{sec:Device Types / So=
und Device / Device Operation / Channel Map Control Messages}
> --
> 2.41.0
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

