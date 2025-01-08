Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B81A8403
	for <virtio-comment@lists.linux.dev>; Wed,  8 Jan 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329745; cv=none; b=NHpdnYitRkHaVYpo3iVw3a1jlV3RdVmw4KsallpafOBZwaJeFlNuOh1kO185nx7njU6ATw4xVyUYQ1DyDpu6X0NNfG/wSEAcTssyPeP9C78zaDgIUptmEriIuOL6UvtCKCBRmr7AMMCq9OOX5CeFU+jkIZWJO2SJVUwBy7DTcyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329745; c=relaxed/simple;
	bh=2lZn72ymCAnHT7WWuHwLbfCnj2fd1t9knSjAAXLtH7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kcalb7enMN/iK1geoAZuGI60pDefNu0ZHjEQPFpnmkum7pNpH/MrAoISbGZd8a+FHrJLKjo77JZvF7jFw80wv4eXhkgZcpQOHZGS7ZSjma/cwtv17YwRkTWIHpptz5+s+y7ybe+4TvEUmVpZ41LbjO8IHiaWXb3ZSFJ3Q+VXnYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AziVqXkB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AziVqXkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736329738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJzdQ7XhwzHV4DJVjssJotZd/4Y8mbPz6+j/Ukq9ON0=;
	b=AziVqXkBdWYdtdQIZtXrw9mAms1w3Hkvuv8BZcj2jNC2GMZJR8QF521jjQIxzBUXRf+p+S
	u/n6ArIht/LwOz6P0uEVYyNpmcbCTkSQ1t3n+3tizlBZGNKAYipDlwRUbOYiPqxC5oo+9D
	LoodjpUNU5JZZBuPSCrBEAbapjAkoLE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-MFRpJcH3NyiucZqQNDp3dA-1; Wed, 08 Jan 2025 04:48:51 -0500
X-MC-Unique: MFRpJcH3NyiucZqQNDp3dA-1
X-Mimecast-MFC-AGG-ID: MFRpJcH3NyiucZqQNDp3dA
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so23829033a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 08 Jan 2025 01:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329730; x=1736934530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJzdQ7XhwzHV4DJVjssJotZd/4Y8mbPz6+j/Ukq9ON0=;
        b=j2FT4RduORh0W3gEw6YeEXG1K1EIOrvaUloX63sZP48dt70nufGaPNVTGtlIr190el
         uaeasv1EolUzWtpLo/0uwDjKFArLxZHHzLrb8KBm56+s4ygKNqQplBQJoB8Lc//GqLhd
         NGriTsOCdoMhZSA2r0394fm2g8j9FAv/jaOcGHMQG4NAYpt+F9Ksks8+nVbx8nt4M0KE
         sps1lhKXNOpHj2DSdpXxwjN3UgmyQhb6inS7A177KxQ30dM3HMrew2t5kOFJI7mKEk8j
         TV4j9Y0+BLQkVoyHt1iFyLWS51oFl0LFPHuH67wJEL8P8/c6GtdZkjYQHmtZXafpvcBa
         2ZVA==
X-Gm-Message-State: AOJu0Yyrrdbsj5wYT8CYR2bt/WZfoioi6h9hEV/cYVkWWtUjH1cq4G0x
	7lTA8pIHOCmgrbFxS69J0LTUYXoiZTyAzKmV300eUmq77K1sLV42z1RyHWINpRVFLW/SPGH9T5q
	X/jgRzyHblmaV1LVJ1EuxnM1Y0ybDIGMnTVZzeSyygv9s7cMvwzFDbr4EhKzpRpMIOlA2iP00hf
	T5y3rp3Nlf3ooEqx5G6G/p9y5vEZWdaSfMKM8VGQY=
X-Gm-Gg: ASbGncsRrd5GNCtoGdOTxFy2H6ztMoiwo9U7Z8LIdO/kXVuGoPXHsEVrOmBTfoRSGnP
	biQoBzN0i2CU+zJgUCM5mcuc1Px5MzF8B/6REzK08
X-Received: by 2002:a17:90b:538e:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f548f580femr3286601a91.29.1736329729619;
        Wed, 08 Jan 2025 01:48:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyaicYAntj5ld9YKwDjGFgDX6SqJtX65DaH8SnUXEwgKCQVErZFI/dw7eGArV0QKSOulyOza+FWoBKTDFBaFM=
X-Received: by 2002:a17:90b:538e:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2f548f580femr3286567a91.29.1736329728966; Wed, 08 Jan 2025
 01:48:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107154930.118763-1-aesteve@redhat.com> <20241107154930.118763-2-aesteve@redhat.com>
 <CAPBb6MVDgdBiqV0J4DXKX2u-KKpBs+119X7obNFsDpKjH0iarg@mail.gmail.com> <CADSE00KU+L-fByz+rEdMtUY1bg4hjyuBRkZhZy6Na5v0z6q1+Q@mail.gmail.com>
In-Reply-To: <CADSE00KU+L-fByz+rEdMtUY1bg4hjyuBRkZhZy6Na5v0z6q1+Q@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 8 Jan 2025 10:48:37 +0100
X-Gm-Features: AbW1kvaF6rwlIuUYEBFbU3iyhmvgk_A2EmrKcbEgH4hWHbk3GSDAtSbjkRZJZKk
Message-ID: <CADSE00+eLP+PbrmSiyvao4bJeBRSDCSBTbFUMdPomxngwz6D+w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <acourbot@chromium.org>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, 
	daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, 
	dverkamp@chromium.org, ribalda@google.com, alex.bennee@linaro.org, 
	mst@redhat.com, nicolas.dufresne@collabora.com, cohuck@redhat.com, 
	changyeon@google.com, hverkuil@xs4all.nl, gurchetansingh@google.com, 
	Alexandre Courbot <gnurou@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5bXsA5SY6PaL-ZgHfeT55MQO9MhnVlbzNEVM3MgPbbs_1736329730
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 5:25=E2=80=AFPM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> Hi Alexandre,
>
> Thanks for your comments! Partially covered here, responded inline
> below. I'll go through the rest tomorrow.

Hi,

I have already checked and agreed on the rest. I will soon post a new
version of the spec. Waiting for some inputs for now.

BR,
Albert.

>
> On Tue, Jan 7, 2025 at 8:00=E2=80=AFAM Alexandre Courbot <acourbot@chromi=
um.org> wrote:
> >
> > Hi Albert,
> >
> > Thanks again for driving this. The current version looks good to me,
> > but here are a few things I found while doing another pass.
> >
> > On Fri, Nov 8, 2024 at 12:50=E2=80=AFAM Albert Esteve <aesteve@redhat.c=
om> wrote:
> > >
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
> > >  device-types/media/description.tex        | 575 ++++++++++++++++++++=
++
> > >  device-types/media/device-conformance.tex |  10 +
> > >  device-types/media/driver-conformance.tex |   8 +
> > >  5 files changed, 603 insertions(+), 4 deletions(-)
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
> > > index 0000000..d20d2f6
> > > --- /dev/null
> > > +++ b/device-types/media/description.tex
> > > @@ -0,0 +1,575 @@
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
> > > +\begin{enumerate}
> > > +\item Read the \field{device_caps} and \field{device_type} fields
> > > +from the configuration layout to identify the device.
> > > +\item Set up the \field{commandq} and \field{eventq}.
> > > +\item May open a session (see Section \ref{sec:Device Operation: Com=
mand Virtqueue: Sessions})
> >
> > This reference does not resolve.
> >
> > > +to use the device and send V4L2 ioctls in order to receive more info=
rmation
> > > +about the device, such as supported formats or controls.
> > > +\end{enumerate}
> > > +
> > > +\subsection{Device Operation}\label{sec:Device Types / Media Device =
/ Device Operation}
> > > +
> > > +Commands are queued on the command queue by the driver for the devic=
e to
> > > +process. The errors returned by each command are standard
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen=
-errors.html}{Linux kernel error codes}.
> > > +For instance, a command that contains invalid options will return \t=
extit{EINVAL}.
> > > +
> > > +Events are sent on the event queue by the device for the driver to h=
andle.
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
> > > +       le32 cmd;
> > > +       le32 __reserved;
> > > +};
> > > +
> > > +/* Header for all virtio responses from the device to the driver on =
the commandq. */
> > > +struct virtio_media_resp_header {
> > > +       le32 status;
> > > +       le32 __reserved;
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
> > > +The status field can take 0 if the command was successful, or one of=
 the
> > > +standard Linux error codes if it was not.
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Se=
ssions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > > +
> > > +Sessions are how the device is multiplexed, allowing several distinc=
t works to
> > > +take place simultaneously. Before start operating, the driver needs =
to open a
> >
> > nit: "Before starting operation" maybe?
> >
> > > +session. This is equivalent to opening the \textit{/dev/videoX} file=
 of the
> > > +V4L2 device. Each session gets a unique ID assigned, which can be th=
en used
> > > +to perform actions on it.
> > > +
> > > +\paragraph{Device Operation: Open device}
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
> > > +\item[\field{session_id}] specifies an identifier for the session to=
 close.
> > > +\end{description}
> > > +
> > > +\drivernormative{\subparagraph}{Device Operation: Close device}{Devi=
ce Types / Media Device / Device Operation / Close device}
> > > +
> > > +The session ID SHALL NOT be used again after queueing this command.
> >
> > ... until it has been obtained again through a subsequent
> > VIRTIO_MEDIA_CMD_OPEN call. (session IDs can be recycled ; this should
> > go without saying but it doesn't hurt to mention it)
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
> > > +    /* Followed by the relevant ioctl payload as defined in the macr=
o */
> >
> > "ioctl command payload" maybe.
> >
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
> > > +Note that although most architectures use this format, there
> > > +are some architecture-specific encoding differences.
> > > +See \textit{include/ARCH/ioctl.h} for more details.
> >
> > Is the last sentence needed? videodev2.h is not architecture-specific,
> > so I don't think this adds anything for our purpose?
>
> Probably not. The idea was to highlight that in some cases the payload
> may vary depending on the underlying architecture for some
> ioctls, due to these architecture differences.
> But I agree that it is a detail that should not concern to those wanting =
to
> implement the specs. So I will remove the lines.
>
> >
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
> > > +    /* Followed by the ioctl payload as defined in the macro */
> >
> > Similarly, "ioctl response payload"?
> >
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
> > > +
> > > +A common optimization for \textit{WR} ioctls is to provide the paylo=
ad using
> >
> > s/common/possible? Unless this is indeed commonly used by other
> > devices, but I doubt it.
> >
> > > +descriptors that both point to the same buffer. This mimics the beha=
vior of
> > > +V4L2 ioctls where the data is only passed once and used as both inpu=
t and
> > > +output by the kernel.
> >
> > That's actually something I'd like to confirm - is it ok to have the
> > device-readable and device-writable descriptors point to the same
> > memory? I don't see why it wouldn't, but in case this is a problem we
> > may want to change this and update the driver accordingly.
> >
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
> > > +expected to write the updated payload. If the device has not written=
 the
> > > +payload after an error (i.e., only the header is returned), the driv=
er MUST
> > > +assume that the payload has not been modified.
> >
> > This last sentence sounds like it is driver-normative, not device-norma=
tive.
> >
> > > +
> > > +\subparagraph{Handling of pointers in ioctl payload}
> > > +
> > > +A few structures used as ioctl payloads contain pointers to further
> > > +data needed for the ioctl. There are notably:
> > > +
> > > +\begin{itemize}
> > > +\item The \field{planes} pointer of
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l=
/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > +which size is determined by the length member.
> > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_contro=
ls}, which
> >
> > Since `struct v4l2_buffer` above is a link, do we want to one for
> > `struct v4l2_ext_controls` as well?
> >
> > > +size is determined by the count member.
> > > +\end{itemize}
> > > +
> > > +If the size of the pointed area is determined to be non-zero, then t=
he main
> >
> > nit: "If the size of the pointed area is non-zero, ..."
> >
> > > +payload is immediately followed by the pointed data in their order o=
f
> > > +appearance in the structure, and the pointer value itself is ignored=
 by the
> > > +device, which must also return the value initially passed by the dri=
ver.
> > > +
> > > +\subparagraph{Handling of pointers to userspace memory}
> >
> > s/userspace/guest ?
>
> To me this refers to the fact that the original fields in the related
> structures refer to userspace memory (outside of the host/guest
> context). I think I'd keep it as is.
>
> Maybe changing the titles of this and the previous sections to:
> \subparagraph{Handling of pointers to data in ioctl payload}
> and
> \subparagraph{Handling of pointers to userspace memory in ioctl payload}
>
> wdyt?
>
> >
> > I'd also suggest adding a "(SHARED_PAGES memory type)" at the end of
> > the title to make it explicit that this is specific to this particular
> > memory type.
>
> Maybe a clarification in the first paragraph (and a link to the related
> section) would be enough? I feel having a memory type in the title when
> this concept has not been yet introduced may be confusing. Having that
> in the text allows to link the section and jump ahead to relate both conc=
epts.
>
> >
> > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace mem=
ory}
> > > +
> > > +A few pointers are special in that they point to userspace memory in=
 the
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
> >
> > Same as above, let's either add links to all V4L2 structs, or just
> > remove them altogether since we point to the documentation in the
> > introduction anyway.
>
> I added the link for your comment above, but I think with that change,
> this is ok as it is. I only add the link to those structs that have
> not been linked before.
>
> >
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
> > > +       le64 start;
> > > +       le32 len;
> > > +       le32 __reserved;
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
> > > +which corresponds with the response for unknown ioctls.
> >
> > s/with/to
> >
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
> > > +       struct virtio_media_cmd_header hdr;
> > > +       le32 session_id;
> >
> > session_id is not mentioned in the member description below.
> >
> > > +       le32 flags;
> > > +       le32 offset;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
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
> >
> > This makes me think: do we need to return the length of the mapping
> > when we already know the length of the v4l2_plane and we only map
> > whole buffers? It probably doesn't hurt to repeat that information
> > here but maybe that's something we can optimize out?
>
> That's a good point. Indeed, no partial mapping should be allowed, so
> the length field does sound a bit redundant. Unless it needs error
> checking, which probably does not, I think it can be skipped. I'll do
> for the next version. Thanks!
>
> >
> > > +\end{description}
> > > +
> > > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapp=
ed using \field{VIRTIO_MEDIA_CMD_MMAP}.
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
> > > +However, the driver shall only advertise support for \textit{MMAP} a=
nd
> > > +\textit{DMABUF} to the guest userspace. \textit{USERPTR} is merely e=
mployed to
> > > +discern \textit{SHARED_PAGES} buffers, similar to how \textit{DMABUF=
} is used
> > > +to signify \textit{VIRTIO_OBJECT} buffers in the driver and device c=
ontext.
> >
> > This paragraph sounds specific to the Linux guest driver, as upstream
> > signaled they prefer if drivers don't expose USERPTR to userspace. But
> > it's probably not related for non-V4L2 guest drivers, so I'd suggest
> > we remove it.
>
> Uhm, good point. I think I am biased and failed to consider that. I
> agree in that the spec should be kept generic and avoid guest-specific
> details like this. I'll remove the paragraph!
>
> >
> > We probably also want to define the values, I am using this in the driv=
er:
> >
> > enum virtio_media_memory {
> > VIRTIO_MEDIA_MMAP =3D V4L2_MEMORY_MMAP,
> > VIRTIO_MEDIA_SHARED_PAGES =3D V4L2_MEMORY_USERPTR,
> > VIRTIO_MEDIA_OBJECT =3D V4L2_MEMORY_DMABUF,
> > };
> >
> > > +
> > > +\subparagraph{MMAP}
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
> >
> > Maybe add something to say this is the semantic equivalent of
> > V4L2_MEMORY_USERPTR.
> >
> > > +
> > > +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by th=
e driver,
> > > +and use guest physical addresses. Instances of \textit{struct v4l2_b=
uffer}
> > > +and \textit{struct v4l2_plane} of this type are followed by a list o=
f
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
> >
> > Similarly we probably want to say this is the semantic equivalent of
> > V4L2_MEMORY_DMABUF.
> >
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
> > > +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to b=
e added in
> > > +both the device-readable and device-writable section of the descript=
or chain.
> >
> > s/USERPTR/SHARED_PAGES.
> >
> > I'm also not quite sure why we concluded the objects UUIDs need to be
> > on both the device-readable and device-writable sections. Do you
> > happen to remember?
>
> I took this directly from the virtio-media project at
> https://github.com/chromeos/virtio-media/blob/main/README.md?plain=3D1#L4=
44
>
> I do not think I got involved in any discussion regarding this detail?
> Maybe it has to do with the fact that mmaped buffers can be exported
> by the device, and uses the device-writable section to communicate the
> new ID back to the driver? Just a guess though.
>
> >
> > > +
> > > +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory t=
ype can also
> >
> > s/V4L2_MEMORY_MMAP/VIRTIO_MEDIA_MMAP
> >
> > > +be exported as virtio objects for use with another virtio device usi=
ng the
> > > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exp=
ortbuffer}
> > > +means that space for the UUID needs to be reserved right after that =
structure
> >
> > nit: missing "." at the end of the sentence.
> >
> > > +
> > > +\subsubsection{Event Virtqueue}
> > > +
> > > +Events are a way for the device to inform the driver about asynchron=
ous events
> > > +that it should know about. In virtio-media, they are used as a repla=
cement for
> > > +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the=
 polling
> > > +mechanism, which would be impractical to implement on top of virtio.
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
> >
> > I think there is a risk for a race condition if the session ID is
> > recycled by the device and the driver opens a new session before
> > acknowledging the error event. We probably need to make sure that the
> > device acknowledges that the session is invalid before that happens.
> > I'd suggest adding the following as a device-normative section:
> >
> > "While the session is considered non-existing by the device after the
> > error is signaled, the device MUST NOT recycle the session ID until
> > the driver has explicitly closed it."
> >
> > And a driver-normative section:
> >
> > "Upon receiving an error event for a session, the driver MUST
> > explicitly close the session using a VIRTIO_MEDIA_CMD_CLOSE command."
> >
> > > +
> > > +\paragraph{Device Operation: Dequeue buffer}
> > > +\label{sec:Device Types / Media Device / Device Operation / Dequeue =
buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being u=
sed anymore
> > > +by the device and is returned to the driver.
> > > +
> > > +A \textit{struct virtio_media_event_dqbuf} event is queued on the ev=
entq by the
> > > +device every time a buffer previously queued using the \textit{VIDIO=
C_QBUF}
> > > +ioctl is done being processed and can be used by the driver again. T=
his is like
> > > +an implicit \textit{VIDIOC_DQBUF} ioctl.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_event_dqbuf {
> > > +    struct virtio_media_event_header hdr;
> > > +    struct v4l2_buffer buffer;
> > > +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> >
> > Maybe use VIRTIO_MEDIA_MAX_PLANES and define it as
> >
> > #define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> >
> > or
> >
> > #define VIRTIO_MEDIA_MAX_PLANES 8
> >
> > if we don't want to depend on videodev2.h's definitions here.
> >
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
> > > +Note that in the case of a \field{USERPTR} buffer, the \textit{struc=
t v4l2_buffer}
> >
> > s/USERPTR/SHARED_PAGES.
> >
> > > +used as event payload is not followed by the buffer memory:
> >
> > "... not followed by the buffer's SG entries" is probably more precise.
> >
> > Cheers,
> > Alex.
> >

