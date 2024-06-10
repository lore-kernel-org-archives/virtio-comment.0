Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FC335A7
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011641; cv=none; b=M3nms173NRJJS80OSvYw2zwt2ftX6T3JklUeJel3VjniwYbFzblifaLreHC9k5IhAnk5ayR2anc/Ee4OlBslB9rPkQcZ+BKX4SQ2afs2MFz9sMvMt9ph+AqJ7fvZeVFLgnMZsQFjkA3lsbtbtu7nqfJ8F01XscmgKB4l/RwhLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011641; c=relaxed/simple;
	bh=sZHcdV+TOmAVn82faiz406Px1hFvwymp4U8Y3unrNVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9EQcNmwDrbnJtbGBMdnE0HYCNe4alkwDvWL23aUFx/5oTKiQLDIN9ypyL7WyS6yTcXMa+6T/mjJGn71WgVN51fb3362Zhdlan2jtDIvDfs9bD+xqGwJFvBV9v8Yz5+pcJQjwarpQWS3ORUAq6E+bDmNSdT8nC8Hiolu5sKvta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Br7/rZOq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Br7/rZOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718011636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XQW3ZTDnI8veKsxrBRY8dtubPeDStWMTRNvLoycdAdE=;
	b=Br7/rZOq4uvD2q46cbd1szs4yVwYs9+VKpcUXvxlptP2QULfU+UvrDMX5VL+twA1DUENnD
	QMJV+JXbl9A/nkeW7vIQR2i+c1SotSF4KE3KZ7kXAO9AKaf1SgA7JkVjK0sAWBOjAIrcHZ
	tD73zgLoHIWaWLjtqkdNwZMUVnT0P2E=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-r7rDoX9BNIqyUpzETUCyPw-1; Mon, 10 Jun 2024 05:27:14 -0400
X-MC-Unique: r7rDoX9BNIqyUpzETUCyPw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-6c380e03048so4176898a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011633; x=1718616433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQW3ZTDnI8veKsxrBRY8dtubPeDStWMTRNvLoycdAdE=;
        b=ofQzsREesx0z2xRIPXa1ZG4DVCr0xK9BDinLCPPc4LhlCx9h/QWUu/MdeK6908w/E6
         0BJU1fIIu2//23UtrXlx3N0Tpto85UQre3THXYb4usbKcmNGJqXu1AG1hM/xQPN7qauO
         hzJDrb5tCBJROoiLMDJPonQn4wuoV5b0latzFribJelTyLpgu4X3GAZPIOfU4ud/hGwb
         iuoMHv+eguGQbcfZMceWmYJfS+ihudN8kPIoX9ANb2SEIGMd3jqFRLCezR/M/v2I3bUu
         nlxTRXYpagdpCSs9oFDlRKikQymnIaMttyzHSn4irMlal7dMI7XrolHmVwT9JqRBMBCo
         PjiA==
X-Gm-Message-State: AOJu0YzPIeoesIt9ZBkQMxz2fHDMevIQgrCK+HPPxujGgMRIPqQuOq4p
	hVdfDWsHiW8VVXhuCzoPkxvEH/3OhvebXYEw/KIubsWo6ihAJBohU2gJWY+JaoDylvS0D6ESH41
	8lkQxsZO+odSIN5q+r4NWXK4RFTeAD4L1h5fS9sallYDmqeHXlMqXase5q1T15h2LQteUQxIMjY
	hr6XvVKesoArxjlkA2B8/cPeOkDy8kH3K/ppquGsBD42d0XnwsJQ==
X-Received: by 2002:a05:6a20:7fa8:b0:1b0:25b6:a749 with SMTP id adf61e73a8af0-1b2f9c6dademr8201985637.48.1718011632699;
        Mon, 10 Jun 2024 02:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6ewve3egg2xHrTwheZwuhLUyaO/XNMw0w5mg5Ptx5wQZNd61nz4j/uwu9eIxdbUzmljGNX1+INuiZAipeGEA=
X-Received: by 2002:a05:6a20:7fa8:b0:1b0:25b6:a749 with SMTP id
 adf61e73a8af0-1b2f9c6dademr8201959637.48.1718011632096; Mon, 10 Jun 2024
 02:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607133508.1400529-1-aesteve@redhat.com> <20240607133508.1400529-2-aesteve@redhat.com>
In-Reply-To: <20240607133508.1400529-2-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 10 Jun 2024 11:27:00 +0200
Message-ID: <CADSE00Kn_Et4W2CXiEGUWYJ4psVY1HTiyXo076AjwhzrTVyyTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-media: Add virtio media device specification
To: virtio-comment@lists.linux.dev
Cc: changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com, 
	Alexander.Gordeev@opensynergy.com, ribalda@google.com, acourbot@chromium.org, 
	mst@redhat.com, gurchetansingh@google.com, Matti.Moell@opensynergy.com, 
	cohuck@redhat.com, nicolas.dufresne@collabora.com, alex.bennee@linaro.org, 
	hverkuil@xs4all.nl
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000d28a0061a85c199"

--0000000000000d28a0061a85c199
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hans, Alex,

I had to re-post the series. I'll link the latest response from the
previous thread so
that we can continue the discussion here:
https://lore.kernel.org/all/CAPBb6MV00eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0V=
u06Q@mail.gmail.com/

Sorry for the inconvenience.

On Fri, Jun 7, 2024 at 3:35=E2=80=AFPM Albert Esteve <aesteve@redhat.com> w=
rote:

> Virtio-media is an encapsulation of the V4L2 UAPI into
> virtio, able to virtualize any video device supported
> by V4L2
>
> Note that virtio-media does not require the use of a
> V4L2 device driver or of Linux on the host or
> guest side - V4L2 is only used as a host-guest protocol,
> and both sides are free to convert it from/to any
> model that they wish to use.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  conformance.tex                           |  13 +-
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 578 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  11 +
>  device-types/media/driver-conformance.tex |   9 +
>  5 files changed, 608 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/media/description.tex
>  create mode 100644 device-types/media/device-conformance.tex
>  create mode 100644 device-types/media/driver-conformance.tex
>
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..c369da1 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance /
> Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver
> Conformance},
>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> +
>
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional
> Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance /
> Conformance Targets}
>  \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device
> Conformance},
>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
>
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional
> Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance /
> Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/media/driver-conformance.tex}
>
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Devic=
e
> Conformance}
>
> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance /
> Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/media/device-conformance.tex}
>
>  \conformance{\section}{Legacy Interface: Transitional Device and
> Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface=
:
> Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
> diff --git a/content.tex b/content.tex
> index 0a62dce..59925ae 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/scmi/description.tex}
>  \input{device-types/gpio/description.tex}
>  \input{device-types/pmem/description.tex}
> +\input{device-types/media/description.tex}
>
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>
> diff --git a/device-types/media/description.tex
> b/device-types/media/description.tex
> new file mode 100644
> index 0000000..887eacf
> --- /dev/null
> +++ b/device-types/media/description.tex
> @@ -0,0 +1,578 @@
> +\section{Media Device}\label{sec:Device Types / Media Device}
> +
> +The virtio media device follow the same model (and structures) as V4L2. =
It
> +can be used to virtualize cameras, codec devices, or any other device
> +supported by V4L2. The device assumes 64-bit little-endian V4L2 structur=
es
> +are exchanged. The complete definition of V4L2 structures and ioctls can
> +be found under the
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4=
L2
> UAPI documentation}.
> +
> +V4L2 is a UAPI that allows a less privileged entity (user-space) to use
> video
> +hardware exposed by a more privileged entity (the kernel). Virtio-media
> is an
> +encapsulation of this API into virtio, turning it into a virtualization
> API
> +for all classes of video devices supported by V4L2, where the device
> plays the
> +role of the kernel and the driver the role of user-space.
> +
> +The device is therefore responsible for presenting a virtual device that
> behaves
> +like an actual V4L2 device, which the driver can control.
> +
> +Note that virtio-media does not require the use of a V4L2 device driver
> or of
> +Linux on any side - V4L2 is only used as a transport protocol,
> +and both sides are free to convert it from/to any model that they wish t=
o
> use.
> +
> +This section relies on definitions from
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4=
L2
> UAPI documentation}.
> +
> +\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID=
}
> +
> +42
> +
> +\subsection{Virtqueues}\label{sec:Device Types / Media Device /
> Virtqueues}
> +
> +\begin{description}
> +\item[0] commandq - used for driver commands and device responses to the=
se
> +commands.
> +\item[1] eventq - used for events sent by the device to the driver.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Device
> / Virtqueues}
> +
> +The device MUST return the descriptor chains it receives on the commandq
> as
> +soon as possible, and must never hold them for indefinite periods of tim=
e.
> +
> +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Device
> / Virtqueues}
> +
> +The driver MUST re-queue the descriptor chains returned by the device on
> the
> +eventq as soon as possible, and must never hold them for indefinite
> periods
> +of time.
> +
> +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Featur=
e
> Bits}
> +
> +None
> +
> +\subsection{Device Configuration Layout}\label{sec:Device Types / Media
> Device / Device Configuration Layout}
> +
> +The video device configuration space uses the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_media_config {
> +    le32 device_caps;
> +    le32 device_type;
> +    u8 card[32];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{device_caps}] (driver-read-only) flags representing the
> device
> +capabilities as used in
> +\href{
> https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-querycap.html#=
c.v4l2_capability}{struct
> v4l2_capabilities}.
> +Corresponds with the \field{device_caps} field in the \textit{struct
> video_device}.
> +\item[\field{device_type}] (driver-read-only) informs the driver of the
> type
> +of the video device. Corresponds with the \field{vfl_devnode_type} field
> of the device.
> +\item[\field{card}] (driver-read-only) name of the device, a
> NUL-terminated
> +UTF-8 string. Corresponds with the \field{card} field of the
> \textit{struct v4l2_capability}.
> +If all the characters of the field are used, it does not need to be
> NUL-terminated.
> +\end{description}
> +
> +\subsection{Device Initialization}
> +
> +\begin{enumerate}
> +\item The driver reads the \field{device_caps} and \field{device_type}
> fields
> +from the configuration layout to identify the device.
> +\item The driver sets up the \field{commandq} and \field{eventq}.
> +\item The driver may open a session to use the device and send V4L2
> ioctls in
> +order to receive more information about the device, such as supported
> +formats or controls.
> +\end{enumerate}
> +
> +\subsection{Device Operation}\label{sec:Device Types / Media Device /
> Device Operation}
> +
> +Commands are queued on the command queue by the driver for the device to
> +process. The errors returned by each command are standard
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.htm=
l}{Linux
> kernel error codes}.
> +For instance, a command that contains invalid options will return
> \textit{EINVAL}.
> +
> +Events are sent on the event queue by the device for the driver to handl=
e.
> +
> +\subsubsection{Command Virtqueue}
> +
> +\paragraph{Device Operation: Command headers}
> +
> +\begin{lstlisting}
> +#define VIRTIO_MEDIA_CMD_OPEN 1
> +#define VIRTIO_MEDIA_CMD_CLOSE 2
> +#define VIRTIO_MEDIA_CMD_IOCTL 3
> +#define VIRTIO_MEDIA_CMD_MMAP 4
> +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> +
> +/* Header for all virtio commands from the driver to the device on the
> commandq. */
> +struct virtio_media_cmd_header {
> +       u32 cmd;
> +       u32 __padding;
> +};
> +
> +/* Header for all virtio responses from the device to the driver on the
> commandq. */
> +struct virtio_media_resp_header {
> +       u32 status;
> +       u32 __padding;
> +};
> +\end{lstlisting}
> +
> +A command consists of a command header \textit{virtio_media_cmd_header}
> +containing the following device-readable field:
> +
> +\begin{description}
> +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
> +\end{description}
> +
> +A response consists of a response header \textit{virtio_media_resp_heade=
r}
> +containing the following device-writable field:
> +
> +\begin{description}
> +\item[\field{status}] indicates a device request status.
> +\end{description}
> +
> +The status field can take 0 if the command was successful, or one of the
> +standard Linux error codes if it was not.
> +
> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue:
> Sessions}{Device Types / Media Device / Device Operation / Command
> Virtqueue}
> +
> +Sessions are how the device is multiplexed, allowing several distinct
> works to
> +take place simultaneously. The driver needs to open a session before it
> can
> +perform any useful operation on the device.
> +
> +\paragraph{Device Operation: Open device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> +
> +This is the equivalent of calling \textit{open} on a V4L2 device node.
> +The driver uses \textit{virtio_media_cmd_open} to send an open request.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_open {
> +    struct virtio_media_cmd_header hdr;
> +};
> +\end{lstlisting}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with
> \textit{virtio_media_resp_open}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_open {
> +    struct virtio_media_resp_header hdr;
> +    u32 session_id;
> +    u32 __padding;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] specifies an identifier for the current
> session. The
> +identifier can be used to perform other commands on the session, notably
> ioctls.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Operation: Open device}{Device
> Types / Media Device / Device Operation / Open device}
> +
> +Upon success, the device MUST set a \field{session_id} in
> \textit{virtio_media_resp_open}
> +to an integer that is NOT used by any other open session.
> +
> +\paragraph{Device Operation: Close device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> +
> +This is the equivalent of calling \textit{close} on a previously opened
> V4L2
> +device node. All resources associated with this session will be freed.
> +
> +This command does not require a response from the device.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_close {
> +    struct virtio_media_cmd_header hdr;
> +    u32 session_id;
> +    u32 __padding;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] specifies an identifier for the session to
> close.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Operation: Close device}{Device
> Types / Media Device / Device Operation / Close device}
> +
> +The session ID SHALL NOT be used again after queueing this command.
> +
> +\paragraph{Device Operation: V4L2 ioctls}
> +
> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an ope=
n
> +session.
> +
> +This command asks the device to run one of the `VIDIOC_*` ioctls on the
> active
> +session.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_ioctl {
> +    struct virtio_media_cmd_header hdr;
> +    u32 session_id;
> +    u32 code;
> +    /* Followed by the relevant ioctl payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] specifies an identifier of thesession to run
> the ioctl on.
> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to
> run.
> +\end{description}
> +
> +The code is extracted from the
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.h=
tml}{videodev2.h
> },
> +header file. The file defines the ioctl's codes, type of payload, and
> +direction. The code consists of the second argument of the \field{_IO*}
> macro.
> +
> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> +\end{lstlisting}
> +
> +This means that its ioctl code is \textit{4}, that its payload is a
> +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.e.=
,
> the
> +payload is written by both the driver and the device).
> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls
> payload}
> +for more information about the direction of ioctls.
> +
> +The payload layout is always a 64-bit representation of the correspondin=
g
> +V4L2 structure.
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with
> \textit{virtio_media_resp_ioctl}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_ioctl {
> +    struct virtio_media_resp_header hdr;
> +    /* Followed by the ioctl payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device /
> V4L2 ioctls / Ioctls payload}
> +
> +Each ioctl has a payload, which is defined by the third argument of the
> +\field{_IO*} macro defining it.
> +
> +The payload of an ioctl in the descriptor chain follows the command
> structure,
> +the reponse structure, or both depending on the direction:
> +
> +\begin{itemize}
> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> +follows the response in the device-writable section of the descriptor
> chain.
> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> +follows the command in the driver-writable section of the descriptor
> chain.
> +\item \textbf{_IOWR} is writable by both the device and driver,
> +meaning the payload must follow both the command in the driver-writable
> section
> +of the descriptor chain, and the response in the device-writable section=
.
> +\end{itemize}
> +
> +A common optimization for \textit{WR} ioctls is to provide the payload
> using
> +descriptors that both point to the same buffer. This mimics the behavior
> of
> +V4L2 ioctls where the data is only passed once and used as both input an=
d
> +output by the kernel.
> +
> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device
> Types / Media Device / Device Operation / V4L2 ioctls}
> +
> +In case of success of a device-writable ioctl, the device MUST always
> write the
> +payload in the device-writable part of the descriptor chain.
> +
> +In case of failure of a device-writable ioctl, the device is free to
> write the
> +payload in the device-writable part of the descriptor chain or not. Some
> errors
> +may still result in the payload being updated, and in this case the
> device is
> +expected to write the updated payload. If the device has not written the
> +payload after an error, the driver MUST assume that the payload has not
> been
> +modified.
> +
> +\subparagraph{Handling of pointers in ioctl payload}
> +
> +A few structures used as ioctl payloads contain pointers to further
> +data needed for the ioctl. There are notably:
> +
> +\begin{itemize}
> +\item The \field{planes} pointer of
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.htm=
l#struct-v4l2-buffer}{struct
> v4l2_buffer},
> +which size is determined by the length member.
> +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls},
> which
> +size is determined by the count member.
> +\end{itemize}
> +
> +If the size of the pointed area is determined to be non-zero, then the
> main
> +payload is immediately followed by the pointed data in their order of
> +appearance in the structure, and the pointer value itself is ignored by
> the
> +device, which must also return the value initially passed by the driver.
> +
> +\subparagraph{Handling of pointers to userspace memory}
> +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> +
> +A few pointers are special in that they point to userspace memory in the
> +original V4L2 specification. They are:
> +
> +\begin{itemize}
> +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> +\href{
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.htm=
l#struct-v4l2-plane}{struct
> v4l2_plane}
> +(technically an unsigned long, but designated a userspace address).
> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> +\end{itemize}
> +
> +These pointers can cover large areas of scattered memory, which has the
> +potential to require more descriptors than the virtio queue can provide.
> For
> +these particular pointers only, a list of \textit{struct
> virtio_media_sg_entry}
> +that covers the needed amount of memory for the pointer is used instead =
of
> +using descriptors to map the pointed memory directly.
> +
> +\begin{lstlisting}
> +struct virtio_media_sg_entry {
> +       u64 start;
> +       u32 len;
> +       u32 __padding;
> +};
> +\end{lstlisting}
> +
> +For each such pointer to read, the device reads as many SG entries as
> needed
> +to cover the length of the pointed buffer, as described by its parent
> +structure (\field{length} member of \textit{struct v4l2_buffer} or
> +\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
> +\textit{struct v4l2_ext_control} for control data).
> +
> +Since the device never needs to modify the list of SG entries, it is onl=
y
> +provided by the driver in the device-readable section of the descriptor
> chain,
> +and not repeated in the device-writable section, even for WR ioctls.
> +
> +\subparagraph{Unsupported ioctls}
> +
> +A few ioctls are replaced by other, more suitable mechanisms.
> +
> +\begin{itemize}
> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration
> area
> +(see \ref{sec:Device Types / Media Device / Device Configuration Layout}=
).
> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue
> buffer}).
> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an
> event}).
> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are
> deprecated
> +and replaced by the controls of the JPEG class.
> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall no=
t
> be
> +implemented by the device.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unsupported
> ioctls}{Device Types / Media Device / Device Operation / Unsupported ioct=
ls}
> +
> +If being requested an unsupported ioctl, the device MUST return the same
> +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.
> +
> +\paragraph{Device Operation: Mapping a MMAP buffer}
> +
> +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into th=
e
> +driver's address space.
> +
> +Shared memory region ID 0 is used to map MMAP buffers with
> +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> +
> +\begin{lstlisting}
> +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> +
> +struct virtio_media_cmd_mmap {
> +       struct virtio_media_cmd_header hdr;
> +       u32 session_id;
> +       u32 flags;
> +       u64 offset;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{flags}] is the set of flags for the mapping.
> \field{VIRTIO_MEDIA_MMAP_FLAG_RW}
> +can be set if a read-write mapping is desired. Without this flag the
> mapping
> +will be read-only.
> +\item[\field{offset}] corresponds to the \field{mem_offset} field of the
> +\textit{union v4l2_plane} for the plane to map. This field can be obtain=
ed
> +using the \textit{VIDIOC_QUERYBUF} ioctl.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with
> \textit{virtio_media_resp_mmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_mmap {
> +    struct virtio_media_resp_header hdr;
> +    u64 offset;
> +    u64 len;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{offset}] offset into SHM region ID 0 of the start of the
> mapping.
> +\item[\field{len}] length of the mapping as indicated by the
> \textit{struct v4l2_plane}
> +the buffer belongs to.
> +\end{description}
> +
> +\paragraph{Device Operation: Unmapping a MMAP buffer}
> +
> +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped
> using \field{VIRTIO_MEDIA_CMD_MMAP}.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_munmap {
> +    struct virtio_media_cmd_header hdr;
> +    u64 offset;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{offset}] offset into SHM region ID 0 previously returned by
> +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously
> mapped.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with
> \textit{virtio_media_resp_munmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_munmap {
> +    struct virtio_media_resp_header hdr;
> +};
> +\end{lstlisting}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP
> buffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP
> buffer}
> +
> +The device MUST keep mappings performed using
> \textit{VIRTIO_MEDIA_CMD_MMAP}
> +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the
> buffers or
> +session they belong to are released or closed by the driver.
> +
> +\paragraph{Device Operation: Memory Types}
> +
> +The semantics of the three V4L2 memory types (\textit{MMAP},
> \textit{USERPTR}
> +and \textit{DMABUF}) can easily be mapped to both driver and device
> context.
> +
> +\subparagraph{MMAP}
> +
> +In virtio-media, \textit{MMAP} buffers are provisioned by the device,
> just like
> +they are by the kernel in regular V4L2. Similarly to how userspace can
> map a
> +\textit{MMAP} buffer into its address space using mmap and munmap, the
> +virtio-media driver can map device buffers into the driver space by
> queueing the
> +\textit{struct virtio_media_cmd_mmap} and \textit{struct
> virtio_media_cmd_munmap}
> +commands to the commandq.
> +
> +\subparagraph{USERPTR}
> +
> +In virtio-media, \textit{USERPTR} buffers are provisioned by the driver,
> just
> +like they are by userspace in regular V4L2. Instances of \textit{struct
> v4l2_buffer}
> +and \textit{struct v4l2_plane} of this type are followed by a list of
> +\textit{struct virtio_media_sg_entry}. For more information, see
> +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> +
> +The device must not alter the pointer values provided by the driver, i.e=
.
> +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> +\textit{struct v4l2_plane} must be returned to the driver with the same
> value
> +as it was provided.
> +
> +\subparagraph{DMABUF}
> +
> +In virtio-media, \textit{DMABUF} buffers are provisioned by a virtio
> object,
> +just like they are by a \textit{DMABUF} in regular V4L2. Virtio objects
> are
> +16-bytes UUIDs and do not fit in the placeholders for file descriptors, =
so
> +they follow their embedding data structure as needed and the device must
> +leave the V4L2 structure placeholder unchanged.
> +
> +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be
> added in
> +both the device-readable and device-writable section of the descriptor
> chain.
> +
> +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory type
> can also
> +be exported as virtio objects for use with another virtio device using t=
he
> +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of
> \textit{v4l2_exportbuffer}
> +means that space for the UUID needs to be reserved right after that
> structure
> +
> +\subsubsection{Event Virtqueue}
> +
> +Events are a way for the device to inform the driver about asynchronous
> events
> +that it should know about. In virtio-media, they are used as a
> replacement for
> +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the
> polling
> +mechanism, which would be impractical to implement on top of virtio.
> +
> +\paragraph{Device Operation: Event header}
> +
> +\begin{lstlisting}
> +#define VIRTIO_MEDIA_EVT_ERROR 0
> +#define VIRTIO_MEDIA_EVT_DQBUF 1
> +#define VIRTIO_MEDIA_EVT_EVENT 2
> +
> +/* Header for events queued by the device for the driver on the eventq. =
*/
> +struct virtio_media_event_header {
> +    u32 event;
> +    u32 session_id;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> +\item[\field{session_id}] ID of the session the event applies to.
> +\end{description}
> +
> +\paragraph{Device Operation: Device-side error}
> +
> +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> +mentioned in the header is considered corrupted and automatically closed
> by
> +the device.
> +
> +\begin{lstlisting}
> +struct virtio_media_event_error {
> +    struct virtio_media_event_header hdr;
> +    u32 errno;
> +    u32 __padding;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{errno}] error code describing the kind of error that
> occurred.
> +\end{description}
> +
> +\paragraph{Device Operation: Dequeue buffer}
> +\label{sec:Device Types / Media Device / Device Operation / Dequeue
> buffer}
> +
> +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being used
> anymore
> +by the device and is returned to the driver.
> +
> +A \textit{struct virtio_media_event_dqbuf} event is queued on the eventq
> by the
> +device every time a buffer previously queued using the
> \textit{VIDIOC_QBUF}
> +ioctl is done being processed and can be used by the driver again. This
> is like
> +an implicit \textit{VIDIOC_DQBUF} ioctl.
> +
> +\begin{lstlisting}
> +struct virtio_media_event_dqbuf {
> +    struct virtio_media_event_header hdr;
> +    struct v4l2_buffer buffer;
> +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffer
> that has been dequeued.
> +\item[\field{planes}] array of \textit{struct v4l2_plane} containing the
> plane information for multi-planar buffers.
> +\end{description}
> +
> +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct
> v4l2_plane}
> +are meaningless and must be ignored by the driver. It is recommended tha=
t
> the
> +device sets them to NULL in order to avoid leaking potential device
> addresses.
> +
> +Note that in the case of a \field{USERPTR} buffer, the \textit{struct
> v4l2_buffer}
> +used as event payload is not followed by the buffer memory: since that
> memory
> +is the same that the driver submitted with the \textit{VIDIOC_QBUF}, it
> would
> +be redundant to have it here.
> +
> +\paragraph{Device Operation: Emit an event}
> +\label{sec:Device Types / Media Device / Device Operation / Emit an even=
t}
> +
> +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been
> emitted for a session.
> +
> +A \textit{struct virtio_media_event_event} event is queued on the eventq
> by the
> +device every time an event the driver previously subscribed to using the
> +\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is like an
> +implicit \textit{VIDIOC_DQEVENT} ioctl.
> +
> +\begin{lstlisting}
> +struct virtio_media_event_event {
> +    struct virtio_media_event_header hdr;
> +    struct v4l2_event event;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{event}] \textit{struct v4l2_event} describing the event tha=
t
> occurred.
> +\end{description}
> diff --git a/device-types/media/device-conformance.tex
> b/device-types/media/device-conformance.tex
> new file mode 100644
> index 0000000..3338822
> --- /dev/null
> +++ b/device-types/media/device-conformance.tex
> @@ -0,0 +1,11 @@
> +\conformance{\subsection}{Media Device Conformance}\label{sec:Conformanc=
e
> / Device Conformance / Media Device Conformance}
> +
> +A Media device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / Media Device / Virtqueues}
> +\item \ref{devicenormative:Device Types / Media Device / Device Operatio=
n
> / Open device}
> +\item \ref{devicenormative:Device Types / Media Device / Device Operatio=
n
> / V4L2 ioctls}
> +\item \ref{devicenormative:Device Types / Media Device / Device Operatio=
n
> / Unsupported ioctls}
> +\item \ref{devicenormative:Device Types / Media Device / Device Operatio=
n
> / Unmapping a MMAP buffer}
> +\end{itemize}
> \ No newline at end of file
> diff --git a/device-types/media/driver-conformance.tex
> b/device-types/media/driver-conformance.tex
> new file mode 100644
> index 0000000..058b812
> --- /dev/null
> +++ b/device-types/media/driver-conformance.tex
> @@ -0,0 +1,9 @@
> +\conformance{\subsection}{Media Device Conformance}\label{sec:Conformanc=
e
> / Driver Conformance / Media Driver Conformance}
> +
> +A Media device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / Media Device / Virtqueues}
> +\item \ref{drivernormative:Device Types / Media Device / Device Operatio=
n
> / Command Virtqueue}
> +\item \ref{drivernormative:Device Types / Media Device / Device Operatio=
n
> / Close device}
> +\end{itemize}
> \ No newline at end of file
> --
> 2.44.0
>
>

--0000000000000d28a0061a85c199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr">Hans, Alex,<br></div><div dir=3D"ltr"><br></div><di=
v>I had to re-post the series. I&#39;ll link the latest response from the p=
revious thread so</div><div>that we can continue the discussion here:</div>=
<div><a href=3D"https://lore.kernel.org/all/CAPBb6MV00eRGib6YhEdgTjh-_Rdo2n=
BwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com/">https://lore.kernel.org/all/CAPBb6MV0=
0eRGib6YhEdgTjh-_Rdo2nBwQ6VFSYfyxJcv0Vu06Q@mail.gmail.com/</a><br></div><di=
v><br></div><div>Sorry for the inconvenience.</div></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun =
7, 2024 at 3:35=E2=80=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@redh=
at.com">aesteve@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Virtio-media is an encapsulation of the V4L2 UAPI=
 into<br>
virtio, able to virtualize any video device supported<br>
by V4L2<br>
<br>
Note that virtio-media does not require the use of a<br>
V4L2 device driver or of Linux on the host or<br>
guest side - V4L2 is only used as a host-guest protocol,<br>
and both sides are free to convert it from/to any<br>
model that they wish to use.<br>
<br>
Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
---<br>
=C2=A0conformance.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
=C2=A0content.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0device-types/media/description.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 578 +=
+++++++++++++++++++++<br>
=C2=A0device-types/media/device-conformance.tex |=C2=A0 11 +<br>
=C2=A0device-types/media/driver-conformance.tex |=C2=A0 =C2=A09 +<br>
=C2=A05 files changed, 608 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 device-types/media/description.tex<br>
=C2=A0create mode 100644 device-types/media/device-conformance.tex<br>
=C2=A0create mode 100644 device-types/media/driver-conformance.tex<br>
<br>
diff --git a/conformance.tex b/conformance.tex<br>
index dc00e84..c369da1 100644<br>
--- a/conformance.tex<br>
+++ b/conformance.tex<br>
@@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance / Co=
nformance Targets}<br>
=C2=A0\ref{sec:Conformance / Driver Conformance / Memory Driver Conformance=
},<br>
=C2=A0\ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Confor=
mance},<br>
=C2=A0\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},=
<br>
-\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or<br=
>
-\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.<br>
+\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},<br>
+\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or<br=
>
+\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.<br>
+<br>
<br>
=C2=A0 =C2=A0 =C2=A0\item Clause \ref{sec:Conformance / Legacy Interface: T=
ransitional Device and Transitional Driver Conformance}.<br>
=C2=A0 =C2=A0\end{itemize}<br>
@@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}<br>
=C2=A0\ref{sec:Conformance / Device Conformance / Memory Device Conformance=
},<br>
=C2=A0\ref{sec:Conformance / Device Conformance / I2C Adapter Device Confor=
mance},<br>
=C2=A0\ref{sec:Conformance / Device Conformance / SCMI Device Conformance},=
<br>
-\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or<br=
>
-\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.<br>
+\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},<br>
+\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or<br=
>
+\ref{sec:Conformance / Device Conformance / Media Device Conformance}.<br>
<br>
=C2=A0 =C2=A0 =C2=A0\item Clause \ref{sec:Conformance / Legacy Interface: T=
ransitional Device and Transitional Driver Conformance}.<br>
=C2=A0 =C2=A0\end{itemize}<br>
@@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}<br>
=C2=A0\input{device-types/scmi/driver-conformance.tex}<br>
=C2=A0\input{device-types/gpio/driver-conformance.tex}<br>
=C2=A0\input{device-types/pmem/driver-conformance.tex}<br>
+\input{device-types/media/driver-conformance.tex}<br>
<br>
=C2=A0\conformance{\section}{Device Conformance}\label{sec:Conformance / De=
vice Conformance}<br>
<br>
@@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}<br>
=C2=A0\input{device-types/scmi/device-conformance.tex}<br>
=C2=A0\input{device-types/gpio/device-conformance.tex}<br>
=C2=A0\input{device-types/pmem/device-conformance.tex}<br>
+\input{device-types/media/device-conformance.tex}<br>
<br>
=C2=A0\conformance{\section}{Legacy Interface: Transitional Device and Tran=
sitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Tran=
sitional Device and Transitional Driver Conformance}<br>
=C2=A0A conformant implementation MUST be either transitional or<br>
diff --git a/content.tex b/content.tex<br>
index 0a62dce..59925ae 100644<br>
--- a/content.tex<br>
+++ b/content.tex<br>
@@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}<br>
=C2=A0\input{device-types/scmi/description.tex}<br>
=C2=A0\input{device-types/gpio/description.tex}<br>
=C2=A0\input{device-types/pmem/description.tex}<br>
+\input{device-types/media/description.tex}<br>
<br>
=C2=A0\chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}<br>
<br>
diff --git a/device-types/media/description.tex b/device-types/media/descri=
ption.tex<br>
new file mode 100644<br>
index 0000000..887eacf<br>
--- /dev/null<br>
+++ b/device-types/media/description.tex<br>
@@ -0,0 +1,578 @@<br>
+\section{Media Device}\label{sec:Device Types / Media Device}<br>
+<br>
+The virtio media device follow the same model (and structures) as V4L2. It=
<br>
+can be used to virtualize cameras, codec devices, or any other device<br>
+supported by V4L2. The device assumes 64-bit little-endian V4L2 structures=
<br>
+are exchanged. The complete definition of V4L2 structures and ioctls can<b=
r>
+be found under the<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/index.html%7D%7BV4L2" rel=3D"noreferrer" target=3D"_blank">https://www.ke=
rnel.org/doc/html/latest/userspace-api/media/index.html}{V4L2</a> UAPI docu=
mentation}.<br>
+<br>
+V4L2 is a UAPI that allows a less privileged entity (user-space) to use vi=
deo<br>
+hardware exposed by a more privileged entity (the kernel). Virtio-media is=
 an<br>
+encapsulation of this API into virtio, turning it into a virtualization AP=
I<br>
+for all classes of video devices supported by V4L2, where the device plays=
 the<br>
+role of the kernel and the driver the role of user-space.<br>
+<br>
+The device is therefore responsible for presenting a virtual device that b=
ehaves<br>
+like an actual V4L2 device, which the driver can control.<br>
+<br>
+Note that virtio-media does not require the use of a V4L2 device driver or=
 of<br>
+Linux on any side - V4L2 is only used as a transport protocol,<br>
+and both sides are free to convert it from/to any model that they wish to =
use.<br>
+<br>
+This section relies on definitions from<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/index.html%7D%7BV4L2" rel=3D"noreferrer" target=3D"_blank">https://www.ke=
rnel.org/doc/html/latest/userspace-api/media/index.html}{V4L2</a> UAPI docu=
mentation}.<br>
+<br>
+\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID}<=
br>
+<br>
+42<br>
+<br>
+\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueues=
}<br>
+<br>
+\begin{description}<br>
+\item[0] commandq - used for driver commands and device responses to these=
<br>
+commands.<br>
+\item[1] eventq - used for events sent by the device to the driver.<br>
+\end{description}<br>
+<br>
+\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Device /=
 Virtqueues}<br>
+<br>
+The device MUST return the descriptor chains it receives on the commandq a=
s<br>
+soon as possible, and must never hold them for indefinite periods of time.=
<br>
+<br>
+\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Device /=
 Virtqueues}<br>
+<br>
+The driver MUST re-queue the descriptor chains returned by the device on t=
he<br>
+eventq as soon as possible, and must never hold them for indefinite period=
s<br>
+of time.<br>
+<br>
+\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feature =
Bits}<br>
+<br>
+None<br>
+<br>
+\subsection{Device Configuration Layout}\label{sec:Device Types / Media De=
vice / Device Configuration Layout}<br>
+<br>
+The video device configuration space uses the following layout:<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_config {<br>
+=C2=A0 =C2=A0 le32 device_caps;<br>
+=C2=A0 =C2=A0 le32 device_type;<br>
+=C2=A0 =C2=A0 u8 card[32];<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{device_caps}] (driver-read-only) flags representing the devic=
e<br>
+capabilities as used in<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidio=
c-querycap.html#c.v4l2_capability%7D%7Bstruct" rel=3D"noreferrer" target=3D=
"_blank">https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-queryca=
p.html#c.v4l2_capability}{struct</a> v4l2_capabilities}.<br>
+Corresponds with the \field{device_caps} field in the \textit{struct video=
_device}.<br>
+\item[\field{device_type}] (driver-read-only) informs the driver of the ty=
pe<br>
+of the video device. Corresponds with the \field{vfl_devnode_type} field o=
f the device.<br>
+\item[\field{card}] (driver-read-only) name of the device, a NUL-terminate=
d<br>
+UTF-8 string. Corresponds with the \field{card} field of the \textit{struc=
t v4l2_capability}.<br>
+If all the characters of the field are used, it does not need to be NUL-te=
rminated.<br>
+\end{description}<br>
+<br>
+\subsection{Device Initialization}<br>
+<br>
+\begin{enumerate}<br>
+\item The driver reads the \field{device_caps} and \field{device_type} fie=
lds<br>
+from the configuration layout to identify the device.<br>
+\item The driver sets up the \field{commandq} and \field{eventq}.<br>
+\item The driver may open a session to use the device and send V4L2 ioctls=
 in<br>
+order to receive more information about the device, such as supported<br>
+formats or controls.<br>
+\end{enumerate}<br>
+<br>
+\subsection{Device Operation}\label{sec:Device Types / Media Device / Devi=
ce Operation}<br>
+<br>
+Commands are queued on the command queue by the driver for the device to<b=
r>
+process. The errors returned by each command are standard<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/gen-errors.html%7D%7BLinux" rel=3D"noreferrer" target=3D"_blank">https://=
www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux</=
a> kernel error codes}.<br>
+For instance, a command that contains invalid options will return \textit{=
EINVAL}.<br>
+<br>
+Events are sent on the event queue by the device for the driver to handle.=
<br>
+<br>
+\subsubsection{Command Virtqueue}<br>
+<br>
+\paragraph{Device Operation: Command headers}<br>
+<br>
+\begin{lstlisting}<br>
+#define VIRTIO_MEDIA_CMD_OPEN 1<br>
+#define VIRTIO_MEDIA_CMD_CLOSE 2<br>
+#define VIRTIO_MEDIA_CMD_IOCTL 3<br>
+#define VIRTIO_MEDIA_CMD_MMAP 4<br>
+#define VIRTIO_MEDIA_CMD_MUNMAP 5<br>
+<br>
+/* Header for all virtio commands from the driver to the device on the com=
mandq. */<br>
+struct virtio_media_cmd_header {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 __padding;<br>
+};<br>
+<br>
+/* Header for all virtio responses from the device to the driver on the co=
mmandq. */<br>
+struct virtio_media_resp_header {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 __padding;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+A command consists of a command header \textit{virtio_media_cmd_header}<br=
>
+containing the following device-readable field:<br>
+<br>
+\begin{description}<br>
+\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).<b=
r>
+\end{description}<br>
+<br>
+A response consists of a response header \textit{virtio_media_resp_header}=
<br>
+containing the following device-writable field:<br>
+<br>
+\begin{description}<br>
+\item[\field{status}] indicates a device request status.<br>
+\end{description}<br>
+<br>
+The status field can take 0 if the command was successful, or one of the<b=
r>
+standard Linux error codes if it was not.<br>
+<br>
+\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions=
}{Device Types / Media Device / Device Operation / Command Virtqueue}<br>
+<br>
+Sessions are how the device is multiplexed, allowing several distinct work=
s to<br>
+take place simultaneously. The driver needs to open a session before it ca=
n<br>
+perform any useful operation on the device.<br>
+<br>
+\paragraph{Device Operation: Open device}<br>
+<br>
+\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.<br>
+<br>
+This is the equivalent of calling \textit{open} on a V4L2 device node.<br>
+The driver uses \textit{virtio_media_cmd_open} to send an open request.<br=
>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_cmd_open {<br>
+=C2=A0 =C2=A0 struct virtio_media_cmd_header hdr;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virtio_=
media_resp_open}.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_resp_open {<br>
+=C2=A0 =C2=A0 struct virtio_media_resp_header hdr;<br>
+=C2=A0 =C2=A0 u32 session_id;<br>
+=C2=A0 =C2=A0 u32 __padding;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{session_id}] specifies an identifier for the current session.=
 The<br>
+identifier can be used to perform other commands on the session, notably i=
octls.<br>
+\end{description}<br>
+<br>
+\devicenormative{\subparagraph}{Device Operation: Open device}{Device Type=
s / Media Device / Device Operation / Open device}<br>
+<br>
+Upon success, the device MUST set a \field{session_id} in \textit{virtio_m=
edia_resp_open}<br>
+to an integer that is NOT used by any other open session.<br>
+<br>
+\paragraph{Device Operation: Close device}<br>
+<br>
+\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.<br>
+<br>
+This is the equivalent of calling \textit{close} on a previously opened V4=
L2<br>
+device node. All resources associated with this session will be freed.<br>
+<br>
+This command does not require a response from the device.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_cmd_close {<br>
+=C2=A0 =C2=A0 struct virtio_media_cmd_header hdr;<br>
+=C2=A0 =C2=A0 u32 session_id;<br>
+=C2=A0 =C2=A0 u32 __padding;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{session_id}] specifies an identifier for the session to close=
.<br>
+\end{description}<br>
+<br>
+\drivernormative{\subparagraph}{Device Operation: Close device}{Device Typ=
es / Media Device / Device Operation / Close device}<br>
+<br>
+The session ID SHALL NOT be used again after queueing this command.<br>
+<br>
+\paragraph{Device Operation: V4L2 ioctls}<br>
+<br>
+\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an open<=
br>
+session.<br>
+<br>
+This command asks the device to run one of the `VIDIOC_*` ioctls on the ac=
tive<br>
+session.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_cmd_ioctl {<br>
+=C2=A0 =C2=A0 struct virtio_media_cmd_header hdr;<br>
+=C2=A0 =C2=A0 u32 session_id;<br>
+=C2=A0 =C2=A0 u32 code;<br>
+=C2=A0 =C2=A0 /* Followed by the relevant ioctl payload as defined in the =
macro */<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{session_id}] specifies an identifier of thesession to run the=
 ioctl on.<br>
+\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to ru=
n.<br>
+\end{description}<br>
+<br>
+The code is extracted from the<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/v4l/videodev.html%7D%7Bvideodev2.h" rel=3D"noreferrer" target=3D"_blank">=
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.htm=
l}{videodev2.h</a>},<br>
+header file. The file defines the ioctl&#39;s codes, type of payload, and<=
br>
+direction. The code consists of the second argument of the \field{_IO*} ma=
cro.<br>
+<br>
+For example, the \textit{VIDIOC_G_FMT} is defined as follows:<br>
+<br>
+\begin{lstlisting}<br>
+#define VIDIOC_G_FMT _IOWR(&#39;V&#39;,=C2=A0 4, struct v4l2_format)<br>
+\end{lstlisting}<br>
+<br>
+This means that its ioctl code is \textit{4}, that its payload is a<br>
+\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.e., =
the<br>
+payload is written by both the driver and the device).<br>
+See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls pa=
yload}<br>
+for more information about the direction of ioctls.<br>
+<br>
+The payload layout is always a 64-bit representation of the corresponding<=
br>
+V4L2 structure.<br>
+<br>
+The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virtio=
_media_resp_ioctl}.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_resp_ioctl {<br>
+=C2=A0 =C2=A0 struct virtio_media_resp_header hdr;<br>
+=C2=A0 =C2=A0 /* Followed by the ioctl payload as defined in the macro */<=
br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4L2=
 ioctls / Ioctls payload}<br>
+<br>
+Each ioctl has a payload, which is defined by the third argument of the<br=
>
+\field{_IO*} macro defining it. <br>
+<br>
+The payload of an ioctl in the descriptor chain follows the command struct=
ure,<br>
+the reponse structure, or both depending on the direction:<br>
+<br>
+\begin{itemize}<br>
+\item \textbf{_IOR} is read-only for the driver, meaning the payload<br>
+follows the response in the device-writable section of the descriptor chai=
n.<br>
+\item \textbf{_IOW} is read-only for the device, meaning the payload<br>
+follows the command in the driver-writable section of the descriptor chain=
.<br>
+\item \textbf{_IOWR} is writable by both the device and driver,<br>
+meaning the payload must follow both the command in the driver-writable se=
ction<br>
+of the descriptor chain, and the response in the device-writable section.<=
br>
+\end{itemize}<br>
+<br>
+A common optimization for \textit{WR} ioctls is to provide the payload usi=
ng<br>
+descriptors that both point to the same buffer. This mimics the behavior o=
f<br>
+V4L2 ioctls where the data is only passed once and used as both input and<=
br>
+output by the kernel.<br>
+<br>
+\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Type=
s / Media Device / Device Operation / V4L2 ioctls}<br>
+<br>
+In case of success of a device-writable ioctl, the device MUST always writ=
e the<br>
+payload in the device-writable part of the descriptor chain.<br>
+<br>
+In case of failure of a device-writable ioctl, the device is free to write=
 the<br>
+payload in the device-writable part of the descriptor chain or not. Some e=
rrors<br>
+may still result in the payload being updated, and in this case the device=
 is<br>
+expected to write the updated payload. If the device has not written the<b=
r>
+payload after an error, the driver MUST assume that the payload has not be=
en<br>
+modified.<br>
+<br>
+\subparagraph{Handling of pointers in ioctl payload}<br>
+<br>
+A few structures used as ioctl payloads contain pointers to further<br>
+data needed for the ioctl. There are notably:<br>
+<br>
+\begin{itemize}<br>
+\item The \field{planes} pointer of<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/v4l/buffer.html#struct-v4l2-buffer%7D%7Bstruct" rel=3D"noreferrer" target=
=3D"_blank">https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/=
buffer.html#struct-v4l2-buffer}{struct</a> v4l2_buffer},<br>
+which size is determined by the length member.<br>
+\item The \field{controls} pointer of \textit{struct v4l2_ext_controls}, w=
hich<br>
+size is determined by the count member.<br>
+\end{itemize}<br>
+<br>
+If the size of the pointed area is determined to be non-zero, then the mai=
n<br>
+payload is immediately followed by the pointed data in their order of<br>
+appearance in the structure, and the pointer value itself is ignored by th=
e<br>
+device, which must also return the value initially passed by the driver.<b=
r>
+<br>
+\subparagraph{Handling of pointers to userspace memory}<br>
+\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}<b=
r>
+<br>
+A few pointers are special in that they point to userspace memory in the<b=
r>
+original V4L2 specification. They are:<br>
+<br>
+\begin{itemize}<br>
+\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and<br>
+\href{<a href=3D"https://www.kernel.org/doc/html/latest/userspace-api/medi=
a/v4l/buffer.html#struct-v4l2-plane%7D%7Bstruct" rel=3D"noreferrer" target=
=3D"_blank">https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/=
buffer.html#struct-v4l2-plane}{struct</a> v4l2_plane}<br>
+(technically an unsigned long, but designated a userspace address).<br>
+\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.<br>
+\end{itemize}<br>
+<br>
+These pointers can cover large areas of scattered memory, which has the<br=
>
+potential to require more descriptors than the virtio queue can provide. F=
or<br>
+these particular pointers only, a list of \textit{struct virtio_media_sg_e=
ntry}<br>
+that covers the needed amount of memory for the pointer is used instead of=
<br>
+using descriptors to map the pointed memory directly.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_sg_entry {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 __padding;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+For each such pointer to read, the device reads as many SG entries as need=
ed<br>
+to cover the length of the pointed buffer, as described by its parent<br>
+structure (\field{length} member of \textit{struct v4l2_buffer} or<br>
+\textit{struct v4l2_plane} for buffer memory, and \field{size} member of<b=
r>
+\textit{struct v4l2_ext_control} for control data).<br>
+<br>
+Since the device never needs to modify the list of SG entries, it is only<=
br>
+provided by the driver in the device-readable section of the descriptor ch=
ain,<br>
+and not repeated in the device-writable section, even for WR ioctls.<br>
+<br>
+\subparagraph{Unsupported ioctls}<br>
+<br>
+A few ioctls are replaced by other, more suitable mechanisms.<br>
+<br>
+\begin{itemize}<br>
+\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration ar=
ea<br>
+(see \ref{sec:Device Types / Media Device / Device Configuration Layout}).=
<br>
+\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event<br>
+(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue buf=
fer}).<br>
+\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event<br>
+(see \ref{sec:Device Types / Media Device / Device Operation / Emit an eve=
nt}).<br>
+\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are deprec=
ated<br>
+and replaced by the controls of the JPEG class.<br>
+\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall not =
be<br>
+implemented by the device.<br>
+\end{itemize}<br>
+<br>
+\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{Devi=
ce Types / Media Device / Device Operation / Unsupported ioctls}<br>
+<br>
+If being requested an unsupported ioctl, the device MUST return the same<b=
r>
+error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.<br>
+<br>
+\paragraph{Device Operation: Mapping a MMAP buffer}<br>
+<br>
+\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into the<=
br>
+driver&#39;s address space.<br>
+<br>
+Shared memory region ID 0 is used to map MMAP buffers with<br>
+the \textit{VIRTIO_MEDIA_CMD_MMAP} command.<br>
+<br>
+\begin{lstlisting}<br>
+#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 &lt;&lt; 0)<br>
+<br>
+struct virtio_media_cmd_mmap {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_media_cmd_header hdr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 session_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{flags}] is the set of flags for the mapping. \field{VIRTIO_ME=
DIA_MMAP_FLAG_RW}<br>
+can be set if a read-write mapping is desired. Without this flag the mappi=
ng<br>
+will be read-only.<br>
+\item[\field{offset}] corresponds to the \field{mem_offset} field of the<b=
r>
+\textit{union v4l2_plane} for the plane to map. This field can be obtained=
<br>
+using the \textit{VIDIOC_QUERYBUF} ioctl.<br>
+\end{description}<br>
+<br>
+The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{virtio_=
media_resp_mmap}.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_resp_mmap {<br>
+=C2=A0 =C2=A0 struct virtio_media_resp_header hdr;<br>
+=C2=A0 =C2=A0 u64 offset;<br>
+=C2=A0 =C2=A0 u64 len;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{offset}] offset into SHM region ID 0 of the start of the mapp=
ing.<br>
+\item[\field{len}] length of the mapping as indicated by the \textit{struc=
t v4l2_plane}<br>
+the buffer belongs to.<br>
+\end{description}<br>
+<br>
+\paragraph{Device Operation: Unmapping a MMAP buffer}<br>
+<br>
+\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped usi=
ng \field{VIRTIO_MEDIA_CMD_MMAP}.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_cmd_munmap {<br>
+=C2=A0 =C2=A0 struct virtio_media_cmd_header hdr;<br>
+=C2=A0 =C2=A0 u64 offset;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{offset}] offset into SHM region ID 0 previously returned by <=
br>
+\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously map=
ped.<br>
+\end{description}<br>
+<br>
+The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{virti=
o_media_resp_munmap}.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_resp_munmap {<br>
+=C2=A0 =C2=A0 struct virtio_media_resp_header hdr;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buffer}=
{Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}<=
br>
+<br>
+The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD_MMA=
P}<br>
+valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffer=
s or<br>
+session they belong to are released or closed by the driver.<br>
+<br>
+\paragraph{Device Operation: Memory Types}<br>
+<br>
+The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{USERP=
TR}<br>
+and \textit{DMABUF}) can easily be mapped to both driver and device contex=
t.<br>
+<br>
+\subparagraph{MMAP}<br>
+<br>
+In virtio-media, \textit{MMAP} buffers are provisioned by the device, just=
 like<br>
+they are by the kernel in regular V4L2. Similarly to how userspace can map=
 a<br>
+\textit{MMAP} buffer into its address space using mmap and munmap, the<br>
+virtio-media driver can map device buffers into the driver space by queuei=
ng the<br>
+\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_cmd_=
munmap}<br>
+commands to the commandq.<br>
+<br>
+\subparagraph{USERPTR}<br>
+<br>
+In virtio-media, \textit{USERPTR} buffers are provisioned by the driver, j=
ust<br>
+like they are by userspace in regular V4L2. Instances of \textit{struct v4=
l2_buffer}<br>
+and \textit{struct v4l2_plane} of this type are followed by a list of<br>
+\textit{struct virtio_media_sg_entry}. For more information, see<br>
+\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}<br>
+<br>
+The device must not alter the pointer values provided by the driver, i.e.<=
br>
+\field{the m.userptr} member of \textit{struct v4l2_buffer} and<br>
+\textit{struct v4l2_plane} must be returned to the driver with the same va=
lue<br>
+as it was provided.<br>
+<br>
+\subparagraph{DMABUF}<br>
+<br>
+In virtio-media, \textit{DMABUF} buffers are provisioned by a virtio objec=
t,<br>
+just like they are by a \textit{DMABUF} in regular V4L2. Virtio objects ar=
e<br>
+16-bytes UUIDs and do not fit in the placeholders for file descriptors, so=
<br>
+they follow their embedding data structure as needed and the device must<b=
r>
+leave the V4L2 structure placeholder unchanged.<br>
+<br>
+Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be adde=
d in<br>
+both the device-readable and device-writable section of the descriptor cha=
in.<br>
+<br>
+Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory type ca=
n also<br>
+be exported as virtio objects for use with another virtio device using the=
<br>
+\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exportbuf=
fer}<br>
+means that space for the UUID needs to be reserved right after that struct=
ure<br>
+<br>
+\subsubsection{Event Virtqueue}<br>
+<br>
+Events are a way for the device to inform the driver about asynchronous ev=
ents<br>
+that it should know about. In virtio-media, they are used as a replacement=
 for<br>
+the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the polli=
ng<br>
+mechanism, which would be impractical to implement on top of virtio.<br>
+<br>
+\paragraph{Device Operation: Event header}<br>
+<br>
+\begin{lstlisting}<br>
+#define VIRTIO_MEDIA_EVT_ERROR 0<br>
+#define VIRTIO_MEDIA_EVT_DQBUF 1<br>
+#define VIRTIO_MEDIA_EVT_EVENT 2<br>
+<br>
+/* Header for events queued by the device for the driver on the eventq. */=
<br>
+struct virtio_media_event_header {<br>
+=C2=A0 =C2=A0 u32 event;<br>
+=C2=A0 =C2=A0 u32 session_id;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.<br>
+\item[\field{session_id}] ID of the session the event applies to.<br>
+\end{description}<br>
+<br>
+\paragraph{Device Operation: Device-side error}<br>
+<br>
+\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session<br>
+mentioned in the header is considered corrupted and automatically closed b=
y<br>
+the device.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_event_error {<br>
+=C2=A0 =C2=A0 struct virtio_media_event_header hdr;<br>
+=C2=A0 =C2=A0 u32 errno;<br>
+=C2=A0 =C2=A0 u32 __padding;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{errno}] error code describing the kind of error that occurred=
.<br>
+\end{description}<br>
+<br>
+\paragraph{Device Operation: Dequeue buffer}<br>
+\label{sec:Device Types / Media Device / Device Operation / Dequeue buffer=
}<br>
+<br>
+\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being used an=
ymore<br>
+by the device and is returned to the driver.<br>
+<br>
+A \textit{struct virtio_media_event_dqbuf} event is queued on the eventq b=
y the<br>
+device every time a buffer previously queued using the \textit{VIDIOC_QBUF=
}<br>
+ioctl is done being processed and can be used by the driver again. This is=
 like<br>
+an implicit \textit{VIDIOC_DQBUF} ioctl.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_event_dqbuf {<br>
+=C2=A0 =C2=A0 struct virtio_media_event_header hdr;<br>
+=C2=A0 =C2=A0 struct v4l2_buffer buffer;<br>
+=C2=A0 =C2=A0 struct v4l2_plane planes[VIDEO_MAX_PLANES];<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffer th=
at has been dequeued.<br>
+\item[\field{planes}] array of \textit{struct v4l2_plane} containing the p=
lane information for multi-planar buffers.<br>
+\end{description}<br>
+<br>
+Pointer values in the \textit{struct v4l2_buffer} and \textit{struct v4l2_=
plane}<br>
+are meaningless and must be ignored by the driver. It is recommended that =
the<br>
+device sets them to NULL in order to avoid leaking potential device addres=
ses.<br>
+<br>
+Note that in the case of a \field{USERPTR} buffer, the \textit{struct v4l2=
_buffer}<br>
+used as event payload is not followed by the buffer memory: since that mem=
ory<br>
+is the same that the driver submitted with the \textit{VIDIOC_QBUF}, it wo=
uld<br>
+be redundant to have it here.<br>
+<br>
+\paragraph{Device Operation: Emit an event}<br>
+\label{sec:Device Types / Media Device / Device Operation / Emit an event}=
<br>
+<br>
+\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been emitted=
 for a session.<br>
+<br>
+A \textit{struct virtio_media_event_event} event is queued on the eventq b=
y the<br>
+device every time an event the driver previously subscribed to using the<b=
r>
+\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is like an<b=
r>
+implicit \textit{VIDIOC_DQEVENT} ioctl.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtio_media_event_event {<br>
+=C2=A0 =C2=A0 struct virtio_media_event_header hdr;<br>
+=C2=A0 =C2=A0 struct v4l2_event event;<br>
+};<br>
+\end{lstlisting}<br>
+<br>
+\begin{description}<br>
+\item[\field{event}] \textit{struct v4l2_event} describing the event that =
occurred.<br>
+\end{description}<br>
diff --git a/device-types/media/device-conformance.tex b/device-types/media=
/device-conformance.tex<br>
new file mode 100644<br>
index 0000000..3338822<br>
--- /dev/null<br>
+++ b/device-types/media/device-conformance.tex<br>
@@ -0,0 +1,11 @@<br>
+\conformance{\subsection}{Media Device Conformance}\label{sec:Conformance =
/ Device Conformance / Media Device Conformance}<br>
+<br>
+A Media device MUST conform to the following normative statements:<br>
+<br>
+\begin{itemize}<br>
+\item \ref{devicenormative:Device Types / Media Device / Virtqueues}<br>
+\item \ref{devicenormative:Device Types / Media Device / Device Operation =
/ Open device}<br>
+\item \ref{devicenormative:Device Types / Media Device / Device Operation =
/ V4L2 ioctls}<br>
+\item \ref{devicenormative:Device Types / Media Device / Device Operation =
/ Unsupported ioctls}<br>
+\item \ref{devicenormative:Device Types / Media Device / Device Operation =
/ Unmapping a MMAP buffer}<br>
+\end{itemize}<br>
\ No newline at end of file<br>
diff --git a/device-types/media/driver-conformance.tex b/device-types/media=
/driver-conformance.tex<br>
new file mode 100644<br>
index 0000000..058b812<br>
--- /dev/null<br>
+++ b/device-types/media/driver-conformance.tex<br>
@@ -0,0 +1,9 @@<br>
+\conformance{\subsection}{Media Device Conformance}\label{sec:Conformance =
/ Driver Conformance / Media Driver Conformance}<br>
+<br>
+A Media device MUST conform to the following normative statements:<br>
+<br>
+\begin{itemize}<br>
+\item \ref{drivernormative:Device Types / Media Device / Virtqueues}<br>
+\item \ref{drivernormative:Device Types / Media Device / Device Operation =
/ Command Virtqueue}<br>
+\item \ref{drivernormative:Device Types / Media Device / Device Operation =
/ Close device}<br>
+\end{itemize}<br>
\ No newline at end of file<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div></div>

--0000000000000d28a0061a85c199--

