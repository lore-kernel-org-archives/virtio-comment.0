Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663251E4A9
	for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749942; cv=none; b=PsGq87KfWy5PBYcEkolaMHT7spY1mnMTZHLHyp6yLkTZboqZFwMAOYe/nAtbkULPZP1On2VdX0Y1NgejsMtbFivAlH5imtXBeuft5pQLPqOCEMQJ6O6herXgZAs5/bkZ69V6OL9Ivt8Oo6rOAfvDF473PFBqcppanUMbYBZgNmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749942; c=relaxed/simple;
	bh=goeLCY8N76j5DZZsD4MegoyNkqiVu2unFe61NodR4tc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=pJLMhvd5EK22pGckxpks7ja8mWZMxdBgGsgLiSR1bwjZy0N1C4XopB46dsftofcheOOnSFB3opmELbmdj6ViN6GVK5yfKHsHNBlI2lurdM8Hskge9lVq2XdKpKBaQekN8K3rHIzVyzE/S5OaiU3zh/3DEibirW/AXWjXWnTp9YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlwVQgDx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlwVQgDx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fe8c35b6cbso3430280a91.3
        for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740749939; x=1741354739; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UYiY5O7GR82hktBwISTPSQ5TzLsc25QO9EfX1CyPBM=;
        b=FlwVQgDx+2SnHpl1/kRSwACRtv65heiJOHPOZyjxzh9LKgedfWMkJGFS6dlYcNyoUJ
         JCLwEj7bzey5gLRFBKbXTo7FWZKm2YEhaMi6B0umBZTrgET8hNPzFXdFt/Jqxe/fJQJv
         S/FjLPZh4BpzfRdCcNgLKaA0K9WQKSkVtXhjyvyJFt558P9BpfHF7EfTPImlBoeQb2p2
         JnTUkbe6OEJ3Gs/M9hMq/MKuhDr0LFTjOT6NMdmDf/BWYaKoQFMTnf4E7F0TPEmz1Idq
         wLdMamE967VHEfBi3Sz7ZD1KjSFtsyvAml/OdXiC28oriAF654/GRCWdg62J8VHfYiRX
         ecBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740749940; x=1741354740;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UYiY5O7GR82hktBwISTPSQ5TzLsc25QO9EfX1CyPBM=;
        b=Itmhe1FNWn/0w8pAHRKoB/rTh0yjWujaFcsRLLWQisRGVFCgSspLUuPi5XeIr9nAgY
         jNPzvJUkxpbdgMDyuaOsyzremZopz+qsDQI6tq5KdsnhvwCb+JDVTX/jZ+Wz88WhlnwB
         oIhGjgMkgcQo4wQM3k+fiHSLVBDwcOp26ByLkUezlWzeyNZGycdb0JplElkGdL9x8rZl
         Hl40+K6BuSnSetlzbQD6PgGPbCgljGz3XaewkFgaXa6OUa8RJVB62nlsVgKNGJ2wfra5
         0/otwpXx0igO+p2EAI2qpV6biru2IuiHXt5hCnj3DJfe34Xon0sbyLHGPCmvVQyZ4o7j
         Xkvg==
X-Forwarded-Encrypted: i=1; AJvYcCVPefuiU1/Ywha0bwYFq2BfXa64l7l4X7Xcm+3VKgHMWUxaiG2Ilkiw4ybfLC9OK+BHFZKDr1+cSh9xp0OTlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXhvMZe0aSG7PABTnQN0wNWXJHjKvI5ojTDAMt4XQCpOLjs7e6
	AFpXjDLT6r13nWKFY/sh48MtVlNc7dqthUWEGyW3aHFEN+KOuKKd
X-Gm-Gg: ASbGncvE75p5bM5YLTTRTyMSSEdoMX4LasphqfqKFd3Bax00kR7NcV7ikZSI+mactrM
	bNSYUwBetHl3hBCjnPaAGjz8u0uqSelVztwbxNGwupqsI8BthJQNrsRnEDAGQit8tnN+jlz7u8E
	Xhv1IyZas49RAsvG9vVMM9ZgEFy4UxQMRpfnjlfyzqWB9NPMz3W6sLS4zdxI28DB/bjTtbwz0vY
	hJC51/9vMl+IIJ7ITTfx/4S/mE+XV4QSZ7QmYxtSDny7wIiJGjU5so6khhosyU3JRQuEshm7XI8
	k4jrDR/wddR6rmbQnQ==
X-Google-Smtp-Source: AGHT+IERpxPzNdp939dC962T8Q/FIWOyGYAEOFl7wv0opUUqic4LGCZxYOVaCfMx/FTnHB6i/lUOMw==
X-Received: by 2002:a05:6a20:431d:b0:1f0:e2d1:bec0 with SMTP id adf61e73a8af0-1f2f4cafaf1mr6539152637.2.1740749939156;
        Fri, 28 Feb 2025 05:38:59 -0800 (PST)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024d35sm3726368b3a.87.2025.02.28.05.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:38:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Feb 2025 22:38:51 +0900
Message-Id: <D844CMV9GQ2S.EAKBGGAOP6JM@gmail.com>
To: "Albert Esteve" <aesteve@redhat.com>, <virtio-comment@lists.linux.dev>
Cc: <nicolas.dufresne@collabora.com>, <cohuck@redhat.com>,
 <hverkuil@xs4all.nl>, <adelva@google.com>, <eballetb@redhat.com>,
 <mst@redhat.com>, <ribalda@google.com>, <changyeon@google.com>,
 <mvaralar@redhat.com>, <daniel.almeida@collabora.com>,
 <dverkamp@chromium.org>, <agordeev@qti.qualcomm.com>,
 <gurchetansingh@google.com>, <alex.bennee@linaro.org>
Subject: Re: [PATCH v7 1/1] virtio-media: Add virtio media device
 specification
From: "Alexandre Courbot" <gnurou@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250220155636.577400-1-aesteve@redhat.com>
 <20250220155636.577400-2-aesteve@redhat.com>
In-Reply-To: <20250220155636.577400-2-aesteve@redhat.com>

Hi Albert,

Apologies, I wanted to just put my reviewed-by but found a few more
things on what I expected to be my final read of this spec. ^_^; They
should be easy to address though.

On Fri Feb 21, 2025 at 12:56 AM JST, Albert Esteve wrote:
> Virtio-media is an encapsulation of the V4L2 UAPI into
> virtio, able to virtualize any video device supported
> by V4L2.
>
> Note that virtio-media does not require the use of a
> V4L2 device driver on the host or guest side -
> V4L2 is only used as a host-guest protocol,
> and both sides are free to convert it from/to any
> model that they wish to use.
>
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  conformance.tex                           |  13 +-
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 637 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  15 +
>  device-types/media/driver-conformance.tex |  11 +
>  5 files changed, 673 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/media/description.tex
>  create mode 100644 device-types/media/device-conformance.tex
>  create mode 100644 device-types/media/driver-conformance.tex
>
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..c369da1 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance / =
Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conforman=
ce},
>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> +
> =20
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
>  \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conforman=
ce},
>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
> =20
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/media/driver-conformance.tex}
> =20
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Devic=
e Conformance}
> =20
> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/media/device-conformance.tex}
> =20
>  \conformance{\section}{Legacy Interface: Transitional Device and Transit=
ional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transit=
ional Device and Transitional Driver Conformance}
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
> =20
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> =20
> diff --git a/device-types/media/description.tex b/device-types/media/desc=
ription.tex
> new file mode 100644
> index 0000000..2256cae
> --- /dev/null
> +++ b/device-types/media/description.tex
> @@ -0,0 +1,637 @@
> +\section{Media Device}\label{sec:Device Types / Media Device}
> +
> +The virtio media device follows the same model (and structures) as V4L2.=
 It
> +can be used to virtualize cameras, codec devices, or any other device
> +supported by V4L2. The complete definition of V4L2 structures and ioctls=
 can
> +be found under the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.h=
tml}{V4L2 UAPI documentation}.
> +
> +V4L2 is a UAPI that allows a less privileged entity (user-space) to use =
video
> +hardware exposed by a more privileged entity (the kernel). Virtio-media =
is an
> +encapsulation of this API into virtio, turning it into a virtualization =
API
> +for all classes of video devices supported by V4L2, where the device pla=
ys the
> +role of the kernel and the driver the role of user-space.
> +
> +The device is therefore responsible for presenting a virtual device that=
 behaves
> +like an actual V4L2 device, which the driver can control.
> +
> +Note that virtio-media does not require the use of a V4L2 device driver =
or of
> +Linux on any side - V4L2 is only used as a transport protocol,
> +and both sides are free to convert it from/to any model that they wish t=
o use.
> +
> +\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID=
}
> +
> +48
> +
> +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueu=
es}
> +
> +\begin{description}
> +\item[0] commandq - used for driver commands and device responses to the=
se
> +commands.
> +\item[1] eventq - used for events sent by the device to the driver.
> +\end{description}
> +
> +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Featur=
e Bits}
> +
> +None
> +
> +\subsection{Device Configuration Layout}\label{sec:Device Types / Media =
Device / Device Configuration Layout}
> +
> +The video device configuration space uses the following layout:
> +
> +\begin{lstlisting}
> +struct virtio_media_config {
> +    le32 device_caps;
> +    le32 device_type;
> +    le8 card[32];
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{device_caps}] (driver-read-only) flags representing the dev=
ice
> +capabilities as used in
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vid=
ioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> +It corresponds with the \field{device_caps} field in the \textit{struct =
video_device}.
> +\item[\field{device_type}] (driver-read-only) informs the driver of the =
type
> +of the video device. It corresponds with the \field{vfl_devnode_type} fi=
eld of the device.
> +\item[\field{card}] (driver-read-only) name of the device, a NUL-termina=
ted
> +UTF-8 string. It corresponds with the \field{card} field of the \textit{=
struct v4l2_capability}.
> +If all the characters of the field are used, it does not need to be NUL-=
terminated.
> +\end{description}
> +
> +\subsection{Device Initialization}
> +
> +A driver executes the following sequence to initialize a device:
> +
> +\begin{enumerate}
> +\item Read the \field{device_caps} and \field{device_type} fields
> +from the configuration layout to identify the device.
> +\item Set up the \field{commandq} and \field{eventq} virtqueues.
> +\item May open a session (see Section \ref{sec:Device Types / Media Devi=
ce / Device Operation / Open Device})
> +to use the device and send V4L2 ioctls in order to receive more informat=
ion
> +about the device, such as supported formats or controls.
> +\end{enumerate}
> +
> +\subsection{Device Operation}\label{sec:Device Types / Media Device / De=
vice Operation}
> +
> +The driver enqueues commands in the command queue for the device to proc=
ess.
> +The errors returned by each command are standard
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-err=
ors.html}{Linux kernel error codes}.
> +For instance, a driver sending a command that contains invalid options w=
ill
> +receive \textit{EINVAL} in return, after the device tries to process it.
> +
> +The device enqueues events in the event queue for the driver to process.
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
> +/* Header for all virtio commands from the driver to the device on the c=
ommandq. */
> +struct virtio_media_cmd_header {
> +	le32 cmd;
> +	le32 __reserved;
> +};
> +
> +/* Header for all virtio responses from the device to the driver on the =
commandq. */
> +struct virtio_media_resp_header {
> +	le32 status;
> +	le32 __reserved;
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
> +When the device executes the command successfully, the value of the stat=
us
> +field is 0. Conversely, when the device fails to execute the command, th=
e value
> +of the status fields corresponds with one of the standard Linux error co=
des.
> +
> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessio=
ns}{Device Types / Media Device / Device Operation / Command Virtqueue}
> +
> +Sessions are how the device is multiplexed, allowing several distinct wo=
rks to
> +take place simultaneously. Before starting operation, the driver needs t=
o open
> +a session. This is equivalent to opening the \textit{/dev/videoX} file o=
f the
> +V4L2 device. Each session gets a unique ID assigned, which can be then u=
sed
> +to perform actions on it.
> +
> +\paragraph{Device Operation: Open device}\label{sec:Device Types / Media=
 Device / Device Operation / Open Device}
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
> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virti=
o_media_resp_open}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_open {
> +    struct virtio_media_resp_header hdr;
> +    le32 session_id;
> +    le32 __reserved;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] identifies the current session, which is used =
for
> +other commands, predominantly ioctls.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Operation: Open device}{Device Ty=
pes / Media Device / Device Operation / Open device}
> +
> +Upon success, the device MUST set a \field{session_id} in \textit{virtio=
_media_resp_open}
> +to an integer that is NOT used by any other open session.
> +
> +\paragraph{Device Operation: Close device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> +
> +This is the equivalent of calling \textit{close} on a previously opened =
V4L2
> +device node. All resources associated with this session will be freed.
> +
> +This command does not require a response from the device.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_close {
> +    struct virtio_media_cmd_header hdr;
> +    le32 session_id;
> +    le32 __reserved;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] identifies the session to close.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Operation: Close device}{Device T=
ypes / Media Device / Device Operation / Close device}
> +
> +The session ID SHALL NOT be used again after queueing this command, unti=
l it has
> +been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OPEN} =
call.
> +
> +\paragraph{Device Operation: V4L2 ioctls}
> +
> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an ope=
n
> +session.
> +
> +This command tells the device to run one of the `VIDIOC_*` ioctls on the
> +session identified by \textit{session_id}.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_ioctl {
> +    struct virtio_media_cmd_header hdr;
> +    le32 session_id;
> +    le32 code;
> +    /* Followed by the relevant ioctl command payload as defined in the =
macro */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] identifies the session to run the ioctl on.
> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to =
run.
> +\end{description}
> +
> +The code is extracted from the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vid=
eodev.html}{videodev2.h},
> +header file. The file defines the ioctl's codes, type of payload, and
> +direction. The code consists of the second argument of the \field{_IO*} =
macro.
> +
> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> +\end{lstlisting}
> +
> +This means that its ioctl code is \textit{4}, its payload is a
> +\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., the
> +payload is written by both the driver and the device).
> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls =
payload}
> +for more information about the direction of ioctls.
> +
> +The payload struct layout always matches the 64-bit, little-endian
> +representation of the corresponding V4L2 structure.
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virt=
io_media_resp_ioctl}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_ioctl {
> +    struct virtio_media_resp_header hdr;
> +    /* Followed by the ioctl response payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4=
L2 ioctls / Ioctls payload}
> +
> +Each ioctl has a payload, which is defined by the third argument of the
> +\field{_IO*} macro.=20
> +
> +The payload of an ioctl in the descriptor chain follows the command stru=
cture,
> +the response structure, or both depending on the direction:
> +
> +\begin{itemize}
> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> +follows the response in the device-writable section of the descriptor ch=
ain.
> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> +follows the command in the device-readable section of the descriptor cha=
in.
> +\item \textbf{_IOWR} is writable by both the device and driver,
> +meaning the payload must follow both the command in the device-readable =
section
> +of the descriptor chain, and the response in the device-writable section=
.
> +\end{itemize}
> +
> +A possible optimization for \textit{WR} ioctls is to provide the payload=
 using
> +descriptors that both point to the same buffer. This mimics the behavior=
 of
> +V4L2 ioctls where the data is only passed once and used as both input an=
d
> +output by the kernel.
> +
> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Ty=
pes / Media Device / Device Operation / V4L2 ioctls}
> +
> +In case of success of a device-writable ioctl, the device MUST always wr=
ite the
> +payload in the device-writable part of the descriptor chain.
> +
> +In case of failure of a device-writable ioctl, the device is free to wri=
te the
> +payload in the device-writable part of the descriptor chain or not. Some=
 errors
> +may still result in the payload being updated, and in this case the devi=
ce is
> +expected to write the updated payload.=20
> +
> +\drivernormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Ty=
pes / Media Device / Device Operation / V4L2 ioctls}
> +
> +For most V4L2 structures, the size is identical for both 32 and 64 bits =
versions.
> +If the payload struct layout size differs for 32 and 64 bits, the driver
> +MUST translate them to its the 64-bit, little-endian representation.
> +
> +If the device has not written the payload after an error (i.e., only the
> +header is returned), the driver MUST assume that the payload has not
> +been modified.
> +
> +\subparagraph{Handling of pointers to data in ioctl payload}
> +\label{sec:Device Types / Media Device / V4L2 ioctls / Pointers in V4l2 =
ioctls}
> +
> +A few structures used as ioctl payloads contain pointers to further
> +data needed for the ioctl. There are notably:
> +
> +\begin{itemize}
> +\item The \field{planes} pointer of
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buf=
fer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> +which size is determined by the length member.
> +\item The \field{controls} pointer of
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vid=
ioc-g-ext-ctrls.html#c.V4L.v4l2_ext_controls}{struct v4l2_ext_controls},
> +which size is determined by the count member.
> +\end{itemize}
> +
> +If the size of the pointed area is non-zero, then the main
> +payload is immediately followed by the pointed data in their order of
> +appearance in the structure.
> +
> +\devicenormative{\subparagraph}{Handling of pointers to data in ioctl pa=
yload}{Device Types / Media Device / Device Operation / Pointers in V4l2 io=
ctls}
> +
> +The pointer value, when its area is non-zero, is ignored by the device,
> +which MUST return the value initially passed by the driver.
> +
> +
> +\subparagraph{Handling of pointers to userspace memory in ioctl payload}
> +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> +
> +A few pointers (used for \textit{SHARED_PAGES} memory type,
> +see \ref{sec:Device Types / Media Device / Device Operation / Shared Pag=
es})
> +are special in that they point to userspace memory in the
> +original V4L2 specification. They are:
> +
> +\begin{itemize}
> +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buf=
fer.html#struct-v4l2-plane}{struct v4l2_plane}
> +(technically an unsigned long, but designated a userspace address).
> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> +\end{itemize}
> +
> +These pointers may cover large areas of scattered memory, which has the
> +potential to require more descriptors than the virtio queue can provide.=
 For
> +these particular pointers only, a list of \textit{struct virtio_media_sg=
_entry}
> +that covers the needed amount of memory for the pointer is used instead =
of
> +using descriptors to map the pointed memory directly.
> +
> +\begin{lstlisting}
> +struct virtio_media_sg_entry {
> +	le64 start;
> +	le32 len;
> +	le32 __reserved;
> +};
> +\end{lstlisting}
> +
> +For each such pointer to read, the device reads as many SG entries as ne=
eded
> +to cover the length of the pointed buffer, as described by its parent
> +structure (\field{length} member of \textit{struct v4l2_buffer} or
> +\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
> +\textit{struct v4l2_ext_control} for control data).
> +
> +Since the device never needs to modify the list of SG entries, it is onl=
y
> +provided by the driver in the device-readable section of the descriptor =
chain,
> +and not repeated in the device-writable section, even for WR ioctls.
> +
> +\subparagraph{Unsupported ioctls}
> +
> +A few ioctls are replaced by other, more suitable mechanisms.
> +
> +\begin{itemize}
> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration =
area
> +(see \ref{sec:Device Types / Media Device / Device Configuration Layout}=
).
> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue b=
uffer}).
> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an e=
vent}).

Nit: for consiseness we can probably merge DQBUF and DQEVENT into a
single bullet point that references subsection 1.6.2.

> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are depr=
ecated
> +and replaced by the controls of the JPEG class.
> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall no=
t be
> +implemented by the device.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{De=
vice Types / Media Device / Device Operation / Unsupported ioctls}
> +
> +When a request is not supported, the device MUST return \textit{ENOTTY},
> +which corresponds to the response for unknown ioctls.
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
> +	struct virtio_media_cmd_header hdr;
> +	le32 session_id;
> +	le32 flags;
> +	le32 offset;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] identifies the session which the mapped buffer=
 pertains to.
> +\item[\field{flags}] is the set of flags for the mapping. \field{VIRTIO_=
MEDIA_MMAP_FLAG_RW}
> +can be set if a read-write mapping is desired. Without this flag the map=
ping
> +will be read-only.
> +\item[\field{offset}] corresponds to the \field{mem_offset} field of the
> +\textit{union v4l2_plane} for the plane to map. This field can be obtain=
ed
> +using the \textit{VIDIOC_QUERYBUF} ioctl.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{virti=
o_media_resp_mmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_mmap {
> +    struct virtio_media_resp_header hdr;
> +    le64 driver_addr;
> +    le64 len;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{driver_addr}] offset into SHM region ID 0 of the start of t=
he mapping.
> +\item[\field{len}] length of the mapping as indicated by the \textit{str=
uct v4l2_plane}
> +the buffer belongs to.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Operation: Mapping a MMAP buffer}=
{Device Types / Media Device / Device Operation / Mapping a MMAP buffer}
> +
> +The \textit{len} parameter of the \textit{virtio_media_resp_mmap} respon=
se sent
> +by the device MUST always be equal to the length of the buffer.
> +
> +\paragraph{Device Operation: Unmapping a MMAP buffer}
> +
> +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} unmaps a MMAP buffer previously mapped =
using \field{VIRTIO_MEDIA_CMD_MMAP}.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_munmap {
> +    struct virtio_media_cmd_header hdr;
> +    le64 driver_addr;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{driver_addr}] offset into SHM region ID 0 previously return=
ed by=20
> +\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously m=
apped.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{vir=
tio_media_resp_munmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_munmap {
> +    struct virtio_media_resp_header hdr;
> +};
> +\end{lstlisting}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buffe=
r}{Device Types / Media Device / Device Operation / Unmapping a MMAP buffer=
}
> +
> +The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD_M=
MAP}
> +valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buff=
ers or
> +session they belong to are released or closed by the driver.
> +
> +\paragraph{Device Operation: Memory Types}
> +
> +The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{USE=
RPTR}
> +and \textit{DMABUF}) can easily be mapped to both driver and device cont=
ext.
> +
> +\begin{lstlisting}
> +enum virtio_media_memory {
> +    VIRTIO_MEDIA_MMAP =3D V4L2_MEMORY_MMAP,
> +    VIRTIO_MEDIA_SHARED_PAGES =3D V4L2_MEMORY_USERPTR,
> +    VIRTIO_MEDIA_OBJECT =3D V4L2_MEMORY_DMABUF,
> +};
> +\end{lstlisting}
> +
> +\subparagraph{MMAP}
> +
> +\textit{MMAP} memory type is the semantic equivalent of
> +\textit{V4L2_MEMORY_MMAP} in regular V4L2.=20
> +
> +In virtio-media, \textit{MMAP} buffers are provisioned by the device, ju=
st like
> +they are by the kernel in regular V4L2. Similarly to how userspace can m=
ap a
> +\textit{MMAP} buffer into its address space using mmap and munmap, the
> +virtio-media driver can map device buffers into the driver space by queu=
eing the
> +\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_cm=
d_munmap}
> +commands to the commandq.
> +
> +\subparagraph{SHARED_PAGES}
> +\label{sec:Device Types / Media Device / Device Operation / Shared Pages=
}
> +
> +\textit{SHARED_PAGES} memory type is the semantic equivalent of
> +\textit{V4L2_MEMORY_USERPTR} in regular V4L2.=20
> +
> +In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by the dr=
iver,
> +and use guest physical addresses. Instances of \textit{struct v4l2_buffe=
r}
> +and \textit{struct v4l2_plane} of this memory type are followed by a lis=
t of
> +\textit{struct virtio_media_sg_entry}. For more information, see
> +\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
> +
> +\devicenormative{\subparagraph}{Device Operation: Shared Pages}{Device T=
ypes / Media Device / Device Operation / Shared Pages}
> +
> +The device MUST not alter the pointer values provided by the driver, i.e=
.
> +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> +\textit{struct v4l2_plane} MUST be returned to the driver with the same =
value
> +as it was provided.
> +
> +\subparagraph{VIRTIO_OBJECT}
> +\label{sec:Device Types / Media Device / Device Operation / Virtio Objec=
t}
> +
> +\textit{VIRTIO_OBJECT} memory type is the semantic equivalent of
> +\textit{V4L2_MEMORY_DMABUF} in regular V4L2.=20
> +
> +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a vir=
tio
> +object, just like they are by a \textit{DMABUF} in regular V4L2. Virtio =
objects
> +are 16-bytes UUIDs and do not fit in the placeholders for file descripto=
rs, so
> +they follow their embedding data structure as needed. For example, in mu=
lti-planar
> +buffers, \textit{struct v4l2_plane} structures are located after the
> +\textit{struct v4l2_buffer} in the memory layout. Then, after the last p=
lane,
> +the memory contains an array of UUIDs in which the first element corresp=
onds
> +with the first plane, and so on.
> +
> +Conversely to \textit{SHARED_PAGES} buffers, virtio objects UUIDs need t=
o be added in
> +both the device-readable and device-writable section of the descriptor c=
hain.

Let's add the reason for this, as this sentence left me thinking for a
bit:

Conversely to \textit{SHARED_PAGES} buffers which SG lists are never
modified by the device, virtio objects UUIDs need to be added in both
the device-readable and device-writable section of the descriptor chain
so the device can update them if needed.

> +
> +Device-allocated buffers with the \textit{VIRTIO_MEDIA_MMAP} memory type=
 may also
> +be exported as virtio objects for use with another virtio device using t=
he
> +\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exportb=
uffer}
> +means that space for the UUID needs to be reserved right after that stru=
cture.
> +
> +\devicenormative{\subparagraph}{Device Operation: Virtio Object}{Device =
Types / Media Device / Device Operation / Virtio Object}
> +
> +The device MUST leave the V4L2 structure placeholder unchanged.

Maybe I misunderstood it, but this sentence seems incorrect to me - the
V4L2 structure (I believe this refers to v4l2_buffer or v4l2_plane?) can
be updated by the device depending on the requested ioctl. This behavior
is not dependent on the memory type.

> +
> +\subsubsection{Event Virtqueue}
> +
> +Events are asynchronous notifications to the driver. In virtio-media,
> +they are used as a replacement for the \textit{VIDIOC_DQBUF} and
> +\textit{VIDIOC_DQEVENT} ioctls and the polling mechanism, which would be
> +impractical to implement on top of virtio.
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
> +    le32 event;
> +    le32 session_id;
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
> +mentioned in the header is considered corrupted and automatically closed=
 by
> +the device.

Since we added the clause that the driver must close the FD, the use of
"closed" by the device here might be ambiguous.

We also employ "upon receiving" which suggests we talk about the driver,
but then mention the device later in the same sentence. So how about
this:

  \textbf{VIRTIO_MEDIA_EVT_ERROR} Unrecoverable session error. Upon
  emitting this event, the device considers the session mentioned in the
  header to be invalid and returns and error to all future commands
  mentioning it. Upon receiving this event, the driver stops using it
  and closes it as soon as possible.

Cheers,
Alex.
