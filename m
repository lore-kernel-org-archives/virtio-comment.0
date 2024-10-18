Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47C17839C
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241536; cv=none; b=E+m97ZUUs73q0cA0S/zanuQEx0SczURDM0RTIxw88NBDfzb2OgNQ3Pd0Or5SxppHgC+7apEGT01EPyIuNTsFy/fXta0cy+xNVQy8hfep9ewdMlzdcD5T8iNY3TQ6JnB31lZUH5KsG+FfM3pcrRXG9CYviNbJyC7XodFeIBAzma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241536; c=relaxed/simple;
	bh=ByW7lcpwJ4xwjUlhDLvljY8YPSnvzleTiY/GYE9I63Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nHRhnumtoAHEjEpNKq7yd6S6xAEkwqXFka7tSIdV+bAhYXcIYqdEgUaTYlCWpi99QMPpDQHFkEpVOwDCVza+YO/8mSFcC/QbaiQH3QUED4KfWKcMtoSwTjS4MRn+mcsyZMQiCUnytNOU9oH4EOwMUjj3EQwMs/8SVqNaCMrKbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QpEuMFWT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QpEuMFWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729241532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j+dxObAninOFotPDQq9PHmb73j0/SOfi9r2S39t+hoE=;
	b=QpEuMFWT3GNEQpbA/wjh4fhuiqgcXMF7iUhqhpkj+W01LSXgR1xzwcMh5LidLjgqzNQ3Yo
	lLuySc7ClNPOG3oAhBjEPQhmH5skhloX6E2vJjofhE2au8uTl8EcYxLsjFOIOr3S+G+rZm
	6DVZeghNQGQjB+AH9zuCzh/0Hf83+KQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-N13Uy0A2PniKacCz7bzHmA-1; Fri, 18 Oct 2024 04:52:11 -0400
X-MC-Unique: N13Uy0A2PniKacCz7bzHmA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b15a8e9ff1so22865085a.1
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 01:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729241531; x=1729846331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+dxObAninOFotPDQq9PHmb73j0/SOfi9r2S39t+hoE=;
        b=WZXdMcMAziE4axAzWcMgN8wm2+kSCr2v80VgVIy5EOkDQwBrnBfTDw/MyDGqzlN5lR
         3HG5q+KfZM1ZeEn4CxE5agDkdN28SLwBakb3+OwYD5Jo3ygbUHCiThDIaZLYLl6rnL+l
         +mKQdan8l1HWJnOmmR+urRSjZUHyhmqpQPs4cREtx7AL6NiRS27xlMGPEOKg1WC0EUaY
         e6XqlFm/N0ST6MWut90mWk3RZLuwSphN6AfBhY5mablE05RjH9BYrd36zlGxIrz92F4/
         /TSsf812CoKmKsgV3pTJs+eaiJAxZpcFbRPZzYR4zQOQ0jx9ZGgINFuPAmGpjmyxGoUk
         LJSg==
X-Gm-Message-State: AOJu0YyOx8hB9hSdm/z+emp2LtvoGYU7//QEZNQxgLbnJASMNl7U318Y
	7/EiWuBhAVO8hFgRDEpPXgCyaG8e+Ml5JO8Tyzfu/YjbaKIPw1rY2SDr1rWBrxgv5+YqKv9L6Co
	P6OaL72YOZhTpzaV8mVYhLnVyjkNM2hfWkK+LESS2TykIc1kLE4I0PTMFdhELke7V
X-Received: by 2002:a05:620a:2482:b0:7b1:5680:164b with SMTP id af79cd13be357-7b157b6aa43mr209824285a.26.1729241530819;
        Fri, 18 Oct 2024 01:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2I0fRjanlbBE98ZeJXUle0fP/HmOjxcrkh9ZvDPvQ4bqPx/01W5MWX6YcSQZuGXgMVgqYaA==
X-Received: by 2002:a05:620a:2482:b0:7b1:5680:164b with SMTP id af79cd13be357-7b157b6aa43mr209820785a.26.1729241530194;
        Fri, 18 Oct 2024 01:52:10 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156f8a942sm51376885a.18.2024.10.18.01.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:52:09 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:52:05 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, changyeon@google.com,
	daniel.almeida@collabora.com, ribalda@google.com,
	nicolas.dufresne@collabora.com, alex.bennee@linaro.org,
	eballetb@redhat.com, acourbot@chromium.org,
	gurchetansingh@google.com, hverkuil@xs4all.nl, cohuck@redhat.com,
	mst@redhat.com, agordeev@qti.qualcomm.com
Subject: Re: [PATCH v3 1/1] virtio-media: Add virtio media device
 specification
Message-ID: <ZxIhtQrr/oKwPUBb@fedora>
References: <20241017070423.86706-1-aesteve@redhat.com>
 <20241017070423.86706-2-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241017070423.86706-2-aesteve@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Albert, 

I gave a first reading. I left some minor comments below. I could not
cover the whole patch yet.

On Thu, Oct 17, 2024 at 09:04:23AM +0200, Albert Esteve wrote:
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
>  device-types/media/description.tex        | 583 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  11 +
>  device-types/media/driver-conformance.tex |   9 +
>  5 files changed, 613 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/media/description.tex
>  create mode 100644 device-types/media/device-conformance.tex
>  create mode 100644 device-types/media/driver-conformance.tex
> 
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..c369da1 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -32,8 +32,10 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
> +
>  
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -59,8 +61,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance},
>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
> -\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
> +\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
>  
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/media/driver-conformance.tex}
>  
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>  
> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/media/device-conformance.tex}
>  
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
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
> diff --git a/device-types/media/description.tex b/device-types/media/description.tex
> new file mode 100644
> index 0000000..793e9b1
> --- /dev/null
> +++ b/device-types/media/description.tex
> @@ -0,0 +1,583 @@
> +\section{Media Device}\label{sec:Device Types / Media Device}
> +
> +The virtio media device follow the same model (and structures) as V4L2. It

s/follow/follows

> +can be used to virtualize cameras, codec devices, or any other device
> +supported by V4L2. The device assumes 64-bit little-endian V4L2 structures
> +are exchanged. The complete definition of V4L2 structures and ioctls can
> +be found under the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
> +
> +V4L2 is a UAPI that allows a less privileged entity (user-space) to use video
> +hardware exposed by a more privileged entity (the kernel). Virtio-media is an
> +encapsulation of this API into virtio, turning it into a virtualization API
> +for all classes of video devices supported by V4L2, where the device plays the
> +role of the kernel and the driver the role of user-space.
> +
> +The device is therefore responsible for presenting a virtual device that behaves
> +like an actual V4L2 device, which the driver can control.
> +
> +Note that virtio-media does not require the use of a V4L2 device driver or of
> +Linux on any side - V4L2 is only used as a transport protocol,
> +and both sides are free to convert it from/to any model that they wish to use.
> +
> +This section relies on definitions from
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
> +
> +\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID}
> +
> +49
> +
> +\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueues}
> +
> +\begin{description}
> +\item[0] commandq - used for driver commands and device responses to these
> +commands.
> +\item[1] eventq - used for events sent by the device to the driver.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Virtqueues}{Device Types / Media Device / Virtqueues}
> +
> +The device MUST return the descriptor chains it receives on the commandq as
> +soon as possible, and must never hold them for indefinite periods of time.
> +

I think this is true for any device. I wonder what is specific for
virtio-media to put it here. 

> +\drivernormative{\subsubsection}{Virtqueues}{Device Types / Media Device / Virtqueues}
> +
> +The driver MUST re-queue the descriptor chains returned by the device on the
> +eventq as soon as possible, and must never hold them for indefinite periods
> +of time.
> +

This is also true for any device. The mechanism to provide buffers
through the available ring to be consumed and then enqueued in the used
ring is not device specific. Is there any reason that this is different
for virtio-media?

> +\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feature Bits}
> +
> +None
> +
> +\subsection{Device Configuration Layout}\label{sec:Device Types / Media Device / Device Configuration Layout}
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
> +\item[\field{device_caps}] (driver-read-only) flags representing the device
> +capabilities as used in
> +\href{https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-querycap.html#c.v4l2_capability}{struct v4l2_capabilities}.
> +Corresponds with the \field{device_caps} field in the \textit{struct video_device}.

I think you should not start a sentence with a verb. I think you should
add the person. Something like `It corresponds with the ...`. I see
other cases below.

> +\item[\field{device_type}] (driver-read-only) informs the driver of the type
> +of the video device. Corresponds with the \field{vfl_devnode_type} field of the device.
> +\item[\field{card}] (driver-read-only) name of the device, a NUL-terminated
> +UTF-8 string. Corresponds with the \field{card} field of the \textit{struct v4l2_capability}.
> +If all the characters of the field are used, it does not need to be NUL-terminated.
> +\end{description}
> +
> +\subsection{Device Initialization}
> +
> +\begin{enumerate}
> +\item The driver reads the \field{device_caps} and \field{device_type} fields
> +from the configuration layout to identify the device.
> +\item The driver sets up the \field{commandq} and \field{eventq}.
> +\item The driver may open a session to use the device and send V4L2 ioctls in
> +order to receive more information about the device, such as supported
> +formats or controls.
> +\end{enumerate}
> +
I think other devices remove `the driver` and write it as sequence by
starting with the verb like:

`- reads the field{}
 - sets up the \field{}
 ...
` 
Also, the last sentence talks about `session` but it was not introduced
yet, what is a session?

> +\subsection{Device Operation}\label{sec:Device Types / Media Device / Device Operation}
> +
> +Commands are queued on the command queue by the driver for the device to
> +process. The errors returned by each command are standard
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux kernel error codes}.

Maybe I am missing something but where and how is stored the returned
error? I mean, it is stored in the device-writable area but what is the
structure?

> +For instance, a command that contains invalid options will return \textit{EINVAL}.
> +
> +Events are sent on the event queue by the device for the driver to handle.
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
> +/* Header for all virtio commands from the driver to the device on the commandq. */
> +struct virtio_media_cmd_header {
> +	u32 cmd;
> +	u32 __padding;
> +};
> +
> +/* Header for all virtio responses from the device to the driver on the commandq. */
> +struct virtio_media_resp_header {
> +	u32 status;
> +	u32 __padding;
> +};
> +\end{lstlisting}
> +

OK, I guess this is the structure that contains the response.

> +A command consists of a command header \textit{virtio_media_cmd_header}
> +containing the following device-readable field:
> +
> +\begin{description}
> +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
> +\end{description}
> +
> +A response consists of a response header \textit{virtio_media_resp_header}
> +containing the following device-writable field:
> +
> +\begin{description}
> +\item[\field{status}] indicates a device request status.
> +\end{description}
> +
> +The status field can take 0 if the command was successful, or one of the
> +standard Linux error codes if it was not.
> +
> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions}{Device Types / Media Device / Device Operation / Command Virtqueue}
> +
> +Sessions are how the device is multiplexed, allowing several distinct works to
> +take place simultaneously. The driver needs to open a session before it can
> +perform any useful operation on the device.
> +
I think this paragraph can be rewritten. For example, what do you mean
with `multiplexed`? I think I got the idea but I would elaborate it a
bit. Also, I think you can rewrite the last sentence to something like:
`Before start operating, the driver must open a session`

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
> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virtio_media_resp_open}.
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
> +\item[\field{session_id}] specifies an identifier for the current session. The
> +identifier can be used to perform other commands on the session, notably ioctls.

I would rewrite it as:

`... identifies the current session, which is used for other commands
like ioctls.`

But I do not have a strong opinion about it.

> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Operation: Open device}{Device Types / Media Device / Device Operation / Open device}
> +
> +Upon success, the device MUST set a \field{session_id} in \textit{virtio_media_resp_open}
> +to an integer that is NOT used by any other open session.
> +
> +\paragraph{Device Operation: Close device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> +
> +This is the equivalent of calling \textit{close} on a previously opened V4L2
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
> +\item[\field{session_id}] specifies an identifier for the session to close.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Operation: Close device}{Device Types / Media Device / Device Operation / Close device}
> +
> +The session ID SHALL NOT be used again after queueing this command.
> +
> +\paragraph{Device Operation: V4L2 ioctls}
> +
> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an open
> +session.
> +
> +This command asks the device to run one of the `VIDIOC_*` ioctls on the active
> +session.
> +
Why do you use `ask` here? Could it be `tells` instead? But I do not
have a strong opinion about it. Also, I think with `active` you mean the
session identified by `session_id`. I think I would not use `active`.

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
> +\item[\field{session_id}] specifies an identifier of thesession to run the ioctl on.

I would rewrite it as:

`\item[\field{session_id}] identifies the session to run the ioctl on`

> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to run.
> +\end{description}
> +
> +The code is extracted from the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.html}{videodev2.h},
> +header file. The file defines the ioctl's codes, type of payload, and
> +direction. The code consists of the second argument of the \field{_IO*} macro.
> +
> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> +\end{lstlisting}
> +
> +This means that its ioctl code is \textit{4}, that its payload is a
> +\textit{struct v4l2_format}, and that its direction is \textit{WR} (i.e., the
> +payload is written by both the driver and the device).

I think you can remove some of the `thats`:

`This means that its ioctl code is \textit{4}, its payload is a
\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., the
payload is written by both the driver and the device).`

> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
> +for more information about the direction of ioctls.
> +
> +The payload layout is always a 64-bit representation of the corresponding
> +V4L2 structure.
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virtio_media_resp_ioctl}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_ioctl {
> +    struct virtio_media_resp_header hdr;
> +    /* Followed by the ioctl payload as defined in the macro */
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
> +
> +Each ioctl has a payload, which is defined by the third argument of the
> +\field{_IO*} macro defining it. 
> +

I think you can remove `defining it`.

> +The payload of an ioctl in the descriptor chain follows the command structure,
> +the reponse structure, or both depending on the direction:
> +
> +\begin{itemize}
> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> +follows the response in the device-writable section of the descriptor chain.
> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> +follows the command in the driver-writable section of the descriptor chain.
> +\item \textbf{_IOWR} is writable by both the device and driver,
> +meaning the payload must follow both the command in the driver-writable section
> +of the descriptor chain, and the response in the device-writable section.
> +\end{itemize}
> +
> +A common optimization for \textit{WR} ioctls is to provide the payload using
> +descriptors that both point to the same buffer. This mimics the behavior of
> +V4L2 ioctls where the data is only passed once and used as both input and
> +output by the kernel.
> +
> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Types / Media Device / Device Operation / V4L2 ioctls}
> +
> +In case of success of a device-writable ioctl, the device MUST always write the
> +payload in the device-writable part of the descriptor chain.
> +
> +In case of failure of a device-writable ioctl, the device is free to write the
> +payload in the device-writable part of the descriptor chain or not. Some errors
> +may still result in the payload being updated, and in this case the device is
> +expected to write the updated payload. If the device has not written the
> +payload after an error, the driver MUST assume that the payload has not been
> +modified.
> +
> +\subparagraph{Handling of pointers in ioctl payload}
> +
> +A few structures used as ioctl payloads contain pointers to further
> +data needed for the ioctl. There are notably:
> +
> +\begin{itemize}
> +\item The \field{planes} pointer of
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
> +which size is determined by the length member.
> +\item The \field{controls} pointer of \textit{struct v4l2_ext_controls}, which
> +size is determined by the count member.
> +\end{itemize}
> +
> +If the size of the pointed area is determined to be non-zero, then the main
> +payload is immediately followed by the pointed data in their order of
> +appearance in the structure, and the pointer value itself is ignored by the
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
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
> +(technically an unsigned long, but designated a userspace address).
> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> +\end{itemize}
> +
> +These pointers can cover large areas of scattered memory, which has the
> +potential to require more descriptors than the virtio queue can provide. For
> +these particular pointers only, a list of \textit{struct virtio_media_sg_entry}
> +that covers the needed amount of memory for the pointer is used instead of
> +using descriptors to map the pointed memory directly.
> +
> +\begin{lstlisting}
> +struct virtio_media_sg_entry {
> +	u64 start;
> +	u32 len;
> +	u32 __padding;
> +};
> +\end{lstlisting}
> +
> +For each such pointer to read, the device reads as many SG entries as needed
> +to cover the length of the pointed buffer, as described by its parent
> +structure (\field{length} member of \textit{struct v4l2_buffer} or
> +\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
> +\textit{struct v4l2_ext_control} for control data).
> +
> +Since the device never needs to modify the list of SG entries, it is only
> +provided by the driver in the device-readable section of the descriptor chain,
> +and not repeated in the device-writable section, even for WR ioctls.
> +
> +\subparagraph{Unsupported ioctls}
> +
> +A few ioctls are replaced by other, more suitable mechanisms.
> +
> +\begin{itemize}
> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration area
> +(see \ref{sec:Device Types / Media Device / Device Configuration Layout}).
> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Dequeue buffer}).
> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event
> +(see \ref{sec:Device Types / Media Device / Device Operation / Emit an event}).
> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are deprecated
> +and replaced by the controls of the JPEG class.
> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall not be
> +implemented by the device.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
> +
> +If being requested an unsupported ioctl, the device MUST return the same
> +error response as it would for an unknown ioctl, i.e. \textit{ENOTTY}.
> +

I would rewrite it as:

`When a request is not supported, the device MUST return \textit{ENOTTY},
which corresponds with the response for unknown ioctls.`

Matias

