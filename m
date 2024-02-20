Return-Path: <virtio-comment-return-9129-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033D5C48BC3
	for <virtio-comment@archiver.kernel.org>; Tue, 20 Feb 2024 09:11:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 43BD53357E
	for <virtio-comment@archiver.kernel.org>; Tue, 20 Feb 2024 09:11:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F36F986561
	for <virtio-comment@archiver.kernel.org>; Tue, 20 Feb 2024 09:11:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE7399864A3; Tue, 20 Feb 2024 09:11:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DED369864BB
	for <virtio-comment@lists.oasis-open.org>; Tue, 20 Feb 2024 09:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iAjQjoDvOq-59NV7f6EACw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420302; x=1709025102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q9fOlJJ9uGcC12mc2tMTyWAxS3LHqn9kbS0C3aC43E=;
        b=SxmpFmredaGm/30NIGIv5kEnlf6Hu4X/TpQxB6vmGCAFgtwEAd61RPNao+DX/MLPS/
         8sxw0hFsBkIHFaoPkTMfQw6Ut9iP8SjC2EKmO7kEztte7rRqckvyRyJqM47PTOD6SDRc
         cDbkSfJe7W6QKNWYR2Rz9uq49629pjHxTNrPYNrd2EZ0Iw50YO2H+rkVHVAkGaYbb9Ki
         wOwGBigGgYiGXolC4ZfZIOt9rEbZdP0ZzFIkOdLbiQ1RgWJJuMSSmAlGUTK2i+tCguNf
         wmWIrCinbyZsfF+tTVHHrvEgwKgoaU5vbzGFCn9WT9dhXGA5ZLcEv/0EI7Zk+AFQIp1h
         M2Ug==
X-Gm-Message-State: AOJu0Yz1sUM5m8SGlBPIVe4EcOjBD4CivQsjQl+FHxCXAdbCQ4NroLTM
	XEO1lwNPU/VMgDWRaAwvm/qulxkXhq0krVvAHaAzEoDUwDPO62OT54Zzl2o6xisi4waT2pytSNd
	uadJ9l3RzQZgz0uDoXT5zbaSjYm1n0aUoqwbcSu4SKOD3EiduUYyn7aPkyj+PBk3TgfavG7Jvd8
	PRg0H056UxnDetekW7NAnJRtyWJZdQSG518p/+8m2diVODgn+lwMoTPb02
X-Received: by 2002:a67:fa55:0:b0:470:4de7:20a2 with SMTP id j21-20020a67fa55000000b004704de720a2mr4778781vsq.33.1708420302014;
        Tue, 20 Feb 2024 01:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF2eaeEfOodmZpxLJQbzyBRo91vUBZog/6C9MaLw3FMOpfbJB6ty04YZYc+aaBdRPwtebUTr+5bVebi0Vz6DM=
X-Received: by 2002:a67:fa55:0:b0:470:4de7:20a2 with SMTP id
 j21-20020a67fa55000000b004704de720a2mr4778768vsq.33.1708420301655; Tue, 20
 Feb 2024 01:11:41 -0800 (PST)
MIME-Version: 1.0
References: <ZWhq3eOxSZ8a7sd1@fedora>
In-Reply-To: <ZWhq3eOxSZ8a7sd1@fedora>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Tue, 20 Feb 2024 10:11:30 +0100
Message-ID: <CAHYGQ0x4fKCaTE1sBmpbBzzjEw_GwFES0f3eg7oeRvWsm4S4ZA@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH] virtio-sound: use 'data buffer' instead of 'buffer'

On Thu, Nov 30, 2023 at 11:58=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
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

Hello Anton,

I apologize for asking again, but could you please add your R-b to
this patch? you have already reviewed the RFC.

Thanks.


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

