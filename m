Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2114884C
	for <virtio-comment@lists.linux.dev>; Fri, 17 Jan 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737127264; cv=none; b=WZ9E+j5AWoCUZNP1NqB2PYJYtkLoEs3aXAng2LCO3kn+NGNUFxxbm/vbZ3YazeFVqhnP0CCOqql2Bg2PTkDzI+dZXX3pY9AkziW8EEXUxNkrQaIHaT+hxqFNMTi2vXDByWvpJ3XtMF8AyQadqZd8+XM2dJU4oop8nhu+SWpNqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737127264; c=relaxed/simple;
	bh=rwg0T5deTMBtwozCpdZOLZrvVl2xMnULRnZFebUPFmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFzBZ6Irdss7GLyvfPpeKfCa4TCvBinyfgbBizBAIHxk7al/pvWXoXIOI1yqQILSPmYZK2YCjck6Ad6f9LEVUz6a3/uxeho/pmXcIqzOdcVuO/MnZv1NKfoCaKQUo68PgPrVpMWO/fhIVKbaFOzC31MVgmGUqmdnuMDR3kwCCuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wd9/fElq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wd9/fElq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737127260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJd9v8uy1HbYZMbsAevQd2W/0XW31zYwdX4tzPMfYo4=;
	b=Wd9/fElqNM5UoY1YhwAYz+bmmYc/vkZ6ElHSvGx1Uc0iO79e7tWTRIY2UVQvjOrb/TQIFQ
	W41jST+hCvMY4JnysK4japIAI5KvblyF3zi6uNHyh590CCucN1rJMqcoKRuurXlZ4FNQcp
	QK2ckFOELvhZX0vMyhG5warZYSPzbTc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-W8qmsI_QPOW8QZG2b1EjQw-1; Fri, 17 Jan 2025 10:20:57 -0500
X-MC-Unique: W8qmsI_QPOW8QZG2b1EjQw-1
X-Mimecast-MFC-AGG-ID: W8qmsI_QPOW8QZG2b1EjQw
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso4200219a91.2
        for <virtio-comment@lists.linux.dev>; Fri, 17 Jan 2025 07:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127256; x=1737732056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJd9v8uy1HbYZMbsAevQd2W/0XW31zYwdX4tzPMfYo4=;
        b=u7YTEgn1tqhtSQ3XYOcOx/gE/XrbTpShOfCuAVoZFdrx9q7wFZEcjZmC9QdHkvs1A8
         iRvv5DncMjM1xjggHOC8Gg86WzCEZuGBuzfeGr0nKP1RVM20Wn0/wSrG6+q0jAkResWE
         Le1L1zvANwWKTlcjYITBW+XG2nVNw85QR10xFgnZTMIR6jWP0PnJ168YI+iBBVz/g3aw
         x5VDgZlzvs4v7NBGhUy+Sllr95QbjkRAhPZNNfPOkufj+E/uNWXxh95eRgZim3zsX/gT
         kb+wzh8afmRp4l1vHAUSFTadOZOz1q7bzJ8/XMY1V4leYp9+3ylSqCo6PAAa9qw2/Pa4
         1DDA==
X-Forwarded-Encrypted: i=1; AJvYcCXYWhoblzahjdEFeTyWfPAIZSCA4h9nEApww6xhdpDWubw5w1/xRQOj9wRAVNEL5KDnItNutZU4vTXismZPRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnufiv3zpbKcnwZh4d4psN++D8n8cC26mGhpWRPcf2ucJEYXv1
	wYufj5+B1qjPSSDTDG+38xfxPt4UzqmfTi/uyKooeOF4vcPp/wRQ7dEzIgHiboafxnSHJPl0bTp
	3l0W6g1rnl/4b+DjCDV2mRugCLDcGtD3PW6dwHrJj/z42D9lZZC2pvFUVaPkBB+geWrED4CNa/T
	cSC4jCpK2fv6jqQPBZ3/8p5ej5gPEL1KLr5WNs8Q0=
X-Gm-Gg: ASbGncsY60847kBY/z+88mK21dSaPUoBZetD7FA9eNzoyfmDORu80X5PX71dkJlpNKw
	h138SzgzvvbJC3qPoUuO9J69bRZttnMNUoPlssDq9
X-Received: by 2002:a17:90b:54cb:b0:2ee:df57:b194 with SMTP id 98e67ed59e1d1-2f782cc011fmr3905447a91.21.1737127256070;
        Fri, 17 Jan 2025 07:20:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHvhMFgmHix1sYO4xDjVE4DFVIpehs2DFTZ82yfGphDlBcGCWOBeAaioPgnM6Ooh5Cr9CFU/gYyH58gwYK2Gs=
X-Received: by 2002:a17:90b:54cb:b0:2ee:df57:b194 with SMTP id
 98e67ed59e1d1-2f782cc011fmr3905381a91.21.1737127255392; Fri, 17 Jan 2025
 07:20:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107154930.118763-1-aesteve@redhat.com> <20241107154930.118763-2-aesteve@redhat.com>
 <CAPBb6MVDgdBiqV0J4DXKX2u-KKpBs+119X7obNFsDpKjH0iarg@mail.gmail.com>
 <CADSE00KU+L-fByz+rEdMtUY1bg4hjyuBRkZhZy6Na5v0z6q1+Q@mail.gmail.com>
 <CADSE00+eLP+PbrmSiyvao4bJeBRSDCSBTbFUMdPomxngwz6D+w@mail.gmail.com>
 <D6YAQ9B0IPR7.1ZYKATYW5K8K7@gmail.com> <D74402ZPCM0C.2H7L6GQ5CR07I@gmail.com>
In-Reply-To: <D74402ZPCM0C.2H7L6GQ5CR07I@gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jan 2025 16:20:43 +0100
X-Gm-Features: AbW1kvYDzX3QQ4yw9TGnF_XOZezDvVmqTrUYWe01UHMKXtehzNkPt0zOZ98FYHU
Message-ID: <CADSE00LecSKbiOMApVZsvqGy31ygeQ=huPft+VMMVcM=MjR2CA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alexandre Courbot <acourbot@chromium.org>, virtio-comment@lists.linux.dev, 
	eballetb@redhat.com, daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, 
	dverkamp@chromium.org, ribalda@google.com, alex.bennee@linaro.org, 
	mst@redhat.com, nicolas.dufresne@collabora.com, cohuck@redhat.com, 
	changyeon@google.com, hverkuil@xs4all.nl, gurchetansingh@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0YuOjSMRn3uhtNQKgTW3M4O99j7-1-31pfQm0SJn82Q_1737127256
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 6:46=E2=80=AFAM Alexandre Courbot <gnurou@gmail.com=
> wrote:
>
> On Fri Jan 10, 2025 at 6:46 PM JST, Alexandre Courbot wrote:
> > Hi Albert,
> >
> > On Wed Jan 8, 2025 at 1:25 AM JST, Albert Esteve wrote:
> > > Hi Alexandre,
> > >
> > > Thanks for your comments! Partially covered here, responded inline
> > > below. I'll go through the rest tomorrow.
> > >
> > > On Tue, Jan 7, 2025 at 8:00=E2=80=AFAM Alexandre Courbot <acourbot@ch=
romium.org> wrote:
> > > >
> > > > Hi Albert,
> > > >
> > > > Thanks again for driving this. The current version looks good to me=
,
> > > > but here are a few things I found while doing another pass.
> > > >
> > > > On Fri, Nov 8, 2024 at 12:50=E2=80=AFAM Albert Esteve <aesteve@redh=
at.com> wrote:
> > > > >
> > > > > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > > > virtio, able to virtualize any video device supported
> > > > > by V4L2.
> > > > >
> > > > > Note that virtio-media does not require the use of a
> > > > > V4L2 device driver on the host or guest side -
> > > > > V4L2 is only used as a host-guest protocol,
> > > > > and both sides are free to convert it from/to any
> > > > > model that they wish to use.
> > > > >
> > > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > > ---
> > > > >  conformance.tex                           |  13 +-
> > > > >  content.tex                               |   1 +
> > > > >  device-types/media/description.tex        | 575 ++++++++++++++++=
++++++
> > > > >  device-types/media/device-conformance.tex |  10 +
> > > > >  device-types/media/driver-conformance.tex |   8 +
> > > > >  5 files changed, 603 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 device-types/media/description.tex
> > > > >  create mode 100644 device-types/media/device-conformance.tex
> > > > >  create mode 100644 device-types/media/driver-conformance.tex
> > > > >
> > > > > diff --git a/conformance.tex b/conformance.tex
> > > > > index dc00e84..c369da1 100644
> > > > > --- a/conformance.tex
> > > > > +++ b/conformance.tex
> > > > > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Confor=
mance / Conformance Targets}
> > > > >  \ref{sec:Conformance / Driver Conformance / Memory Driver Confor=
mance},
> > > > >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver C=
onformance},
> > > > >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conforma=
nce},
> > > > > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conforma=
nce} or
> > > > > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conforma=
nce}.
> > > > > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conforma=
nce},
> > > > > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conforma=
nce} or
> > > > > +\ref{sec:Conformance / Driver Conformance / Media Driver Conform=
ance}.
> > > > > +
> > > > >
> > > > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transi=
tional Device and Transitional Driver Conformance}.
> > > > >    \end{itemize}
> > > > > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conform=
ance / Conformance Targets}
> > > > >  \ref{sec:Conformance / Device Conformance / Memory Device Confor=
mance},
> > > > >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device C=
onformance},
> > > > >  \ref{sec:Conformance / Device Conformance / SCMI Device Conforma=
nce},
> > > > > -\ref{sec:Conformance / Device Conformance / GPIO Device Conforma=
nce} or
> > > > > -\ref{sec:Conformance / Device Conformance / PMEM Device Conforma=
nce}.
> > > > > +\ref{sec:Conformance / Device Conformance / GPIO Device Conforma=
nce},
> > > > > +\ref{sec:Conformance / Device Conformance / PMEM Device Conforma=
nce} or
> > > > > +\ref{sec:Conformance / Device Conformance / Media Device Conform=
ance}.
> > > > >
> > > > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transi=
tional Device and Transitional Driver Conformance}.
> > > > >    \end{itemize}
> > > > > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Confo=
rmance / Conformance Targets}
> > > > >  \input{device-types/scmi/driver-conformance.tex}
> > > > >  \input{device-types/gpio/driver-conformance.tex}
> > > > >  \input{device-types/pmem/driver-conformance.tex}
> > > > > +\input{device-types/media/driver-conformance.tex}
> > > > >
> > > > >  \conformance{\section}{Device Conformance}\label{sec:Conformance=
 / Device Conformance}
> > > > >
> > > > > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Confo=
rmance / Conformance Targets}
> > > > >  \input{device-types/scmi/device-conformance.tex}
> > > > >  \input{device-types/gpio/device-conformance.tex}
> > > > >  \input{device-types/pmem/device-conformance.tex}
> > > > > +\input{device-types/media/device-conformance.tex}
> > > > >
> > > > >  \conformance{\section}{Legacy Interface: Transitional Device and=
 Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface:=
 Transitional Device and Transitional Driver Conformance}
> > > > >  A conformant implementation MUST be either transitional or
> > > > > diff --git a/content.tex b/content.tex
> > > > > index 0a62dce..59925ae 100644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types=
}
> > > > >  \input{device-types/scmi/description.tex}
> > > > >  \input{device-types/gpio/description.tex}
> > > > >  \input{device-types/pmem/description.tex}
> > > > > +\input{device-types/media/description.tex}
> > > > >
> > > > >  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > > > >
> > > > > diff --git a/device-types/media/description.tex b/device-types/me=
dia/description.tex
> > > > > new file mode 100644
> > > > > index 0000000..d20d2f6
> > > > > --- /dev/null
> > > > > +++ b/device-types/media/description.tex
> > > > > @@ -0,0 +1,575 @@
> > > > > +\section{Media Device}\label{sec:Device Types / Media Device}
> > > > > +
> > > > > +The virtio media device follows the same model (and structures) =
as V4L2. It
> > > > > +can be used to virtualize cameras, codec devices, or any other d=
evice
> > > > > +supported by V4L2. The complete definition of V4L2 structures an=
d ioctls can
> > > > > +be found under the
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/index.html}{V4L2 UAPI documentation}.
> > > > > +
> > > > > +V4L2 is a UAPI that allows a less privileged entity (user-space)=
 to use video
> > > > > +hardware exposed by a more privileged entity (the kernel). Virti=
o-media is an
> > > > > +encapsulation of this API into virtio, turning it into a virtual=
ization API
> > > > > +for all classes of video devices supported by V4L2, where the de=
vice plays the
> > > > > +role of the kernel and the driver the role of user-space.
> > > > > +
> > > > > +The device is therefore responsible for presenting a virtual dev=
ice that behaves
> > > > > +like an actual V4L2 device, which the driver can control.
> > > > > +
> > > > > +Note that virtio-media does not require the use of a V4L2 device=
 driver or of
> > > > > +Linux on any side - V4L2 is only used as a transport protocol,
> > > > > +and both sides are free to convert it from/to any model that the=
y wish to use.
> > > > > +
> > > > > +\subsection{Device ID}\label{sec:Device Types / Media Device / D=
evice ID}
> > > > > +
> > > > > +48
> > > > > +
> > > > > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / =
Virtqueues}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[0] commandq - used for driver commands and device response=
s to these
> > > > > +commands.
> > > > > +\item[1] eventq - used for events sent by the device to the driv=
er.
> > > > > +\end{description}
> > > > > +
> > > > > +\subsection{Feature Bits}\label{sec:Device Types / Media Device =
/ Feature Bits}
> > > > > +
> > > > > +None
> > > > > +
> > > > > +\subsection{Device Configuration Layout}\label{sec:Device Types =
/ Media Device / Device Configuration Layout}
> > > > > +
> > > > > +The video device configuration space uses the following layout:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_config {
> > > > > +    le32 device_caps;
> > > > > +    le32 device_type;
> > > > > +    le8 card[32];
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{device_caps}] (driver-read-only) flags representing=
 the device
> > > > > +capabilities as used in
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/v4l/vidioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > > > > +It corresponds with the \field{device_caps} field in the \textit=
{struct video_device}.
> > > > > +\item[\field{device_type}] (driver-read-only) informs the driver=
 of the type
> > > > > +of the video device. It corresponds with the \field{vfl_devnode_=
type} field of the device.
> > > > > +\item[\field{card}] (driver-read-only) name of the device, a NUL=
-terminated
> > > > > +UTF-8 string. It corresponds with the \field{card} field of the =
\textit{struct v4l2_capability}.
> > > > > +If all the characters of the field are used, it does not need to=
 be NUL-terminated.
> > > > > +\end{description}
> > > > > +
> > > > > +\subsection{Device Initialization}
> > > > > +
> > > > > +\begin{enumerate}
> > > > > +\item Read the \field{device_caps} and \field{device_type} field=
s
> > > > > +from the configuration layout to identify the device.
> > > > > +\item Set up the \field{commandq} and \field{eventq}.
> > > > > +\item May open a session (see Section \ref{sec:Device Operation:=
 Command Virtqueue: Sessions})
> > > >
> > > > This reference does not resolve.
> > > >
> > > > > +to use the device and send V4L2 ioctls in order to receive more =
information
> > > > > +about the device, such as supported formats or controls.
> > > > > +\end{enumerate}
> > > > > +
> > > > > +\subsection{Device Operation}\label{sec:Device Types / Media Dev=
ice / Device Operation}
> > > > > +
> > > > > +Commands are queued on the command queue by the driver for the d=
evice to
> > > > > +process. The errors returned by each command are standard
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/gen-errors.html}{Linux kernel error codes}.
> > > > > +For instance, a command that contains invalid options will retur=
n \textit{EINVAL}.
> > > > > +
> > > > > +Events are sent on the event queue by the device for the driver =
to handle.
> > > > > +
> > > > > +\subsubsection{Command Virtqueue}
> > > > > +
> > > > > +\paragraph{Device Operation: Command headers}
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > > > > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > > > > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > > > > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > > > > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > > > > +
> > > > > +/* Header for all virtio commands from the driver to the device =
on the commandq. */
> > > > > +struct virtio_media_cmd_header {
> > > > > +       le32 cmd;
> > > > > +       le32 __reserved;
> > > > > +};
> > > > > +
> > > > > +/* Header for all virtio responses from the device to the driver=
 on the commandq. */
> > > > > +struct virtio_media_resp_header {
> > > > > +       le32 status;
> > > > > +       le32 __reserved;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +A command consists of a command header \textit{virtio_media_cmd_=
header}
> > > > > +containing the following device-readable field:
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA=
_CMD_*).
> > > > > +\end{description}
> > > > > +
> > > > > +A response consists of a response header \textit{virtio_media_re=
sp_header}
> > > > > +containing the following device-writable field:
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{status}] indicates a device request status.
> > > > > +\end{description}
> > > > > +
> > > > > +The status field can take 0 if the command was successful, or on=
e of the
> > > > > +standard Linux error codes if it was not.
> > > > > +
> > > > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue=
: Sessions}{Device Types / Media Device / Device Operation / Command Virtqu=
eue}
> > > > > +
> > > > > +Sessions are how the device is multiplexed, allowing several dis=
tinct works to
> > > > > +take place simultaneously. Before start operating, the driver ne=
eds to open a
> > > >
> > > > nit: "Before starting operation" maybe?
> > > >
> > > > > +session. This is equivalent to opening the \textit{/dev/videoX} =
file of the
> > > > > +V4L2 device. Each session gets a unique ID assigned, which can b=
e then used
> > > > > +to perform actions on it.
> > > > > +
> > > > > +\paragraph{Device Operation: Open device}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new sessio=
n.
> > > > > +
> > > > > +This is the equivalent of calling \textit{open} on a V4L2 device=
 node.
> > > > > +The driver uses \textit{virtio_media_cmd_open} to send an open r=
equest.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_cmd_open {
> > > > > +    struct virtio_media_cmd_header hdr;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \text=
it{virtio_media_resp_open}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_resp_open {
> > > > > +    struct virtio_media_resp_header hdr;
> > > > > +    le32 session_id;
> > > > > +    le32 __reserved;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{session_id}] identifies the current session, which =
is used for
> > > > > +other commands, predominantly ioctls.
> > > > > +\end{description}
> > > > > +
> > > > > +\devicenormative{\subparagraph}{Device Operation: Open device}{D=
evice Types / Media Device / Device Operation / Open device}
> > > > > +
> > > > > +Upon success, the device MUST set a \field{session_id} in \texti=
t{virtio_media_resp_open}
> > > > > +to an integer that is NOT used by any other open session.
> > > > > +
> > > > > +\paragraph{Device Operation: Close device}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active se=
ssion.
> > > > > +
> > > > > +This is the equivalent of calling \textit{close} on a previously=
 opened V4L2
> > > > > +device node. All resources associated with this session will be =
freed.
> > > > > +
> > > > > +This command does not require a response from the device.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_cmd_close {
> > > > > +    struct virtio_media_cmd_header hdr;
> > > > > +    le32 session_id;
> > > > > +    le32 __reserved;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{session_id}] specifies an identifier for the sessio=
n to close.
> > > > > +\end{description}
> > > > > +
> > > > > +\drivernormative{\subparagraph}{Device Operation: Close device}{=
Device Types / Media Device / Device Operation / Close device}
> > > > > +
> > > > > +The session ID SHALL NOT be used again after queueing this comma=
nd.
> > > >
> > > > ... until it has been obtained again through a subsequent
> > > > VIRTIO_MEDIA_CMD_OPEN call. (session IDs can be recycled ; this sho=
uld
> > > > go without saying but it doesn't hurt to mention it)
> > > >
> > > > > +
> > > > > +\paragraph{Device Operation: V4L2 ioctls}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl o=
n an open
> > > > > +session.
> > > > > +
> > > > > +This command tells the device to run one of the `VIDIOC_*` ioctl=
s on the
> > > > > +session identified by \textit{session_id}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_cmd_ioctl {
> > > > > +    struct virtio_media_cmd_header hdr;
> > > > > +    le32 session_id;
> > > > > +    le32 code;
> > > > > +    /* Followed by the relevant ioctl payload as defined in the =
macro */
> > > >
> > > > "ioctl command payload" maybe.
> > > >
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{session_id}] identifies the session to run the ioct=
l on.
> > > > > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} i=
octl to run.
> > > > > +\end{description}
> > > > > +
> > > > > +The code is extracted from the
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/v4l/videodev.html}{videodev2.h},
> > > > > +header file. The file defines the ioctl's codes, type of payload=
, and
> > > > > +direction. The code consists of the second argument of the \fiel=
d{_IO*} macro.
> > > > > +
> > > > > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +This means that its ioctl code is \textit{4}, its payload is a
> > > > > +\textit{struct v4l2_format}, and its direction is \textit{WR} (i=
.e., the
> > > > > +payload is written by both the driver and the device).
> > > > > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls /=
 Ioctls payload}
> > > > > +for more information about the direction of ioctls.
> > > > > +Note that although most architectures use this format, there
> > > > > +are some architecture-specific encoding differences.
> > > > > +See \textit{include/ARCH/ioctl.h} for more details.
> > > >
> > > > Is the last sentence needed? videodev2.h is not architecture-specif=
ic,
> > > > so I don't think this adds anything for our purpose?
> > >
> > > Probably not. The idea was to highlight that in some cases the payloa=
d
> > > may vary depending on the underlying architecture for some
> > > ioctls, due to these architecture differences.
> > > But I agree that it is a detail that should not concern to those want=
ing to
> > > implement the specs. So I will remove the lines.
> >
> > Thanks. My concern was that reader would try to find reasons to care
> > about architecture when all they need to do is look at the ioctls
> > declarations from videodev2.h and copy the second field.
> >
> > >
> > > >
> > > > > +
> > > > > +The payload struct layout always matches the 64-bit, little-endi=
an
> > > > > +representation of the corresponding V4L2 structure. For most str=
ucts, the
> > > > > +size is identical for both 32 and 64 bits versions. Otherwise, t=
he driver
> > > > > +must translate them to the aforementioned size and endianess.
> > > > > +
> > > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \tex=
tit{virtio_media_resp_ioctl}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_resp_ioctl {
> > > > > +    struct virtio_media_resp_header hdr;
> > > > > +    /* Followed by the ioctl payload as defined in the macro */
> > > >
> > > > Similarly, "ioctl response payload"?
> > > >
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Dev=
ice / V4L2 ioctls / Ioctls payload}
> > > > > +
> > > > > +Each ioctl has a payload, which is defined by the third argument=
 of the
> > > > > +\field{_IO*} macro.
> > > > > +
> > > > > +The payload of an ioctl in the descriptor chain follows the comm=
and structure,
> > > > > +the response structure, or both depending on the direction:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item \textbf{_IOR} is read-only for the driver, meaning the pay=
load
> > > > > +follows the response in the device-writable section of the descr=
iptor chain.
> > > > > +\item \textbf{_IOW} is read-only for the device, meaning the pay=
load
> > > > > +follows the command in the driver-writable section of the descri=
ptor chain.
> > > > > +\item \textbf{_IOWR} is writable by both the device and driver,
> > > > > +meaning the payload must follow both the command in the driver-w=
ritable section
> > > > > +of the descriptor chain, and the response in the device-writable=
 section.
> > > > > +\end{itemize}
> > > > > +
> > > > > +A common optimization for \textit{WR} ioctls is to provide the p=
ayload using
> > > >
> > > > s/common/possible? Unless this is indeed commonly used by other
> > > > devices, but I doubt it.
> > > >
> > > > > +descriptors that both point to the same buffer. This mimics the =
behavior of
> > > > > +V4L2 ioctls where the data is only passed once and used as both =
input and
> > > > > +output by the kernel.
> > > >
> > > > That's actually something I'd like to confirm - is it ok to have th=
e
> > > > device-readable and device-writable descriptors point to the same
> > > > memory? I don't see why it wouldn't, but in case this is a problem =
we
> > > > may want to change this and update the driver accordingly.
> >
> > Thanks to Matias and Michael's confirmation it seems there is no proble=
m
> > doing this.
> >
> > > >
> > > > > +
> > > > > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{D=
evice Types / Media Device / Device Operation / V4L2 ioctls}
> > > > > +
> > > > > +In case of success of a device-writable ioctl, the device MUST a=
lways write the
> > > > > +payload in the device-writable part of the descriptor chain.
> > > > > +
> > > > > +In case of failure of a device-writable ioctl, the device is fre=
e to write the
> > > > > +payload in the device-writable part of the descriptor chain or n=
ot. Some errors
> > > > > +may still result in the payload being updated, and in this case =
the device is
> > > > > +expected to write the updated payload. If the device has not wri=
tten the
> > > > > +payload after an error (i.e., only the header is returned), the =
driver MUST
> > > > > +assume that the payload has not been modified.
> > > >
> > > > This last sentence sounds like it is driver-normative, not device-n=
ormative.
> > > >
> > > > > +
> > > > > +\subparagraph{Handling of pointers in ioctl payload}
> > > > > +
> > > > > +A few structures used as ioctl payloads contain pointers to furt=
her
> > > > > +data needed for the ioctl. There are notably:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item The \field{planes} pointer of
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > > > +which size is determined by the length member.
> > > > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_co=
ntrols}, which
> > > >
> > > > Since `struct v4l2_buffer` above is a link, do we want to one for
> > > > `struct v4l2_ext_controls` as well?
> > > >
> > > > > +size is determined by the count member.
> > > > > +\end{itemize}
> > > > > +
> > > > > +If the size of the pointed area is determined to be non-zero, th=
en the main
> > > >
> > > > nit: "If the size of the pointed area is non-zero, ..."
> > > >
> > > > > +payload is immediately followed by the pointed data in their ord=
er of
> > > > > +appearance in the structure, and the pointer value itself is ign=
ored by the
> > > > > +device, which must also return the value initially passed by the=
 driver.
> > > > > +
> > > > > +\subparagraph{Handling of pointers to userspace memory}
> > > >
> > > > s/userspace/guest ?
> > >
> > > To me this refers to the fact that the original fields in the related
> > > structures refer to userspace memory (outside of the host/guest
> > > context). I think I'd keep it as is.
> > >
> > > Maybe changing the titles of this and the previous sections to:
> > > \subparagraph{Handling of pointers to data in ioctl payload}
> > > and
> > > \subparagraph{Handling of pointers to userspace memory in ioctl paylo=
ad}
> > >
> > > wdyt?
> >
> > Sounds good to me.
> >
> > >
> > > >
> > > > I'd also suggest adding a "(SHARED_PAGES memory type)" at the end o=
f
> > > > the title to make it explicit that this is specific to this particu=
lar
> > > > memory type.
> > >
> > > Maybe a clarification in the first paragraph (and a link to the relat=
ed
> > > section) would be enough? I feel having a memory type in the title wh=
en
> > > this concept has not been yet introduced may be confusing. Having tha=
t
> > > in the text allows to link the section and jump ahead to relate both =
concepts.
> >
> > Agreed, a clarification in the text is probably better for providing
> > context.
> >
> > >
> > > >
> > > > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace=
 memory}
> > > > > +
> > > > > +A few pointers are special in that they point to userspace memor=
y in the
> > > > > +original V4L2 specification. They are:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer=
} and
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/v4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > > > > +(technically an unsigned long, but designated a userspace addres=
s).
> > > > > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > > > > +\end{itemize}
> > > >
> > > > Same as above, let's either add links to all V4L2 structs, or just
> > > > remove them altogether since we point to the documentation in the
> > > > introduction anyway.
> > >
> > > I added the link for your comment above, but I think with that change=
,
> > > this is ok as it is. I only add the link to those structs that have
> > > not been linked before.
> > >
> > > >
> > > > > +
> > > > > +These pointers can cover large areas of scattered memory, which =
has the
> > > > > +potential to require more descriptors than the virtio queue can =
provide. For
> > > > > +these particular pointers only, a list of \textit{struct virtio_=
media_sg_entry}
> > > > > +that covers the needed amount of memory for the pointer is used =
instead of
> > > > > +using descriptors to map the pointed memory directly.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_sg_entry {
> > > > > +       le64 start;
> > > > > +       le32 len;
> > > > > +       le32 __reserved;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +For each such pointer to read, the device reads as many SG entri=
es as needed
> > > > > +to cover the length of the pointed buffer, as described by its p=
arent
> > > > > +structure (\field{length} member of \textit{struct v4l2_buffer} =
or
> > > > > +\textit{struct v4l2_plane} for buffer memory, and \field{size} m=
ember of
> > > > > +\textit{struct v4l2_ext_control} for control data).
> > > > > +
> > > > > +Since the device never needs to modify the list of SG entries, i=
t is only
> > > > > +provided by the driver in the device-readable section of the des=
criptor chain,
> > > > > +and not repeated in the device-writable section, even for WR ioc=
tls.
> > > > > +
> > > > > +\subparagraph{Unsupported ioctls}
> > > > > +
> > > > > +A few ioctls are replaced by other, more suitable mechanisms.
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the config=
uration area
> > > > > +(see \ref{sec:Device Types / Media Device / Device Configuration=
 Layout}).
> > > > > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > > > > +(see \ref{sec:Device Types / Media Device / Device Operation / D=
equeue buffer}).
> > > > > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > > > > +(see \ref{sec:Device Types / Media Device / Device Operation / E=
mit an event}).
> > > > > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} =
are deprecated
> > > > > +and replaced by the controls of the JPEG class.
> > > > > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and =
shall not be
> > > > > +implemented by the device.
> > > > > +\end{itemize}
> > > > > +
> > > > > +\devicenormative{\subparagraph}{Device Operation: Unsupported io=
ctls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > > > +
> > > > > +When a request is not supported, the device MUST return \textit{=
ENOTTY},
> > > > > +which corresponds with the response for unknown ioctls.
> > > >
> > > > s/with/to
> > > >
> > > > > +
> > > > > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer=
 into the
> > > > > +driver's address space.
> > > > > +
> > > > > +Shared memory region ID 0 is used to map MMAP buffers with
> > > > > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > > > > +
> > > > > +struct virtio_media_cmd_mmap {
> > > > > +       struct virtio_media_cmd_header hdr;
> > > > > +       le32 session_id;
> > > >
> > > > session_id is not mentioned in the member description below.
> > > >
> > > > > +       le32 flags;
> > > > > +       le32 offset;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{flags}] is the set of flags for the mapping. \field=
{VIRTIO_MEDIA_MMAP_FLAG_RW}
> > > > > +can be set if a read-write mapping is desired. Without this flag=
 the mapping
> > > > > +will be read-only.
> > > > > +\item[\field{offset}] corresponds to the \field{mem_offset} fiel=
d of the
> > > > > +\textit{union v4l2_plane} for the plane to map. This field can b=
e obtained
> > > > > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > > > > +\end{description}
> > > > > +
> > > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \text=
it{virtio_media_resp_mmap}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_resp_mmap {
> > > > > +    struct virtio_media_resp_header hdr;
> > > > > +    le64 driver_addr;
> > > > > +    le64 len;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{driver_addr}] offset into SHM region ID 0 of the st=
art of the mapping.
> > > > > +\item[\field{len}] length of the mapping as indicated by the \te=
xtit{struct v4l2_plane}
> > > > > +the buffer belongs to.
> > > >
> > > > This makes me think: do we need to return the length of the mapping
> > > > when we already know the length of the v4l2_plane and we only map
> > > > whole buffers? It probably doesn't hurt to repeat that information
> > > > here but maybe that's something we can optimize out?
> > >
> > > That's a good point. Indeed, no partial mapping should be allowed, so
> > > the length field does sound a bit redundant. Unless it needs error
> > > checking, which probably does not, I think it can be skipped. I'll do
> > > for the next version. Thanks!
> >
> > Thanks - I will make sure to update the driver and devices as well to
> > confirm this doesn't introduce any issue in practice.
>
> So after trying to update the code to remove the length field, I have
> come to the conclusion that it is useful after all.
>
> While it is true that the returned length of the mapping will always be
> equal to the length of the buffer, the semantics of mmap require that we
> check that the mapped area fits inside the requested VMA, and in order
> to do so we need the length of the mapping.
>
> Why can't we use the length of the buffer, since it is the same value?
> The driver doesn't know that length until a QUERYBUF ioctl is performed,
> and although it is almost certain that the user will do a QUERYBUF ->
> mmap in practice (if only to obtain the offset to use as a mmap
> parameter), there is no formal guarantee of this, and doing so would
> require some caching mechanism that is a bit more complex than what I am
> comfortable putting in a kernel driver if it is not absolutely
> necessary.
>
> So we should keep this `len` parameter, and maybe just add a
> device-normative paragraph stating that it must always be equal to the
> length of the buffer.

Got it. Will do that. Thanks for testing it.

Next week I will post a new version of the spec. But I feel it pretty
mature already.

Best regards,
Albert.

>
> Thanks,
> Alex.
>

