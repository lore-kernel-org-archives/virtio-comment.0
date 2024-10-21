Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134171E633C
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729516882; cv=none; b=gMGBgNo5SoVlaxgbWVZZ+oNzB7ElXTEMuvplW7fC8MeyZk0yTbrb3TFpT/boh4esEC8hQdRFD2FTW8nVULB/6be5BBlN51x0/LpDmdZ56G5Q1uh4uHrqaM6QF7R3yB3U+XS2/OyCi8slAG9VjQA1hel5tkZ4hGM2amWdBr41wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729516882; c=relaxed/simple;
	bh=3RZQXtiv+CSgH/iA1WtqkrpGmPMzNj7F0ZcqF8orMxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXJ2p6dIvOTHhj1BgKmca+j7qyF6nK0Q8+u1VHvAS75xAL9p5DJM3HLwtROn0J20G+SwCUVHiA8+IHTt3s7YHUfTqBBCif0AZCowGtCI28pK7OECiMD9kDnLGpZt7H7eHytjHfpSD9CxYVODYygZcgoEkULcwU55KgL2LhRYJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CjAhuL52; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CjAhuL52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729516879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG3zotzp/I1y0jr7f7NMYhwD5P9cdSd1Z//oBE1bvCc=;
	b=CjAhuL52f+8DTHd/E03W2pPSBkF4JlDeIlyrpoVmMBzfUGI6NRBlEj640sCpzG0Mi3UYFd
	bxFatCj3eYww8+O/87pBEgGTPTI75mXFWJClFQOn22De3bbM+JoA94H6TGNLhRT9y6QG+7
	5Xx5aLYzRhDKHtvCH40/sfI6zUJX70U=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398--dA3Sb4wOAiG0iCQ2qbG9Q-1; Mon, 21 Oct 2024 09:21:17 -0400
X-MC-Unique: -dA3Sb4wOAiG0iCQ2qbG9Q-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e2cc47ce63so4225744a91.3
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 06:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729516877; x=1730121677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG3zotzp/I1y0jr7f7NMYhwD5P9cdSd1Z//oBE1bvCc=;
        b=quFyIesthXdkg4ByI7blcJp8BBSwSX9fMwytxxvgaF2XF6jF+MVkjI6w64KSiU9NM1
         odwV3Q4xUJvGHRAgpfvaoHqfxQX7nqdbxUvZItXPRVnvK9k4oSCXt0FRqYrtQi4Aumcf
         uvDhrTHsKsm/95d2ifcG4lR+C8hOqnM4GgcpCu4NbM9+LyS9ESGKqNMv931xUyNeyuR2
         io1646AbZHhylHYD0zBWUCbnVafiLiZfbJRYauHD1HRO3or29SfKNztBd9Z7262yxuGy
         aIEaLRrpwHDOhxiLwJu7Z0rvzWLx91jdPEhaZlnE2GF3jXnwEZaIAj2rfXu/VhCIeKU1
         jZTg==
X-Gm-Message-State: AOJu0Yy+lsl3xRSztaIHTDSaVRNtsuYUbk4XQfr7PGKn1oLSm2JAzuC1
	1Yfz2gB7ats3Qonp7jSnyGkHqMTmITEZzfEwLo/BSEM5KF0P4Vt6LeLWMxmdhRIX64Vhs0/II2S
	SCzuiUHPNQVgtkMsqPtn5NYnAb8HwmIYuvJ7zXONvaheegSby8yGYmV0wD7PHTA64l1JvVUTtIQ
	0mXcQrSZx3vRmo8AX9xFk2bA3M1I5qga2neRdhTNA=
X-Received: by 2002:a17:90a:7406:b0:2e2:ba35:356c with SMTP id 98e67ed59e1d1-2e56172c2a4mr13091727a91.39.1729516876505;
        Mon, 21 Oct 2024 06:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNs/sXzG3OG8MCNFAyUVgcLKB4twtx8KjS041NLqt4JqZ93+IjWDt7+LAYCgPthOlEJlXKvFRLdi8MPiPh8Qo=
X-Received: by 2002:a17:90a:7406:b0:2e2:ba35:356c with SMTP id
 98e67ed59e1d1-2e56172c2a4mr13091671a91.39.1729516875713; Mon, 21 Oct 2024
 06:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
 <ZxIhtQrr/oKwPUBb@fedora>
In-Reply-To: <ZxIhtQrr/oKwPUBb@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 21 Oct 2024 15:21:04 +0200
Message-ID: <CADSE00+=vE1Z+ocna-pnEZdhSFqnv4CndrzBSSbgUh_s4wR_xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com, 
	daniel.almeida@collabora.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, eballetb@redhat.com, 
	acourbot@chromium.org, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	cohuck@redhat.com, mst@redhat.com, agordeev@qti.qualcomm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 10:52=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Hello Albert,
>
> I gave a first reading. I left some minor comments below. I could not
> cover the whole patch yet.
>
> On Thu, Oct 17, 2024 at 09:04:23AM +0200, Albert Esteve wrote:
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver or of Linux on the host or
> > guest side - V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 583 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  11 +
> >  device-types/media/driver-conformance.tex |   9 +
> >  5 files changed, 613 insertions(+), 4 deletions(-)
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
> > index 0000000..793e9b1
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,583 @@
> > +\section{Media Device}\label{sec:Device Types / Media Device}
> > +
> > +The virtio media device follow the same model (and structures) as V4L2=
. It
>
> s/follow/follows
>
> > +can be used to virtualize cameras, codec devices, or any other device
> > +supported by V4L2. The device assumes 64-bit little-endian V4L2 struct=
ures
> > +are exchanged. The complete definition of V4L2 structures and ioctls c=
an
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
> > +This section relies on definitions from
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index=
.html}{V4L2 UAPI documentation}.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / Media Device / Device =
ID}
> > +
> > +49
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
> > +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Devi=
ce / Virtqueues}
> > +
> > +The device MUST return the descriptor chains it receives on the comman=
dq as
> > +soon as possible, and must never hold them for indefinite periods of t=
ime.
> > +
>
> I think this is true for any device. I wonder what is specific for
> virtio-media to put it here.
>
> > +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Devi=
ce / Virtqueues}
> > +
> > +The driver MUST re-queue the descriptor chains returned by the device =
on the
> > +eventq as soon as possible, and must never hold them for indefinite pe=
riods
> > +of time.
> > +
>
> This is also true for any device. The mechanism to provide buffers
> through the available ring to be consumed and then enqueued in the used
> ring is not device specific. Is there any reason that this is different
> for virtio-media?

Not really. I think you are right and this can be skipped. Shorten the
spec is good :)

>
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
> > +    u8 card[32];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{device_caps}] (driver-read-only) flags representing the d=
evice
> > +capabilities as used in
> > +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-query=
cap.html#c.v4l2_capability}{struct v4l2_capabilities}.
> > +Corresponds with the \field{device_caps} field in the \textit{struct v=
ideo_device}.
>
> I think you should not start a sentence with a verb. I think you should
> add the person. Something like `It corresponds with the ...`. I see
> other cases below.
>
> > +\item[\field{device_type}] (driver-read-only) informs the driver of th=
e type
> > +of the video device. Corresponds with the \field{vfl_devnode_type} fie=
ld of the device.
> > +\item[\field{card}] (driver-read-only) name of the device, a NUL-termi=
nated
> > +UTF-8 string. Corresponds with the \field{card} field of the \textit{s=
truct v4l2_capability}.
> > +If all the characters of the field are used, it does not need to be NU=
L-terminated.
> > +\end{description}
> > +
> > +\subsection{Device Initialization}
> > +
> > +\begin{enumerate}
> > +\item The driver reads the \field{device_caps} and \field{device_type}=
 fields
> > +from the configuration layout to identify the device.
> > +\item The driver sets up the \field{commandq} and \field{eventq}.
> > +\item The driver may open a session to use the device and send V4L2 io=
ctls in
> > +order to receive more information about the device, such as supported
> > +formats or controls.
> > +\end{enumerate}
> > +
> I think other devices remove `the driver` and write it as sequence by
> starting with the verb like:
>
> `- reads the field{}
>  - sets up the \field{}
>  ...
> `
> Also, the last sentence talks about `session` but it was not introduced
> yet, what is a session?
>
> > +\subsection{Device Operation}\label{sec:Device Types / Media Device / =
Device Operation}
> > +
> > +Commands are queued on the command queue by the driver for the device =
to
> > +process. The errors returned by each command are standard
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-e=
rrors.html}{Linux kernel error codes}.
>
> Maybe I am missing something but where and how is stored the returned
> error? I mean, it is stored in the device-writable area but what is the
> structure?
>
> > +For instance, a command that contains invalid options will return \tex=
tit{EINVAL}.
> > +
> > +Events are sent on the event queue by the device for the driver to han=
dle.
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
> > +     u32 cmd;
> > +     u32 __padding;
> > +};
> > +
> > +/* Header for all virtio responses from the device to the driver on th=
e commandq. */
> > +struct virtio_media_resp_header {
> > +     u32 status;
> > +     u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
>
> OK, I guess this is the structure that contains the response.
>
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
> > +The status field can take 0 if the command was successful, or one of t=
he
> > +standard Linux error codes if it was not.
> > +
> > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sess=
ions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > +
> > +Sessions are how the device is multiplexed, allowing several distinct =
works to
> > +take place simultaneously. The driver needs to open a session before i=
t can
> > +perform any useful operation on the device.
> > +
> I think this paragraph can be rewritten. For example, what do you mean
> with `multiplexed`? I think I got the idea but I would elaborate it a
> bit. Also, I think you can rewrite the last sentence to something like:
> `Before start operating, the driver must open a session`
>
> > +\paragraph{Device Operation: Open device}
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
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the current sess=
ion. The
> > +identifier can be used to perform other commands on the session, notab=
ly ioctls.
>
> I would rewrite it as:
>
> `... identifies the current session, which is used for other commands
> like ioctls.`
>
> But I do not have a strong opinion about it.
>
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
> > +    u32 session_id;
> > +    u32 __padding;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier for the session to c=
lose.
> > +\end{description}
> > +
> > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device=
 Types / Media Device / Device Operation / Close device}
> > +
> > +The session ID SHALL NOT be used again after queueing this command.
> > +
> > +\paragraph{Device Operation: V4L2 ioctls}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an o=
pen
> > +session.
> > +
> > +This command asks the device to run one of the `VIDIOC_*` ioctls on th=
e active
> > +session.
> > +
> Why do you use `ask` here? Could it be `tells` instead? But I do not
> have a strong opinion about it. Also, I think with `active` you mean the
> session identified by `session_id`. I think I would not use `active`.
>
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_ioctl {
> > +    struct virtio_media_cmd_header hdr;
> > +    u32 session_id;
> > +    u32 code;
> > +    /* Followed by the relevant ioctl payload as defined in the macro =
*/
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{session_id}] specifies an identifier of thesession to run=
 the ioctl on.
>
> I would rewrite it as:
>
> `\item[\field{session_id}] identifies the session to run the ioctl on`
>
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
> > +This means that its ioctl code is \textit{4}, that its payload is a
> > +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.=
e., the
> > +payload is written by both the driver and the device).
>
> I think you can remove some of the `thats`:
>
> `This means that its ioctl code is \textit{4}, its payload is a
> \textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., the
> payload is written by both the driver and the device).`
>
> > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctl=
s payload}
> > +for more information about the direction of ioctls.
> > +
> > +The payload layout is always a 64-bit representation of the correspond=
ing
> > +V4L2 structure.
> > +
> > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{vi=
rtio_media_resp_ioctl}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_resp_ioctl {
> > +    struct virtio_media_resp_header hdr;
> > +    /* Followed by the ioctl payload as defined in the macro */
> > +};
> > +\end{lstlisting}
> > +
> > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / =
V4L2 ioctls / Ioctls payload}
> > +
> > +Each ioctl has a payload, which is defined by the third argument of th=
e
> > +\field{_IO*} macro defining it.
> > +
>
> I think you can remove `defining it`.
>
> > +The payload of an ioctl in the descriptor chain follows the command st=
ructure,
> > +the reponse structure, or both depending on the direction:
> > +
> > +\begin{itemize}
> > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > +follows the response in the device-writable section of the descriptor =
chain.
> > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > +follows the command in the driver-writable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver,
> > +meaning the payload must follow both the command in the driver-writabl=
e section
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
> > +
> > +A common optimization for \textit{WR} ioctls is to provide the payload=
 using
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
> > +expected to write the updated payload. If the device has not written t=
he
> > +payload after an error, the driver MUST assume that the payload has no=
t been
> > +modified.
> > +
> > +\subparagraph{Handling of pointers in ioctl payload}
> > +
> > +A few structures used as ioctl payloads contain pointers to further
> > +data needed for the ioctl. There are notably:
> > +
> > +\begin{itemize}
> > +\item The \field{planes} pointer of
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/b=
uffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > +which size is determined by the length member.
> > +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls=
}, which
> > +size is determined by the count member.
> > +\end{itemize}
> > +
> > +If the size of the pointed area is determined to be non-zero, then the=
 main
> > +payload is immediately followed by the pointed data in their order of
> > +appearance in the structure, and the pointer value itself is ignored b=
y the
> > +device, which must also return the value initially passed by the drive=
r.
> > +
> > +\subparagraph{Handling of pointers to userspace memory}
> > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memor=
y}
> > +
> > +A few pointers are special in that they point to userspace memory in t=
he
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
> > +These pointers can cover large areas of scattered memory, which has th=
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
> > +     u64 start;
> > +     u32 len;
> > +     u32 __padding;
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
> > +If being requested an unsupported ioctl, the device MUST return the sa=
me
> > +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.
> > +
>
> I would rewrite it as:
>
> `When a request is not supported, the device MUST return \textit{ENOTTY},
> which corresponds with the response for unknown ioctls.`
>
> Matias

I am ok with most/all the rewrites you suggested. Thanks for taking a look!

BR,
Albert.

>

