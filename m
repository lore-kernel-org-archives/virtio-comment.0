Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1804126C16
	for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992230; cv=none; b=J66GtWFpKcPAMtVUKfC9T2YLUkOf68DUyvz/vb271CvFNpJveg2Zp5m7lxHfvGka8cc9by2ULam/vrMQXOZPB1Q3ge7akoQKIb96y/Pe1G2OQAvMoiDxalTCSnsCf7ZHosn5f83a3RufMRMhWpJyZsZWFzfhhAEmwmXs1hJvbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992230; c=relaxed/simple;
	bh=7D9TqZEkGXsWURzT03kCF/7aqpZnqA7iRm6ugFGBi5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljd8j71Zf7iE/WsAc+TWTP1GEdikj1eX3DhIp4iAy8Cs0lewH5P33rmbYkAmiLbqazYcyLXL/4zgYwg5GoV9GmTFP0TZ/KuomqNql+0tWsXhAB5/NrJTpgRXtljRCFNyxizxwVzXS0FxUjR+1h4CzE6E2Jvn/W9N0kvENDg5fR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEG/Xjfn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEG/Xjfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737992225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d18/saSSeUyoiUhurJklYDqH+H8jCW/2mNBPVlkVA28=;
	b=AEG/XjfnRJ+ZqWMF6aknj6cr1c12AaXnxqVnozcpfWIAQeVX/qx7lUV/bu4/Gq/hRZrb43
	hJra8LeO7hKCJPBU7LewIxUtEChTN9Jdd20uq1J260DS6/XyTd5/beeh9QoKBOqVYW2IAZ
	T5+y0dvDZf8jJmEUUaVHs6qnz7VrpbU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-0oJ_4Hy8N0qnVQBBQyi6KA-1; Mon, 27 Jan 2025 10:37:02 -0500
X-MC-Unique: 0oJ_4Hy8N0qnVQBBQyi6KA-1
X-Mimecast-MFC-AGG-ID: 0oJ_4Hy8N0qnVQBBQyi6KA
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so8461093a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 07:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992219; x=1738597019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d18/saSSeUyoiUhurJklYDqH+H8jCW/2mNBPVlkVA28=;
        b=iYaO4ibEpRo32GubEIhTU63IDr1ktl+CwAPSCGGjbW3fS0LqTfaXfmhOf14cfoeh33
         Y2+/brUlgSRlnniPXwPDg0Dm91fOng9u2oAzJtURPz1e8WEbXGcrsqHWToHOCXDVckm7
         CA2JIG02R8gT8pSxw0ktPgWV6iCZD0Mxih+7jXHAc4fyHOh7ldaukWP6W/EjfhC71ve3
         XWfDHOLjalxt5vPqVXlkCKv8uQTLWwu1cLG+aiR+lIitocAv5IF93XKj3qJbTVQzoji+
         uUcD8dPY/+A7efAaR1rjR1RZka+YTTR6VZR/6huEwtZLExliLSHe0S9UjWTh3babdHSE
         zBpw==
X-Gm-Message-State: AOJu0YxrOOZ0GIEJUu3KGkGUg1Y7Uzeb47mzUWMKSOrf/q4jFpWjfw+Z
	jAQsOxbZCLR4dLgjkYsW2uExFG6n4Cu5KCmg34+kMeze7wG5lYneH1vQnEoL4bbsYtbNJGUSHyX
	d5nIfKcYZi1CWce6JveAaE3BaNKnypZtZVOxgLtBpMImvaB/juGx9BSpfJmjnHCR+/dnX3LKEHO
	m72j3F/z0bJocW+kf/BSSDDnwLjicTeDcl7kbk0FY=
X-Gm-Gg: ASbGnctLCZ02OWG1vJX+72wUHcrgx+r2zNyH+/xeD8/Xoob3ShYhzjv/eBGiHAZViUs
	QEcAlFknmfFcOAWtWSMcDnuDvD/gWgMnAKiDDYzHeU0aVtGlztMSaLGaYEeiWwzMC
X-Received: by 2002:a17:90b:2dc6:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-2f782c787f3mr59061055a91.13.1737992218703;
        Mon, 27 Jan 2025 07:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj8SmS61Mk6Ptk+SiyTzHtPI/m949KYN5q+JVs6hexlxIlhC6TZnRV5eFE7vdsFDgC1i/Fy1Cl1Og3qcVx6z0=
X-Received: by 2002:a17:90b:2dc6:b0:2ee:d63f:d8f with SMTP id
 98e67ed59e1d1-2f782c787f3mr59060993a91.13.1737992218040; Mon, 27 Jan 2025
 07:36:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120085015.956057-1-aesteve@redhat.com> <20250120085015.956057-2-aesteve@redhat.com>
 <Z5ejOtZyzn746lIv@fedora>
In-Reply-To: <Z5ejOtZyzn746lIv@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 27 Jan 2025 16:36:46 +0100
X-Gm-Features: AWEUYZlDCAA4dm-o5lCU4-s3RSHpLZmq4OoAXvMPMPhJqLbnUiyfHEsqInz0nrU
Message-ID: <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio-media: Add virtio media device specification
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, agordeev@qti.qualcomm.com, 
	ribalda@google.com, acourbot@chromium.org, gurchetansingh@google.com, 
	cohuck@redhat.com, daniel.almeida@collabora.com, changyeon@google.com, 
	nicolas.dufresne@collabora.com, eballetb@redhat.com, dverkamp@chromium.org, 
	hverkuil@xs4all.nl, mst@redhat.com, alex.bennee@linaro.org, 
	acourbot@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vnn8gaFbLnSPQbWmp5pbU6xawZSLAirc5gOKojgOaWk_1737992219
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 4:16=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> On Mon, Jan 20, 2025 at 09:50:15AM +0100, Albert Esteve wrote:
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
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 617 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  12 +
> >  device-types/media/driver-conformance.tex |  10 +
> >  5 files changed, 649 insertions(+), 4 deletions(-)
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
> > index 0000000..2c7f451
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,617 @@
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
> > +of the status fiels corresponds with one of the standard Linux error c=
odes.
>
> s/fiels/field
>
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
til it
> > +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OPEN=
} call.
>
> I think you forgot the `has` in `until it been ...`.
>
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
> > +representation of the corresponding V4L2 structure. For most structs, =
the
> > +size is identical for both 32 and 64 bits versions. Otherwise, the dri=
ver
> > +must translate them to the aforementioned size and endianess.
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
> > +follows the command in the driver-writable section of the descriptor c=
hain.
> > +\item \textbf{_IOWR} is writable by both the device and driver,
> > +meaning the payload must follow both the command in the driver-writabl=
e section
> > +of the descriptor chain, and the response in the device-writable secti=
on.
> > +\end{itemize}
>
> What is the driver-writable section in the descriptor chain? AFAIU,
> there are only two sections: the device-readable and the
> device-writable. The spec states that the device-writable follows the
> device-readable section.

So in this case who is suppossed to fill the buffer for the
device-readable section is the driver. It is mostly a matter of
perspective (and naming). The sentence is focusing on who can write
into those spaces instead of a pure driver perspective, as it makes
sense in this context. If you prefer, I could change it for
driver-readable instead. But I think it is clearer to keep the focus
on who is allowed to write into it instead.

>
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
> > +If the device has not written the payload after an error (i.e., only t=
he
> > +header is returned), the driver MUST assume that the payload has not
> > +been modified.
> > +
> > +\subparagraph{Handling of pointers to data in ioctl payload}
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
> > +appearance in the structure, and the pointer value itself is ignored b=
y the
> > +device, which must also return the value initially passed by the drive=
r.
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
> > +The device must not alter the pointer values provided by the driver, i=
.e.
> > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > +\textit{struct v4l2_plane} must be returned to the driver with the sam=
e value
> > +as it was provided.
> > +
> > +\subparagraph{VIRTIO_OBJECT}
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
> > +they follow their embedding data structure as needed and the device mu=
st
> > +leave the V4L2 structure placeholder unchanged.
> > +
> > +Conversely to \textit{SHARED_PAGES} buffers, virtio objects UUIDs need=
 to be added in
> > +both the device-readable and device-writable section of the descriptor=
 chain.
> > +
> > +Device-allocated buffers with the \textit{VIRTIO_MEDIA_MMAP} memory ty=
pe can also
> > +be exported as virtio objects for use with another virtio device using=
 the
> > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_expor=
tbuffer}
> > +means that space for the UUID needs to be reserved right after that st=
ructure.
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
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_error {
> > +    struct virtio_media_event_header hdr;
> > +    le32 errno;
> > +    le32 __reserved;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{errno}] error code describing the kind of error that occu=
rred.
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Operation: Device-side error}{D=
evice Types / Media Device / Device Operation / Device-side error}
> > +
> > +After an error is signaled, when the device considers the session as
> > +non-existing, the device MUST NOT recycle the session ID until the dri=
ver has
> > +explicitly closed it.
> > +
> > +\drivernormative{\subparagraph}{Device Operation: Device-side error}{D=
evice Types / Media Device / Device Operation / Device-side error}
> > +
> > +Upon receiving an error event for a session, the driver MUST
> > +explicitly close the session using a \textit{VIRTIO_MEDIA_CMD_CLOSE} c=
ommand.
> > +
> > +\paragraph{Device Operation: Dequeue buffer}
> > +\label{sec:Device Types / Media Device / Device Operation / Dequeue bu=
ffer}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} signals that a buffer is not being use=
d anymore
> > +by the device and is returned to the driver.
> > +
> > +Every time a buffer previously queued (i.e., using the
> > +\textit{VIDIOC_QBUF} ioctl) is done being processed, the
> > +device queues a \textit{struct virtio_media_event_dqbuf} event on
> > +the eventq, signifying that the buffer can be used again by the driver=
.
> > +This is like an implicit \textit{VIDIOC_DQBUF} ioctl.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_MEDIA_MAX_PLANES 8
> > +
> > +struct virtio_media_event_dqbuf {
> > +    struct virtio_media_event_header hdr;
> > +    struct v4l2_buffer buffer;
> > +    struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffe=
r that has been dequeued.
> > +\item[\field{planes}] array of \textit{struct v4l2_plane} containing t=
he plane information for multi-planar buffers.
> > +\end{description}
> > +
> > +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct v=
4l2_plane}
> > +are meaningless and must be ignored by the driver. It is recommended t=
hat the
> > +device sets them to NULL in order to avoid leaking potential device ad=
dresses.
> > +
> > +Note that in the case of a \field{SHARED_PAGES} buffer, the \textit{st=
ruct v4l2_buffer}
> > +used as event payload is not followed by the buffer's SG entries: sinc=
e that memory
> > +is the same that the driver submitted with the \textit{VIDIOC_QBUF}, i=
t would
> > +be redundant to have it here.
> > +
> > +\paragraph{Device Operation: Emit an event}
> > +\label{sec:Device Types / Media Device / Device Operation / Emit an ev=
ent}
> > +
> > +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been emi=
tted for a session.
> > +
> > +Every time an event for which the driver has been previously subcribed=
 to
> > +(i.e., using the \textit{VIDIOC_SUBSCRIBE_EVENT} ioctl) is signaled, t=
he
> > +device queues a \textit{struct virtio_media_event_event} event on the =
eventq.
> > +This is like an implicit \textit{VIDIOC_DQEVENT} ioctl.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_event_event {
> > +    struct virtio_media_event_header hdr;
> > +    struct v4l2_event event;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{event}] \textit{struct v4l2_event} describing the event t=
hat occurred.
> > +\end{description}
> > diff --git a/device-types/media/device-conformance.tex b/device-types/m=
edia/device-conformance.tex
> > new file mode 100644
> > index 0000000..fcc697d
> > --- /dev/null
> > +++ b/device-types/media/device-conformance.tex
> > @@ -0,0 +1,12 @@
> > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conforma=
nce / Device Conformance / Media Device Conformance}
> > +
> > +A Media device MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Open device}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / V4L2 ioctls}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Unsupported ioctls}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Mapping a MMAP buffer}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Unmapping a MMAP buffer}
> > +\item \ref{devicenormative:Device Types / Media Device / Device Operat=
ion / Device-side error}
> > +\end{itemize}
> > \ No newline at end of file
> > diff --git a/device-types/media/driver-conformance.tex b/device-types/m=
edia/driver-conformance.tex
> > new file mode 100644
> > index 0000000..de781b9
> > --- /dev/null
> > +++ b/device-types/media/driver-conformance.tex
> > @@ -0,0 +1,10 @@
> > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conforma=
nce / Driver Conformance / Media Driver Conformance}
> > +
> > +A Media device MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / Command Virtqueue}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / Close device}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / V4L2 ioctls}
> > +\item \ref{drivernormative:Device Types / Media Device / Device Operat=
ion / Device-side error}
> > +\end{itemize}
> > \ No newline at end of file
> > --
> > 2.47.1
> >
> >
>

