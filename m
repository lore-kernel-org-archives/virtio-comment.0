Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621219DF61
	for <virtio-comment@lists.linux.dev>; Tue, 28 Jan 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073561; cv=none; b=B2ABkTbeqYtQIf75vs4VTHKbFMveL6Y60t/gB0WJg2bOtWIAdS07fqliIfuVXJYUhmVZzZgndRkq2RGXpiOvDhTNMnyR1BAoTkr4d3iGG92ZbUS3ChwtCDIDRLY1vufdcebfffwwkzwmgjAR8LY5hZBKsL4Z8ZLpiNDqYe4CMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073561; c=relaxed/simple;
	bh=saZnhsFtsYMmKhHlPq3YclFdf7ZLjOoAkHPPWOzUq/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nlgos5Sv2YCfotGO7JTxWH5MOSWwx+nxasfkmiqeAD7GonnPFvr3cWSeVT+63ihpSao0ts1yF4Gj/gl9oU2J3HyeTk1QK+DdGZnNUJhJZREBb7jAGKfksIBilepOQziXa+nl6t7aYzPeRpfxiIfU/4oGC+Sw2SDhETHhsYG4hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QfBRsxLN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QfBRsxLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738073558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MrP9xlWXnGaMcR+gVwahgxt5J3YybQQkuD4QAHaNOmk=;
	b=QfBRsxLN9YrBpf2rt68id12l5wMhhWUUI4m2yCJBiO31D60LPLadIR6sM0hjlxx1g4e74Z
	XGvSO5/RUP/sx1FBr5fWOLTbUXjnAbjQ4ht11r+Fjen/g+3CgWhaMFzIOPDjOOmKL+eCZz
	qETJgxw9fTFVgDqdiAtDJnpL2GbAdMI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-QvsO6EEUO3qiegR2SnSgnA-1; Tue, 28 Jan 2025 09:12:37 -0500
X-MC-Unique: QvsO6EEUO3qiegR2SnSgnA-1
X-Mimecast-MFC-AGG-ID: QvsO6EEUO3qiegR2SnSgnA
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2162f80040aso103474665ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 28 Jan 2025 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073556; x=1738678356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrP9xlWXnGaMcR+gVwahgxt5J3YybQQkuD4QAHaNOmk=;
        b=n9NwFUYaYSh8+9H9tnRnX1G7UaSgWCWgBPWS4K3PABUyp1VdUt4ysG2YbU7EMqh3Le
         nFRGHV4SxoR3XVcTtZWBdtcZDt1XINpn1t87SGsR4bHCX5tq5NVQXFxIy9jNwRPG0LlT
         St0AKBGOAq0gVsKnX0J5Tmsq4GlI1GM+fdA1bw2sQLr7nzMdNVom72PFrYi+z8L1sqwH
         VE16TjCscgmUjfDtULsSMqRlxcbfdDDHixLT3b8ZzrzcIlEigdhCN3Jbim7osnQ9ZjBN
         nE5wYG0HgbwWuVuXzClmdOg5R1mNfCgzj90wyz/srOtVWZ2eqp2ZZdM0lewFejjL1dUp
         L4fA==
X-Gm-Message-State: AOJu0YyqZow3IkKlEc8JVxmqS8QzOmcmCwLBwAa+r1Tl4BnkoeC8EQ4/
	lmaBaNR+1EFE9IUvlJZEfA4t8NYlsxXotFCrmOsoBYzkL5Ybf0nBRgsyGAAiRFxbS5XQiWYSBOj
	Q8nrWq+CTPAmdadFez3jduyh/aYeNqfdaspLOZkDWExMUvikcAjvfWM5UDWihYwNkzrO+vokUGR
	igGQ9HIzkkf3yjzQXxUdpBUWzokZxFPe1/YVweIYY=
X-Gm-Gg: ASbGncvxbpZ3rBuwZAgBgoGpGgH/8587HDO8Y3N2nrHnIrL3bQUGIMXdVTGU880WR++
	4xV1lpl/HIq2zG1ZCsqS1IMMeLXdCl3Hk5g05Rxy5+nLRiFIHOEU++G/p/BcB9+Ky
X-Received: by 2002:a17:902:f689:b0:215:5935:7eef with SMTP id d9443c01a7336-21c35549f0fmr678285775ad.22.1738073555839;
        Tue, 28 Jan 2025 06:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsa7XFrTG/AiJp134w9CPEBmAxcNV2coDeC9zVCCJ+9zEc3Mob3qeXAm+sm31V1Cy1LeB4U2KdNuuQ4z8j3C8=
X-Received: by 2002:a17:902:f689:b0:215:5935:7eef with SMTP id
 d9443c01a7336-21c35549f0fmr678284965ad.22.1738073555066; Tue, 28 Jan 2025
 06:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120085015.956057-1-aesteve@redhat.com> <20250120085015.956057-2-aesteve@redhat.com>
 <Z5ejOtZyzn746lIv@fedora> <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
 <Z5e+mY7E40DYlrTA@fedora>
In-Reply-To: <Z5e+mY7E40DYlrTA@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 28 Jan 2025 15:12:23 +0100
X-Gm-Features: AWEUYZkhkmbreUuZsZuB-qgkacMTVkchWrdbhY5wY5DpnbxbPOOvQ1J2k-A_ApE
Message-ID: <CADSE00KSUt2uELzTVbAt9Rda52uHeu6PJoWLePPF3-sdxCnAVg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio-media: Add virtio media device specification
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, agordeev@qti.qualcomm.com, 
	ribalda@google.com, acourbot@chromium.org, gurchetansingh@google.com, 
	cohuck@redhat.com, daniel.almeida@collabora.com, changyeon@google.com, 
	nicolas.dufresne@collabora.com, eballetb@redhat.com, dverkamp@chromium.org, 
	hverkuil@xs4all.nl, mst@redhat.com, alex.bennee@linaro.org, 
	acourbot@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RptiuAn5fHA2A_zBofz3uZZ0tCSVoC7bO-mvg0hnmTc_1738073556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 6:13=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> On Mon, Jan 27, 2025 at 04:36:46PM +0100, Albert Esteve wrote:
> > On Mon, Jan 27, 2025 at 4:16=E2=80=AFPM Matias Ezequiel Vara Larsen
> > <mvaralar@redhat.com> wrote:
> > >
> > > On Mon, Jan 20, 2025 at 09:50:15AM +0100, Albert Esteve wrote:
> > > > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > > virtio, able to virtualize any video device supported
> > > > by V4L2.
> > > >
> > > > Note that virtio-media does not require the use of a
> > > > V4L2 device driver on the host or guest side -
> > > > V4L2 is only used as a host-guest protocol,
> > > > and both sides are free to convert it from/to any
> > > > model that they wish to use.
> > > >
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  conformance.tex                           |  13 +-
> > > >  content.tex                               |   1 +
> > > >  device-types/media/description.tex        | 617 ++++++++++++++++++=
++++
> > > >  device-types/media/device-conformance.tex |  12 +
> > > >  device-types/media/driver-conformance.tex |  10 +
> > > >  5 files changed, 649 insertions(+), 4 deletions(-)
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
> > > > index 0000000..2c7f451
> > > > --- /dev/null
> > > > +++ b/device-types/media/description.tex
> > > > @@ -0,0 +1,617 @@
> > > > +\section{Media Device}\label{sec:Device Types / Media Device}
> > > > +
> > > > +The virtio media device follows the same model (and structures) as=
 V4L2. It
> > > > +can be used to virtualize cameras, codec devices, or any other dev=
ice
> > > > +supported by V4L2. The complete definition of V4L2 structures and =
ioctls can
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
> > > > +\subsection{Device ID}\label{sec:Device Types / Media Device / Dev=
ice ID}
> > > > +
> > > > +48
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
> > > > +    le8 card[32];
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{device_caps}] (driver-read-only) flags representing t=
he device
> > > > +capabilities as used in
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/vidioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > > > +It corresponds with the \field{device_caps} field in the \textit{s=
truct video_device}.
> > > > +\item[\field{device_type}] (driver-read-only) informs the driver o=
f the type
> > > > +of the video device. It corresponds with the \field{vfl_devnode_ty=
pe} field of the device.
> > > > +\item[\field{card}] (driver-read-only) name of the device, a NUL-t=
erminated
> > > > +UTF-8 string. It corresponds with the \field{card} field of the \t=
extit{struct v4l2_capability}.
> > > > +If all the characters of the field are used, it does not need to b=
e NUL-terminated.
> > > > +\end{description}
> > > > +
> > > > +\subsection{Device Initialization}
> > > > +
> > > > +A driver executes the following sequence to initialize a device:
> > > > +
> > > > +\begin{enumerate}
> > > > +\item Read the \field{device_caps} and \field{device_type} fields
> > > > +from the configuration layout to identify the device.
> > > > +\item Set up the \field{commandq} and \field{eventq} virtqueues.
> > > > +\item May open a session (see Section \ref{sec:Device Types / Medi=
a Device / Device Operation / Open Device})
> > > > +to use the device and send V4L2 ioctls in order to receive more in=
formation
> > > > +about the device, such as supported formats or controls.
> > > > +\end{enumerate}
> > > > +
> > > > +\subsection{Device Operation}\label{sec:Device Types / Media Devic=
e / Device Operation}
> > > > +
> > > > +The driver enqueues commands in the command queue for the device t=
o process.
> > > > +The errors returned by each command are standard
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/g=
en-errors.html}{Linux kernel error codes}.
> > > > +For instance, a driver sending a command that contains invalid opt=
ions will
> > > > +receive \textit{EINVAL} in return, after the device tries to proce=
ss it.
> > > > +
> > > > +The device enqueues events in the event queue for the driver to pr=
ocess.
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
> > > > +     le32 cmd;
> > > > +     le32 __reserved;
> > > > +};
> > > > +
> > > > +/* Header for all virtio responses from the device to the driver o=
n the commandq. */
> > > > +struct virtio_media_resp_header {
> > > > +     le32 status;
> > > > +     le32 __reserved;
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
> > > > +When the device executes the command successfully, the value of th=
e status
> > > > +field is 0. Conversely, when the device fails to execute the comma=
nd, the value
> > > > +of the status fiels corresponds with one of the standard Linux err=
or codes.
> > >
> > > s/fiels/field
> > >
> > > > +
> > > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: =
Sessions}{Device Types / Media Device / Device Operation / Command Virtqueu=
e}
> > > > +
> > > > +Sessions are how the device is multiplexed, allowing several disti=
nct works to
> > > > +take place simultaneously. Before starting operation, the driver n=
eeds to open
> > > > +a session. This is equivalent to opening the \textit{/dev/videoX} =
file of the
> > > > +V4L2 device. Each session gets a unique ID assigned, which can be =
then used
> > > > +to perform actions on it.
> > > > +
> > > > +\paragraph{Device Operation: Open device}\label{sec:Device Types /=
 Media Device / Device Operation / Open Device}
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
> > > > +    le32 session_id;
> > > > +    le32 __reserved;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] identifies the current session, which is=
 used for
> > > > +other commands, predominantly ioctls.
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
> > > > +    le32 session_id;
> > > > +    le32 __reserved;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] identifies the session to close.
> > > > +\end{description}
> > > > +
> > > > +\drivernormative{\subparagraph}{Device Operation: Close device}{De=
vice Types / Media Device / Device Operation / Close device}
> > > > +
> > > > +The session ID SHALL NOT be used again after queueing this command=
, until it
> > > > +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_=
OPEN} call.
> > >
> > > I think you forgot the `has` in `until it been ...`.
> > >
> > > > +
> > > > +\paragraph{Device Operation: V4L2 ioctls}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on =
an open
> > > > +session.
> > > > +
> > > > +This command tells the device to run one of the `VIDIOC_*` ioctls =
on the
> > > > +session identified by \textit{session_id}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_cmd_ioctl {
> > > > +    struct virtio_media_cmd_header hdr;
> > > > +    le32 session_id;
> > > > +    le32 code;
> > > > +    /* Followed by the relevant ioctl command payload as defined i=
n the macro */
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{session_id}] identifies the session to run the ioctl =
on.
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
> > > > +This means that its ioctl code is \textit{4}, its payload is a
> > > > +\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e=
., the
> > > > +payload is written by both the driver and the device).
> > > > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / I=
octls payload}
> > > > +for more information about the direction of ioctls.
> > > > +
> > > > +The payload struct layout always matches the 64-bit, little-endian
> > > > +representation of the corresponding V4L2 structure. For most struc=
ts, the
> > > > +size is identical for both 32 and 64 bits versions. Otherwise, the=
 driver
> > > > +must translate them to the aforementioned size and endianess.
> > > > +
> > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \texti=
t{virtio_media_resp_ioctl}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_resp_ioctl {
> > > > +    struct virtio_media_resp_header hdr;
> > > > +    /* Followed by the ioctl response payload as defined in the ma=
cro */
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Devic=
e / V4L2 ioctls / Ioctls payload}
> > > > +
> > > > +Each ioctl has a payload, which is defined by the third argument o=
f the
> > > > +\field{_IO*} macro.
> > > > +
> > > > +The payload of an ioctl in the descriptor chain follows the comman=
d structure,
> > > > +the response structure, or both depending on the direction:
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
> > >
> > > What is the driver-writable section in the descriptor chain? AFAIU,
> > > there are only two sections: the device-readable and the
> > > device-writable. The spec states that the device-writable follows the
> > > device-readable section.
> >
> > So in this case who is suppossed to fill the buffer for the
> > device-readable section is the driver. It is mostly a matter of
> > perspective (and naming). The sentence is focusing on who can write
> > into those spaces instead of a pure driver perspective, as it makes
> > sense in this context. If you prefer, I could change it for
> > driver-readable instead. But I think it is clearer to keep the focus
> > on who is allowed to write into it instead.
> >
>
> Thanks for clarification. I do not have a strong opinion about what
> wording to use so you can keep it. I think however that the same
> vocabulary should be used all over the document.
>

I see what you mean. OK, then I will change it here instead to avoid
introducing the term in an isolated way. Thanks.

> Matias
>

