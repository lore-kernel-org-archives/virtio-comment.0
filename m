Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EB25A63C
	for <virtio-comment@lists.linux.dev>; Fri, 17 Jan 2025 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737092800; cv=none; b=WVhsLNh4CWePoNPtRP4qOCjK2qTNN5wWFNU39S4XT2/kKuJtb9KBiwrKN67QosKpKIqIPEdcHBc0qfELRj4HHhvS7Rg95d/CYeKNtTJXx1SOQDFX4LsE3/xByxwghRHYRCgp/e81QolNOz7V6ACuo82KIsPLDS9dn7EaO2U2u9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737092800; c=relaxed/simple;
	bh=qnQaldsQUAQdyKp6l6cvvZDUXNjE7c3rBiI6MBCI59U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=udiQliAaqPjVfJTJ40yIo6unnDj1MZkmHmtbPxajW8fiu1NWYP+lsodc0AT4DEHPFjjLW0omYM2OJSpqTSMbCKaTesoxekA06A/DYKGS/J7VsLMsnZx0v8VzBqY6HrfUSwnMnSgfh14dPexDEkJL2u8VP9fG0pMFrID/oUHe4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDXI5qPS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDXI5qPS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so29220175ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 16 Jan 2025 21:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737092797; x=1737697597; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hJTl+uUg7Mckrl0KZtsGzYKY/hlI5Nl0xnqgLtHK5Y=;
        b=eDXI5qPSQn2WuBd3b8+KbNpc7Nw9zS7FA3Vv723/QNOqWhetklN8HKa0WAHX1MEWtD
         wXFl/kkpjDN/l92r10jvLeV6cNY0AG3rbWHnqQBiIgwNR8PVcVi2qN/DDVNYbwJNeKHs
         F3EETt0W+ctArSDr3ozaYMMbOYoKqmRCGaUpz9Ane35w54smxss2X8UH1b9JAAwtCTgS
         n6QWYNY90tX48s8VSWYEAnHl04Qcg4EIZQbVMKg5NyHPLSeK6Cz0rxpLAwiR1C87DlIM
         HX4FGbcxhh+vUls8aR+iNCS3fXm5TiGr3kzKWRzeRJi1QwnT3CtLUJ78eFEY1t9vFcYA
         +1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737092797; x=1737697597;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hJTl+uUg7Mckrl0KZtsGzYKY/hlI5Nl0xnqgLtHK5Y=;
        b=uaI78w7nF9vPX93pfmH19RwpCP5Clx6o6F8kQqga6n3fGOZ6KX7DVGXOdgwbvKo8Bx
         GHjsJjpTKplNUQewRaahlS8fi1wUvB7YpE2LNNGwE5yZYMQJTZFPw72NbLrSlSTvpBNw
         1ZfJbt9UkqY19ZfT1UUApC6B2yXgBhJnsxwSEExI5IgGtxBjBVk8UcFWYIHgwWpf5tzS
         t7oSEIrTS2AyeQjgqNehpK7IPHvMlTxVrpyodZFrNtKWUGrbb/l+I3ZQYW8sIe4dCf73
         TH0CJY5LDGY/HQfLTUk5SF3b+dnpqbxP6Mrd9EUfL71CddgrP7Eex5M979tsm2AXMpnM
         uHMA==
X-Gm-Message-State: AOJu0YxRa3zIAeBKTedlnNmYbMIy7EfxBQzcwRT+NsZr2DCfXHnGW0ed
	1fd0GS/amnLACm7mEt46T+YAKrZUm+XJJURVp2HdpZ+/pacHwnNe
X-Gm-Gg: ASbGncvb1Fs3ZlS5lo8RHLSXAzfQcsy9etzVxTeh6QrhW/NBbPmVoKmiB2ZPDqbsxSF
	Z8rLCXnIvyLA4GGlphxL8AXzQCERiDd3JDbQMcFsOSVAxzG4tjVNbid+qq2f6kVq5k6XjDCOJjz
	kwOlxoX2vRenL3QSJOKmmo75JmG8jvtHwu/Cve/MZAWLP46oNaAxZCKMFlOZiOZKLtSfhVhatCR
	WTWKsbpxNaThNY76VzIPixfVFY4bMPC01C/rvKnSGl+FBfV
X-Google-Smtp-Source: AGHT+IG105LfZJDmVMnql1RY8WBPICDg7BvjG6YTXH/afF6/cgY8C0d34VYlpy89F91lcQpB6FDBUw==
X-Received: by 2002:a05:6a20:4ca6:b0:1dc:e8d:c8f0 with SMTP id adf61e73a8af0-1eb215895f6mr1836131637.29.1737092796646;
        Thu, 16 Jan 2025 21:46:36 -0800 (PST)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa751asm958827b3a.162.2025.01.16.21.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 21:46:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 14:46:29 +0900
Message-Id: <D74402ZPCM0C.2H7L6GQ5CR07I@gmail.com>
Cc: <virtio-comment@lists.linux.dev>, <eballetb@redhat.com>,
 <daniel.almeida@collabora.com>, <agordeev@qti.qualcomm.com>,
 <dverkamp@chromium.org>, <ribalda@google.com>, <alex.bennee@linaro.org>,
 <mst@redhat.com>, <nicolas.dufresne@collabora.com>, <cohuck@redhat.com>,
 <changyeon@google.com>, <hverkuil@xs4all.nl>, <gurchetansingh@google.com>
Subject: Re: [PATCH v4 1/1] virtio-media: Add virtio media device
 specification
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Alexandre Courbot" <gnurou@gmail.com>, "Albert Esteve"
 <aesteve@redhat.com>, "Alexandre Courbot" <acourbot@chromium.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241107154930.118763-1-aesteve@redhat.com>
 <20241107154930.118763-2-aesteve@redhat.com>
 <CAPBb6MVDgdBiqV0J4DXKX2u-KKpBs+119X7obNFsDpKjH0iarg@mail.gmail.com>
 <CADSE00KU+L-fByz+rEdMtUY1bg4hjyuBRkZhZy6Na5v0z6q1+Q@mail.gmail.com>
 <CADSE00+eLP+PbrmSiyvao4bJeBRSDCSBTbFUMdPomxngwz6D+w@mail.gmail.com>
 <D6YAQ9B0IPR7.1ZYKATYW5K8K7@gmail.com>
In-Reply-To: <D6YAQ9B0IPR7.1ZYKATYW5K8K7@gmail.com>

On Fri Jan 10, 2025 at 6:46 PM JST, Alexandre Courbot wrote:
> Hi Albert,
>
> On Wed Jan 8, 2025 at 1:25 AM JST, Albert Esteve wrote:
> > Hi Alexandre,
> >
> > Thanks for your comments! Partially covered here, responded inline
> > below. I'll go through the rest tomorrow.
> >
> > On Tue, Jan 7, 2025 at 8:00=E2=80=AFAM Alexandre Courbot <acourbot@chro=
mium.org> wrote:
> > >
> > > Hi Albert,
> > >
> > > Thanks again for driving this. The current version looks good to me,
> > > but here are a few things I found while doing another pass.
> > >
> > > On Fri, Nov 8, 2024 at 12:50=E2=80=AFAM Albert Esteve <aesteve@redhat=
.com> wrote:
> > > >
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
> > > >  device-types/media/description.tex        | 575 ++++++++++++++++++=
++++
> > > >  device-types/media/device-conformance.tex |  10 +
> > > >  device-types/media/driver-conformance.tex |   8 +
> > > >  5 files changed, 603 insertions(+), 4 deletions(-)
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
> > > > index 0000000..d20d2f6
> > > > --- /dev/null
> > > > +++ b/device-types/media/description.tex
> > > > @@ -0,0 +1,575 @@
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
> > > > +\begin{enumerate}
> > > > +\item Read the \field{device_caps} and \field{device_type} fields
> > > > +from the configuration layout to identify the device.
> > > > +\item Set up the \field{commandq} and \field{eventq}.
> > > > +\item May open a session (see Section \ref{sec:Device Operation: C=
ommand Virtqueue: Sessions})
> > >
> > > This reference does not resolve.
> > >
> > > > +to use the device and send V4L2 ioctls in order to receive more in=
formation
> > > > +about the device, such as supported formats or controls.
> > > > +\end{enumerate}
> > > > +
> > > > +\subsection{Device Operation}\label{sec:Device Types / Media Devic=
e / Device Operation}
> > > > +
> > > > +Commands are queued on the command queue by the driver for the dev=
ice to
> > > > +process. The errors returned by each command are standard
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/g=
en-errors.html}{Linux kernel error codes}.
> > > > +For instance, a command that contains invalid options will return =
\textit{EINVAL}.
> > > > +
> > > > +Events are sent on the event queue by the device for the driver to=
 handle.
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
> > > > +       le32 cmd;
> > > > +       le32 __reserved;
> > > > +};
> > > > +
> > > > +/* Header for all virtio responses from the device to the driver o=
n the commandq. */
> > > > +struct virtio_media_resp_header {
> > > > +       le32 status;
> > > > +       le32 __reserved;
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
> > > > +The status field can take 0 if the command was successful, or one =
of the
> > > > +standard Linux error codes if it was not.
> > > > +
> > > > +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: =
Sessions}{Device Types / Media Device / Device Operation / Command Virtqueu=
e}
> > > > +
> > > > +Sessions are how the device is multiplexed, allowing several disti=
nct works to
> > > > +take place simultaneously. Before start operating, the driver need=
s to open a
> > >
> > > nit: "Before starting operation" maybe?
> > >
> > > > +session. This is equivalent to opening the \textit{/dev/videoX} fi=
le of the
> > > > +V4L2 device. Each session gets a unique ID assigned, which can be =
then used
> > > > +to perform actions on it.
> > > > +
> > > > +\paragraph{Device Operation: Open device}
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
> > > > +\item[\field{session_id}] specifies an identifier for the session =
to close.
> > > > +\end{description}
> > > > +
> > > > +\drivernormative{\subparagraph}{Device Operation: Close device}{De=
vice Types / Media Device / Device Operation / Close device}
> > > > +
> > > > +The session ID SHALL NOT be used again after queueing this command=
.
> > >
> > > ... until it has been obtained again through a subsequent
> > > VIRTIO_MEDIA_CMD_OPEN call. (session IDs can be recycled ; this shoul=
d
> > > go without saying but it doesn't hurt to mention it)
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
> > > > +    /* Followed by the relevant ioctl payload as defined in the ma=
cro */
> > >
> > > "ioctl command payload" maybe.
> > >
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
> > > > +Note that although most architectures use this format, there
> > > > +are some architecture-specific encoding differences.
> > > > +See \textit{include/ARCH/ioctl.h} for more details.
> > >
> > > Is the last sentence needed? videodev2.h is not architecture-specific=
,
> > > so I don't think this adds anything for our purpose?
> >
> > Probably not. The idea was to highlight that in some cases the payload
> > may vary depending on the underlying architecture for some
> > ioctls, due to these architecture differences.
> > But I agree that it is a detail that should not concern to those wantin=
g to
> > implement the specs. So I will remove the lines.
>
> Thanks. My concern was that reader would try to find reasons to care
> about architecture when all they need to do is look at the ioctls
> declarations from videodev2.h and copy the second field.
>
> >
> > >
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
> > > > +    /* Followed by the ioctl payload as defined in the macro */
> > >
> > > Similarly, "ioctl response payload"?
> > >
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
> > > > +
> > > > +A common optimization for \textit{WR} ioctls is to provide the pay=
load using
> > >
> > > s/common/possible? Unless this is indeed commonly used by other
> > > devices, but I doubt it.
> > >
> > > > +descriptors that both point to the same buffer. This mimics the be=
havior of
> > > > +V4L2 ioctls where the data is only passed once and used as both in=
put and
> > > > +output by the kernel.
> > >
> > > That's actually something I'd like to confirm - is it ok to have the
> > > device-readable and device-writable descriptors point to the same
> > > memory? I don't see why it wouldn't, but in case this is a problem we
> > > may want to change this and update the driver accordingly.
>
> Thanks to Matias and Michael's confirmation it seems there is no problem
> doing this.
>
> > >
> > > > +
> > > > +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Dev=
ice Types / Media Device / Device Operation / V4L2 ioctls}
> > > > +
> > > > +In case of success of a device-writable ioctl, the device MUST alw=
ays write the
> > > > +payload in the device-writable part of the descriptor chain.
> > > > +
> > > > +In case of failure of a device-writable ioctl, the device is free =
to write the
> > > > +payload in the device-writable part of the descriptor chain or not=
. Some errors
> > > > +may still result in the payload being updated, and in this case th=
e device is
> > > > +expected to write the updated payload. If the device has not writt=
en the
> > > > +payload after an error (i.e., only the header is returned), the dr=
iver MUST
> > > > +assume that the payload has not been modified.
> > >
> > > This last sentence sounds like it is driver-normative, not device-nor=
mative.
> > >
> > > > +
> > > > +\subparagraph{Handling of pointers in ioctl payload}
> > > > +
> > > > +A few structures used as ioctl payloads contain pointers to furthe=
r
> > > > +data needed for the ioctl. There are notably:
> > > > +
> > > > +\begin{itemize}
> > > > +\item The \field{planes} pointer of
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> > > > +which size is determined by the length member.
> > > > +\item The \field{controls} pointer of \textit{struct v4l2_ext_cont=
rols}, which
> > >
> > > Since `struct v4l2_buffer` above is a link, do we want to one for
> > > `struct v4l2_ext_controls` as well?
> > >
> > > > +size is determined by the count member.
> > > > +\end{itemize}
> > > > +
> > > > +If the size of the pointed area is determined to be non-zero, then=
 the main
> > >
> > > nit: "If the size of the pointed area is non-zero, ..."
> > >
> > > > +payload is immediately followed by the pointed data in their order=
 of
> > > > +appearance in the structure, and the pointer value itself is ignor=
ed by the
> > > > +device, which must also return the value initially passed by the d=
river.
> > > > +
> > > > +\subparagraph{Handling of pointers to userspace memory}
> > >
> > > s/userspace/guest ?
> >
> > To me this refers to the fact that the original fields in the related
> > structures refer to userspace memory (outside of the host/guest
> > context). I think I'd keep it as is.
> >
> > Maybe changing the titles of this and the previous sections to:
> > \subparagraph{Handling of pointers to data in ioctl payload}
> > and
> > \subparagraph{Handling of pointers to userspace memory in ioctl payload=
}
> >
> > wdyt?
>
> Sounds good to me.
>
> >
> > >
> > > I'd also suggest adding a "(SHARED_PAGES memory type)" at the end of
> > > the title to make it explicit that this is specific to this particula=
r
> > > memory type.
> >
> > Maybe a clarification in the first paragraph (and a link to the related
> > section) would be enough? I feel having a memory type in the title when
> > this concept has not been yet introduced may be confusing. Having that
> > in the text allows to link the section and jump ahead to relate both co=
ncepts.
>
> Agreed, a clarification in the text is probably better for providing
> context.
>
> >
> > >
> > > > +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace m=
emory}
> > > > +
> > > > +A few pointers are special in that they point to userspace memory =
in the
> > > > +original V4L2 specification. They are:
> > > > +
> > > > +\begin{itemize}
> > > > +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} =
and
> > > > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v=
4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> > > > +(technically an unsigned long, but designated a userspace address)=
.
> > > > +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> > > > +\end{itemize}
> > >
> > > Same as above, let's either add links to all V4L2 structs, or just
> > > remove them altogether since we point to the documentation in the
> > > introduction anyway.
> >
> > I added the link for your comment above, but I think with that change,
> > this is ok as it is. I only add the link to those structs that have
> > not been linked before.
> >
> > >
> > > > +
> > > > +These pointers can cover large areas of scattered memory, which ha=
s the
> > > > +potential to require more descriptors than the virtio queue can pr=
ovide. For
> > > > +these particular pointers only, a list of \textit{struct virtio_me=
dia_sg_entry}
> > > > +that covers the needed amount of memory for the pointer is used in=
stead of
> > > > +using descriptors to map the pointed memory directly.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_sg_entry {
> > > > +       le64 start;
> > > > +       le32 len;
> > > > +       le32 __reserved;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +For each such pointer to read, the device reads as many SG entries=
 as needed
> > > > +to cover the length of the pointed buffer, as described by its par=
ent
> > > > +structure (\field{length} member of \textit{struct v4l2_buffer} or
> > > > +\textit{struct v4l2_plane} for buffer memory, and \field{size} mem=
ber of
> > > > +\textit{struct v4l2_ext_control} for control data).
> > > > +
> > > > +Since the device never needs to modify the list of SG entries, it =
is only
> > > > +provided by the driver in the device-readable section of the descr=
iptor chain,
> > > > +and not repeated in the device-writable section, even for WR ioctl=
s.
> > > > +
> > > > +\subparagraph{Unsupported ioctls}
> > > > +
> > > > +A few ioctls are replaced by other, more suitable mechanisms.
> > > > +
> > > > +\begin{itemize}
> > > > +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configur=
ation area
> > > > +(see \ref{sec:Device Types / Media Device / Device Configuration L=
ayout}).
> > > > +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> > > > +(see \ref{sec:Device Types / Media Device / Device Operation / Deq=
ueue buffer}).
> > > > +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> > > > +(see \ref{sec:Device Types / Media Device / Device Operation / Emi=
t an event}).
> > > > +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} ar=
e deprecated
> > > > +and replaced by the controls of the JPEG class.
> > > > +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and sh=
all not be
> > > > +implemented by the device.
> > > > +\end{itemize}
> > > > +
> > > > +\devicenormative{\subparagraph}{Device Operation: Unsupported ioct=
ls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> > > > +
> > > > +When a request is not supported, the device MUST return \textit{EN=
OTTY},
> > > > +which corresponds with the response for unknown ioctls.
> > >
> > > s/with/to
> > >
> > > > +
> > > > +\paragraph{Device Operation: Mapping a MMAP buffer}
> > > > +
> > > > +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer i=
nto the
> > > > +driver's address space.
> > > > +
> > > > +Shared memory region ID 0 is used to map MMAP buffers with
> > > > +the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> > > > +
> > > > +struct virtio_media_cmd_mmap {
> > > > +       struct virtio_media_cmd_header hdr;
> > > > +       le32 session_id;
> > >
> > > session_id is not mentioned in the member description below.
> > >
> > > > +       le32 flags;
> > > > +       le32 offset;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{flags}] is the set of flags for the mapping. \field{V=
IRTIO_MEDIA_MMAP_FLAG_RW}
> > > > +can be set if a read-write mapping is desired. Without this flag t=
he mapping
> > > > +will be read-only.
> > > > +\item[\field{offset}] corresponds to the \field{mem_offset} field =
of the
> > > > +\textit{union v4l2_plane} for the plane to map. This field can be =
obtained
> > > > +using the \textit{VIDIOC_QUERYBUF} ioctl.
> > > > +\end{description}
> > > > +
> > > > +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit=
{virtio_media_resp_mmap}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_media_resp_mmap {
> > > > +    struct virtio_media_resp_header hdr;
> > > > +    le64 driver_addr;
> > > > +    le64 len;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{driver_addr}] offset into SHM region ID 0 of the star=
t of the mapping.
> > > > +\item[\field{len}] length of the mapping as indicated by the \text=
it{struct v4l2_plane}
> > > > +the buffer belongs to.
> > >
> > > This makes me think: do we need to return the length of the mapping
> > > when we already know the length of the v4l2_plane and we only map
> > > whole buffers? It probably doesn't hurt to repeat that information
> > > here but maybe that's something we can optimize out?
> >
> > That's a good point. Indeed, no partial mapping should be allowed, so
> > the length field does sound a bit redundant. Unless it needs error
> > checking, which probably does not, I think it can be skipped. I'll do
> > for the next version. Thanks!
>
> Thanks - I will make sure to update the driver and devices as well to
> confirm this doesn't introduce any issue in practice.

So after trying to update the code to remove the length field, I have
come to the conclusion that it is useful after all.

While it is true that the returned length of the mapping will always be
equal to the length of the buffer, the semantics of mmap require that we
check that the mapped area fits inside the requested VMA, and in order
to do so we need the length of the mapping.

Why can't we use the length of the buffer, since it is the same value?
The driver doesn't know that length until a QUERYBUF ioctl is performed,
and although it is almost certain that the user will do a QUERYBUF ->
mmap in practice (if only to obtain the offset to use as a mmap
parameter), there is no formal guarantee of this, and doing so would
require some caching mechanism that is a bit more complex than what I am
comfortable putting in a kernel driver if it is not absolutely
necessary.

So we should keep this `len` parameter, and maybe just add a
device-normative paragraph stating that it must always be equal to the
length of the buffer.

Thanks,
Alex.
