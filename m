Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD75417C224
	for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737997993; cv=none; b=os/yKTtEK3HrO0w7ZDjGOlwOR+iUrl77BbOGqPqDhTkPCRJ0sxIqe1HMwKSmbzmubNsKTcXQx9LCUWIYAqtJ9XunbvtZTqECHbJD0LL+mS6If3c2DOA9RgHPXQic7rqL2cw2i6w+yZDI0raStAFyvtpm2TBL397kcQl3KrHGj6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737997993; c=relaxed/simple;
	bh=eaFDPQNAyszF8WbqaHgoGWbDOr82WA0KLBt0zw++QnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kfqn6JF0VXuB4/7tIc+gUntIca5cetK+nPq4I75dEmT1dpqY4znrop5Tv5ixdb6l66BVuTQwP9sHvFyMHt7gRkAbqNBS15lT+SJknwFSu35xD2rekeDgEwLHmD5ihzHtqFw/aHo8wapTemoU9wWNTu97ExmEgniVyYWZLpLeS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCBG2NbN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCBG2NbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737997989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xjtE37CjtflNbM1w2KY/SQnVDtfRam/BGCdq6y+ztw=;
	b=WCBG2NbN434i25KR0W9h/7w7FC+tSDvc65OV+LKh1H32/gjuHUV41IjB7FIOPXM4ZxvRGv
	WYts6a1B5cK56bgaP7G8Ahvo4Kb4JEg/iModj8fj4U6bgOeN2E2ogUYnu+H4o722gnfVuh
	HKK+ltclzPACIv3NgWJqJeZw/Lc0YAQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-zJzig4AEPoS_fANj2rTioA-1; Mon, 27 Jan 2025 12:13:07 -0500
X-MC-Unique: zJzig4AEPoS_fANj2rTioA-1
X-Mimecast-MFC-AGG-ID: zJzig4AEPoS_fANj2rTioA
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8f78fdad0so64083546d6.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 09:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997986; x=1738602786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xjtE37CjtflNbM1w2KY/SQnVDtfRam/BGCdq6y+ztw=;
        b=WbKocB9ABJu6IjojGu5sfNn0exdz4kB3GO7sdt+16KO/KHafA9oMlsaC8cBSYYWcHC
         0ouqBo4pO1H614XhL+5m0NXouTlox3OQE6CoAwZkHISnJE8MvplIEwuK59gOBZB8QTKl
         onnBvg5TYXePQsg5xOML0on9BVJxJjssgi+A+OG48BVt9y/GUedJtB7fMucLy+EL5py+
         KFMSD0Aru5yaQcKEmrofjB+lzru8VtzG+vXv5rMx5ZcjAaJZjrz9vZK1xwV+MXHHeKUD
         TNtOLGQGWfLJWICGDxXJ/UJU5Edx2k7ZAqAiV1q9pzK1HXHjBEIRTHG+nP6xHIFmMYo6
         +N9Q==
X-Gm-Message-State: AOJu0YyOuOWHy+OhEnJOh/DeyuApN5CcxQshViNmQg3Ebz50tzC8xU7h
	GU+wzcOTv4Pi768yk/zb7CP3vdQoymwCsf/LDjG83fIQiMljK4zW0aZ8FEgc/jtlpctvLGa6tKC
	0c2GYGavJqQmiSuLF349ksXzqyyQxXRqvvr+ArqCdj3gHDAqnPCoD5E5QYzFdKatITIZVLNqISI
	k=
X-Gm-Gg: ASbGncvPHOoY57HVMYmEsB1C+VFRXQUIujnoJ1n6J9HYuQ/2HopEKoh80fraBftQhkE
	x6NKLd12cH9VakzsX1cIHUntDsq6hYKhBNDB5obWNBOHJbLi2GrVUyVGEROjkjWQurafCWo959c
	WGEOgEI32Fotv+mfYaffltT2vsMasP+UWSL6K6BgUuSNLpqHUVD5irQni4pO8LhSis1YwdXt+aw
	+z7sbTg5oHS3dB3RntMBw8yFjZSpz5766v7x/c+xCVOTdpOGJWdAmEKgnWpwijDoZMeMsfNUNQ=
X-Received: by 2002:a05:6214:5019:b0:6e1:a4d6:185f with SMTP id 6a1803df08f44-6e1b220c5c8mr715165646d6.34.1737997985453;
        Mon, 27 Jan 2025 09:13:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENhF8QyAgnPapybaSzbYg7z53EZMptbYxsaG2SYTnSN6/naXQgptyx8OO4VcUixF7U3HHN/g==
X-Received: by 2002:a05:6214:5019:b0:6e1:a4d6:185f with SMTP id 6a1803df08f44-6e1b220c5c8mr715163346d6.34.1737997983494;
        Mon, 27 Jan 2025 09:13:03 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2057a88edsm36161066d6.90.2025.01.27.09.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:13:03 -0800 (PST)
Date: Mon, 27 Jan 2025 18:12:57 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, agordeev@qti.qualcomm.com,
	ribalda@google.com, acourbot@chromium.org,
	gurchetansingh@google.com, cohuck@redhat.com,
	daniel.almeida@collabora.com, changyeon@google.com,
	nicolas.dufresne@collabora.com, eballetb@redhat.com,
	dverkamp@chromium.org, hverkuil@xs4all.nl, mst@redhat.com,
	alex.bennee@linaro.org, acourbot@google.com
Subject: Re: [PATCH v5 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <Z5e+mY7E40DYlrTA@fedora>
References: <20250120085015.956057-1-aesteve@redhat.com>
 <20250120085015.956057-2-aesteve@redhat.com>
 <Z5ejOtZyzn746lIv@fedora>
 <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00KeRjcLdpQ4b4YkbsUyceqrBi5gc=rDZTP17oP-W=SK1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pW1Iqrunlk66f7mwwERHctwX3la3pmyqeLO5UwPD_jk_1737997987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 27, 2025 at 04:36:46PM +0100, Albert Esteve wrote:
> On Mon, Jan 27, 2025 at 4:16 PM Matias Ezequiel Vara Larsen
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
> > >  device-types/media/description.tex        | 617 ++++++++++++++++++++++
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
> > > @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
> > >  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
> > >  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> > > -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
> > > -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> > > +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> > > +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
> > > +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> > > +
> > >
> > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
> > >    \end{itemize}
> > > @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
> > >  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance},
> > >  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> > > -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
> > > -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> > > +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> > > +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
> > > +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
> > >
> > >      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
> > >    \end{itemize}
> > > @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \input{device-types/scmi/driver-conformance.tex}
> > >  \input{device-types/gpio/driver-conformance.tex}
> > >  \input{device-types/pmem/driver-conformance.tex}
> > > +\input{device-types/media/driver-conformance.tex}
> > >
> > >  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
> > >
> > > @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \input{device-types/scmi/device-conformance.tex}
> > >  \input{device-types/gpio/device-conformance.tex}
> > >  \input{device-types/pmem/device-conformance.tex}
> > > +\input{device-types/media/device-conformance.tex}
> > >
> > >  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
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
> > > diff --git a/device-types/media/description.tex b/device-types/media/description.tex
> > > new file mode 100644
> > > index 0000000..2c7f451
> > > --- /dev/null
> > > +++ b/device-types/media/description.tex
> > > @@ -0,0 +1,617 @@
> > > +\section{Media Device}\label{sec:Device Types / Media Device}
> > > +
> > > +The virtio media device follows the same model (and structures) as V4L2. It
> > > +can be used to virtualize cameras, codec devices, or any other device
> > > +supported by V4L2. The complete definition of V4L2 structures and ioctls can
> > > +be found under the
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
> > > +
> > > +V4L2 is a UAPI that allows a less privileged entity (user-space) to use video
> > > +hardware exposed by a more privileged entity (the kernel). Virtio-media is an
> > > +encapsulation of this API into virtio, turning it into a virtualization API
> > > +for all classes of video devices supported by V4L2, where the device plays the
> > > +role of the kernel and the driver the role of user-space.
> > > +
> > > +The device is therefore responsible for presenting a virtual device that behaves
> > > +like an actual V4L2 device, which the driver can control.
> > > +
> > > +Note that virtio-media does not require the use of a V4L2 device driver or of
> > > +Linux on any side - V4L2 is only used as a transport protocol,
> > > +and both sides are free to convert it from/to any model that they wish to use.
> > > +
> > > +\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID}
> > > +
> > > +48
> > > +
> > > +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueues}
> > > +
> > > +\begin{description}
> > > +\item[0] commandq - used for driver commands and device responses to these
> > > +commands.
> > > +\item[1] eventq - used for events sent by the device to the driver.
> > > +\end{description}
> > > +
> > > +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feature Bits}
> > > +
> > > +None
> > > +
> > > +\subsection{Device Configuration Layout}\label{sec:Device Types / Media Device / Device Configuration Layout}
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
> > > +\item[\field{device_caps}] (driver-read-only) flags representing the device
> > > +capabilities as used in
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > > +It corresponds with the \field{device_caps} field in the \textit{struct video_device}.
> > > +\item[\field{device_type}] (driver-read-only) informs the driver of the type
> > > +of the video device. It corresponds with the \field{vfl_devnode_type} field of the device.
> > > +\item[\field{card}] (driver-read-only) name of the device, a NUL-terminated
> > > +UTF-8 string. It corresponds with the \field{card} field of the \textit{struct v4l2_capability}.
> > > +If all the characters of the field are used, it does not need to be NUL-terminated.
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
> > > +\item May open a session (see Section \ref{sec:Device Types / Media Device / Device Operation / Open Device})
> > > +to use the device and send V4L2 ioctls in order to receive more information
> > > +about the device, such as supported formats or controls.
> > > +\end{enumerate}
> > > +
> > > +\subsection{Device Operation}\label{sec:Device Types / Media Device / Device Operation}
> > > +
> > > +The driver enqueues commands in the command queue for the device to process.
> > > +The errors returned by each command are standard
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux kernel error codes}.
> > > +For instance, a driver sending a command that contains invalid options will
> > > +receive \textit{EINVAL} in return, after the device tries to process it.
> > > +
> > > +The device enqueues events in the event queue for the driver to process.
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
> > > +/* Header for all virtio commands from the driver to the device on the commandq. */
> > > +struct virtio_media_cmd_header {
> > > +     le32 cmd;
> > > +     le32 __reserved;
> > > +};
> > > +
> > > +/* Header for all virtio responses from the device to the driver on the commandq. */
> > > +struct virtio_media_resp_header {
> > > +     le32 status;
> > > +     le32 __reserved;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +A command consists of a command header \textit{virtio_media_cmd_header}
> > > +containing the following device-readable field:
> > > +
> > > +\begin{description}
> > > +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
> > > +\end{description}
> > > +
> > > +A response consists of a response header \textit{virtio_media_resp_header}
> > > +containing the following device-writable field:
> > > +
> > > +\begin{description}
> > > +\item[\field{status}] indicates a device request status.
> > > +\end{description}
> > > +
> > > +When the device executes the command successfully, the value of the status
> > > +field is 0. Conversely, when the device fails to execute the command, the value
> > > +of the status fiels corresponds with one of the standard Linux error codes.
> >
> > s/fiels/field
> >
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > > +
> > > +Sessions are how the device is multiplexed, allowing several distinct works to
> > > +take place simultaneously. Before starting operation, the driver needs to open
> > > +a session. This is equivalent to opening the \textit{/dev/videoX} file of the
> > > +V4L2 device. Each session gets a unique ID assigned, which can be then used
> > > +to perform actions on it.
> > > +
> > > +\paragraph{Device Operation: Open device}\label{sec:Device Types / Media Device / Device Operation / Open Device}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> > > +
> > > +This is the equivalent of calling \textit{open} on a V4L2 device node.
> > > +The driver uses \textit{virtio_media_cmd_open} to send an open request.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_open {
> > > +    struct virtio_media_cmd_header hdr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virtio_media_resp_open}.
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
> > > +\item[\field{session_id}] identifies the current session, which is used for
> > > +other commands, predominantly ioctls.
> > > +\end{description}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Open device}{Device Types / Media Device / Device Operation / Open device}
> > > +
> > > +Upon success, the device MUST set a \field{session_id} in \textit{virtio_media_resp_open}
> > > +to an integer that is NOT used by any other open session.
> > > +
> > > +\paragraph{Device Operation: Close device}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> > > +
> > > +This is the equivalent of calling \textit{close} on a previously opened V4L2
> > > +device node. All resources associated with this session will be freed.
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
> > > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device Types / Media Device / Device Operation / Close device}
> > > +
> > > +The session ID SHALL NOT be used again after queueing this command, until it
> > > +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OPEN} call.
> >
> > I think you forgot the `has` in `until it been ...`.
> >
> > > +
> > > +\paragraph{Device Operation: V4L2 ioctls}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an open
> > > +session.
> > > +
> > > +This command tells the device to run one of the `VIDIOC_*` ioctls on the
> > > +session identified by \textit{session_id}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_ioctl {
> > > +    struct virtio_media_cmd_header hdr;
> > > +    le32 session_id;
> > > +    le32 code;
> > > +    /* Followed by the relevant ioctl command payload as defined in the macro */
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{session_id}] identifies the session to run the ioctl on.
> > > +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to run.
> > > +\end{description}
> > > +
> > > +The code is extracted from the
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.html}{videodev2.h},
> > > +header file. The file defines the ioctl's codes, type of payload, and
> > > +direction. The code consists of the second argument of the \field{_IO*} macro.
> > > +
> > > +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> > > +\end{lstlisting}
> > > +
> > > +This means that its ioctl code is \textit{4}, its payload is a
> > > +\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., the
> > > +payload is written by both the driver and the device).
> > > +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
> > > +for more information about the direction of ioctls.
> > > +
> > > +The payload struct layout always matches the 64-bit, little-endian
> > > +representation of the corresponding V4L2 structure. For most structs, the
> > > +size is identical for both 32 and 64 bits versions. Otherwise, the driver
> > > +must translate them to the aforementioned size and endianess.
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virtio_media_resp_ioctl}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_ioctl {
> > > +    struct virtio_media_resp_header hdr;
> > > +    /* Followed by the ioctl response payload as defined in the macro */
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
> > > +
> > > +Each ioctl has a payload, which is defined by the third argument of the
> > > +\field{_IO*} macro.
> > > +
> > > +The payload of an ioctl in the descriptor chain follows the command structure,
> > > +the response structure, or both depending on the direction:
> > > +
> > > +\begin{itemize}
> > > +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> > > +follows the response in the device-writable section of the descriptor chain.
> > > +\item \textbf{_IOW} is read-only for the device, meaning the payload
> > > +follows the command in the driver-writable section of the descriptor chain.
> > > +\item \textbf{_IOWR} is writable by both the device and driver,
> > > +meaning the payload must follow both the command in the driver-writable section
> > > +of the descriptor chain, and the response in the device-writable section.
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
> on who is allowed to write into it instead.
> 

Thanks for clarification. I do not have a strong opinion about what
wording to use so you can keep it. I think however that the same
vocabulary should be used all over the document.

Matias

