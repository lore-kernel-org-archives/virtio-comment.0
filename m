Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701FCEC4
	for <virtio-comment@lists.linux.dev>; Mon,  3 Mar 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994240; cv=none; b=hZeO2UuwC6na4nqNsMuvJQHFbmfdH5d7GoC0jfTXVz4m7V1iHaDIwBwLQmTeTx/pL7vDHhhAkQxFOmFVbZpp7opv6mThyxkW34mCQa8B2fKdZPL3hLfq9w/ktHjNigEeQvjXuzVjftgenZzUbbS95lu0oVFHsilyqQXMDeuefKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994240; c=relaxed/simple;
	bh=SHTUXE6BgtsFMZPHfQHn/GzS9rU03z5ZeOQKRzDYmew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IR4U5omjdjwaoWphxUqO+o0E7z7NdX6KuOw4wHXgnsKj/e28/fo8vBUw/Ngk+C9sbu294dHM8WkD+E6XfHXOAkimgYkeXrhA6uNCn3qv9Un/da/F3jEKaROKyYsLeDqmrbINCt4LS4YS8BfQ99WPxTZbQ4hd0/jJLON9BQamT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KSTYtD3j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KSTYtD3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmfIqto3GKck+jS0dKTZ7g99/C1p1WY+NvT5/ihNY9E=;
	b=KSTYtD3jhXqx8aSZqK8rtI2e5EFxu4+bw8EcPncC0UBw1h7hsqCoCveufp4TG4jC1alLRh
	6Lg8T365IcLzflK+frTla5J6ZrorfJgxs0A3eI0qExffl4QwUIr623b2+GhrSBfHHX2IiS
	l/eAP6O2Ckf/I2skEeVYXaG/1jpbqkI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-72mWsBA0Oy2AEEfg0P_NoQ-1; Mon, 03 Mar 2025 04:30:33 -0500
X-MC-Unique: 72mWsBA0Oy2AEEfg0P_NoQ-1
X-Mimecast-MFC-AGG-ID: 72mWsBA0Oy2AEEfg0P_NoQ_1740994232
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fea8e4a655so12833769a91.0
        for <virtio-comment@lists.linux.dev>; Mon, 03 Mar 2025 01:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994232; x=1741599032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmfIqto3GKck+jS0dKTZ7g99/C1p1WY+NvT5/ihNY9E=;
        b=ZHqkJCxMS7o+SuhC0an1bOGod5PmLAMoQvnho8zBcPMSpGMLVIYx77YihYpHiJZUZG
         2i27sQR9oRApBi7CPErKEewxS49O1DGMFcd+PSCc8kcl9b6QxphYMzr8UG0Z4Vy4FjUa
         6lvkEhwZ5yPwxMiLo4rCpxsh15XqmQdLOLHUsTuQ2bipV4FjqmQQsOU1B1PewTA5Y4ad
         M1hT0z2CgIFKwkkanQF3WlGqdd+/dNDt4FBDyIGC2T4P3qnQGXfSimLQa0oKfyFnj0Ab
         hjvDc8quwH9Z29r0aJA5nL/umM2Rb9d4TY9H3opfIQmm99kVaABO7CIPgyqydxg3Om1C
         bvLw==
X-Gm-Message-State: AOJu0YydZHXV0xYnAvPDZFsqaxeWfN+E5cRPY+kr7W8EIg3VO2qQ5EfN
	v/9jIDAbxfWNwflDzeasan4KfvG0yrqbq71P2ZFOhTojzUXvWqbYQ5znA86RREZZt4TmmP5IkM/
	7l4eBkJfYYs7EUdcxR3BJlPoN2KiI0Aq/piy+FNogFWzyBSfCB911j+mi//T1g7JZUEZFGaM5Xb
	6o/I2joeARXYN/RuO7Q6ZG8cb97k/hwSOoQULujt4=
X-Gm-Gg: ASbGncvsv8FziPk0f4SiqggJCHDwcm69PZaiSmdebGfWHxX0ZecaqBNeMcGWEM3ibQl
	pX2gxlyrkBt4iP2/qAJrl624Jv8UvMbbwgb12/kkFMekXB7qAGyBlF1x02ZVBTU4uyN4d4afE+8
	E=
X-Received: by 2002:a17:90b:3511:b0:2ee:8427:4b02 with SMTP id 98e67ed59e1d1-2febabd9c82mr18971971a91.28.1740994231563;
        Mon, 03 Mar 2025 01:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/4zEb5G/pIoVk/8aM+EZBjXSKt9tNxwfG5jfIZEXVCzEODaZHupjvLgZGOlt8N4hlpy+TDyzzwTUfO9yBcpU=
X-Received: by 2002:a17:90b:3511:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2febabd9c82mr18971901a91.28.1740994230863; Mon, 03 Mar 2025
 01:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220155636.577400-1-aesteve@redhat.com> <20250220155636.577400-2-aesteve@redhat.com>
 <D844CMV9GQ2S.EAKBGGAOP6JM@gmail.com>
In-Reply-To: <D844CMV9GQ2S.EAKBGGAOP6JM@gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 3 Mar 2025 10:30:18 +0100
X-Gm-Features: AQ5f1JqBpcsTDTRVixjA66TA_CAAvDkpPmFWniOGqOKp7LYFAiFqxpyQdCZCJ-k
Message-ID: <CADSE00+H8xvw+ydMa8qyenJYxmDLeotjts7iKm56ZBxfECXUcw@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <gnurou@gmail.com>
Cc: virtio-comment@lists.linux.dev, nicolas.dufresne@collabora.com, 
	cohuck@redhat.com, hverkuil@xs4all.nl, adelva@google.com, eballetb@redhat.com, 
	mst@redhat.com, ribalda@google.com, changyeon@google.com, mvaralar@redhat.com, 
	daniel.almeida@collabora.com, dverkamp@chromium.org, 
	agordeev@qti.qualcomm.com, gurchetansingh@google.com, alex.bennee@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BRNeL-paGkE0SgW9sQod2MOQOhRAFFuUblDoyfNNhUA_1740994232
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 2:39=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com=
> wrote:
>
> Hi Albert,
>
> Apologies, I wanted to just put my reviewed-by but found a few more
> things on what I expected to be my final read of this spec. ^_^; They
> should be easy to address though.

Hi Alex,

Not a problem! At the contrary, your input is always welcome.

>
> On Fri Feb 21, 2025 at 12:56 AM JST, Albert Esteve wrote:
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2.
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver on the host or guest side -
> > V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
> >
> > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 637 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  15 +
> >  device-types/media/driver-conformance.tex |  11 +
> >  5 files changed, 673 insertions(+), 4 deletions(-)
> >  create mode 100644 device-types/media/description.tex
> >  create mode 100644 device-types/media/device-conformance.tex
> >  create mode 100644 device-types/media/driver-conformance.tex
> >
> > diff --git a/conformance.tex b/conformance.tex
> > index dc00e84..c369da1 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance =
/ Conformance Targets}
> >  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance}=
,
> >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conform=
ance},
> >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} o=
r
> > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} o=
r
> > +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> > +
> >
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional=
 Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
> >  \ref{sec:Conformance / Device Conformance / Memory Device Conformance}=
,
> >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conform=
ance},
> >  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> > -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} o=
r
> > -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> > +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> > +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} o=
r
> > +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
> >
> >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional=
 Device and Transitional Driver Conformance}.
> >    \end{itemize}
> > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >  \input{device-types/scmi/driver-conformance.tex}
> >  \input{device-types/gpio/driver-conformance.tex}
> >  \input{device-types/pmem/driver-conformance.tex}
> > +\input{device-types/media/driver-conformance.tex}
> >
> >  \conformance{\section}{Device Conformance}\label{sec:Conformance / Dev=
ice Conformance}
> >
> > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> >  \input{device-types/scmi/device-conformance.tex}
> >  \input{device-types/gpio/device-conformance.tex}
> >  \input{device-types/pmem/device-conformance.tex}
> > +\input{device-types/media/device-conformance.tex}
> >
> >  \conformance{\section}{Legacy Interface: Transitional Device and Trans=
itional Driver Conformance}\label{sec:Conformance / Legacy Interface: Trans=
itional Device and Transitional Driver Conformance}
> >  A conformant implementation MUST be either transitional or
> > diff --git a/content.tex b/content.tex
> > index 0a62dce..59925ae 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \input{device-types/scmi/description.tex}
> >  \input{device-types/gpio/description.tex}
> >  \input{device-types/pmem/description.tex}
> > +\input{device-types/media/description.tex}
> >
> >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >
> > diff --git a/device-types/media/description.tex b/device-types/media/de=
scription.tex
> > new file mode 100644
> > index 0000000..2256cae
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,637 @@
> > +\section{Media Device}\label{sec:Device Types / Media Device}
> > +
> > +The virtio media device follows the same model (and structures) as V4L=
2. It
> > +can be used to virtualize cameras, codec devices, or any other device
> > +supported by V4L2. The complete definition of V4L2 structures and ioct=
ls can
> > +be found under the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
> > +
> > +V4L2 is a UAPI that allows a less privileged entity (user-space) to us=
e video
> > +hardware exposed by a more privileged entity (the kernel). Virtio-medi=
a is an
> > +encapsulation of this API into virtio, turning it into a virtualizatio=
n API
> > +for all classes of video devices supported by V4L2, where the device p=
lays the
> > +role of the kernel and the driver the role of user-space.
> > +
> > +The device is therefore responsible for presenting a virtual device th=
at behaves
> > +like an actual V4L2 device, which the driver can control.
> > +
> > +Note that virtio-media does not require the use of a V4L2 device drive=
r or of
> > +Linux on any side - V4L2 is only used as a transport protocol,
> > +and both sides are free to convert it from/to any model that they wish=
 to use.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / Media Device / Device =
ID}
> > +
> > +48
> > +
> > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqu=
eues}
> > +
> > +\begin{description}
> > +\item[0] commandq - used for driver commands and device responses to t=
hese
> > +commands.
> > +\item[1] eventq - used for events sent by the device to the driver.
> > +\end{description}
> > +
> > +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feat=
ure Bits}
> > +
> > +None
> > +
> > +\subsection{Device Configuration Layout}\label{sec:Device Types / Medi=
a Device / Device Configuration Layout}
> > +
> > +The video device configuration space uses the following layout:
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_config {
> > +    le32 device_caps;
> > +    le32 device_type;
> > +    le8 card[32];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{device_caps}] (driver-read-only) flags representing the d=
evice
> > +capabilities as used in
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
idioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > +It corresponds with the \field{device_caps} field in the \textit{struc=
t video_device}.
> > +\item[\field{device_type}] (driver-read-only) informs the driver of th=
e type
> > +of the video device. It corresponds with the \field{vfl_devnode_type} =
field of the device.
> > +\item[\field{card}] (driver-read-only) name of the device, a NUL-termi=
nated
> > +UTF-8 string. It corresponds with the \field{card} field of the \texti=
t{struct v4l2_capability}.
> > +If all the characters of the field are used, it does not need to be NU=
L-terminated.
> > +\end{description}
> > +
> > +\subsection{Device Initialization}
> > +
> > +A driver executes the following sequence to initialize a device:
> > +
> > +\begin{enumerate}
> > +\item Read the \field{device_caps} and \field{device_type} fields
> > +from the configuration layout to identify the device.
> > +\item Set up the \field{commandq} and \field{eventq} virtqueues.
> > +\item May open a session (see Section \ref{sec:Device Types / Media De=
vice / Device Operation / Open Device})
> > +to use the device and send V4L2 ioctls in order to receive more inform=
ation
> > +about the device, such as supported formats or controls.
> > +\end{enumerate}
> > +
> > +\subsection{Device Operation}\label{sec:Device Types / Media Device / =
Device Operation}
> > +
> > +The driver enqueues commands in the command queue for the device to pr=
ocess.
> > +The errors returned by each command are standard
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-e=
rrors.html}{Linux kernel error codes}.
> > +For instance, a driver sending a command that contains invalid options=
 will
> > +receive \textit{EINVAL} in return, after the device tries to process i=
t.
> > +
> > +The device enqueues events in the event queue for the driver to proces=
s.
> > +
> > +\subsubsection{Command Virtqueue}
> > +
> > +\paragraph{Device Operation: Command headers}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > +
> > +/* Header for all virtio commands from the driver to the device on the=
 commandq. */
> > +struct virtio_media_cmd_header {
> > +     le32 cmd;
> > +     le32 __reserved;
> > +};
> > +
> > +/* Header for all virtio responses from the device to the driver on th=
e commandq. */
> > +struct virtio_media_resp_header {
> > +     le32 status;
> > +     le32 __reserved;
> > +};
> > +\end{lstlisting}
> > +
> > +A command consists of a command header \textit{virtio_media_cmd_header=
}
> > +containing the following device-readable field:
> > +
> > +\begin{description}
> > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*=
).
> > +\end{description}
> > +
> > +A response consists of a response header \textit{virtio_media_resp_hea=
der}
> > +containing the following device-writable field:
> > +
> > +\begin{description}
> > +\item[\field{status}] indicates a device request status.
> > +\end{description}
> > +
> > +When the device executes the command successfully, the value of the st=
atus
> > +field is 0. Conversely, when the device fails to execute the command, =
the value
> > +of the status fields corresponds with one of the standard Linux error =
codes.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sess=
ions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > +
> > +Sessions are how the device is multiplexed, allowing several distinct =
works to
> > +take place simultaneously. Before starting operation, the driver needs=
 to open
> > +a session. This is equivalent to opening the \textit{/dev/videoX} file=
 of the
> > +V4L2 device. Each session gets a unique ID assigned, which can be then=
 used
> > +to perform actions on it.
> > +
> > +\paragraph{Device Operation: Open device}\label{sec:Device Types / Med=
ia Device / Device Operation / Open Device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > +
> > +This is the equivalent of calling \textit{open} on a V4L2 device node.
> > +The driver uses \textit{virtio_media_cmd_open} to send an open request=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_open {
> > +    struct virtio_media_cmd_header hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{vir=
tio_media_resp_open}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_open {
> > +    struct virtio_media_resp_header hdr;
> > +    le32 session_id;
> > +    le32 __reserved;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] identifies the current session, which is use=
d for
> > +other commands, predominantly ioctls.
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Open device}{Device =
Types / Media Device / Device Operation / Open device}
> > +
> > +Upon success, the device MUST set a \field{session_id} in \textit{virt=
io_media_resp_open}
> > +to an integer that is NOT used by any other open session.
> > +
> > +\paragraph{Device Operation: Close device}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> > +
> > +This is the equivalent of calling \textit{close} on a previously opene=
d V4L2
> > +device node. All resources associated with this session will be freed.
> > +
> > +This command does not require a response from the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_close {
> > +    struct virtio_media_cmd_header hdr;
> > +    le32 session_id;
> > +    le32 __reserved;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] identifies the session to close.
> > +\end{description}
> > +
> > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device=
 Types / Media Device / Device Operation / Close device}
> > +
> > +The session ID SHALL NOT be used again after queueing this command, un=
til it has
> > +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OPEN=
} call.
> > +
> > +\paragraph{Device Operation: V4L2 ioctls}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an o=
pen
> > +session.
> > +
> > +This command tells the device to run one of the `VIDIOC_*` ioctls on t=
he
> > +session identified by \textit{session_id}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_ioctl {
> > +    struct virtio_media_cmd_header hdr;
> > +    le32 session_id;
> > +    le32 code;
> > +    /* Followed by the relevant ioctl command payload as defined in th=
e macro */
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] identifies the session to run the ioctl on.
> > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl t=
o run.
> > +\end{description}
> > +
> > +The code is extracted from the
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
ideodev.html}{videodev2.h},
> > +header file. The file defines the ioctl's codes, type of payload, and
> > +direction. The code consists of the second argument of the \field{_IO*=
} macro.
> > +
> > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > +
> > +\begin{lstlisting}
> > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > +\end{lstlisting}
> > +
> > +This means that its ioctl code is \textit{4}, its payload is a
> > +\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., t=
he
> > +payload is written by both the driver and the device).
> > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctl=
s payload}
> > +for more information about the direction of ioctls.
> > +
> > +The payload struct layout always matches the 64-bit, little-endian
> > +representation of the corresponding V4L2 structure.
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{vi=
rtio_media_resp_ioctl}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_ioctl {
> > +    struct virtio_media_resp_header hdr;
> > +    /* Followed by the ioctl response payload as defined in the macro =
*/
> > +};
> > +\end{lstlisting}
> > +
> > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / =
V4L2 ioctls / Ioctls payload}
> > +
> > +Each ioctl has a payload, which is defined by the third argument of th=
e
> > +\field{_IO*} macro.
> > +
> > +The payload of an ioctl in the descriptor chain follows the command st=
ructure,
> > +the response structure, or both depending on the direction:
> > +
> > +\begin{itemize}
> > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > +follows the response in the device-writable section of the descriptor =
chain.
> > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > +follows the command in the device-readable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver,
> > +meaning the payload must follow both the command in the device-readabl=
e section
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
> > +
> > +A possible optimization for \textit{WR} ioctls is to provide the paylo=
ad using
> > +descriptors that both point to the same buffer. This mimics the behavi=
or of
> > +V4L2 ioctls where the data is only passed once and used as both input =
and
> > +output by the kernel.
> > +
> > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device =
Types / Media Device / Device Operation / V4L2 ioctls}
> > +
> > +In case of success of a device-writable ioctl, the device MUST always =
write the
> > +payload in the device-writable part of the descriptor chain.
> > +
> > +In case of failure of a device-writable ioctl, the device is free to w=
rite the
> > +payload in the device-writable part of the descriptor chain or not. So=
me errors
> > +may still result in the payload being updated, and in this case the de=
vice is
> > +expected to write the updated payload.
> > +
> > +\drivernormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device =
Types / Media Device / Device Operation / V4L2 ioctls}
> > +
> > +For most V4L2 structures, the size is identical for both 32 and 64 bit=
s versions.
> > +If the payload struct layout size differs for 32 and 64 bits, the driv=
er
> > +MUST translate them to its the 64-bit, little-endian representation.
> > +
> > +If the device has not written the payload after an error (i.e., only t=
he
> > +header is returned), the driver MUST assume that the payload has not
> > +been modified.
> > +
> > +\subparagraph{Handling of pointers to data in ioctl payload}
> > +\label{sec:Device Types / Media Device / V4L2 ioctls / Pointers in V4l=
2 ioctls}
> > +
> > +A few structures used as ioctl payloads contain pointers to further
> > +data needed for the ioctl. There are notably:
> > +
> > +\begin{itemize}
> > +\item The \field{planes} pointer of
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
uffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > +which size is determined by the length member.
> > +\item The \field{controls} pointer of
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
idioc-g-ext-ctrls.html#c.V4L.v4l2_ext_controls}{struct v4l2_ext_controls},
> > +which size is determined by the count member.
> > +\end{itemize}
> > +
> > +If the size of the pointed area is non-zero, then the main
> > +payload is immediately followed by the pointed data in their order of
> > +appearance in the structure.
> > +
> > +\devicenormative{\subparagraph}{Handling of pointers to data in ioctl =
payload}{Device Types / Media Device / Device Operation / Pointers in V4l2 =
ioctls}
> > +
> > +The pointer value, when its area is non-zero, is ignored by the device=
,
> > +which MUST return the value initially passed by the driver.
> > +
> > +
> > +\subparagraph{Handling of pointers to userspace memory in ioctl payloa=
d}
> > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memor=
y}
> > +
> > +A few pointers (used for \textit{SHARED_PAGES} memory type,
> > +see \ref{sec:Device Types / Media Device / Device Operation / Shared P=
ages})
> > +are special in that they point to userspace memory in the
> > +original V4L2 specification. They are:
> > +
> > +\begin{itemize}
> > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
uffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > +(technically an unsigned long, but designated a userspace address).
> > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > +\end{itemize}
> > +
> > +These pointers may cover large areas of scattered memory, which has th=
e
> > +potential to require more descriptors than the virtio queue can provid=
e. For
> > +these particular pointers only, a list of \textit{struct virtio_media_=
sg_entry}
> > +that covers the needed amount of memory for the pointer is used instea=
d of
> > +using descriptors to map the pointed memory directly.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_sg_entry {
> > +     le64 start;
> > +     le32 len;
> > +     le32 __reserved;
> > +};
> > +\end{lstlisting}
> > +
> > +For each such pointer to read, the device reads as many SG entries as =
needed
> > +to cover the length of the pointed buffer, as described by its parent
> > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > +\textit{struct v4l2_plane} for buffer memory, and \field{size} member =
of
> > +\textit{struct v4l2_ext_control} for control data).
> > +
> > +Since the device never needs to modify the list of SG entries, it is o=
nly
> > +provided by the driver in the device-readable section of the descripto=
r chain,
> > +and not repeated in the device-writable section, even for WR ioctls.
> > +
> > +\subparagraph{Unsupported ioctls}
> > +
> > +A few ioctls are replaced by other, more suitable mechanisms.
> > +
> > +\begin{itemize}
> > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuratio=
n area
> > +(see \ref{sec:Device Types / Media Device / Device Configuration Layou=
t}).
> > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue=
 buffer}).
> > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an=
 event}).
>
> Nit: for consiseness we can probably merge DQBUF and DQEVENT into a
> single bullet point that references subsection 1.6.2.

Makes sense.

>
> > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are de=
precated
> > +and replaced by the controls of the JPEG class.
> > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall =
not be
> > +implemented by the device.
> > +\end{itemize}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{=
Device Types / Media Device / Device Operation / Unsupported ioctls}
> > +
> > +When a request is not supported, the device MUST return \textit{ENOTTY=
},
> > +which corresponds to the response for unknown ioctls.
> > +
> > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into =
the
> > +driver's address space.
> > +
> > +Shared memory region ID 0 is used to map MMAP buffers with
> > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > +
> > +struct virtio_media_cmd_mmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     le32 session_id;
> > +     le32 flags;
> > +     le32 offset;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] identifies the session which the mapped buff=
er pertains to.
> > +\item[\field{flags}] is the set of flags for the mapping. \field{VIRTI=
O_MEDIA_MMAP_FLAG_RW}
> > +can be set if a read-write mapping is desired. Without this flag the m=
apping
> > +will be read-only.
> > +\item[\field{offset}] corresponds to the \field{mem_offset} field of t=
he
> > +\textit{union v4l2_plane} for the plane to map. This field can be obta=
ined
> > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{vir=
tio_media_resp_mmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_mmap {
> > +    struct virtio_media_resp_header hdr;
> > +    le64 driver_addr;
> > +    le64 len;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{driver_addr}] offset into SHM region ID 0 of the start of=
 the mapping.
> > +\item[\field{len}] length of the mapping as indicated by the \textit{s=
truct v4l2_plane}
> > +the buffer belongs to.
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Mapping a MMAP buffe=
r}{Device Types / Media Device / Device Operation / Mapping a MMAP buffer}
> > +
> > +The \textit{len} parameter of the \textit{virtio_media_resp_mmap} resp=
onse sent
> > +by the device MUST always be equal to the length of the buffer.
> > +
> > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} unmaps a MMAP buffer previously mappe=
d using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_munmap {
> > +    struct virtio_media_cmd_header hdr;
> > +    le64 driver_addr;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{driver_addr}] offset into SHM region ID 0 previously retu=
rned by
> > +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously=
 mapped.
> > +\end{description}
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{v=
irtio_media_resp_munmap}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_munmap {
> > +    struct virtio_media_resp_header hdr;
> > +};
> > +\end{lstlisting}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buf=
fer}{Device Types / Media Device / Device Operation / Unmapping a MMAP buff=
er}
> > +
> > +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD=
_MMAP}
> > +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the bu=
ffers or
> > +session they belong to are released or closed by the driver.
> > +
> > +\paragraph{Device Operation: Memory Types}
> > +
> > +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{U=
SERPTR}
> > +and \textit{DMABUF}) can easily be mapped to both driver and device co=
ntext.
> > +
> > +\begin{lstlisting}
> > +enum virtio_media_memory {
> > +    VIRTIO_MEDIA_MMAP =3D V4L2_MEMORY_MMAP,
> > +    VIRTIO_MEDIA_SHARED_PAGES =3D V4L2_MEMORY_USERPTR,
> > +    VIRTIO_MEDIA_OBJECT =3D V4L2_MEMORY_DMABUF,
> > +};
> > +\end{lstlisting}
> > +
> > +\subparagraph{MMAP}
> > +
> > +\textit{MMAP} memory type is the semantic equivalent of
> > +\textit{V4L2_MEMORY_MMAP} in regular V4L2.
> > +
> > +In virtio-media, \textit{MMAP} buffers are provisioned by the device, =
just like
> > +they are by the kernel in regular V4L2. Similarly to how userspace can=
 map a
> > +\textit{MMAP} buffer into its address space using mmap and munmap, the
> > +virtio-media driver can map device buffers into the driver space by qu=
eueing the
> > +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_=
cmd_munmap}
> > +commands to the commandq.
> > +
> > +\subparagraph{SHARED_PAGES}
> > +\label{sec:Device Types / Media Device / Device Operation / Shared Pag=
es}
> > +
> > +\textit{SHARED_PAGES} memory type is the semantic equivalent of
> > +\textit{V4L2_MEMORY_USERPTR} in regular V4L2.
> > +
> > +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by the =
driver,
> > +and use guest physical addresses. Instances of \textit{struct v4l2_buf=
fer}
> > +and \textit{struct v4l2_plane} of this memory type are followed by a l=
ist of
> > +\textit{struct virtio_media_sg_entry}. For more information, see
> > +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Shared Pages}{Device=
 Types / Media Device / Device Operation / Shared Pages}
> > +
> > +The device MUST not alter the pointer values provided by the driver, i=
.e.
> > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > +\textit{struct v4l2_plane} MUST be returned to the driver with the sam=
e value
> > +as it was provided.
> > +
> > +\subparagraph{VIRTIO_OBJECT}
> > +\label{sec:Device Types / Media Device / Device Operation / Virtio Obj=
ect}
> > +
> > +\textit{VIRTIO_OBJECT} memory type is the semantic equivalent of
> > +\textit{V4L2_MEMORY_DMABUF} in regular V4L2.
> > +
> > +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a v=
irtio
> > +object, just like they are by a \textit{DMABUF} in regular V4L2. Virti=
o objects
> > +are 16-bytes UUIDs and do not fit in the placeholders for file descrip=
tors, so
> > +they follow their embedding data structure as needed. For example, in =
multi-planar
> > +buffers, \textit{struct v4l2_plane} structures are located after the
> > +\textit{struct v4l2_buffer} in the memory layout. Then, after the last=
 plane,
> > +the memory contains an array of UUIDs in which the first element corre=
sponds
> > +with the first plane, and so on.
> > +
> > +Conversely to \textit{SHARED_PAGES} buffers, virtio objects UUIDs need=
 to be added in
> > +both the device-readable and device-writable section of the descriptor=
 chain.
>
> Let's add the reason for this, as this sentence left me thinking for a
> bit:
>
> Conversely to \textit{SHARED_PAGES} buffers which SG lists are never
> modified by the device, virtio objects UUIDs need to be added in both
> the device-readable and device-writable section of the descriptor chain
> so the device can update them if needed.

Sounds good.

>
> > +
> > +Device-allocated buffers with the \textit{VIRTIO_MEDIA_MMAP} memory ty=
pe may also
> > +be exported as virtio objects for use with another virtio device using=
 the
> > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_expor=
tbuffer}
> > +means that space for the UUID needs to be reserved right after that st=
ructure.
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Virtio Object}{Devic=
e Types / Media Device / Device Operation / Virtio Object}
> > +
> > +The device MUST leave the V4L2 structure placeholder unchanged.
>
> Maybe I misunderstood it, but this sentence seems incorrect to me - the
> V4L2 structure (I believe this refers to v4l2_buffer or v4l2_plane?) can
> be updated by the device depending on the requested ioctl. This behavior
> is not dependent on the memory type.

Pertains to this section because it refers to the fd placeholder. I
will clarify in the text.

>
> > +
> > +\subsubsection{Event Virtqueue}
> > +
> > +Events are asynchronous notifications to the driver. In virtio-media,
> > +they are used as a replacement for the \textit{VIDIOC_DQBUF} and
> > +\textit{VIDIOC_DQEVENT} ioctls and the polling mechanism, which would =
be
> > +impractical to implement on top of virtio.
> > +
> > +\paragraph{Device Operation: Event header}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > +
> > +/* Header for events queued by the device for the driver on the eventq=
. */
> > +struct virtio_media_event_header {
> > +    le32 event;
> > +    le32 session_id;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> > +\item[\field{session_id}] ID of the session the event applies to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Device-side error}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> > +mentioned in the header is considered corrupted and automatically clos=
ed by
> > +the device.
>
> Since we added the clause that the driver must close the FD, the use of
> "closed" by the device here might be ambiguous.
>
> We also employ "upon receiving" which suggests we talk about the driver,
> but then mention the device later in the same sentence. So how about
> this:
>
>   \textbf{VIRTIO_MEDIA_EVT_ERROR} Unrecoverable session error. Upon
>   emitting this event, the device considers the session mentioned in the
>   header to be invalid and returns and error to all future commands
>   mentioning it. Upon receiving this event, the driver stops using it
>   and closes it as soon as possible.

Sounds good.

I will cover all requested changes and send a new version later today
or tomorrow.

Thanks!
Albert.

>
> Cheers,
> Alex.
>

