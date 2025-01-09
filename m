Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97219995B
	for <virtio-comment@lists.linux.dev>; Thu,  9 Jan 2025 18:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449035; cv=none; b=busa40yJXW5eLDgfsoH8Gasozlyov+cjeYLaBeqIMWNxsRTEarA+pDKG5wf0TxIkqr4UVLSFXEBJkf/hpZ3iy4SqQoPHuZXRZWyGEPE4pordbdJ1LL8n9su7xpzGjTtJy9qcROoLvGtoIIucj0WSR3KRTrK3F/Xz96p8r/q4AhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449035; c=relaxed/simple;
	bh=d11kcFFNQr4kK/lghwPEyHHbSZUzglngUBKwzekbT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MCmkoXzpztK5UJNhe8OoJyxIhVFWMtC8dWfP1B46d6lqtKbZR8mFb5pd6MCkU70WsTUMLDJzlJxw9qbGAqCjKKpcrKtrOdyXoqFoxZMeCfX8sTYrUbiL8UupfFkf97H4uNdvSYnI9cmQK41hyywXMRJPWD/AkXDoKwTKbDsnD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VlaoPWLy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VlaoPWLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736449031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mW37r2ZUCZ0JVmiTXUMmmqnaMK1MA4n6V+ycGV6H/Kk=;
	b=VlaoPWLyIGhJSzzvFuhMQ6/wbB/K+0Y2YT+0khd+H8DdZH2/bqK5ZCMbLc6/OJUOu0SpjK
	bJRpge1r1+L5oomSdrYXhxHNZfKvz7cYjsUNEOkfFkVaWNhLIY0L5ZX7rgjY7pMUfHH4mk
	BSZzt5mADcHQUNoMucrlx7rOmnnMcGY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-kWpaOI3nN4igjC1eB9bz_Q-1; Thu, 09 Jan 2025 13:57:06 -0500
X-MC-Unique: kWpaOI3nN4igjC1eB9bz_Q-1
X-Mimecast-MFC-AGG-ID: kWpaOI3nN4igjC1eB9bz_Q
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e00ebb16so534834f8f.3
        for <virtio-comment@lists.linux.dev>; Thu, 09 Jan 2025 10:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449025; x=1737053825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mW37r2ZUCZ0JVmiTXUMmmqnaMK1MA4n6V+ycGV6H/Kk=;
        b=JfdguoL/39u+myHYScIIxCSUf8h8OfGGkkVkLCBdLHsr5t8uc++GGgl2kdSpoo1heh
         SQkKG8qhBGyD9vn2LtOU5IhY8fBxFtqvN8tU/aJzAlscTm5CAeAzpotRRSHSEWs/GS2R
         XGafXGSFWS0JLBGgyIRkPX7i/MZuiSeLrL/aGQ2m8C/KEOHy/zBXVGyQZdJJP3+Mtyrg
         UuAvZw8zAo3vAXAZaAZW8UKFAmUpRd3ov0/DP6lYR7EB5lO22Z2gOEaYVGvNWkieUMyu
         +efhBuhb5I/NkZKYTF3EftulstwBrjXE4U3L+qQjQYuRJ7/v9IrYCK0JO4JLfoaI9My6
         cVSw==
X-Gm-Message-State: AOJu0YyUBD40pqRLkKf5HFZQbOoNFWz9ZX9ImTu08HX4gMJuioKpE+qL
	L968CsMRANN5MAdEGBb3F1ibUBRuoe8arrAxewXm/pK91A9IvJOOODXT8j/equxH3vZiz9qqzD2
	FVXoOwW0aPzWEvvF0lZUs6o0n+ROzVz5ctH09u0+Pv1z0Zll/mUtm7mnFPdzG0Np0bYTojjnfnz
	U=
X-Gm-Gg: ASbGnctC1dT9JoQ+jqjQVLiW1Nbx8I8g3/KpcmYjYwsfsrRoGqtX316R+uidL4QonVW
	0P+tnQ+zBt2VuUpiX/URI94IaEjkQ8FCLpSinxwcaTtiBWyP5jc4f6zGfsQjE6R4LPuQv7QuQMS
	d+W1sp6YjVI5S3EAjGmanemtiHSV7MD4qYRnXdC3S1ZK3ib+LneDXOL5RtTW6G+bQdtHD39TNsj
	sf9EFO1GORSGS8GFlyzNB69NS9diLUdfagCPKADJ8Rf9ojeoUE=
X-Received: by 2002:a5d:6c63:0:b0:385:e22e:288f with SMTP id ffacd0b85a97d-38a872ea33fmr7856065f8f.31.1736449024591;
        Thu, 09 Jan 2025 10:57:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5UxVnwwaP+lmyMRT0pPkxh1TVRKnTSE9S2I3HR81Kzj2l5F2+h8ej6N1wX/imdXbby8noaQ==
X-Received: by 2002:a5d:6c63:0:b0:385:e22e:288f with SMTP id ffacd0b85a97d-38a872ea33fmr7856016f8f.31.1736449023812;
        Thu, 09 Jan 2025 10:57:03 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fd03sm30372375e9.6.2025.01.09.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 10:57:03 -0800 (PST)
Date: Thu, 9 Jan 2025 19:57:00 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com,
	daniel.almeida@collabora.com, agordeev@qti.qualcomm.com,
	dverkamp@chromium.org, ribalda@google.com, alex.bennee@linaro.org,
	mst@redhat.com, nicolas.dufresne@collabora.com,
	acourbot@chromium.org, cohuck@redhat.com, changyeon@google.com,
	hverkuil@xs4all.nl, gurchetansingh@google.com
Subject: Re: [PATCH v4 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <Z4Ab/E3d8S6R21W2@fedora>
References: <20241107154930.118763-1-aesteve@redhat.com>
 <20241107154930.118763-2-aesteve@redhat.com>
 <Z07Q5GjhBYbpXtkF@fedora>
 <CADSE00KexjcoYaROCc9-oWBtjW-FccYKz-2=2aHNBtwcg53C6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00KexjcoYaROCc9-oWBtjW-FccYKz-2=2aHNBtwcg53C6Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -E0-QlmZ6Smuz5LcR9qMAZ0-LLWjmFWXbshjM3hjGg4_1736449025
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 07, 2025 at 02:12:33PM +0100, Albert Esteve wrote:
> Hi Matias,
> 
> On Tue, Dec 3, 2024 at 10:35 AM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Hello Albert,
> >
> > I added some minor comments below. I may need to read it again since
> > there are some points that I did not understand completely.
> >
> > On Thu, Nov 07, 2024 at 04:49:30PM +0100, Albert Esteve wrote:
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
> > >  device-types/media/description.tex        | 575 ++++++++++++++++++++++
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
> > > index 0000000..d20d2f6
> > > --- /dev/null
> > > +++ b/device-types/media/description.tex
> > > @@ -0,0 +1,575 @@
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
> >
> > Just to clarify, I would add a sentence here like:
> > `A driver executes the following sequence to initialize a device:`
> >
> > > +\begin{enumerate}
> > > +\item Read the \field{device_caps} and \field{device_type} fields
> > > +from the configuration layout to identify the device.
> > > +\item Set up the \field{commandq} and \field{eventq}.
> >
> > Maybe add `... \field{commandq} and \field{eventq} virtqueues`.
> >
> > > +\item May open a session (see Section \ref{sec:Device Operation: Command Virtqueue: Sessions})
> > > +to use the device and send V4L2 ioctls in order to receive more information
> > > +about the device, such as supported formats or controls.
> > > +\end{enumerate}
> > > +
> > > +\subsection{Device Operation}\label{sec:Device Types / Media Device / Device Operation}
> > > +
> > > +Commands are queued on the command queue by the driver for the device to
> > > +process. The errors returned by each command are standard
> >
> > I would rewrite it as below but I do not have a strong opinion:
> >
> > `The driver enqueues commands in the command queue for the device to
> > process them.`
> >
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux kernel error codes}.
> > > +For instance, a command that contains invalid options will return \textit{EINVAL}.
> > > +
> >
> > I think here is not the command that returns EINVAL but the device when
> > trying to process a command that has an invalid option.
> >
> > > +Events are sent on the event queue by the device for the driver to handle.
> >
> > I would rewrite it as below but I do not have a strong opinion:
> >
> > `The device enqueues events in the event queue for the driver to process
> > them.`
> >
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
> > > +The status field can take 0 if the command was successful, or one of the
> > > +standard Linux error codes if it was not.
> >
> > I would rewrite it as but I do not have a strong opinion about it:
> >
> > `When the device executes the command successfully, the value of the status
> > field is 0. When the device fails to execute the command, the value of
> > the status field is one of the standard Linux error codes.`
> >
> > > +
> > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> > > +
> > > +Sessions are how the device is multiplexed, allowing several distinct works to
> > > +take place simultaneously. Before start operating, the driver needs to open a
> > > +session. This is equivalent to opening the \textit{/dev/videoX} file of the
> > > +V4L2 device. Each session gets a unique ID assigned, which can be then used
> > > +to perform actions on it.
> > > +
> > > +\paragraph{Device Operation: Open device}
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
> > > +\item[\field{session_id}] specifies an identifier for the session to close.
> >
> > I would rewrite it shorter as:
> >
> > `session_id identifies the session to close.`
> >
> > > +\end{description}
> > > +
> > > +\drivernormative{\subparagraph}{Device Operation: Close device}{Device Types / Media Device / Device Operation / Close device}
> > > +
> > > +The session ID SHALL NOT be used again after queueing this command.
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
> > > +    /* Followed by the relevant ioctl payload as defined in the macro */
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
> > > +Note that although most architectures use this format, there
> > > +are some architecture-specific encoding differences.
> > > +See \textit{include/ARCH/ioctl.h} for more details.
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
> > > +    /* Followed by the ioctl payload as defined in the macro */
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
> > > +
> > > +A common optimization for \textit{WR} ioctls is to provide the payload using
> > > +descriptors that both point to the same buffer. This mimics the behavior of
> > > +V4L2 ioctls where the data is only passed once and used as both input and
> > > +output by the kernel.
> > > +

I think you're suggesting that two descriptors in the descriptor ring
point to the same memory address. For instance, if the chain consists of
only two descriptors, the first one would be read-only and the second
one would be write-only, both pointing to the same memory location.
According to my understanding, this behavior is allowed by the
specification as long as two separate descriptors are used. However, I
think it's worth noting that the specification does not explicitly
define a descriptor for simultaneous reading and writing.

It may be helpful to add a note in a new patch to inform other
developers about this potential optimization. Nevertheless, it's crucial
for both the driver and the device to understand it when accessing the
data to avoid any issues.

> > > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Types / Media Device / Device Operation / V4L2 ioctls}
> > > +
> > > +In case of success of a device-writable ioctl, the device MUST always write the
> > > +payload in the device-writable part of the descriptor chain.
> > > +
> > > +In case of failure of a device-writable ioctl, the device is free to write the
> > > +payload in the device-writable part of the descriptor chain or not. Some errors
> > > +may still result in the payload being updated, and in this case the device is
> > > +expected to write the updated payload. If the device has not written the
> > > +payload after an error (i.e., only the header is returned), the driver MUST
> > > +assume that the payload has not been modified.
> > > +
> > > +\subparagraph{Handling of pointers in ioctl payload}
> > > +
> > > +A few structures used as ioctl payloads contain pointers to further
> > > +data needed for the ioctl. There are notably:
> > > +
> > > +\begin{itemize}
> > > +\item The \field{planes} pointer of
> >
> > Do you mean `points to`?
> 
> Here we specify the type ""of"" the data the pointer is pointing to. I
> feel this construction is correct as is, although 'points to' would
> mean the same, and be equally valid. I will keep it as is unless there
> is a strong preference.
> 

Oh, I see. I missunderstood the sentence.

> 
> >
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > +which size is determined by the length member.
> > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls}, which
> > > +size is determined by the count member.
> > > +\end{itemize}
> > > +
> > > +If the size of the pointed area is determined to be non-zero, then the main
> > > +payload is immediately followed by the pointed data in their order of
> > > +appearance in the structure, and the pointer value itself is ignored by the
> > > +device, which must also return the value initially passed by the driver.
> > > +
> > > +\subparagraph{Handling of pointers to userspace memory}
> > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> > > +
> > > +A few pointers are special in that they point to userspace memory in the
> > > +original V4L2 specification. They are:
> > > +
> > > +\begin{itemize}
> > > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > > +(technically an unsigned long, but designated a userspace address).
> > > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > > +\end{itemize}
> > > +
> > > +These pointers can cover large areas of scattered memory, which has the
> > > +potential to require more descriptors than the virtio queue can provide. For
> > > +these particular pointers only, a list of \textit{struct virtio_media_sg_entry}
> > > +that covers the needed amount of memory for the pointer is used instead of
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
> > > +For each such pointer to read, the device reads as many SG entries as needed
> > > +to cover the length of the pointed buffer, as described by its parent
> > > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > > +\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
> > > +\textit{struct v4l2_ext_control} for control data).
> > > +
> > > +Since the device never needs to modify the list of SG entries, it is only
> > > +provided by the driver in the device-readable section of the descriptor chain,
> > > +and not repeated in the device-writable section, even for WR ioctls.
> > > +
> > > +\subparagraph{Unsupported ioctls}
> > > +
> > > +A few ioctls are replaced by other, more suitable mechanisms.
> > > +
> > > +\begin{itemize}
> > > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration area
> > > +(see \ref{sec:Device Types / Media Device / Device Configuration Layout}).
> > > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > > +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue buffer}).
> > > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > > +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an event}).
> > > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are deprecated
> > > +and replaced by the controls of the JPEG class.
> > > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall not be
> > > +implemented by the device.
> > > +\end{itemize}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > +
> > > +When a request is not supported, the device MUST return \textit{ENOTTY},
> > > +which corresponds with the response for unknown ioctls.
> > > +
> > > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into the
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
> > > +\item[\field{flags}] is the set of flags for the mapping. \field{VIRTIO_MEDIA_MMAP_FLAG_RW}
> > > +can be set if a read-write mapping is desired. Without this flag the mapping
> > > +will be read-only.
> > > +\item[\field{offset}] corresponds to the \field{mem_offset} field of the
> > > +\textit{union v4l2_plane} for the plane to map. This field can be obtained
> > > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > > +\end{description}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{virtio_media_resp_mmap}.
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
> > > +\item[\field{driver_addr}] offset into SHM region ID 0 of the start of the mapping.
> > > +\item[\field{len}] length of the mapping as indicated by the \textit{struct v4l2_plane}
> > > +the buffer belongs to.
> > > +\end{description}
> > > +
> > > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > > +
> >
> > s/Unmap/unmaps
> >
> > > +\begin{lstlisting}
> > > +struct virtio_media_cmd_munmap {
> > > +    struct virtio_media_cmd_header hdr;
> > > +    le64 driver_addr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{driver_addr}] offset into SHM region ID 0 previously returned by
> > > +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously mapped.
> > > +\end{description}
> > > +
> > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{virtio_media_resp_munmap}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_resp_munmap {
> > > +    struct virtio_media_resp_header hdr;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}
> > > +
> > > +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD_MMAP}
> > > +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffers or
> > > +session they belong to are released or closed by the driver.
> > > +
> > > +\paragraph{Device Operation: Memory Types}
> > > +
> > > +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{USERPTR}
> > > +and \textit{DMABUF}) can easily be mapped to both driver and device context.
> > > +
> > > +However, the driver shall only advertise support for \textit{MMAP} and
> > > +\textit{DMABUF} to the guest userspace. \textit{USERPTR} is merely employed to
> > > +discern \textit{SHARED_PAGES} buffers, similar to how \textit{DMABUF} is used
> > > +to signify \textit{VIRTIO_OBJECT} buffers in the driver and device context.
> > > +
> > > +\subparagraph{MMAP}
> > > +
> > > +In virtio-media, \textit{MMAP} buffers are provisioned by the device, just like
> > > +they are by the kernel in regular V4L2. Similarly to how userspace can map a
> > > +\textit{MMAP} buffer into its address space using mmap and munmap, the
> > > +virtio-media driver can map device buffers into the driver space by queueing the
> > > +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_cmd_munmap}
> > > +commands to the commandq.
> > > +
> > > +\subparagraph{SHARED_PAGES}
> > > +
> > > +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by the driver,
> > > +and use guest physical addresses. Instances of \textit{struct v4l2_buffer}
> > > +and \textit{struct v4l2_plane} of this type are followed by a list of
> >
> > I think here is `these types`.
> 
> It refers to the memory type. I will clarify in the text.
> 
> 
> >
> > > +\textit{struct virtio_media_sg_entry}. For more information, see
> > > +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> > > +
> > > +The device must not alter the pointer values provided by the driver, i.e.
> > > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > > +\textit{struct v4l2_plane} must be returned to the driver with the same value
> > > +as it was provided.
> > > +
> > > +\subparagraph{VIRTIO_OBJECT}
> > > +
> > > +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a virtio
> > > +object, just like they are by a \textit{DMABUF} in regular V4L2. Virtio objects
> > > +are 16-bytes UUIDs and do not fit in the placeholders for file descriptors, so
> > > +they follow their embedding data structure as needed and the device must
> > > +leave the V4L2 structure placeholder unchanged.
> > > +
> > > +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be added in
> > > +both the device-readable and device-writable section of the descriptor chain.
> > > +
> > I think you should use `Conversely to`.
> >
> > > +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory type can also
> > > +be exported as virtio objects for use with another virtio device using the
> > > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exportbuffer}
> > > +means that space for the UUID needs to be reserved right after that structure
> > > +
> > > +\subsubsection{Event Virtqueue}
> > > +
> > > +Events are a way for the device to inform the driver about asynchronous events
> > > +that it should know about. In virtio-media, they are used as a replacement for
> >
> > I think you can rewrite the first sentence as (I do not have a strong
> > opinion though):
> >
> > `Events are asynchronous notifications to the driver.`
> >
> > > +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and the polling
> > > +mechanism, which would be impractical to implement on top of virtio.
> > > +
> > > +\paragraph{Device Operation: Event header}
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > > +
> > > +/* Header for events queued by the device for the driver on the eventq. */
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
> > > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> > > +mentioned in the header is considered corrupted and automatically closed by
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
> > > +\item[\field{errno}] error code describing the kind of error that occurred.
> > > +\end{description}
> > > +
> > > +\paragraph{Device Operation: Dequeue buffer}
> > > +\label{sec:Device Types / Media Device / Device Operation / Dequeue buffer}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not being used anymore
> >
> > s/Signals/signals
> >
> > > +by the device and is returned to the driver.
> > > +
> > > +A \textit{struct virtio_media_event_dqbuf} event is queued on the eventq by the
> > > +device every time a buffer previously queued using the \textit{VIDIOC_QBUF}
> > > +ioctl is done being processed and can be used by the driver again. This is like
> > > +an implicit \textit{VIDIOC_DQBUF} ioctl.
> > > +
> >
> > I think this paragraph could be rewritten. If I understand correctly,
> > every time a buffer is queued using the VIDIOC_QBUF ioctl, the device
> > queues a virtio_media_event_dqbuf event in the eventq to indicate the
> > driver that the buffer can be used again.
> 
> Yes, that is more or less the idea. Once the buffer is filled (or
> displayed), and
> is ready to be reused, the device sends this event to the driver. I
> will rewrite this.
> 
> Also complied with all the other changes in your comment.
> 
> Thanks for taking the time to review!
> 
> >
> > > +\begin{lstlisting}
> > > +struct virtio_media_event_dqbuf {
> > > +    struct virtio_media_event_header hdr;
> > > +    struct v4l2_buffer buffer;
> > > +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffer that has been dequeued.
> > > +\item[\field{planes}] array of \textit{struct v4l2_plane} containing the plane information for multi-planar buffers.
> > > +\end{description}
> > > +
> > > +Pointer values in the \textit{struct v4l2_buffer} and \textit{struct v4l2_plane}
> > > +are meaningless and must be ignored by the driver. It is recommended that the
> > > +device sets them to NULL in order to avoid leaking potential device addresses.
> > > +
> > > +Note that in the case of a \field{USERPTR} buffer, the \textit{struct v4l2_buffer}
> > > +used as event payload is not followed by the buffer memory: since that memory
> > > +is the same that the driver submitted with the \textit{VIDIOC_QBUF}, it would
> > > +be redundant to have it here.
> > > +
> > > +\paragraph{Device Operation: Emit an event}
> > > +\label{sec:Device Types / Media Device / Device Operation / Emit an event}
> > > +
> > > +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been emitted for a session.
> > > +
> > > +A \textit{struct virtio_media_event_event} event is queued on the eventq by the
> > > +device every time an event the driver previously subscribed to using the
> > > +\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is like an
> > > +implicit \textit{VIDIOC_DQEVENT} ioctl.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_media_event_event {
> > > +    struct virtio_media_event_header hdr;
> > > +    struct v4l2_event event;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{event}] \textit{struct v4l2_event} describing the event that occurred.
> > > +\end{description}
> > > diff --git a/device-types/media/device-conformance.tex b/device-types/media/device-conformance.tex
> > > new file mode 100644
> > > index 0000000..1db3b03
> > > --- /dev/null
> > > +++ b/device-types/media/device-conformance.tex
> > > @@ -0,0 +1,10 @@
> > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conformance / Device Conformance / Media Device Conformance}
> > > +
> > > +A Media device MUST conform to the following normative statements:
> > > +
> > > +\begin{itemize}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Operation / Open device}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Operation / V4L2 ioctls}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > +\item \ref{devicenormative:Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}
> > > +\end{itemize}
> > > \ No newline at end of file
> > > diff --git a/device-types/media/driver-conformance.tex b/device-types/media/driver-conformance.tex
> > > new file mode 100644
> > > index 0000000..7e1d263
> > > --- /dev/null
> > > +++ b/device-types/media/driver-conformance.tex
> > > @@ -0,0 +1,8 @@
> > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Conformance / Driver Conformance / Media Driver Conformance}
> > > +
> > > +A Media device MUST conform to the following normative statements:
> > > +
> > > +\begin{itemize}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Operation / Command Virtqueue}
> > > +\item \ref{drivernormative:Device Types / Media Device / Device Operation / Close device}
> > > +\end{itemize}
> > > \ No newline at end of file
> > > --
> > > 2.47.0
> > >
> > >
> >
> 

