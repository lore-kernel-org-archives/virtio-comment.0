Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733954EB45
	for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665586; cv=none; b=eahLu19m58mslTglrgXyI/fQQqQ8hLaEfwWh790NjnbuXUJj+vqs8baDjpDxckOUEUq+KkiLFYP8+yZ+AU4Vio0NfJSphRGl2b+2X+Qs7+FiBhSvA4aJ2NTNMdBCRjQlIZzxgF+nLvYVCJJhkAMiu9mMo81sBmrjNVcUQ6kCyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665586; c=relaxed/simple;
	bh=B2OSSHDzO4jariYAzT/XsGYEIBQC3XkDG6n+Pu2gNNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlD3cPzwbwP39Y1gY2dgdHU7Dbhw/OqK9S3qtix2dbcMiXTGPU0guUpRzBhob6yTpyFiaugWmod3976hRiAjFjHkOYwmaXu4pcuQDyve92/EZ32VDpFkWynOelkMrs3FSsP9fLP1t9kHWHxYb4gqvRBW2V35LpYx12NKjabfqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V5RwdRqQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V5RwdRqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729665582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBf+F/oZqWz1OldTRu8Gr1Q3N15elD14o8+3u7BX3aE=;
	b=V5RwdRqQ3dezTZ0q+MwVpgjUlvZKOHpvlyicpxQPmDHvW1YtrSPcWcQtrAUEWATdvw9tKz
	6+ThU3ZRwnI/TvW7cvGUa747HLtIzucvGadCrv5oMEYNCEU+Jogpy8rPdsgKwPXQlywV5l
	hgFdvniYtYRsI+4zJ0ULOwIgc4Hd6Ys=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-TuV8mi9gMSik4jLn1MVZNA-1; Wed, 23 Oct 2024 02:39:39 -0400
X-MC-Unique: TuV8mi9gMSik4jLn1MVZNA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e5bd595374so579074a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 23:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729665579; x=1730270379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBf+F/oZqWz1OldTRu8Gr1Q3N15elD14o8+3u7BX3aE=;
        b=U7LTtWNLv1bsMMQ54jEYHtMR62hwDB2cNojSkt/ab6Q2dfm6SwHBO3bFgmbbSZ0Gx+
         7269GfMQh5IuDGf512efA4ZhR2H+23uNJ/oJTkZvzk2WTfS9OjYWswIND/UJMGxFI1f7
         SPYcPE9YbMXpIekFJPJrbRCi4ZV26V/Ty6EVu76RR0bYz9An/FF+9VS6fCIrX/EUP33u
         BmkcSRTwdXR7akaFjZzJrLrETYkYTt5n6hDdvcnhlc0V3pZQBR4GoRUuzpmIFk/5t8Vb
         qjZfiMfLw0Jg++ubSUAde1Fg+ju2s90yai56Fdu0I3iHPKzk1yf5FEYHIridUTd4Pdv1
         vwxA==
X-Gm-Message-State: AOJu0YyTufFo7aC6B/+svkX1/Aq/VcVPdSgx7h15cXwrE0Hj8i3lkEkZ
	wYpCyG7dS/fhaggUOwscAntCuHoBPyi+vQuuRCS7tH1aoDFeXh0p/Sf9ABtocbh+mO8zYQuhI5Y
	+LwC+LfQlss6jPQ9rWmIJ0NmSdHtebFSauljOwWGswISankc81TDiw1rlXwPUMpJ6qZ31SY16IY
	gjv8qCXKM5Y/xykur3s2H4m5r4kNVpWPdfLNhcUQI=
X-Received: by 2002:a17:90a:288:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e76a6e47a7mr2447562a91.4.1729665578358;
        Tue, 22 Oct 2024 23:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+7JByY3gkynvtsv+dABtGulge9EtpslDRIyk3gVdWhHtBdr/LHAyPibXNmKR6WLXX6sScxtTGP2MXph4xSa4=
X-Received: by 2002:a17:90a:288:b0:2d8:9fbe:6727 with SMTP id
 98e67ed59e1d1-2e76a6e47a7mr2447513a91.4.1729665577676; Tue, 22 Oct 2024
 23:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
 <CAPBb6MXZ0mtniEDiBnbYE1zDgTAYCvQ2-g-9TxaD3t3AzwZiOQ@mail.gmail.com>
 <CADSE00L-4NzVMEjPhryA-_rvv0TRzsRY7FDB9iMnc7ZCujM35w@mail.gmail.com> <CAPBb6MV9WT=tF0rk0dX_hr3SaHFqxzNf=MZDDRPauvpkYqRrZg@mail.gmail.com>
In-Reply-To: <CAPBb6MV9WT=tF0rk0dX_hr3SaHFqxzNf=MZDDRPauvpkYqRrZg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 23 Oct 2024 08:39:26 +0200
Message-ID: <CADSE00KqP4v4hBsNOaLjWb9npptXs8AefRBQd+oJ7X35t=CyrQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <acourbot@google.com>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com, 
	daniel.almeida@collabora.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, eballetb@redhat.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, cohuck@redhat.com, 
	mst@redhat.com, agordeev@qti.qualcomm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 7:25=E2=80=AFAM Alexandre Courbot <acourbot@google.=
com> wrote:
>
> On Mon, Oct 21, 2024 at 10:42=E2=80=AFPM Albert Esteve <aesteve@redhat.co=
m> wrote:
> >
> > On Mon, Oct 21, 2024 at 9:53=E2=80=AFAM Alexandre Courbot <acourbot@chr=
omium.org> wrote:
> > >
> > > Hi Albert, thanks for this new revision!
> > >
> > > On Thu, Oct 17, 2024 at 4:04=E2=80=AFPM Albert Esteve <aesteve@redhat=
.com> wrote:
> > > >
> > > > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > > virtio, able to virtualize any video device supported
> > > > by V4L2
> > > >
> > > > Note that virtio-media does not require the use of a
> > > > V4L2 device driver or of Linux on the host or
> > > > guest side - V4L2 is only used as a host-guest protocol,
> > > > and both sides are free to convert it from/to any
> > > > model that they wish to use.
> > > >
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  conformance.tex                           |  13 +-
> > > >  content.tex                               |   1 +
> > > >  device-types/media/description.tex        | 583 ++++++++++++++++++=
++++
> > > >  device-types/media/device-conformance.tex |  11 +
> > > >  device-types/media/driver-conformance.tex |   9 +
> > > >  5 files changed, 613 insertions(+), 4 deletions(-)
> > > >  create mode 100644 device-types/media/description.tex
> > > >  create mode 100644 device-types/media/device-conformance.tex
> > > >  create mode 100644 device-types/media/driver-conformance.tex
> > > >
> > > > diff --git a/conformance.tex b/conformance.tex
> > > > index dc00e84..c369da1 100644
> > > > --- a/conformance.tex
> > > > +++ b/conformance.tex
> > > > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conforma=
nce / Conformance Targets}
> > > >  \ref{sec:Conformance / Driver Conformance / Memory Driver Conforma=
nce},
> > > >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Con=
formance},
> > > >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformanc=
e},
> > > > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformanc=
e} or
> > > > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformanc=
e}.
> > > > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformanc=
e},
> > > > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformanc=
e} or
> > > > +\ref{sec:Conformance / Driver Conformance / Media Driver Conforman=
ce}.
> > > > +
> > > >
> > > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transiti=
onal Device and Transitional Driver Conformance}.
> > > >    \end{itemize}
> > > > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> > > >  \ref{sec:Conformance / Device Conformance / Memory Device Conforma=
nce},
> > > >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Con=
formance},
> > > >  \ref{sec:Conformance / Device Conformance / SCMI Device Conformanc=
e},
> > > > -\ref{sec:Conformance / Device Conformance / GPIO Device Conformanc=
e} or
> > > > -\ref{sec:Conformance / Device Conformance / PMEM Device Conformanc=
e}.
> > > > +\ref{sec:Conformance / Device Conformance / GPIO Device Conformanc=
e},
> > > > +\ref{sec:Conformance / Device Conformance / PMEM Device Conformanc=
e} or
> > > > +\ref{sec:Conformance / Device Conformance / Media Device Conforman=
ce}.
> > > >
> > > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transiti=
onal Device and Transitional Driver Conformance}.
> > > >    \end{itemize}
> > > > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conform=
ance / Conformance Targets}
> > > >  \input{device-types/scmi/driver-conformance.tex}
> > > >  \input{device-types/gpio/driver-conformance.tex}
> > > >  \input{device-types/pmem/driver-conformance.tex}
> > > > +\input{device-types/media/driver-conformance.tex}
> > > >
> > > >  \conformance{\section}{Device Conformance}\label{sec:Conformance /=
 Device Conformance}
> > > >
> > > > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conform=
ance / Conformance Targets}
> > > >  \input{device-types/scmi/device-conformance.tex}
> > > >  \input{device-types/gpio/device-conformance.tex}
> > > >  \input{device-types/pmem/device-conformance.tex}
> > > > +\input{device-types/media/device-conformance.tex}
> > > >
> > > >  \conformance{\section}{Legacy Interface: Transitional Device and T=
ransitional Driver Conformance}\label{sec:Conformance / Legacy Interface: T=
ransitional Device and Transitional Driver Conformance}
> > > >  A conformant implementation MUST be either transitional or
> > > > diff --git a/content.tex b/content.tex
> > > > index 0a62dce..59925ae 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
> > > >  \input{device-types/scmi/description.tex}
> > > >  \input{device-types/gpio/description.tex}
> > > >  \input{device-types/pmem/description.tex}
> > > > +\input{device-types/media/description.tex}
> > > >
> > > >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > > >
> > > > diff --git a/device-types/media/description.tex b/device-types/medi=
a/description.tex
> > > > new file mode 100644
> > > > index 0000000..793e9b1
> > > > --- /dev/null
> > > > +++ b/device-types/media/description.tex
> > > > @@ -0,0 +1,583 @@
> > > > +\section{Media Device}\label{sec:Device Types / Media Device}
> > > > +
> > > > +The virtio media device follow the same model (and structures) as =
V4L2. It
> > > > +can be used to virtualize cameras, codec devices, or any other dev=
ice
> > > > +supported by V4L2. The device assumes 64-bit little-endian V4L2 st=
ructures
> > > > +are exchanged. The complete definition of V4L2 structures and ioct=
ls can
> > > > +be found under the
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/i=
ndex.html}{V4L2 UAPI documentation}.
> > > > +
> > > > +V4L2 is a UAPI that allows a less privileged entity (user-space) t=
o use video
> > > > +hardware exposed by a more privileged entity (the kernel). Virtio-=
media is an
> > > > +encapsulation of this API into virtio, turning it into a virtualiz=
ation API
> > > > +for all classes of video devices supported by V4L2, where the devi=
ce plays the
> > > > +role of the kernel and the driver the role of user-space.
> > > > +
> > > > +The device is therefore responsible for presenting a virtual devic=
e that behaves
> > > > +like an actual V4L2 device, which the driver can control.
> > > > +
> > > > +Note that virtio-media does not require the use of a V4L2 device d=
river or of
> > > > +Linux on any side - V4L2 is only used as a transport protocol,
> > > > +and both sides are free to convert it from/to any model that they =
wish to use.
> > > > +
> > > > +This section relies on definitions from
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/i=
ndex.html}{V4L2 UAPI documentation}.
> > > > +
> > > > +\subsection{Device ID}\label{sec:Device Types / Media Device / Dev=
ice ID}
> > > > +
> > > > +49
> > > > +
> > > > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Vi=
rtqueues}
> > > > +
> > > > +\begin{description}
> > > > +\item[0] commandq - used for driver commands and device responses =
to these
> > > > +commands.
> > > > +\item[1] eventq - used for events sent by the device to the driver=
.
> > > > +\end{description}
> > > > +
> > > > +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media =
Device / Virtqueues}
> > > > +
> > > > +The device MUST return the descriptor chains it receives on the co=
mmandq as
> > > > +soon as possible, and must never hold them for indefinite periods =
of time.
> > > > +
> > > > +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media =
Device / Virtqueues}
> > > > +
> > > > +The driver MUST re-queue the descriptor chains returned by the dev=
ice on the
> > > > +eventq as soon as possible, and must never hold them for indefinit=
e periods
> > > > +of time.
> > > > +
> > > > +\subsection{Feature Bits}\label{sec:Device Types / Media Device / =
Feature Bits}
> > > > +
> > > > +None
> > > > +
> > > > +\subsection{Device Configuration Layout}\label{sec:Device Types / =
Media Device / Device Configuration Layout}
> > > > +
> > > > +The video device configuration space uses the following layout:
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_config {
> > > > +    le32 device_caps;
> > > > +    le32 device_type;
> > > > +    u8 card[32];
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{device_caps}] (driver-read-only) flags representing t=
he device
> > > > +capabilities as used in
> > > > +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-q=
uerycap.html#c.v4l2_capability}{struct v4l2_capabilities}.
> > > > +Corresponds with the \field{device_caps} field in the \textit{stru=
ct video_device}.
> > > > +\item[\field{device_type}] (driver-read-only) informs the driver o=
f the type
> > > > +of the video device. Corresponds with the \field{vfl_devnode_type}=
 field of the device.
> > > > +\item[\field{card}] (driver-read-only) name of the device, a NUL-t=
erminated
> > > > +UTF-8 string. Corresponds with the \field{card} field of the \text=
it{struct v4l2_capability}.
> > > > +If all the characters of the field are used, it does not need to b=
e NUL-terminated.
> > > > +\end{description}
> > > > +
> > > > +\subsection{Device Initialization}
> > > > +
> > > > +\begin{enumerate}
> > > > +\item The driver reads the \field{device_caps} and \field{device_t=
ype} fields
> > > > +from the configuration layout to identify the device.
> > > > +\item The driver sets up the \field{commandq} and \field{eventq}.
> > > > +\item The driver may open a session to use the device and send V4L=
2 ioctls in
> > > > +order to receive more information about the device, such as suppor=
ted
> > > > +formats or controls.
> > > > +\end{enumerate}
> > > > +
> > > > +\subsection{Device Operation}\label{sec:Device Types / Media Devic=
e / Device Operation}
> > > > +
> > > > +Commands are queued on the command queue by the driver for the dev=
ice to
> > > > +process. The errors returned by each command are standard
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/g=
en-errors.html}{Linux kernel error codes}.
> > > > +For instance, a command that contains invalid options will return =
\textit{EINVAL}.
> > > > +
> > > > +Events are sent on the event queue by the device for the driver to=
 handle.
> > > > +
> > > > +\subsubsection{Command Virtqueue}
> > > > +
> > > > +\paragraph{Device Operation: Command headers}
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > > > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > > > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > > > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > > > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > > > +
> > > > +/* Header for all virtio commands from the driver to the device on=
 the commandq. */
> > > > +struct virtio_media_cmd_header {
> > > > +       u32 cmd;
> > > > +       u32 __padding;
> > > > +};
> > > > +
> > > > +/* Header for all virtio responses from the device to the driver o=
n the commandq. */
> > > > +struct virtio_media_resp_header {
> > > > +       u32 status;
> > > > +       u32 __padding;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +A command consists of a command header \textit{virtio_media_cmd_he=
ader}
> > > > +containing the following device-readable field:
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_C=
MD_*).
> > > > +\end{description}
> > > > +
> > > > +A response consists of a response header \textit{virtio_media_resp=
_header}
> > > > +containing the following device-writable field:
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{status}] indicates a device request status.
> > > > +\end{description}
> > > > +
> > > > +The status field can take 0 if the command was successful, or one =
of the
> > > > +standard Linux error codes if it was not.
> > > > +
> > > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: =
Sessions}{Device Types / Media Device / Device Operation / Command Virtqueu=
e}
> > > > +
> > > > +Sessions are how the device is multiplexed, allowing several disti=
nct works to
> > > > +take place simultaneously. The driver needs to open a session befo=
re it can
> > > > +perform any useful operation on the device.
> > > > +
> > > > +\paragraph{Device Operation: Open device}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > > > +
> > > > +This is the equivalent of calling \textit{open} on a V4L2 device n=
ode.
> > > > +The driver uses \textit{virtio_media_cmd_open} to send an open req=
uest.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_cmd_open {
> > > > +    struct virtio_media_cmd_header hdr;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit=
{virtio_media_resp_open}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_resp_open {
> > > > +    struct virtio_media_resp_header hdr;
> > > > +    u32 session_id;
> > > > +    u32 __padding;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] specifies an identifier for the current =
session. The
> > > > +identifier can be used to perform other commands on the session, n=
otably ioctls.
> > > > +\end{description}
> > > > +
> > > > +\devicenormative{\subparagraph}{Device Operation: Open device}{Dev=
ice Types / Media Device / Device Operation / Open device}
> > > > +
> > > > +Upon success, the device MUST set a \field{session_id} in \textit{=
virtio_media_resp_open}
> > > > +to an integer that is NOT used by any other open session.
> > > > +
> > > > +\paragraph{Device Operation: Close device}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active sess=
ion.
> > > > +
> > > > +This is the equivalent of calling \textit{close} on a previously o=
pened V4L2
> > > > +device node. All resources associated with this session will be fr=
eed.
> > > > +
> > > > +This command does not require a response from the device.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_cmd_close {
> > > > +    struct virtio_media_cmd_header hdr;
> > > > +    u32 session_id;
> > > > +    u32 __padding;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] specifies an identifier for the session =
to close.
> > > > +\end{description}
> > > > +
> > > > +\drivernormative{\subparagraph}{Device Operation: Close device}{De=
vice Types / Media Device / Device Operation / Close device}
> > > > +
> > > > +The session ID SHALL NOT be used again after queueing this command=
.
> > > > +
> > > > +\paragraph{Device Operation: V4L2 ioctls}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on =
an open
> > > > +session.
> > > > +
> > > > +This command asks the device to run one of the `VIDIOC_*` ioctls o=
n the active
> > > > +session.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_cmd_ioctl {
> > > > +    struct virtio_media_cmd_header hdr;
> > > > +    u32 session_id;
> > > > +    u32 code;
> > > > +    /* Followed by the relevant ioctl payload as defined in the ma=
cro */
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] specifies an identifier of thesession to=
 run the ioctl on.
> > > > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioc=
tl to run.
> > > > +\end{description}
> > > > +
> > > > +The code is extracted from the
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/videodev.html}{videodev2.h},
> > > > +header file. The file defines the ioctl's codes, type of payload, =
and
> > > > +direction. The code consists of the second argument of the \field{=
_IO*} macro.
> > > > +
> > > > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > > > +\end{lstlisting}
> > > > +
> > > > +This means that its ioctl code is \textit{4}, that its payload is =
a
> > > > +\textit{struct v4l2_format}, and that its direction is \textit{WR}=
 (i.e., the
> > > > +payload is written by both the driver and the device).
> > > > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / I=
octls payload}
> > > > +for more information about the direction of ioctls.
> > > > +
> > > > +The payload layout is always a 64-bit representation of the corres=
ponding
> > > > +V4L2 structure.
> > > > +
> > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \texti=
t{virtio_media_resp_ioctl}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_resp_ioctl {
> > > > +    struct virtio_media_resp_header hdr;
> > > > +    /* Followed by the ioctl payload as defined in the macro */
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Devic=
e / V4L2 ioctls / Ioctls payload}
> > > > +
> > > > +Each ioctl has a payload, which is defined by the third argument o=
f the
> > > > +\field{_IO*} macro defining it.
> > > > +
> > > > +The payload of an ioctl in the descriptor chain follows the comman=
d structure,
> > > > +the reponse structure, or both depending on the direction:
> > > > +
> > > > +\begin{itemize}
> > > > +\item \textbf{_IOR} is read-only for the driver, meaning the paylo=
ad
> > > > +follows the response in the device-writable section of the descrip=
tor chain.
> > > > +\item \textbf{_IOW} is read-only for the device, meaning the paylo=
ad
> > > > +follows the command in the driver-writable section of the descript=
or chain.
> > > > +\item \textbf{_IOWR} is writable by both the device and driver,
> > > > +meaning the payload must follow both the command in the driver-wri=
table section
> > > > +of the descriptor chain, and the response in the device-writable s=
ection.
> > > > +\end{itemize}
> > > > +
> > > > +A common optimization for \textit{WR} ioctls is to provide the pay=
load using
> > > > +descriptors that both point to the same buffer. This mimics the be=
havior of
> > > > +V4L2 ioctls where the data is only passed once and used as both in=
put and
> > > > +output by the kernel.
> > > > +
> > > > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Dev=
ice Types / Media Device / Device Operation / V4L2 ioctls}
> > > > +
> > > > +In case of success of a device-writable ioctl, the device MUST alw=
ays write the
> > > > +payload in the device-writable part of the descriptor chain.
> > > > +
> > > > +In case of failure of a device-writable ioctl, the device is free =
to write the
> > > > +payload in the device-writable part of the descriptor chain or not=
. Some errors
> > > > +may still result in the payload being updated, and in this case th=
e device is
> > > > +expected to write the updated payload. If the device has not writt=
en the
> > > > +payload after an error, the driver MUST assume that the payload ha=
s not been
> > > > +modified.
> > > > +
> > > > +\subparagraph{Handling of pointers in ioctl payload}
> > > > +
> > > > +A few structures used as ioctl payloads contain pointers to furthe=
r
> > > > +data needed for the ioctl. There are notably:
> > > > +
> > > > +\begin{itemize}
> > > > +\item The \field{planes} pointer of
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > > +which size is determined by the length member.
> > > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_cont=
rols}, which
> > > > +size is determined by the count member.
> > > > +\end{itemize}
> > > > +
> > > > +If the size of the pointed area is determined to be non-zero, then=
 the main
> > > > +payload is immediately followed by the pointed data in their order=
 of
> > > > +appearance in the structure, and the pointer value itself is ignor=
ed by the
> > > > +device, which must also return the value initially passed by the d=
river.
> > > > +
> > > > +\subparagraph{Handling of pointers to userspace memory}
> > > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace m=
emory}
> > > > +
> > > > +A few pointers are special in that they point to userspace memory =
in the
> > > > +original V4L2 specification. They are:
> > > > +
> > > > +\begin{itemize}
> > > > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} =
and
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > > > +(technically an unsigned long, but designated a userspace address)=
.
> > > > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > > > +\end{itemize}
> > > > +
> > > > +These pointers can cover large areas of scattered memory, which ha=
s the
> > > > +potential to require more descriptors than the virtio queue can pr=
ovide. For
> > > > +these particular pointers only, a list of \textit{struct virtio_me=
dia_sg_entry}
> > > > +that covers the needed amount of memory for the pointer is used in=
stead of
> > > > +using descriptors to map the pointed memory directly.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_sg_entry {
> > > > +       u64 start;
> > > > +       u32 len;
> > > > +       u32 __padding;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +For each such pointer to read, the device reads as many SG entries=
 as needed
> > > > +to cover the length of the pointed buffer, as described by its par=
ent
> > > > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > > > +\textit{struct v4l2_plane} for buffer memory, and \field{size} mem=
ber of
> > > > +\textit{struct v4l2_ext_control} for control data).
> > > > +
> > > > +Since the device never needs to modify the list of SG entries, it =
is only
> > > > +provided by the driver in the device-readable section of the descr=
iptor chain,
> > > > +and not repeated in the device-writable section, even for WR ioctl=
s.
> > > > +
> > > > +\subparagraph{Unsupported ioctls}
> > > > +
> > > > +A few ioctls are replaced by other, more suitable mechanisms.
> > > > +
> > > > +\begin{itemize}
> > > > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configur=
ation area
> > > > +(see \ref{sec:Device Types / Media Device / Device Configuration L=
ayout}).
> > > > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > > > +(see \ref{sec:Device Types / Media Device / Device Operation / Deq=
ueue buffer}).
> > > > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > > > +(see \ref{sec:Device Types / Media Device / Device Operation / Emi=
t an event}).
> > > > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} ar=
e deprecated
> > > > +and replaced by the controls of the JPEG class.
> > > > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and sh=
all not be
> > > > +implemented by the device.
> > > > +\end{itemize}
> > > > +
> > > > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioct=
ls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > > +
> > > > +If being requested an unsupported ioctl, the device MUST return th=
e same
> > > > +error response as it would for an unknown ioctl, i.e. \textit{ENOT=
TY}.
> > > > +
> > > > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer i=
nto the
> > > > +driver's address space.
> > > > +
> > > > +Shared memory region ID 0 is used to map MMAP buffers with
> > > > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > > > +
> > > > +struct virtio_media_cmd_mmap {
> > > > +       struct virtio_media_cmd_header hdr;
> > > > +       u32 session_id;
> > > > +       u32 flags;
> > > > +       u64 offset;
> > >
> > > This field is now
> > >
> > >   u32 offset;
> > >
> > > u32 is the type actually returned by V4L2_QUERYBUF for the offset
> > > field, so using a u64 here made no sense. Furthermore, I realized tha=
t
> > > the offset is an identifier more than an actual starting address entr=
y
> > > in a range that must cover the whole buffer's length, so there is no
> > > risk of running out of space even with a u32.
> >
> > Sounds good, thanks for pointing this out.
> > Parav commented to change all fields to leX (le32, le64, etc.), so
> > that the endianess
> > is not assumed through the spec. I think that makes sense, it was also =
something
> > I was pondering when writing the specs to make it consistent with all o=
ther
> > structures.
> >
> > However, it would require changing all structures in the virtio-media
> > driver and device code, and handle endianess translation where
> > needed. I hope that is ok?
>
> I guess that's a necessity anyway, unless we disable build for
> big-endian platforms. For the driver we can probably keep the
> structures as they are, as long as we make sure to fix their
> endianness when pushing them on the virtqueue.

Makes sense. Thanks for confirming!

BR,
Albert.

>
> >
> > >
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{flags}] is the set of flags for the mapping. \field{V=
IRTIO_MEDIA_MMAP_FLAG_RW}
> > > > +can be set if a read-write mapping is desired. Without this flag t=
he mapping
> > > > +will be read-only.
> > > > +\item[\field{offset}] corresponds to the \field{mem_offset} field =
of the
> > > > +\textit{union v4l2_plane} for the plane to map. This field can be =
obtained
> > > > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > > > +\end{description}
> > > > +
> > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit=
{virtio_media_resp_mmap}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_resp_mmap {
> > > > +    struct virtio_media_resp_header hdr;
> > > > +    u64 offset;
> > >
> > > This has been renamed to
> > >
> > >   u64 guest_addr;
> > >
> > > to avoid confusion with virtio_media_cmd_mmap's "offset" field.
> > >
> > > > +    u64 len;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{offset}] offset into SHM region ID 0 of the start of =
the mapping.
> > > > +\item[\field{len}] length of the mapping as indicated by the \text=
it{struct v4l2_plane}
> > > > +the buffer belongs to.
> > > > +\end{description}
> > > > +
> > > > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously ma=
pped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_cmd_munmap {
> > > > +    struct virtio_media_cmd_header hdr;
> > > > +    u64 offset;
> > >
> > > Similarly to above, this has been renamed to
> > >
> > >   u64 guest_addr;
> >
> > In general I am being asked to remove guest from the spec and use
> > driver instead.
> > So I will change it for driver_addr instead.
> >
> > BR,
> > Albert.
> >
> > >
> > > Cheers,
> > > Alex.
> > >
> >
>

