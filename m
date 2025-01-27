Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1763919BBA
	for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992499; cv=none; b=OAksFqdIyBun+WMweeO6h3ooAJtUxRO8Vq2hA4HM1Pnnofy3qu744fFTITA5Y5YOgUK+qT9WhfeBHbR0aGKutgUwEzTk/0BhT8qKApD6DDVHh/XbFGjTz7ABAGXyCX4en410vdEm56whBsjRN8uR9Npg5LKUknXC8HfMigqglHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992499; c=relaxed/simple;
	bh=6c0kn7iO3+hOwJdbWpObLQI1pBRcP5+dq7b9+90+ZPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dT9kqrNomd+JYMJJp88b/TJ3qgJpjQyhOcx6b/0TVsadR3Bq8X0udsD3+RmcbKGrsA6mQHfdscCKJr14nTJU5MNNFSeOCwXtHYrtyEnXm+zIZgwM8AjwXujQa6Oyn/DtZZnpMF1YDnZZ56JvPkJ0x4/N2JyCmjimbLwbQlRWLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOmiCoYP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOmiCoYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737992494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jm3NRrIgVgGyVmqRRLXtZyeLIVJOevNcej5UzcqUfsI=;
	b=FOmiCoYPMC3MgMGv1270+pGGtwiT2ACgnGLY7t1Ouaf687dYjT5Pqv1hsTOdxzBQ8RmBoY
	Bmom+XLwvB55GNmT+ZnkaLwHGf9lvmB6OpJ8ROzVX8VwfikkXF4+MI6i+VusJNxFthg6Xm
	EIwhocfpasWDFjZ4Zwo7j6Z2xMG5Dug=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-G_OvMlBnOHuvCU3ocWKX2g-1; Mon, 27 Jan 2025 10:41:33 -0500
X-MC-Unique: G_OvMlBnOHuvCU3ocWKX2g-1
X-Mimecast-MFC-AGG-ID: G_OvMlBnOHuvCU3ocWKX2g
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso9228580a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 07:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992492; x=1738597292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm3NRrIgVgGyVmqRRLXtZyeLIVJOevNcej5UzcqUfsI=;
        b=ZWZBDoMZ1PI2Aj4Yfdn20lhCE+bH9TCCeXw23/AuN+PKjk/mcojILUQA9fQFI0Ykrv
         Y59raLJmZaQvToR8SDrAMcC7vwgZdzYCc9wAeZ2/UUUpvcDWvoHVAzixvGBWya7aWGMH
         qA21fiUL5doDk8WQ4KG+Q7uhc/L4Rt80wpcDYmLgiXgnIgwZNrd4ScABYaKDIY0q01hm
         2DVa5DQUw9pzzlnjXNUEn7vGtu8YbjrAa4GoDuGdTb+Lgm6adOReMtd+OZwFPmQj1XL5
         UGl6Us7raw25vrnizFc2/CoIb65e0tcVODo6ab91XQloh7L47NJlZ6DKmaKLKjv4hlQp
         LEMQ==
X-Gm-Message-State: AOJu0Yyfq7upemZlEHQvnslV3qhf3+qTVsnGY7NZ6v4ji7w6Vs3WS8ay
	xxZOJX7paJwifZgHMegWq2oP2+n7mJFrGMHCdm6T7l/A6bukl82NF4j7EzqijumLzXg6Y2432Mv
	rXEyBKLJ9UkJH5ZvxrRMm1x91xuPAahFU/AAW9pgWW/gnmQsz1XNRpGKNJ9hG3p6sVIHDe+e7W2
	TujGG5hpeqWvkOp6HiGNj6pj5wnkgkEeMDb4aDpKQ=
X-Gm-Gg: ASbGnctXUNAi7agxW7sEoCBPH2s5p3KZ18tlTrsiH8l5H1IvUFkhv0VByYLTrCVXvJU
	oAousDzaXsCzwAOhAw8v7CM7DZj1VTj5D+vZokV6Cm6p2EPs4k83tVZCdy+bM4UYy
X-Received: by 2002:a17:90b:2703:b0:2ee:ab29:1a57 with SMTP id 98e67ed59e1d1-2f782c6298emr64289273a91.2.1737992491532;
        Mon, 27 Jan 2025 07:41:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnoCiVIs7ZTBR4TnOh9L3qWWTJUTQIJRsq2WP0UGz+7APPLfZg49YDbAIcuMyfStfy7HQpbJCPikM3UIx+Gps=
X-Received: by 2002:a17:90b:2703:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2f782c6298emr64289183a91.2.1737992490652; Mon, 27 Jan 2025
 07:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120085015.956057-1-aesteve@redhat.com> <20250120085015.956057-2-aesteve@redhat.com>
 <Z5ejOtZyzn746lIv@fedora> <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
In-Reply-To: <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 27 Jan 2025 16:41:19 +0100
X-Gm-Features: AWEUYZkRzxwmaWAh1JW5usJ1HUP0-NRGYuLuj653R8JcvkSkiUmxD0veUdOfVOY
Message-ID: <CADSE00+a0-roH+=UrvcXJyszWg+3Jn+BxueVthGf=WQ2EzwRXA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio-media: Add virtio media device specification
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, agordeev@qti.qualcomm.com, 
	ribalda@google.com, acourbot@chromium.org, gurchetansingh@google.com, 
	cohuck@redhat.com, daniel.almeida@collabora.com, changyeon@google.com, 
	nicolas.dufresne@collabora.com, eballetb@redhat.com, dverkamp@chromium.org, 
	hverkuil@xs4all.nl, mst@redhat.com, alex.bennee@linaro.org, 
	acourbot@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xTt-HpARLoQV3jKwNe8lp8j1w_GaU9ZSmxC57erLWcY_1737992492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 4:36=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Mon, Jan 27, 2025 at 4:16=E2=80=AFPM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > On Mon, Jan 20, 2025 at 09:50:15AM +0100, Albert Esteve wrote:
> > > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > virtio, able to virtualize any video device supported
> > > by V4L2.
> > >
> > > Note that virtio-media does not require the use of a
> > > V4L2 device driver on the host or guest side -
> > > V4L2 is only used as a host-guest protocol,
> > > and both sides are free to convert it from/to any
> > > model that they wish to use.
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  conformance.tex                           |  13 +-
> > >  content.tex                               |   1 +
> > >  device-types/media/description.tex        | 617 ++++++++++++++++++++=
++
> > >  device-types/media/device-conformance.tex |  12 +
> > >  device-types/media/driver-conformance.tex |  10 +
> > >  5 files changed, 649 insertions(+), 4 deletions(-)
> > >  create mode 100644 device-types/media/description.tex
> > >  create mode 100644 device-types/media/device-conformance.tex
> > >  create mode 100644 device-types/media/driver-conformance.tex
> > >
> > > diff --git a/conformance.tex b/conformance.tex
> > > index dc00e84..c369da1 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformanc=
e / Conformance Targets}
> > >  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformanc=
e},
> > >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Confo=
rmance},
> > >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance}=
,
> > > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}=
 or
> > > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}=
.
> > > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}=
,
> > > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}=
 or
> > > +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance=
}.
> > > +
> > >
> > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transition=
al Device and Transitional Driver Conformance}.
> > >    \end{itemize}
> > > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance=
 / Conformance Targets}
> > >  \ref{sec:Conformance / Device Conformance / Memory Device Conformanc=
e},
> > >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Confo=
rmance},
> > >  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance}=
,
> > > -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance}=
 or
> > > -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}=
.
> > > +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance}=
,
> > > +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}=
 or
> > > +\ref{sec:Conformance / Device Conformance / Media Device Conformance=
}.
> > >
> > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transition=
al Device and Transitional Driver Conformance}.
> > >    \end{itemize}
> > > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> > >  \input{device-types/scmi/driver-conformance.tex}
> > >  \input{device-types/gpio/driver-conformance.tex}
> > >  \input{device-types/pmem/driver-conformance.tex}
> > > +\input{device-types/media/driver-conformance.tex}
> > >
> > >  \conformance{\section}{Device Conformance}\label{sec:Conformance / D=
evice Conformance}
> > >
> > > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> > >  \input{device-types/scmi/device-conformance.tex}
> > >  \input{device-types/gpio/device-conformance.tex}
> > >  \input{device-types/pmem/device-conformance.tex}
> > > +\input{device-types/media/device-conformance.tex}
> > >
> > >  \conformance{\section}{Legacy Interface: Transitional Device and Tra=
nsitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Tra=
nsitional Device and Transitional Driver Conformance}
> > >  A conformant implementation MUST be either transitional or
> > > diff --git a/content.tex b/content.tex
> > > index 0a62dce..59925ae 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
> > >  \input{device-types/scmi/description.tex}
> > >  \input{device-types/gpio/description.tex}
> > >  \input{device-types/pmem/description.tex}
> > > +\input{device-types/media/description.tex}
> > >
> > >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >
> > > diff --git a/device-types/media/description.tex b/device-types/media/=
description.tex
> > > new file mode 100644
> > > index 0000000..2c7f451
> > > --- /dev/null
> > > +++ b/device-types/media/description.tex
> > > @@ -0,0 +1,617 @@
> > > +\section{Media Device}\label{sec:Device Types / Media Device}
> > > +
> > > +The virtio media device follows the same model (and structures) as V=
4L2. It
> > > +can be used to virtualize cameras, codec devices, or any other devic=
e
> > > +supported by V4L2. The complete definition of V4L2 structures and io=
ctls can
> > > +be found under the
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/ind=
ex.html}{V4L2 UAPI documentation}.
> > > +
> > > +V4L2 is a UAPI that allows a less privileged entity (user-space) to =
use video
> > > +hardware exposed by a more privileged entity (the kernel). Virtio-me=
dia is an
> > > +encapsulation of this API into virtio, turning it into a virtualizat=
ion API
> > > +for all classes of video devices supported by V4L2, where the device=
 plays the
> > > +role of the kernel and the driver the role of user-space.
> > > +
> > > +The device is therefore responsible for presenting a virtual device =
that behaves
> > > +like an actual V4L2 device, which the driver can control.
> > > +
> > > +Note that virtio-media does not require the use of a V4L2 device dri=
ver or of
> > > +Linux on any side - V4L2 is only used as a transport protocol,
> > > +and both sides are free to convert it from/to any model that they wi=
sh to use.
> > > +
> > > +\subsection{Device ID}\label{sec:Device Types / Media Device / Devic=
e ID}
> > > +
> > > +48
> > > +
> > > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virt=
queues}
> > > +
> > > +\begin{description}
> > > +\item[0] commandq - used for driver commands and device responses to=
 these
> > > +commands.
> > > +\item[1] eventq - used for events sent by the device to the driver.
> > > +\end{description}
> > > +
> > > +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Fe=
ature Bits}
> > > +
> > > +None
> > > +
> > > +\subsection{Device Configuration Layout}\label{sec:Device Types / Me=
dia Device / Device Configuration Layout}
> > > +
> > > +The video device configuration space uses the following layout:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_config {
> > > +    le32 device_caps;
> > > +    le32 device_type;
> > > +    le8 card[32];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{device_caps}] (driver-read-only) flags representing the=
 device
> > > +capabilities as used in
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/vidioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > > +It corresponds with the \field{device_caps} field in the \textit{str=
uct video_device}.
> > > +\item[\field{device_type}] (driver-read-only) informs the driver of =
the type
> > > +of the video device. It corresponds with the \field{vfl_devnode_type=
} field of the device.
> > > +\item[\field{card}] (driver-read-only) name of the device, a NUL-ter=
minated
> > > +UTF-8 string. It corresponds with the \field{card} field of the \tex=
tit{struct v4l2_capability}.
> > > +If all the characters of the field are used, it does not need to be =
NUL-terminated.
> > > +\end{description}
> > > +
> > > +\subsection{Device Initialization}
> > > +
> > > +A driver executes the following sequence to initialize a device:
> > > +
> > > +\begin{enumerate}
> > > +\item Read the \field{device_caps} and \field{device_type} fields
> > > +from the configuration layout to identify the device.
> > > +\item Set up the \field{commandq} and \field{eventq} virtqueues.
> > > +\item May open a session (see Section \ref{sec:Device Types / Media =
Device / Device Operation / Open Device})
> > > +to use the device and send V4L2 ioctls in order to receive more info=
rmation
> > > +about the device, such as supported formats or controls.
> > > +\end{enumerate}
> > > +
> > > +\subsection{Device Operation}\label{sec:Device Types / Media Device =
/ Device Operation}
> > > +
> > > +The driver enqueues commands in the command queue for the device to =
process.
> > > +The errors returned by each command are standard
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen=
-errors.html}{Linux kernel error codes}.
> > > +For instance, a driver sending a command that contains invalid optio=
ns will
> > > +receive \textit{EINVAL} in return, after the device tries to process=
 it.
> > > +
> > > +The device enqueues events in the event queue for the driver to proc=
ess.
> > > +
> > > +\subsubsection{Command Virtqueue}
> > > +
> > > +\paragraph{Device Operation: Command headers}
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > > +
> > > +/* Header for all virtio commands from the driver to the device on t=
he commandq. */
> > > +struct virtio_media_cmd_header {
> > > +     le32 cmd;
> > > +     le32 __reserved;
> > > +};
> > > +
> > > +/* Header for all virtio responses from the device to the driver on =
the commandq. */
> > > +struct virtio_media_resp_header {
> > > +     le32 status;
> > > +     le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +A command consists of a command header \textit{virtio_media_cmd_head=
er}
> > > +containing the following device-readable field:
> > > +
> > > +\begin{description}
> > > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD=
_*).
> > > +\end{description}
> > > +
> > > +A response consists of a response header \textit{virtio_media_resp_h=
eader}
> > > +containing the following device-writable field:
> > > +
> > > +\begin{description}
> > > +\item[\field{status}] indicates a device request status.
> > > +\end{description}
> > > +
> > > +When the device executes the command successfully, the value of the =
status
> > > +field is 0. Conversely, when the device fails to execute the command=
, the value
> > > +of the status fiels corresponds with one of the standard Linux error=
 codes.
> >
> > s/fiels/field
> >
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Se=
ssions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > > +
> > > +Sessions are how the device is multiplexed, allowing several distinc=
t works to
> > > +take place simultaneously. Before starting operation, the driver nee=
ds to open
> > > +a session. This is equivalent to opening the \textit{/dev/videoX} fi=
le of the
> > > +V4L2 device. Each session gets a unique ID assigned, which can be th=
en used
> > > +to perform actions on it.
> > > +
> > > +\paragraph{Device Operation: Open device}\label{sec:Device Types / M=
edia Device / Device Operation / Open Device}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > > +
> > > +This is the equivalent of calling \textit{open} on a V4L2 device nod=
e.
> > > +The driver uses \textit{virtio_media_cmd_open} to send an open reque=
st.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_open {
> > > +    struct virtio_media_cmd_header hdr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{v=
irtio_media_resp_open}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_open {
> > > +    struct virtio_media_resp_header hdr;
> > > +    le32 session_id;
> > > +    le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{session_id}] identifies the current session, which is u=
sed for
> > > +other commands, predominantly ioctls.
> > > +\end{description}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Open device}{Devic=
e Types / Media Device / Device Operation / Open device}
> > > +
> > > +Upon success, the device MUST set a \field{session_id} in \textit{vi=
rtio_media_resp_open}
> > > +to an integer that is NOT used by any other open session.
> > > +
> > > +\paragraph{Device Operation: Close device}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active sessio=
n.
> > > +
> > > +This is the equivalent of calling \textit{close} on a previously ope=
ned V4L2
> > > +device node. All resources associated with this session will be free=
d.
> > > +
> > > +This command does not require a response from the device.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_close {
> > > +    struct virtio_media_cmd_header hdr;
> > > +    le32 session_id;
> > > +    le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{session_id}] identifies the session to close.
> > > +\end{description}
> > > +
> > > +\drivernormative{\subparagraph}{Device Operation: Close device}{Devi=
ce Types / Media Device / Device Operation / Close device}
> > > +
> > > +The session ID SHALL NOT be used again after queueing this command, =
until it
> > > +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OP=
EN} call.
> >
> > I think you forgot the `has` in `until it been ...`.
> >
> > > +
> > > +\paragraph{Device Operation: V4L2 ioctls}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an=
 open
> > > +session.
> > > +
> > > +This command tells the device to run one of the `VIDIOC_*` ioctls on=
 the
> > > +session identified by \textit{session_id}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_ioctl {
> > > +    struct virtio_media_cmd_header hdr;
> > > +    le32 session_id;
> > > +    le32 code;
> > > +    /* Followed by the relevant ioctl command payload as defined in =
the macro */
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{session_id}] identifies the session to run the ioctl on=
.
> > > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl=
 to run.
> > > +\end{description}
> > > +
> > > +The code is extracted from the
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/videodev.html}{videodev2.h},
> > > +header file. The file defines the ioctl's codes, type of payload, an=
d
> > > +direction. The code consists of the second argument of the \field{_I=
O*} macro.
> > > +
> > > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > > +\end{lstlisting}
> > > +
> > > +This means that its ioctl code is \textit{4}, its payload is a
> > > +\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e.,=
 the
> > > +payload is written by both the driver and the device).
> > > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioc=
tls payload}
> > > +for more information about the direction of ioctls.
> > > +
> > > +The payload struct layout always matches the 64-bit, little-endian
> > > +representation of the corresponding V4L2 structure. For most structs=
, the
> > > +size is identical for both 32 and 64 bits versions. Otherwise, the d=
river
> > > +must translate them to the aforementioned size and endianess.
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{=
virtio_media_resp_ioctl}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_ioctl {
> > > +    struct virtio_media_resp_header hdr;
> > > +    /* Followed by the ioctl response payload as defined in the macr=
o */
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device =
/ V4L2 ioctls / Ioctls payload}
> > > +
> > > +Each ioctl has a payload, which is defined by the third argument of =
the
> > > +\field{_IO*} macro.
> > > +
> > > +The payload of an ioctl in the descriptor chain follows the command =
structure,
> > > +the response structure, or both depending on the direction:
> > > +
> > > +\begin{itemize}
> > > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > > +follows the response in the device-writable section of the descripto=
r chain.
> > > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > > +follows the command in the driver-writable section of the descriptor=
 chain.
> > > +\item \textbf{_IOWR} is writable by both the device and driver,
> > > +meaning the payload must follow both the command in the driver-writa=
ble section
> > > +of the descriptor chain, and the response in the device-writable sec=
tion.
> > > +\end{itemize}
> >
> > What is the driver-writable section in the descriptor chain? AFAIU,
> > there are only two sections: the device-readable and the
> > device-writable. The spec states that the device-writable follows the
> > device-readable section.
>
> So in this case who is suppossed to fill the buffer for the
> device-readable section is the driver. It is mostly a matter of
> perspective (and naming). The sentence is focusing on who can write
> into those spaces instead of a pure driver perspective, as it makes
> sense in this context. If you prefer, I could change it for
> driver-readable instead. But I think it is clearer to keep the focus
s/driver/device
> on who is allowed to write into it instead.
>
> >
> > > +
> > > +A possible optimization for \textit{WR} ioctls is to provide the pay=
load using
> > > +descriptors that both point to the same buffer. This mimics the beha=
vior of
> > > +V4L2 ioctls where the data is only passed once and used as both inpu=
t and
> > > +output by the kernel.
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Devic=
e Types / Media Device / Device Operation / V4L2 ioctls}
> > > +
> > > +In case of success of a device-writable ioctl, the device MUST alway=
s write the
> > > +payload in the device-writable part of the descriptor chain.
> > > +
> > > +In case of failure of a device-writable ioctl, the device is free to=
 write the
> > > +payload in the device-writable part of the descriptor chain or not. =
Some errors
> > > +may still result in the payload being updated, and in this case the =
device is
> > > +expected to write the updated payload.
> > > +
> > > +\drivernormative{\subparagraph}{Device Operation: V4L2 ioctls}{Devic=
e Types / Media Device / Device Operation / V4L2 ioctls}
> > > +
> > > +If the device has not written the payload after an error (i.e., only=
 the
> > > +header is returned), the driver MUST assume that the payload has not
> > > +been modified.
> > > +
> > > +\subparagraph{Handling of pointers to data in ioctl payload}
> > > +
> > > +A few structures used as ioctl payloads contain pointers to further
> > > +data needed for the ioctl. There are notably:
> > > +
> > > +\begin{itemize}
> > > +\item The \field{planes} pointer of
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > +which size is determined by the length member.
> > > +\item The \field{controls} pointer of
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/vidioc-g-ext-ctrls.html#c.V4L.v4l2_ext_controls}{struct v4l2_ext_controls}=
,
> > > +which size is determined by the count member.
> > > +\end{itemize}
> > > +
> > > +If the size of the pointed area is non-zero, then the main
> > > +payload is immediately followed by the pointed data in their order o=
f
> > > +appearance in the structure, and the pointer value itself is ignored=
 by the
> > > +device, which must also return the value initially passed by the dri=
ver.
> > > +
> > > +\subparagraph{Handling of pointers to userspace memory in ioctl payl=
oad}
> > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace mem=
ory}
> > > +
> > > +A few pointers (used for \textit{SHARED_PAGES} memory type,
> > > +see \ref{sec:Device Types / Media Device / Device Operation / Shared=
 Pages})
> > > +are special in that they point to userspace memory in the
> > > +original V4L2 specification. They are:
> > > +
> > > +\begin{itemize}
> > > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} an=
d
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > > +(technically an unsigned long, but designated a userspace address).
> > > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > > +\end{itemize}
> > > +
> > > +These pointers can cover large areas of scattered memory, which has =
the
> > > +potential to require more descriptors than the virtio queue can prov=
ide. For
> > > +these particular pointers only, a list of \textit{struct virtio_medi=
a_sg_entry}
> > > +that covers the needed amount of memory for the pointer is used inst=
ead of
> > > +using descriptors to map the pointed memory directly.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_sg_entry {
> > > +     le64 start;
> > > +     le32 len;
> > > +     le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +For each such pointer to read, the device reads as many SG entries a=
s needed
> > > +to cover the length of the pointed buffer, as described by its paren=
t
> > > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > > +\textit{struct v4l2_plane} for buffer memory, and \field{size} membe=
r of
> > > +\textit{struct v4l2_ext_control} for control data).
> > > +
> > > +Since the device never needs to modify the list of SG entries, it is=
 only
> > > +provided by the driver in the device-readable section of the descrip=
tor chain,
> > > +and not repeated in the device-writable section, even for WR ioctls.
> > > +
> > > +\subparagraph{Unsupported ioctls}
> > > +
> > > +A few ioctls are replaced by other, more suitable mechanisms.
> > > +
> > > +\begin{itemize}
> > > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configurat=
ion area
> > > +(see \ref{sec:Device Types / Media Device / Device Configuration Lay=
out}).
> > > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > > +(see \ref{sec:Device Types / Media Device / Device Operation / Deque=
ue buffer}).
> > > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > > +(see \ref{sec:Device Types / Media Device / Device Operation / Emit =
an event}).
> > > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are =
deprecated
> > > +and replaced by the controls of the JPEG class.
> > > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shal=
l not be
> > > +implemented by the device.
> > > +\end{itemize}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls=
}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > +
> > > +When a request is not supported, the device MUST return \textit{ENOT=
TY},
> > > +which corresponds to the response for unknown ioctls.
> > > +
> > > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer int=
o the
> > > +driver's address space.
> > > +
> > > +Shared memory region ID 0 is used to map MMAP buffers with
> > > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > > +
> > > +struct virtio_media_cmd_mmap {
> > > +     struct virtio_media_cmd_header hdr;
> > > +     le32 session_id;
> > > +     le32 flags;
> > > +     le32 offset;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{session_id}] identifies the session which the mapped bu=
ffer pertains to.
> > > +\item[\field{flags}] is the set of flags for the mapping. \field{VIR=
TIO_MEDIA_MMAP_FLAG_RW}
> > > +can be set if a read-write mapping is desired. Without this flag the=
 mapping
> > > +will be read-only.
> > > +\item[\field{offset}] corresponds to the \field{mem_offset} field of=
 the
> > > +\textit{union v4l2_plane} for the plane to map. This field can be ob=
tained
> > > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > > +\end{description}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{v=
irtio_media_resp_mmap}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_mmap {
> > > +    struct virtio_media_resp_header hdr;
> > > +    le64 driver_addr;
> > > +    le64 len;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{driver_addr}] offset into SHM region ID 0 of the start =
of the mapping.
> > > +\item[\field{len}] length of the mapping as indicated by the \textit=
{struct v4l2_plane}
> > > +the buffer belongs to.
> > > +\end{description}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Mapping a MMAP buf=
fer}{Device Types / Media Device / Device Operation / Mapping a MMAP buffer=
}
> > > +
> > > +The \textit{len} parameter of the \textit{virtio_media_resp_mmap} re=
sponse sent
> > > +by the device MUST always be equal to the length of the buffer.
> > > +
> > > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} unmaps a MMAP buffer previously map=
ped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_munmap {
> > > +    struct virtio_media_cmd_header hdr;
> > > +    le64 driver_addr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{driver_addr}] offset into SHM region ID 0 previously re=
turned by
> > > +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previous=
ly mapped.
> > > +\end{description}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit=
{virtio_media_resp_munmap}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_munmap {
> > > +    struct virtio_media_resp_header hdr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP b=
uffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP bu=
ffer}
> > > +
> > > +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_C=
MD_MMAP}
> > > +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the =
buffers or
> > > +session they belong to are released or closed by the driver.
> > > +
> > > +\paragraph{Device Operation: Memory Types}
> > > +
> > > +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit=
{USERPTR}
> > > +and \textit{DMABUF}) can easily be mapped to both driver and device =
context.
> > > +
> > > +\begin{lstlisting}
> > > +enum virtio_media_memory {
> > > +    VIRTIO_MEDIA_MMAP =3D V4L2_MEMORY_MMAP,
> > > +    VIRTIO_MEDIA_SHARED_PAGES =3D V4L2_MEMORY_USERPTR,
> > > +    VIRTIO_MEDIA_OBJECT =3D V4L2_MEMORY_DMABUF,
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\subparagraph{MMAP}
> > > +
> > > +\textit{MMAP} memory type is the semantic equivalent of
> > > +\textit{V4L2_MEMORY_MMAP} in regular V4L2.
> > > +
> > > +In virtio-media, \textit{MMAP} buffers are provisioned by the device=
, just like
> > > +they are by the kernel in regular V4L2. Similarly to how userspace c=
an map a
> > > +\textit{MMAP} buffer into its address space using mmap and munmap, t=
he
> > > +virtio-media driver can map device buffers into the driver space by =
queueing the
> > > +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_medi=
a_cmd_munmap}
> > > +commands to the commandq.
> > > +
> > > +\subparagraph{SHARED_PAGES}
> > > +\label{sec:Device Types / Media Device / Device Operation / Shared P=
ages}
> > > +
> > > +\textit{SHARED_PAGES} memory type is the semantic equivalent of
> > > +\textit{V4L2_MEMORY_USERPTR} in regular V4L2.
> > > +
> > > +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by th=
e driver,
> > > +and use guest physical addresses. Instances of \textit{struct v4l2_b=
uffer}
> > > +and \textit{struct v4l2_plane} of this memory type are followed by a=
 list of
> > > +\textit{struct virtio_media_sg_entry}. For more information, see
> > > +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memor=
y}
> > > +
> > > +The device must not alter the pointer values provided by the driver,=
 i.e.
> > > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > > +\textit{struct v4l2_plane} must be returned to the driver with the s=
ame value
> > > +as it was provided.
> > > +
> > > +\subparagraph{VIRTIO_OBJECT}
> > > +
> > > +\textit{VIRTIO_OBJECT} memory type is the semantic equivalent of
> > > +\textit{V4L2_MEMORY_DMABUF} in regular V4L2.
> > > +
> > > +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a=
 virtio
> > > +object, just like they are by a \textit{DMABUF} in regular V4L2. Vir=
tio objects
> > > +are 16-bytes UUIDs and do not fit in the placeholders for file descr=
iptors, so
> > > +they follow their embedding data structure as needed and the device =
must
> > > +leave the V4L2 structure placeholder unchanged.
> > > +
> > > +Conversely to \textit{SHARED_PAGES} buffers, virtio objects UUIDs ne=
ed to be added in
> > > +both the device-readable and device-writable section of the descript=
or chain.
> > > +
> > > +Device-allocated buffers with the \textit{VIRTIO_MEDIA_MMAP} memory =
type can also
> > > +be exported as virtio objects for use with another virtio device usi=
ng the
> > > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exp=
ortbuffer}
> > > +means that space for the UUID needs to be reserved right after that =
structure.
> > > +
> > > +\subsubsection{Event Virtqueue}
> > > +
> > > +Events are asynchronous notifications to the driver. In virtio-media=
,
> > > +they are used as a replacement for the \textit{VIDIOC_DQBUF} and
> > > +\textit{VIDIOC_DQEVENT} ioctls and the polling mechanism, which woul=
d be
> > > +impractical to implement on top of virtio.
> > > +
> > > +\paragraph{Device Operation: Event header}
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > > +
> > > +/* Header for events queued by the device for the driver on the even=
tq. */
> > > +struct virtio_media_event_header {
> > > +    le32 event;
> > > +    le32 session_id;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> > > +\item[\field{session_id}] ID of the session the event applies to.
> > > +\end{description}
> > > +
> > > +\paragraph{Device Operation: Device-side error}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the sessi=
on
> > > +mentioned in the header is considered corrupted and automatically cl=
osed by
> > > +the device.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_event_error {
> > > +    struct virtio_media_event_header hdr;
> > > +    le32 errno;
> > > +    le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{errno}] error code describing the kind of error that oc=
curred.
> > > +\end{description}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Device-side error}=
{Device Types / Media Device / Device Operation / Device-side error}
> > > +
> > > +After an error is signaled, when the device considers the session as
> > > +non-existing, the device MUST NOT recycle the session ID until the d=
river has
> > > +explicitly closed it.
> > > +
> > > +\drivernormative{\subparagraph}{Device Operation: Device-side error}=
{Device Types / Media Device / Device Operation / Device-side error}
> > > +
> > > +Upon receiving an error event for a session, the driver MUST
> > > +explicitly close the session using a \textit{VIRTIO_MEDIA_CMD_CLOSE}=
 command.
> > > +
> > > +\paragraph{Device Operation: Dequeue buffer}
> > > +\label{sec:Device Types / Media Device / Device Operation / Dequeue =
buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} signals that a buffer is not being u=
sed anymore
> > > +by the device and is returned to the driver.
> > > +
> > > +Every time a buffer previously queued (i.e., using the
> > > +\textit{VIDIOC_QBUF} ioctl) is done being processed, the
> > > +device queues a \textit{struct virtio_media_event_dqbuf} event on
> > > +the eventq, signifying that the buffer can be used again by the driv=
er.
> > > +This is like an implicit \textit{VIDIOC_DQBUF} ioctl.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_MEDIA_MAX_PLANES 8
> > > +
> > > +struct virtio_media_event_dqbuf {
> > > +    struct virtio_media_event_header hdr;
> > > +    struct v4l2_buffer buffer;
> > > +    struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buf=
fer that has been dequeued.
> > > +\item[\field{planes}] array of \textit{struct v4l2_plane} containing=
 the plane information for multi-planar buffers.
> > > +\end{description}
> > > +
> > > +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct=
 v4l2_plane}
> > > +are meaningless and must be ignored by the driver. It is recommended=
 that the
> > > +device sets them to NULL in order to avoid leaking potential device =
addresses.
> > > +
> > > +Note that in the case of a \field{SHARED_PAGES} buffer, the \textit{=
struct v4l2_buffer}
> > > +used as event payload is not followed by the buffer's SG entries: si=
nce that memory
> > > +is the same that the driver submitted with the \textit{VIDIOC_QBUF},=
 it would
> > > +be redundant to have it here.
> > > +
> > > +\paragraph{Device Operation: Emit an event}
> > > +\label{sec:Device Types / Media Device / Device Operation / Emit an =
event}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been e=
mitted for a session.
> > > +
> > > +Every time an event for which the driver has been previously subcrib=
ed to
> > > +(i.e., using the \textit{VIDIOC_SUBSCRIBE_EVENT} ioctl) is signaled,=
 the
> > > +device queues a \textit{struct virtio_media_event_event} event on th=
e eventq.
> > > +This is like an implicit \textit{VIDIOC_DQEVENT} ioctl.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_event_event {
> > > +    struct virtio_media_event_header hdr;
> > > +    struct v4l2_event event;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{event}] \textit{struct v4l2_event} describing the event=
 that occurred.
> > > +\end{description}
> > > diff --git a/device-types/media/device-conformance.tex b/device-types=
/media/device-conformance.tex
> > > new file mode 100644
> > > index 0000000..fcc697d
> > > --- /dev/null
> > > +++ b/device-types/media/device-conformance.tex
> > > @@ -0,0 +1,12 @@
> > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Confor=
mance / Device Conformance / Media Device Conformance}
> > > +
> > > +A Media device MUST conform to the following normative statements:
> > > +
> > > +\begin{itemize}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Open device}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / V4L2 ioctls}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Unsupported ioctls}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Mapping a MMAP buffer}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Unmapping a MMAP buffer}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Oper=
ation / Device-side error}
> > > +\end{itemize}
> > > \ No newline at end of file
> > > diff --git a/device-types/media/driver-conformance.tex b/device-types=
/media/driver-conformance.tex
> > > new file mode 100644
> > > index 0000000..de781b9
> > > --- /dev/null
> > > +++ b/device-types/media/driver-conformance.tex
> > > @@ -0,0 +1,10 @@
> > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Confor=
mance / Driver Conformance / Media Driver Conformance}
> > > +
> > > +A Media device MUST conform to the following normative statements:
> > > +
> > > +\begin{itemize}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / Command Virtqueue}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / Close device}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / V4L2 ioctls}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Oper=
ation / Device-side error}
> > > +\end{itemize}
> > > \ No newline at end of file
> > > --
> > > 2.47.1
> > >
> > >
> >

