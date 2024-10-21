Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04211F942A
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518161; cv=none; b=ep2UdPHkVGauK55RSWWzy/vs8AaxQZoa9oGPKMevJWpSey6CF+JXsc3J0dglc7YM3XvQi28fsKJi65+Sjrn3H69qIPQj+zNi8Y9rdn8qIUraXRIs7/vaoejJbm6k7oiTIrchQP6XDngDMR7LhrCyMiDLKeXqvFHoPRjyTnabYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518161; c=relaxed/simple;
	bh=Aaqj7Q1TN3GimLNGqSQKE3LgRQOtpXr+nPI1x1U3hNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeCQQDaUo9SRbGLPn24SAwVrn7Gi1KQY24zhSbEKUs/78WTtAAu4ZKyK3Y4szDSTePJt1xgQZ68jYwENJFZgxGtL3kzprS+rRYRRzEQVde6VWBNmg+BZglcK/uv9os2HGmmvuWtAYLkcZRrFUxLlby8pZ6Tx07jHcIds6k3eWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay+Bd+wN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay+Bd+wN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729518157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2kDu09J3eYwdbf3h1pTL1TKf/V01tZjU8Yn+hO2WDA=;
	b=Ay+Bd+wNfplx6TwG+eVNUJ7ElHTlq8QDepvVBaOcxrHaDO7pWmjtVvQnymeVYJAMvNTF7u
	12im9wA8LauyFHvfu9PAF9eoIl77/S2aNMVR0qgo2TKlvK0Rd9wf0u3aqS3AFmMONhYEOU
	FiHhn1PzI6F2WxMgRGX63TnZv/xIvE0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-7zC9ad2hMBe3AHoH8G58TA-1; Mon, 21 Oct 2024 09:42:36 -0400
X-MC-Unique: 7zC9ad2hMBe3AHoH8G58TA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e59d872d09so1700848a91.0
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 06:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518155; x=1730122955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2kDu09J3eYwdbf3h1pTL1TKf/V01tZjU8Yn+hO2WDA=;
        b=WNBShCikyl1qpG2lRRElqanUOt4FUxifVXrVw3JBIMAYbdWqLNkznuHNs+OXRBGihc
         N4r7YZFkjZ2HQUJzpDJLh3bufYzRy4tPEEFWhUAhOqsd3BFH5zr20+YgKCyl53wx9lMQ
         446V4ZptEb5oiTBpK+fEMSQyWOinYZlpBE0HXaGLpXXQYwuWU+idYUsjoPBpML6Vl618
         GBSYc0+qzpsveIXVFK9LlSyIl45Nm3Zsi4DqDDP4nd/uwiSf8RXLC6zaEpoo7z4UYttQ
         EzFmem7lvQWN3IMaUesHFP1wpRK2kriNDkikTQiMD3u5/hKAh0dfgJWFtk0VfL80LQDL
         IdAw==
X-Gm-Message-State: AOJu0Yxl078sNsGVKTShnoJHtmH1ca3W9fuzVCixT7Y8TbZpc7eoCieh
	U/68twN9bFJ82rz37T6JgJaChiWeQDAp0+Bs5/dtmBPNr+68SXPIPc5BP7x4ap1KpKNzto47FCX
	Q4/AoyW8Kqmhqt/n+J5zTEVgnEMUctsH/uoL1dyFC4UWjRw4qdLZ4mdVK/OTOIPQSAr3cEUn7xN
	1R6MacZinHbPUkp5Y6N9ZYYQe8cV20/ALgizvW+eg=
X-Received: by 2002:a17:90a:a018:b0:2e3:b168:70f5 with SMTP id 98e67ed59e1d1-2e56172c05fmr13383584a91.21.1729518155237;
        Mon, 21 Oct 2024 06:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8pNA+njAsBCxhS24onL92TOGQijv/NinKq5R+KGCtzTYMa1Vp3S1YR8XJE5bJ0W4hzq7dTInlmmYMYoiFm0=
X-Received: by 2002:a17:90a:a018:b0:2e3:b168:70f5 with SMTP id
 98e67ed59e1d1-2e56172c05fmr13383546a91.21.1729518154634; Mon, 21 Oct 2024
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017070423.86706-1-aesteve@redhat.com> <20241017070423.86706-2-aesteve@redhat.com>
 <CAPBb6MXZ0mtniEDiBnbYE1zDgTAYCvQ2-g-9TxaD3t3AzwZiOQ@mail.gmail.com>
In-Reply-To: <CAPBb6MXZ0mtniEDiBnbYE1zDgTAYCvQ2-g-9TxaD3t3AzwZiOQ@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 21 Oct 2024 15:42:23 +0200
Message-ID: <CADSE00L-4NzVMEjPhryA-_rvv0TRzsRY7FDB9iMnc7ZCujM35w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <acourbot@chromium.org>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com, 
	daniel.almeida@collabora.com, ribalda@google.com, 
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org, eballetb@redhat.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, cohuck@redhat.com, 
	mst@redhat.com, agordeev@qti.qualcomm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 9:53=E2=80=AFAM Alexandre Courbot <acourbot@chromiu=
m.org> wrote:
>
> Hi Albert, thanks for this new revision!
>
> On Thu, Oct 17, 2024 at 4:04=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
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
> > +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Devi=
ce / Virtqueues}
> > +
> > +The driver MUST re-queue the descriptor chains returned by the device =
on the
> > +eventq as soon as possible, and must never hold them for indefinite pe=
riods
> > +of time.
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
> > +\subsection{Device Operation}\label{sec:Device Types / Media Device / =
Device Operation}
> > +
> > +Commands are queued on the command queue by the driver for the device =
to
> > +process. The errors returned by each command are standard
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-e=
rrors.html}{Linux kernel error codes}.
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
> > +       u32 cmd;
> > +       u32 __padding;
> > +};
> > +
> > +/* Header for all virtio responses from the device to the driver on th=
e commandq. */
> > +struct virtio_media_resp_header {
> > +       u32 status;
> > +       u32 __padding;
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
> > +       u64 start;
> > +       u32 len;
> > +       u32 __padding;
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
> > +       struct virtio_media_cmd_header hdr;
> > +       u32 session_id;
> > +       u32 flags;
> > +       u64 offset;
>
> This field is now
>
>   u32 offset;
>
> u32 is the type actually returned by V4L2_QUERYBUF for the offset
> field, so using a u64 here made no sense. Furthermore, I realized that
> the offset is an identifier more than an actual starting address entry
> in a range that must cover the whole buffer's length, so there is no
> risk of running out of space even with a u32.

Sounds good, thanks for pointing this out.
Parav commented to change all fields to leX (le32, le64, etc.), so
that the endianess
is not assumed through the spec. I think that makes sense, it was also some=
thing
I was pondering when writing the specs to make it consistent with all other
structures.

However, it would require changing all structures in the virtio-media
driver and device code, and handle endianess translation where
needed. I hope that is ok?

>
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
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
> > +    u64 offset;
>
> This has been renamed to
>
>   u64 guest_addr;
>
> to avoid confusion with virtio_media_cmd_mmap's "offset" field.
>
> > +    u64 len;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{offset}] offset into SHM region ID 0 of the start of the =
mapping.
> > +\item[\field{len}] length of the mapping as indicated by the \textit{s=
truct v4l2_plane}
> > +the buffer belongs to.
> > +\end{description}
> > +
> > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > +
> > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped=
 using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_media_cmd_munmap {
> > +    struct virtio_media_cmd_header hdr;
> > +    u64 offset;
>
> Similarly to above, this has been renamed to
>
>   u64 guest_addr;

In general I am being asked to remove guest from the spec and use
driver instead.
So I will change it for driver_addr instead.

BR,
Albert.

>
> Cheers,
> Alex.
>

