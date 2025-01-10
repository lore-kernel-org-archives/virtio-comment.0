Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1133987
	for <virtio-comment@lists.linux.dev>; Fri, 10 Jan 2025 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496299; cv=none; b=DcQJiVdq8Jy0p8rmoc2ZheoFLoQkL1d8xFKlabhDd7ezCo8nzzhF8g3L5GkPcs+E+/9RHYDDyydS2HyRYJ9dZ6nDVIRvyiCbB7ltUqnzAhn0CKe/Y6e9Kbt/4LT5YP0lv6XCHzEzThL9dwNWXAMrnqj0uMp2QwfMNaA9BBzFNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496299; c=relaxed/simple;
	bh=HXtdeSbAOS3Sqkcjy1sxLbB+kowzNhvJdRhqZOTuOSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnDi2Z1N5BQijO5ZMeShw2eS4YiYdd3ucsdrYtNNWmvQuLxjn7ci3uz6gftJRRJ4vPmuFSARp4uQlOSoAn4VAQRwxUmpUd8hsiQYv/fbwDc6jj9sPO8ymJIzMURwvAbFNFcxKtVeL/qs+i80jP+XYOp8KL6DVi1CYld8MQ0eDOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=idLA0Vno; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idLA0Vno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736496294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjMA1vrgeq6+QW5NsqCcouy4PqviM2r80uDuzEjBN3s=;
	b=idLA0VnoML0Lz1AWLABT4L4fUpQ26p9p5tLKqe9KtTDSP8FeIP4JIS6lYJKiL6ZTTBqOVG
	/r4BkcXhzGoImqx3nKUqEiyAunDy6KASXWr51mwj4TyfK2FwZPUEKKLqT8hIwRMEEzZZFQ
	kTKHO8Y5o+3xZyY1vq+OVywAhIaCjRc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-VC7zpfR6OGa_Qj21mFonyw-1; Fri, 10 Jan 2025 03:04:53 -0500
X-MC-Unique: VC7zpfR6OGa_Qj21mFonyw-1
X-Mimecast-MFC-AGG-ID: VC7zpfR6OGa_Qj21mFonyw
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee46799961so4832637a91.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Jan 2025 00:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496292; x=1737101092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjMA1vrgeq6+QW5NsqCcouy4PqviM2r80uDuzEjBN3s=;
        b=BlHVaueZAtoT7tkmIc4rXEneP8USSvEPWAv1h02SDmZDkKKXyF9yPpzYwEPXXEKRmO
         f0Guv3FUC/Ta4uVfNjZ7xUJ5B9lrEkYAmslv2UA2PtqyFfl7nH6rdTtr1vCLIYbJNZG7
         InAgu/mTi/Xy7Me3aYVk/4LqJrujqGZxeItOrXO18G02gTvbYNY8GydAPv2IgAXGG/M2
         JVkun6ANaorol6MkVbNpJHNBQ5naALP7dREVy6Igmy/MqzNsbSpUazkcQnc2MF2I7NdW
         T0qFLh2odm82scK8ZtmoqY/1qt1xvs6+QDA+m9yEgPoDE6Ui0vxbNZlKvY9KM90PVz2I
         kc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvTqhs5yihll5KS+qPpAcRPsZ+whW59e50ciepIKhIhQcT9Ganq1Z3gZo5l6qPZbzVLePQEQ110ijjnGWJHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqqCmAMTEMzxaJC1NpbW4OiFVKMBWnEKNElhTufD4gcmVRol0R
	pIl3bOWE6l4jb4q9m2IRouwlzONzotAokMd31UFj7jJp2ZuBPD6S4/TXZJ9a9BWvvrynnDIplCa
	+rYwxxsDwS7rDIe8HFGxX4O0oA7yNcTBEFYSMlykuNdMsKAGAak7sFxRwMn5njjFmcLQHWe4P33
	+9BvCX3zUBLoiDcpcWWVwcZHw1sae3G+MBjSo+BXw=
X-Gm-Gg: ASbGncuuouxWgqiW3e9OKZCtywgBs+FU76hQAW1ItKqAb1FLJZ5mNKt+z8dpiSckunD
	gEvq5YKm9rSG+GZDL2IVw6tdPOcHrOlFe8aZ9endL
X-Received: by 2002:a17:90b:544b:b0:2ee:9902:18b4 with SMTP id 98e67ed59e1d1-2f548f61fe6mr14048143a91.27.1736496291590;
        Fri, 10 Jan 2025 00:04:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaCKkIzkj631Ul0U2szUDwQABxDHpQhvYqhcbau6vRNHFQ6ziNG+pd/Qi22KQC0wNnJfNNobmhfMFyq1VC4/o=
X-Received: by 2002:a17:90b:544b:b0:2ee:9902:18b4 with SMTP id
 98e67ed59e1d1-2f548f61fe6mr14048072a91.27.1736496290702; Fri, 10 Jan 2025
 00:04:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107154930.118763-1-aesteve@redhat.com> <20241107154930.118763-2-aesteve@redhat.com>
 <Z07Q5GjhBYbpXtkF@fedora> <CADSE00KexjcoYaROCc9-oWBtjW-FccYKz-2=2aHNBtwcg53C6Q@mail.gmail.com>
 <Z4Ab/E3d8S6R21W2@fedora> <20250109181346-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250109181346-mutt-send-email-mst@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 10 Jan 2025 09:04:39 +0100
X-Gm-Features: AbW1kvbn26a1TnHb0hLcoxAyu2e_4QwdCTLnjinUrxFFaGQxt2cpP_B7tprFpis
Message-ID: <CADSE00L6i9HhyZuZ34bz=H-2_AcBVNhTJH85yLCJeAhb6wqmrg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] virtio-media: Add virtio media device specification
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, virtio-comment@lists.linux.dev, 
	eballetb@redhat.com, daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, 
	dverkamp@chromium.org, ribalda@google.com, alex.bennee@linaro.org, 
	nicolas.dufresne@collabora.com, acourbot@chromium.org, cohuck@redhat.com, 
	changyeon@google.com, hverkuil@xs4all.nl, gurchetansingh@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UiKaKjeaxPoovheA5CUJm0WIjw83Ujz-DvRe_JOTneM_1736496292
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 12:15=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Thu, Jan 09, 2025 at 07:57:00PM +0100, Matias Ezequiel Vara Larsen wro=
te:
> > On Tue, Jan 07, 2025 at 02:12:33PM +0100, Albert Esteve wrote:
> > > Hi Matias,
> > >
> > > On Tue, Dec 3, 2024 at 10:35=E2=80=AFAM Matias Ezequiel Vara Larsen
> > > <mvaralar@redhat.com> wrote:
> > > >
> > > > Hello Albert,
> > > >
> > > > I added some minor comments below. I may need to read it again sinc=
e
> > > > there are some points that I did not understand completely.
> > > >
> > > > On Thu, Nov 07, 2024 at 04:49:30PM +0100, Albert Esteve wrote:
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
> > > >
> > > > Just to clarify, I would add a sentence here like:
> > > > `A driver executes the following sequence to initialize a device:`
> > > >
> > > > > +\begin{enumerate}
> > > > > +\item Read the \field{device_caps} and \field{device_type} field=
s
> > > > > +from the configuration layout to identify the device.
> > > > > +\item Set up the \field{commandq} and \field{eventq}.
> > > >
> > > > Maybe add `... \field{commandq} and \field{eventq} virtqueues`.
> > > >
> > > > > +\item May open a session (see Section \ref{sec:Device Operation:=
 Command Virtqueue: Sessions})
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
> > > >
> > > > I would rewrite it as below but I do not have a strong opinion:
> > > >
> > > > `The driver enqueues commands in the command queue for the device t=
o
> > > > process them.`
> > > >
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/gen-errors.html}{Linux kernel error codes}.
> > > > > +For instance, a command that contains invalid options will retur=
n \textit{EINVAL}.
> > > > > +
> > > >
> > > > I think here is not the command that returns EINVAL but the device =
when
> > > > trying to process a command that has an invalid option.
> > > >
> > > > > +Events are sent on the event queue by the device for the driver =
to handle.
> > > >
> > > > I would rewrite it as below but I do not have a strong opinion:
> > > >
> > > > `The device enqueues events in the event queue for the driver to pr=
ocess
> > > > them.`
> > > >
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
> > > > > +     le32 cmd;
> > > > > +     le32 __reserved;
> > > > > +};
> > > > > +
> > > > > +/* Header for all virtio responses from the device to the driver=
 on the commandq. */
> > > > > +struct virtio_media_resp_header {
> > > > > +     le32 status;
> > > > > +     le32 __reserved;
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
> > > >
> > > > I would rewrite it as but I do not have a strong opinion about it:
> > > >
> > > > `When the device executes the command successfully, the value of th=
e status
> > > > field is 0. When the device fails to execute the command, the value=
 of
> > > > the status field is one of the standard Linux error codes.`
> > > >
> > > > > +
> > > > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue=
: Sessions}{Device Types / Media Device / Device Operation / Command Virtqu=
eue}
> > > > > +
> > > > > +Sessions are how the device is multiplexed, allowing several dis=
tinct works to
> > > > > +take place simultaneously. Before start operating, the driver ne=
eds to open a
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
> > > >
> > > > I would rewrite it shorter as:
> > > >
> > > > `session_id identifies the session to close.`
> > > >
> > > > > +\end{description}
> > > > > +
> > > > > +\drivernormative{\subparagraph}{Device Operation: Close device}{=
Device Types / Media Device / Device Operation / Close device}
> > > > > +
> > > > > +The session ID SHALL NOT be used again after queueing this comma=
nd.
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
> > > > > +descriptors that both point to the same buffer. This mimics the =
behavior of
> > > > > +V4L2 ioctls where the data is only passed once and used as both =
input and
> > > > > +output by the kernel.
> > > > > +
> >
> > I think you're suggesting that two descriptors in the descriptor ring
> > point to the same memory address. For instance, if the chain consists o=
f
> > only two descriptors, the first one would be read-only and the second
> > one would be write-only, both pointing to the same memory location.
> > According to my understanding, this behavior is allowed by the
> > specification as long as two separate descriptors are used. However, I
> > think it's worth noting that the specification does not explicitly
> > define a descriptor for simultaneous reading and writing.
> >
> > It may be helpful to add a note in a new patch to inform other
> > developers about this potential optimization. Nevertheless, it's crucia=
l
> > for both the driver and the device to understand it when accessing the
> > data to avoid any issues.
>
>
> Except please talk about buffers not descriptors.
> Definitely not descriptor chains.
> descriptors are an implementation detail.

Hi Matias and Michael,

Thanks, I will change the text in this patch to avoid using descriptors.

Also, I'll consider posting a separate patch to make that
clarification in the spec.

>
>
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
> > > > > +
> > > > > +\subparagraph{Handling of pointers in ioctl payload}
> > > > > +
> > > > > +A few structures used as ioctl payloads contain pointers to furt=
her
> > > > > +data needed for the ioctl. There are notably:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item The \field{planes} pointer of
> > > >
> > > > Do you mean `points to`?
> > >
> > > Here we specify the type ""of"" the data the pointer is pointing to. =
I
> > > feel this construction is correct as is, although 'points to' would
> > > mean the same, and be equally valid. I will keep it as is unless ther=
e
> > > is a strong preference.
> > >
> >
> > Oh, I see. I missunderstood the sentence.
> >
> > >
> > > >
> > > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media=
/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > > > +which size is determined by the length member.
> > > > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_co=
ntrols}, which
> > > > > +size is determined by the count member.
> > > > > +\end{itemize}
> > > > > +
> > > > > +If the size of the pointed area is determined to be non-zero, th=
en the main
> > > > > +payload is immediately followed by the pointed data in their ord=
er of
> > > > > +appearance in the structure, and the pointer value itself is ign=
ored by the
> > > > > +device, which must also return the value initially passed by the=
 driver.
> > > > > +
> > > > > +\subparagraph{Handling of pointers to userspace memory}
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
> > > > > +     le64 start;
> > > > > +     le32 len;
> > > > > +     le32 __reserved;
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
> > > > > +     struct virtio_media_cmd_header hdr;
> > > > > +     le32 session_id;
> > > > > +     le32 flags;
> > > > > +     le32 offset;
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
> > > > > +\end{description}
> > > > > +
> > > > > +\paragraph{Device Operation: Unmapping a MMAP buffer}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously =
mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> > > > > +
> > > >
> > > > s/Unmap/unmaps
> > > >
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_cmd_munmap {
> > > > > +    struct virtio_media_cmd_header hdr;
> > > > > +    le64 driver_addr;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{driver_addr}] offset into SHM region ID 0 previousl=
y returned by
> > > > > +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been prev=
iously mapped.
> > > > > +\end{description}
> > > > > +
> > > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \te=
xtit{virtio_media_resp_munmap}.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_resp_munmap {
> > > > > +    struct virtio_media_resp_header hdr;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\devicenormative{\subparagraph}{Device Operation: Unmapping a MM=
AP buffer}{Device Types / Media Device / Device Operation / Unmapping a MMA=
P buffer}
> > > > > +
> > > > > +The device MUST keep mappings performed using \textit{VIRTIO_MED=
IA_CMD_MMAP}
> > > > > +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if =
the buffers or
> > > > > +session they belong to are released or closed by the driver.
> > > > > +
> > > > > +\paragraph{Device Operation: Memory Types}
> > > > > +
> > > > > +The semantics of the three V4L2 memory types (\textit{MMAP}, \te=
xtit{USERPTR}
> > > > > +and \textit{DMABUF}) can easily be mapped to both driver and dev=
ice context.
> > > > > +
> > > > > +However, the driver shall only advertise support for \textit{MMA=
P} and
> > > > > +\textit{DMABUF} to the guest userspace. \textit{USERPTR} is mere=
ly employed to
> > > > > +discern \textit{SHARED_PAGES} buffers, similar to how \textit{DM=
ABUF} is used
> > > > > +to signify \textit{VIRTIO_OBJECT} buffers in the driver and devi=
ce context.
> > > > > +
> > > > > +\subparagraph{MMAP}
> > > > > +
> > > > > +In virtio-media, \textit{MMAP} buffers are provisioned by the de=
vice, just like
> > > > > +they are by the kernel in regular V4L2. Similarly to how userspa=
ce can map a
> > > > > +\textit{MMAP} buffer into its address space using mmap and munma=
p, the
> > > > > +virtio-media driver can map device buffers into the driver space=
 by queueing the
> > > > > +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_=
media_cmd_munmap}
> > > > > +commands to the commandq.
> > > > > +
> > > > > +\subparagraph{SHARED_PAGES}
> > > > > +
> > > > > +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned b=
y the driver,
> > > > > +and use guest physical addresses. Instances of \textit{struct v4=
l2_buffer}
> > > > > +and \textit{struct v4l2_plane} of this type are followed by a li=
st of
> > > >
> > > > I think here is `these types`.
> > >
> > > It refers to the memory type. I will clarify in the text.
> > >
> > >
> > > >
> > > > > +\textit{struct virtio_media_sg_entry}. For more information, see
> > > > > +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace m=
emory}
> > > > > +
> > > > > +The device must not alter the pointer values provided by the dri=
ver, i.e.
> > > > > +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> > > > > +\textit{struct v4l2_plane} must be returned to the driver with t=
he same value
> > > > > +as it was provided.
> > > > > +
> > > > > +\subparagraph{VIRTIO_OBJECT}
> > > > > +
> > > > > +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned =
by a virtio
> > > > > +object, just like they are by a \textit{DMABUF} in regular V4L2.=
 Virtio objects
> > > > > +are 16-bytes UUIDs and do not fit in the placeholders for file d=
escriptors, so
> > > > > +they follow their embedding data structure as needed and the dev=
ice must
> > > > > +leave the V4L2 structure placeholder unchanged.
> > > > > +
> > > > > +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need =
to be added in
> > > > > +both the device-readable and device-writable section of the desc=
riptor chain.
> > > > > +
> > > > I think you should use `Conversely to`.
> > > >
> > > > > +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memo=
ry type can also
> > > > > +be exported as virtio objects for use with another virtio device=
 using the
> > > > > +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2=
_exportbuffer}
> > > > > +means that space for the UUID needs to be reserved right after t=
hat structure
> > > > > +
> > > > > +\subsubsection{Event Virtqueue}
> > > > > +
> > > > > +Events are a way for the device to inform the driver about async=
hronous events
> > > > > +that it should know about. In virtio-media, they are used as a r=
eplacement for
> > > >
> > > > I think you can rewrite the first sentence as (I do not have a stro=
ng
> > > > opinion though):
> > > >
> > > > `Events are asynchronous notifications to the driver.`
> > > >
> > > > > +the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} ioctls and=
 the polling
> > > > > +mechanism, which would be impractical to implement on top of vir=
tio.
> > > > > +
> > > > > +\paragraph{Device Operation: Event header}
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > > > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > > > > +
> > > > > +/* Header for events queued by the device for the driver on the =
eventq. */
> > > > > +struct virtio_media_event_header {
> > > > > +    le32 event;
> > > > > +    le32 session_id;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> > > > > +\item[\field{session_id}] ID of the session the event applies to=
.
> > > > > +\end{description}
> > > > > +
> > > > > +\paragraph{Device Operation: Device-side error}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the s=
ession
> > > > > +mentioned in the header is considered corrupted and automaticall=
y closed by
> > > > > +the device.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_event_error {
> > > > > +    struct virtio_media_event_header hdr;
> > > > > +    le32 errno;
> > > > > +    le32 __reserved;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{errno}] error code describing the kind of error tha=
t occurred.
> > > > > +\end{description}
> > > > > +
> > > > > +\paragraph{Device Operation: Dequeue buffer}
> > > > > +\label{sec:Device Types / Media Device / Device Operation / Dequ=
eue buffer}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_EVT_DQBUF} Signals that a buffer is not bei=
ng used anymore
> > > >
> > > > s/Signals/signals
> > > >
> > > > > +by the device and is returned to the driver.
> > > > > +
> > > > > +A \textit{struct virtio_media_event_dqbuf} event is queued on th=
e eventq by the
> > > > > +device every time a buffer previously queued using the \textit{V=
IDIOC_QBUF}
> > > > > +ioctl is done being processed and can be used by the driver agai=
n. This is like
> > > > > +an implicit \textit{VIDIOC_DQBUF} ioctl.
> > > > > +
> > > >
> > > > I think this paragraph could be rewritten. If I understand correctl=
y,
> > > > every time a buffer is queued using the VIDIOC_QBUF ioctl, the devi=
ce
> > > > queues a virtio_media_event_dqbuf event in the eventq to indicate t=
he
> > > > driver that the buffer can be used again.
> > >
> > > Yes, that is more or less the idea. Once the buffer is filled (or
> > > displayed), and
> > > is ready to be reused, the device sends this event to the driver. I
> > > will rewrite this.
> > >
> > > Also complied with all the other changes in your comment.
> > >
> > > Thanks for taking the time to review!
> > >
> > > >
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_event_dqbuf {
> > > > > +    struct virtio_media_event_header hdr;
> > > > > +    struct v4l2_buffer buffer;
> > > > > +    struct v4l2_plane planes[VIDEO_MAX_PLANES];
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{buffer}] \textit{struct v4l2_buffer} describing the=
 buffer that has been dequeued.
> > > > > +\item[\field{planes}] array of \textit{struct v4l2_plane} contai=
ning the plane information for multi-planar buffers.
> > > > > +\end{description}
> > > > > +
> > > > > +Pointer values in the \textit{struct v4l2_buffer} and \textit{st=
ruct v4l2_plane}
> > > > > +are meaningless and must be ignored by the driver. It is recomme=
nded that the
> > > > > +device sets them to NULL in order to avoid leaking potential dev=
ice addresses.
> > > > > +
> > > > > +Note that in the case of a \field{USERPTR} buffer, the \textit{s=
truct v4l2_buffer}
> > > > > +used as event payload is not followed by the buffer memory: sinc=
e that memory
> > > > > +is the same that the driver submitted with the \textit{VIDIOC_QB=
UF}, it would
> > > > > +be redundant to have it here.
> > > > > +
> > > > > +\paragraph{Device Operation: Emit an event}
> > > > > +\label{sec:Device Types / Media Device / Device Operation / Emit=
 an event}
> > > > > +
> > > > > +\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has be=
en emitted for a session.
> > > > > +
> > > > > +A \textit{struct virtio_media_event_event} event is queued on th=
e eventq by the
> > > > > +device every time an event the driver previously subscribed to u=
sing the
> > > > > +\textit{VIDIOC_SUBSCRIBE_EVENT} ioctl has been signaled. This is=
 like an
> > > > > +implicit \textit{VIDIOC_DQEVENT} ioctl.
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_media_event_event {
> > > > > +    struct virtio_media_event_header hdr;
> > > > > +    struct v4l2_event event;
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +\begin{description}
> > > > > +\item[\field{event}] \textit{struct v4l2_event} describing the e=
vent that occurred.
> > > > > +\end{description}
> > > > > diff --git a/device-types/media/device-conformance.tex b/device-t=
ypes/media/device-conformance.tex
> > > > > new file mode 100644
> > > > > index 0000000..1db3b03
> > > > > --- /dev/null
> > > > > +++ b/device-types/media/device-conformance.tex
> > > > > @@ -0,0 +1,10 @@
> > > > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Co=
nformance / Device Conformance / Media Device Conformance}
> > > > > +
> > > > > +A Media device MUST conform to the following normative statement=
s:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item \ref{devicenormative:Device Types / Media Device / Device =
Operation / Open device}
> > > > > +\item \ref{devicenormative:Device Types / Media Device / Device =
Operation / V4L2 ioctls}
> > > > > +\item \ref{devicenormative:Device Types / Media Device / Device =
Operation / Unsupported ioctls}
> > > > > +\item \ref{devicenormative:Device Types / Media Device / Device =
Operation / Unmapping a MMAP buffer}
> > > > > +\end{itemize}
> > > > > \ No newline at end of file
> > > > > diff --git a/device-types/media/driver-conformance.tex b/device-t=
ypes/media/driver-conformance.tex
> > > > > new file mode 100644
> > > > > index 0000000..7e1d263
> > > > > --- /dev/null
> > > > > +++ b/device-types/media/driver-conformance.tex
> > > > > @@ -0,0 +1,8 @@
> > > > > +\conformance{\subsection}{Media Device Conformance}\label{sec:Co=
nformance / Driver Conformance / Media Driver Conformance}
> > > > > +
> > > > > +A Media device MUST conform to the following normative statement=
s:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item \ref{drivernormative:Device Types / Media Device / Device =
Operation / Command Virtqueue}
> > > > > +\item \ref{drivernormative:Device Types / Media Device / Device =
Operation / Close device}
> > > > > +\end{itemize}
> > > > > \ No newline at end of file
> > > > > --
> > > > > 2.47.0
> > > > >
> > > > >
> > > >
> > >
>

