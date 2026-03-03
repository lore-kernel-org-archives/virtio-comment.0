Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECC33EB1A
	for <virtio-comment@lists.linux.dev>; Tue,  3 Mar 2026 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539388; cv=none; b=mxheroW++TII30G5lgJIny4EkV2ctFW54PPTeolbCK3M81rzSqJ0wtW4bTiM/jUQgPaojaXt9xBelvpU174fO2IBDfgbUgmlJD4Pym5y/Wxoz7u4BnLm+MIomCLXpJC7YuPHxZC89c60tCyBXSATjDkhhbkwxo0npY7TuEysm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539388; c=relaxed/simple;
	bh=IbPz/OwSk5wZWnVM2TyXm6sPMp3P2ibJDuZg8rdtW6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=E08JKICzg1GD8Qe37ewkoXO03+/np1t82rIUubqAkqC5s++ZMf4DwPkhZlqsBsIxkgaVFE1Nv+QargN/rW9/uXz/caGrPBcoVUR02e0pBdURN/dZVa+e2wzqQXqd2/6qxJWVWwP5Tt4UtCJJOjpiZWnM2PoAllANzsbn1uo1w9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T/JMhZsm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/JMhZsm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483703e4b08so50739945e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Mar 2026 04:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772539383; x=1773144183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J7U5Z1RbISYxUHJlulsO9fycyw5nHXtlXrFrl498//Q=;
        b=T/JMhZsmAEoZPuB1qMW8wCmZJF2NRaq4d/HYxkODcXZQDBsDid37OtqysJmyC3qQa4
         yIImGpZP6posO0FRu90worjCyIwtWfDHkUdG2As7XvNUcCNWDIGbtdL3DClX1yd9m/LN
         oNuv4mCBMRoUAO+rTSHuPooiEzv5pOsJd/6QfbwKXLsFpvRmX3cBNbox2VSRyObBa5sT
         s/nRf/aKmxPpwksB9I4dG3rrnQ4PhcVTvPHBxCxW7usIx3sd4sznc7CxDlOAH6FsdJZt
         N+rMP6AmEIwqcR+TX9haj75jNAumrBVBhsTjuqOLT94q9fNQ1bwn7prGsIBWdiGVZSu0
         epJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772539383; x=1773144183;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7U5Z1RbISYxUHJlulsO9fycyw5nHXtlXrFrl498//Q=;
        b=usdK1EyFFcyBTNG1TD+FBX73lFSd70QM2aNiNlMabxSGeH/KWdRiSfzudEXa2cvWFy
         1L+QLq6o909LeDvYp+banciMXIqr+u83g/ioQ7QOxaxCvAcasn/y9Cqs9b5Pu86DvvjN
         DIWHtOvAam2S5NV0yiDsYA09QVkK1j6OuQn59Ef74ARaahvlXlsqvX2WpYJ1ekpf6vtE
         RWq5dnJowAuM3gc2dZRN4W4rswCLNHKAemBIF0IOoumsCHqKjxLbKSEDfwpMUbH1mZo9
         3rT2XpBmu/nbb18JhVQkIQsW9bspTOFbdwprSkSAi6M6roTnTPxs5+JXH1Li2rVZdJPj
         X5fw==
X-Forwarded-Encrypted: i=1; AJvYcCXTXMaeWxOncjQvrwgTVgkuRbv5pL9dc0jsi/XfwUrw2a7ar80C6EnIZpHKaphvIoxGEXqBP3JQ1ta98jQLwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAgBLxoCsDxDI2M8PrWxGn0YIWre+tIesSlt3tqwVBQM+91jJi
	c4lFmyY0sGQYurfK8dlhHycM/926szreZ9lEXXau0cqqAuY/n1rltmHRI+cdc0PeVgY=
X-Gm-Gg: ATEYQzzeQ0sQmYaM4LJkaPSudTVd20+1Ucqkeyyh2HwFZR0LhH6SAfQ3yki1rfYv1wl
	sNmtJfEZWBVeAOo9i/yTb3+gVpnIysPk//osKa7Xa9Jf8LcidFxglrDxeB6YZtTMo2RAfOm6Mvt
	8aomAoaY0DYMbm6g6eAbj+TKnWxIcxN5wM1DHHUXWdFgESCYbblPzRwV8wrbVKkRfhA2CDZdfJ1
	bj0uZm5OKiwFX8K4Uhu7lFHP9hdTkA844oqvzt65/ydAZBLinNpB/z405iagmS4n4gz0fzQ3SDX
	/tP/P0SV20nWcCgEeS7OLwoUDBg/Cq8e76+MPd6PFlEmhSwE/1wTJ+D0q6Vc94EuIHqUb0JyqfK
	SpWk5I1Li/NRHyQchD2M3duMAeS2p5mkMRgrj05+smycvPcBys+1na53CI3s4ioN/J4v7nOmerB
	y5ISkYrIYcGU7yVFlFEPPf6PIe6vYXd8o86as20EpsptRela+oYNyHATzGV56FZRcgqq7sTIodY
	RjjoXX88X9XFlUxMg/xmXggWOI+nK0Py9ze0IX83PsRmITOiEwFkA==
X-Received: by 2002:a05:600c:3ba0:b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-48513a74e6amr35751165e9.10.1772539382147;
        Tue, 03 Mar 2026 04:03:02 -0800 (PST)
Received: from meli-email.org (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851269cf4csm16215545e9.8.2026.03.03.04.02.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Mar 2026 04:03:01 -0800 (PST)
Date: Tue, 03 Mar 2026 13:10:49 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>, virtio-comment@lists.linux.dev
Cc: Albert Esteve <aesteve@redhat.com>, Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Enric Balletbo i Serra <eballetb@redhat.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael S . Tsirkin <mst@redhat.com>, Peter Griffin <peter.griffin@linaro.org>, Demi Marie Obenour <demiobenour@gmail.com>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device specification
User-Agent: meli/0.8.13
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com> <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
Message-ID: <tbbo4y.3b3y09ssseods@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

Hi Alexander,

Looks good and reasonable to me. I left a few non-important suggestions.

On Fri, 13 Feb 2026 10:53, Alexander Gordeev <alexander.gordeev@oss.qualcomm.com> wrote:
>From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
>
>Add the specification of the video decoder and encoder device, which
>can be used to provide host-accelerated video operations to the guest.
>
>Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
>---
> conformance.tex                           |   12 +-
> content.tex                               |    1 +
> device-types/video/description.tex        | 1592 +++++++++++++++++++++
> device-types/video/device-conformance.tex |   22 +
> device-types/video/driver-conformance.tex |   20 +
> introduction.tex                          |   21 +
> 6 files changed, 1664 insertions(+), 4 deletions(-)
> create mode 100644 device-types/video/description.tex
> create mode 100644 device-types/video/device-conformance.tex
> create mode 100644 device-types/video/driver-conformance.tex
>
>diff --git a/conformance.tex b/conformance.tex
>index 9af31e2..f34e600 100644
>--- a/conformance.tex
>+++ b/conformance.tex
>@@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
> \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
> \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
>-\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
>-\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
>+\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
>+\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
>+\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
> 
>     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>   \end{itemize}
>@@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
> \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
> \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
>-\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
>-\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
>+\ref{sec:Conformance / Device Conformance / Media Device Conformance},
>+\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
>+\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
> 
>     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>   \end{itemize}
>@@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> \input{device-types/spi/driver-conformance.tex}
> \input{device-types/media/driver-conformance.tex}
> \input{device-types/rtc/driver-conformance.tex}
>+\input{device-types/video/driver-conformance.tex}
> 
> \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
> 
>@@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> \input{device-types/spi/device-conformance.tex}
> \input{device-types/media/device-conformance.tex}
> \input{device-types/rtc/device-conformance.tex}
>+\input{device-types/video/device-conformance.tex}
> 
> \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
> A conformant implementation MUST be either transitional or
>diff --git a/content.tex b/content.tex
>index 5de811f..0c13f68 100644
>--- a/content.tex
>+++ b/content.tex
>@@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
> \input{device-types/spi/description.tex}
> \input{device-types/media/description.tex}
> \input{device-types/rtc/description.tex}
>+\input{device-types/video/description.tex}
> 
> \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> 
>diff --git a/device-types/video/description.tex b/device-types/video/description.tex
>new file mode 100644
>index 0000000..8945e26
>--- /dev/null
>+++ b/device-types/video/description.tex
>@@ -0,0 +1,1592 @@
>+\section{Video Device}
>+\label{sec:Device Types / Video Device}
>+
>+The virtio video device provides support for host-accelerated video encoding
>+and decoding.
>+
>+\subsection{Device ID}
>+\label{sec:Device Types / Video Device / Device ID}
>+
>+50
>+
>+\subsection{Virtqueues}
>+\label{sec:Device Types / Video Device / Virtqueues}
>+
>+\begin{description}
>+      \item[0]
>+            commandq - driver commands
>+      \item[1]
>+            eventq - device async responses to commands and standalone device events
>+\end{description}
>+
>+\subsection{Feature bits}
>+\label{sec:Device Types / Video Device / Feature bits}
>+
>+\begin{description}
>+      \item[VIRTIO_VIDEO_F_ENCODER (0)]
>+            The device can encode video.
>+      \item[VIRTIO_VIDEO_F_DECODER (1)]
>+            The device can decode video.
>+            % Use-case: the device can support both encoding and decoding, so having both
>+            % here can save resources.
>+      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
>+            Guest pages can be used as the backing memory of resources.
>+      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
>+            The device can use non-contiguous guest memory as the backing memory of
>+            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
>+            set.
>+      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
>+            Objects exported by another virtio device can be used as the backing memory
>+            of resources.
>+      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
>+            The device releases an extra empty output buffer after a drain or DPC so that
>+            the driver can send a buffer with V4L2_BUF_FLAG_LAST set 
>in the V4L2 way.
>+\end{description}
>+
>+\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>+
>+The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
>+
>+The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>+VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
>+mean that no memory can be used at all for resources.
>+
>+The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
>+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.

Suggestion: This sentence could also exist as a Feature bit requirement, 
similar to existing devices. For example virtio-net's "5.1.3.1 Feature 
bit requirements"

>+
>+\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>+
>+The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
>+VIRTIO_VIDEO_F_DECODER features.
>+
>+The driver MUST negotiate at least one of the
>+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>+features.
>+
>+If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>+VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>+contiguous memory for all the buffers it allocates.
>+
>+\subsection{Device configuration layout}
>+\label{sec:Device Types / Video Device / Device configuration layout}
>+
>+The video device configuration space uses the following layout:
>+
>+\begin{lstlisting}
>+struct virtio_video_config {
>+        le32 max_streams;
>+        le32 caps_length;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{max_streams}]
>+            is the maximum number of concurrent streams the device supports.
>+      \item[\field{caps_length}]
>+            is the minimum length in bytes that a device-writable buffer must have
>+            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>+            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>+\end{description}
>+
>+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
>+
>+\field{max_streams} MUST be positive.
>+
>+\field{caps_length} MUST be set to the response size of
>+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>+
>+\subsection{Device Initialization}
>+\label{sec:Device Types / Video Device / Device Initialization}
>+\begin{enumerate}
>+      \item
>+            The driver reads the feature bits and negotiates the features it needs.
>+      \item
>+            The driver sets up the commandq and the eventq.
>+      \item
>+            The driver reads the \field{caps_length} field of the configuration
>+            space, prepares a buffer of at least that size and sends the buffer on the
>+            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>+      \item
>+            The device sends a response over commandq to
>+            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
>+            command.
>+      \item
>+            The driver receives the response from the device, and parses its capabilities.
>+\end{enumerate}
>+
>+\subsection{Device Operation}
>+\label{sec:Device Types / Video Device / Device Operation}
>+
>+The device supports opening and operating a number of parallel streams up to
>+\field{max_streams}. Each stream has three internal device queues: mainqX,
>+inputqX and outputqX, where X is the stream id. Each stream command has a
>+field that dispatches the command to the specific internal queue.
>+
>+% Use-case: there might be different real-time requirements for different
>+% streams, so more virtqueues can be added in the future if necessary.
>+% The internal queues don't change, the data formats don't change, only the
>+% mapping of streams/internal queues to particular virtqueues changes.
>+
>+The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
>+close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
>+using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
>+of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
>+the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
>+format negotiation.
>+
>+The inputqX and outputqX are used to queue input or output resources using
>+VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
>+output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
>+processing of all queued input resources and make the resulting output
>+resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
>+
>+All the stream commands start async operations, return the results
>+using async responses over eventq.

Suggestion: s/, return the results/and the results are returned

>+The eventq is used by the device to send the device's async responses to
>+stream commands and the device's standalone events.
>+
>+% This way eventq becomes the single source of truth about the device's state,
>+% the driver doesn't have to tediously synchronize commandq's and eventq's
>+% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
>+% and DQEVENT). One more benefit is that commandq is processed fast and
>+% strictly in order, so commandq descriptors exhaustion should never happen in
>+% practice.
>+
>+Parameters allow the driver to configure the stream including setting up the
>+resources. Available parameters depend on the device type, see
>+\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>+
>+A resource is a set of memory buffers that contain a unit of data that
>+the device can process or produce. Most resources have only one buffer,
>+raw frames using a multi-planar format can have several.
>+Input resources are filled by the driver with compressed (coded) video data
>+for a decoder and raw frames for an encoder, output resources are filled by
>+the device as the result of processing the input resources with decoded raw
>+frames for a decoder and compressed (encoded) data for an encoder.
>+Resources from inputqX and outputqX are consumed independently, not in pairs.
>+One input resource can result in zero to many produced output resources.
>+A decoder device dequeues the output decoded frames in presentation order.
>+An encoder device dequeues the output decoded frames in decoding order.
>+The driver can reuse a queued resource after receiving a corresponding async
>+response. Dequeued output resources can still be used by the device as
>+reference frames, so the driver can't write to them.
>+
>+% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
>+% output resource is not used by the device anymore and therefore becomes
>+% writeable?
>+
>+The device can detect standalone stream-related events: errors and dynamic
>+parameters changes that require intervention from the driver (e.g.
>+reallocating backing memory of output resources to fit the new parameters).
>+The events are signalled on the eventq, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>+
>+\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
>+
>+The device MUST set to zero all unused, disabled or padding bits in its
>+responses.
>+
>+\subsubsection{Device Operation: Command Virtqueue}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
>+
>+This section lists the commands that can be sent by the driver to commandq.
>+
>+Different structures are used for each command and response. A command
>+structure starts with the requested command code, defined as follows:
>+
>+\begin{lstlisting}
>+/* Device */
>+#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
>+
>+/* Stream */
>+#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
>+#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
>+#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
>+#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
>+#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
>+#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
>+#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
>+#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
>+\end{lstlisting}
>+
>+Stream commands start with a header:
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
>+#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
>+#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
>+
>+struct virtio_video_stream_cmd_header {
>+        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
>+        le32 stream_id;
>+        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
>+        le32 async_response_cookie;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{async_response_cookie}]
>+            is an async response cookie provided by the driver, that allows
>+            to relate an async response to the previously submitted command.
>+\end{description}
>+
>+\subsubsection{Device Operation: Event Virtqueue}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>+
>+The eventq is used by the device to send async responses to commands queued
>+by the driver on commandq and standalone events. Stream errors and dynamic
>+parameters changes are caused by changes in the device's state, not by
>+commands, still they are delivered as responses to implicit
>+VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
>+respectively.
>+
>+Events start with a header:
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
>+#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
>+#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
>+#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
>+
>+struct virtio_video_event_header {
>+        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
>+        le32 stream_id;
>+        le32 async_response_cookie;
>+        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{event_type}]
>+            is the type of the event.
>+      \item[\field{stream_id}]
>+            is the ID of a valid stream.
>+      \item[\field{async_response_cookie}]
>+            is an async response cookie provided by the driver, that allows
>+            to relate the event to a previously submitted command.
>+      \item[\field{event_flags}]
>+            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>+
>+            \begin{description}
>+                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
>+                        is set if the command finished with an error due to an
>+                        invalid argument or for other reasons.
>+                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
>+                        is set for standalone events, see
>+                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>+                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>+                        is set if the command has been canceled by another
>+                        command, that has higher priority. Doesn't make sense
>+                        for standalone events.
>+                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
>+                        is set if the command triggered a block on the
>+                        outputqX to allow output format negotiation.
>+                        When the negotiation is finished the block has to be
>+                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
>+                        command, see
>+                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>+            \end{description}
>+\end{description}
>+
>+The particular data structure representing the event is selected according to
>+the \field{event_type}.
>+
>+\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>+
>+The driver MUST at any time have at least one descriptor with a used
>+buffer large enough to contain a \field{struct virtio_video_event}
>+queued on the eventq.
>+
>+The driver MUST NOT put device-readable descriptors into the eventq.
>+
>+The driver MUST account for the fact that the async responses to commands
>+might come out-of-order (i.e. after other commands sent to the device),
>+and that some of them can be cancelled.
>+
>+The driver SHOULD wait for an async response of command A, that caused
>+cancellation of command B, before queueing the command B again.
>+
>+\subsubsection{Device Operation: TLV format}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>+
>+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
>+VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
>+commands represent device capabilities and corresponding device parameters
>+in the form of TLV (Type-Length-Value):
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv {
>+        le32 type;
>+        le32 length;
>+        u8 value[length];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{type}]
>+            specifies the type of data in \field{value}.
>+      \item[\field{length}]
>+            specifies the \field{value} size in bytes aligned to 4 bytes.
>+      \item[\field{value}]
>+            contains the data according to the type.
>+\end{description}
>+
>+The following TLV types are defined:
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_TLV_CODED_SET                1
>+#define VIRTIO_VIDEO_TLV_RAW_SET                  2
>+#define VIRTIO_VIDEO_TLV_LINK                     3
>+#define VIRTIO_VIDEO_TLV_CODED_FORMAT             4
>+#define VIRTIO_VIDEO_TLV_RAW_FORMAT               5
>+#define VIRTIO_VIDEO_TLV_CODED_RESOURCES          6
>+#define VIRTIO_VIDEO_TLV_RAW_RESOURCES            7
>+#define VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES     8
>+#define VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT   9
>+#define VIRTIO_VIDEO_TLV_CROP                     10
>+#define VIRTIO_VIDEO_TLV_V4L2_CONTROLS            11
>+\end{lstlisting}
>+
>+Some TLVs are used only as containers for sequences of nested TLVs:
>+
>+\begin{description}
>+      \item[\field{VIRTIO_VIDEO_TLV_CODED_SET}]
>+            groups various capabilities or parameters related to a particular coded
>+            format.
>+      \item[\field{VIRTIO_VIDEO_TLV_RAW_SET}]
>+            groups various capabilities or parameters related to a particular raw
>+            format.
>+      \item[\field{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}]
>+            contains V4L2 controls represented in the TLV format. Within this container
>+            only selected V4L2 control identifiers (V4L2_CID_*) are allowed to be used
>+            in the TLV \field{type} field, see
>+            \ref{sec:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS}.
>+\end{description}
>+
>+TLV with type VIRTIO_VIDEO_TLV_LINK is a special one used to define relations
>+between sets of capabilities, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>+
>+For each of the remaining TLV types two different contained data formats are
>+defined: one for the capabilities and one for the specific parameter values.
>+
>+\field{struct virtio_video_range} is used to represent a range of values in
>+some TLVs:
>+
>+\begin{lstlisting}
>+struct virtio_video_range {
>+        le32 min;
>+        le32 max;
>+        le32 step;
>+        u8 padding[4];
>+};
>+\end{lstlisting}
>+
>+An integer \(x\) is within the range \field{r} if
>+\(\field{r.min} \le x \le \field{r.max}\) holds and \(x\) equals to
>+\((\field{min} + \field{step} * n)\) for some integer \(n\).
>+
>+\devicenormative{\paragraph}{Device Operation: TLV format}{Device Types / Video Device / Device Operation / Device Operation: TLV format}
>+
>+\field{min}, \field{step} and \field{max} MUST be positive.
>+
>+\field{min} MUST be less then or equal to \field{max} within the same range.
>+
>+\subsubsection{Device Operation: Device Commands}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands}
>+
>+This command allows retrieving the device capabilities.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}
>+
>+Retrieve device capabilities for all available stream parameters (for example,
>+the range of values).
>+
>+The driver sends this command with
>+\field{struct virtio_video_device_query_caps}:
>+
>+\begin{lstlisting}
>+struct virtio_video_device_query_caps {
>+        le32 type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
>+};
>+\end{lstlisting}
>+
>+The device responds with
>+\field{struct virtio_video_device_query_caps_resp}:
>+
>+\begin{lstlisting}
>+
>+#define VIRTIO_VIDEO_RESULT_OK      0
>+#define VIRTIO_VIDEO_RESULT_ERROR   1
>+
>+struct virtio_video_device_query_caps_resp {
>+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
>+        u8 padding[4];
>+        /**
>+         * Followed by a sequence of TLVs up to caps_length
>+         * counted in bytes from the beginning of the struct.
>+         */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{result}]
>+            is
>+
>+            \begin{description}
>+                  \item[VIRTIO_VIDEO_RESULT_OK]
>+                        if the command succeeded,
>+                  \item[VIRTIO_VIDEO_RESULT_ERROR]
>+                        if the descriptor was smaller than the defined \field{caps_length} in
>+                        the video device configuration.
>+            \end{description}
>+\end{description}
>+
>+The sequence of TLVs consists of TLV containers VIRTIO_VIDEO_TLV_CODED_SET
>+and VIRTIO_VIDEO_TLV_RAW_SET defining sets of possible coded, or respectively
>+raw formats, including the corresponding parameters (e.g. profiles, levels
>+or format modifiers, resolutions), that are supported by the device. For the
>+details see
>+\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>+The last TLVs in the sequence with type VIRTIO_VIDEO_TLV_LINK establish
>+relations between the two groups. If there is a link, then the device supports
>+decoding from the specified coded set to the specified raw set, or encoding in
>+the opposite direction. The value format is defined as follows:
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_STREAM_TYPE_DECODER 0
>+#define VIRTIO_VIDEO_STREAM_TYPE_ENCODER 1
>+
>+struct virtio_video_tlv_link {
>+        le32 stream_type; /* One of VIRTIO_VIDEO_STREAM_TYPE_* */
>+        u8 padding[4];
>+        le64 links[n_coded * (n_raw + 63) / 64];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{stream_type}]
>+            is the type of the stream that is supported and negotiated using
>+            the respective feature flags.
>+      \item[\field{n_coded}]
>+            is the number of VIRTIO_VIDEO_TLV_CODED_SET containers.
>+      \item[\field{n_raw}]
>+            is the number of VIRTIO_VIDEO_TLV_RAW_SET containers.
>+      \item[\field{links}]
>+            is a bitset establishing links between coded and raw sets. For \field{i}-th
>+            coded and \field{j}-th raw sets counted from zero bit \field{(j \% 64)} in
>+            \field{links[i * (n_raw + 63) / 64 + j / 64]} defines the link if it is set.
>+\end{description}
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}
>+
>+Response to the command MUST be written by the device in the first
>+device-writable descriptor of the descriptor chain from which the command
>+came.
>+
>+The device MUST include into the response at least one
>+VIRTIO_VIDEO_TLV_CODED_SET and at least one VIRTIO_VIDEO_TLV_RAW_SET TLV
>+containers, and one VIRTIO_VIDEO_TLV_LINK TLV defining links between the coded
>+and raw sets for each VIRTIO_VIDEO_F_ENCODER and VIRTIO_VIDEO_F_DECODER
>+feature flag that is negotiated. The VIRTIO_VIDEO_TLV_LINK TLVs MUST be the
>+last in the sequence.
>+
>+Each VIRTIO_VIDEO_TLV_CODED_SET and VIRTIO_VIDEO_TLV_RAW_SET MUST take part
>+in at least one defined link in one of the VIRTIO_VIDEO_TLV_LINK TLVs.
>+
>+Each VIRTIO_VIDEO_TLV_CODED_SET MUST contain exactly one
>+VIRTIO_VIDEO_TLV_CODED_FORMAT TLV, exactly one
>+VIRTIO_VIDEO_TLV_CODED_RESOURCES TLV and at most one TLV of other types.
>+
>+Each VIRTIO_VIDEO_TLV_RAW_SET MUST contain exactly one
>+VIRTIO_VIDEO_TLV_RAW_FORMAT TLV, exactly one VIRTIO_VIDEO_TLV_RAW_RESOURCES
>+TLV and at most one TLV of other types.
>+
>+VIRTIO_VIDEO_TLV_RAW_SET containers SHOULD be ordered according to raw format
>+preferences of the device from preferred to not preferred ones.
>+
>+The total size of the response MUST be equal to \field{caps_length}
>+bytes, as reported by the device configuration.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}
>+
>+Descriptor chains sent to the commandq by the driver MUST include at least one
>+device-writable descriptor. The combined length of all such descriptors MUST
>+be at least \field{caps_length} bytes.
>+
>+\subsubsection{Device Operation: Stream commands}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands}
>+
>+Stream commands allow to open, close and control the flow of a stream.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_OPEN}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / OPEN}
>+
>+Open a video stream.
>+
>+The driver sends this command with \field{struct virtio_video_stream_open}:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_open {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_OPEN -> mainqX */
>+        le32 stream_type; /* One of VIRTIO_VIDEO_STREAM_TYPE_* */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to be opened.
>+      \item[\field{stream_type}]
>+            is the type of the stream to be opened.
>+\end{description}
>+
>+The device begins an async OPEN operation. When the operation is completed the
>+device sends the VIRTIO_VIDEO_CMD_STREAM_OPEN async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / OPEN}
>+
>+The device MUST ensure that the \field{stream_id} is within limits and that
>+the corresponding stream is not open.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / OPEN}
>+
>+VIRTIO_VIDEO_CMD_STREAM_OPEN MUST be sent to mainqX.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_CLOSE}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+
>+% Use-case: the guest user-space app closes the file descriptor. Cleanup fast.
>+
>+Close a video stream. Any activity on the stream is halted and all resources
>+are released by the time the async response is received by the driver.
>+
>+The driver sends this command with
>+\field{struct virtio_video_stream_close}:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_close {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_CLOSE -> mainqX */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{stream_id}]
>+            is the ID of the stream to be closed.
>+\end{description}
>+
>+The device begins an async CLOSE operation, that consists of RESET operations
>+on inputqX and outputqX, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET},
>+detaching all the resources, releasing the internal stream queues and any
>+corresponding internal resources. When the CLOSE operation is completed the
>+device sends the VIRTIO_VIDEO_CMD_STREAM_CLOSE async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+The same async response can also come after an unrecoverable stream error, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+
>+After VIRTIO_VIDEO_CMD_STREAM_CLOSE is queued, the device MUST send an async
>+response with VIRTIO_VIDEO_EVENT_FLAG_ERROR flag set to any subsequently
>+queued command with this stream ID except VIRTIO_VIDEO_CMD_STREAM_OPEN.
>+
>+The CLOSE operation MUST NOT be canceled.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+
>+\field{stream_id} MUST be set to a valid stream ID of an open stream.
>+
>+VIRTIO_VIDEO_CMD_STREAM_CLOSE MUST be sent to mainqX.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}
>+
>+Set selected parameters of inputqX or outputqX of a given stream and receive
>+back the actual values of the set parameters. Coded parameters within a
>+VIRTIO_VIDEO_TLV_CODED_SET container belong to inputqX of a decoder stream and
>+to outputqX of an encoder stream. Raw parameters within a
>+VIRTIO_VIDEO_TLV_RAW_SET container belong to outputqX of a decoder stream and
>+to inputqX of an encoder stream.
>+
>+The driver sends this command with
>+\field{struct virtio_video_stream_set_params}:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_get_set_params {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS */
>+        /**
>+         * Followed by a single VIRTIO_VIDEO_TLV_CODED_SET or
>+         * VIRTIO_VIDEO_TLV_RAW_SET TLV container with the parameters.
>+         */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to set parameters for.
>+\end{description}
>+
>+The command can be queued to:
>+
>+\begin{itemize}
>+      \item[\field{inputqX}]
>+            The parameters are set after all commands previously queued on the
>+            inputqX are processed.
>+      \item[\field{mainqX}]
>+            The parameters are set without waiting for other commands queued
>+            on inputqX to be processed.
>+\end{itemize}
>+
>+% Use-case: for the decoder, resolution can be set manually by the driver
>+% (useful for codecs that do not embed this information, like MPEG-2).
>+% The processing sequence should look similar to the dynamic parameters
>+% change case.
>+% Use-case: V4L2's request API.
>+
>+Any changes to formats, decreasing resource numbers or changes to resources
>+in use trigger the following sequence:
>+\begin{enumerate}
>+      \item
>+            an implicit DRAIN operation, see
>+            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN};
>+      \item
>+            only for changes to outputqX parameters: outputqX is blocked until
>+            a VIRTIO_VIDEO_CMD_STREAM_UNBLOCK command is received, see
>+            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>+            When the block is active the decoder or encoder can't get anything
>+            from outputqX.
>+\end{enumerate}
>+
>+% Use-case: dynamic resolution changes on inter frames in VP9.
>+% See https://lore.kernel.org/linux-media/20240314153226.197445-1-benjamin.gaignard@collabora.com/
>+% Because of this buffers can't be detached/deallocated/reset the way it was
>+% specified in the past when a dynamic resolution change happens. Therefore
>+% the access to the outputqX is blocked until the format negotiation is
>+% finished. Otherwise there is a race condition: device sends a DPC event, the
>+% driver meantime keeps queueing buffers, the device can't figure out if these
>+% buffers should be used after the DPC or not. This is somewhat similar to
>+% V4L2_DEC_CMD_START command except that here it only covers the parameter
>+% changes.
>+
>+Only the parameters returned in one of the corresponding sets in the device
>+capabilities can be set, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>+The device checks and applies the parameter changes and sends the
>+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+The async response can also come in case of a dynamic parameters change, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}.
>+
>+The command-specific async response
>+\field{struct virtio_video_stream_params_async_resp} is defined
>+as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_get_set_params_async_resp {
>+        struct virtio_video_event_header hdr;
>+        /**
>+         * Followed by a single VIRTIO_VIDEO_TLV_CODED_SET or
>+         * VIRTIO_VIDEO_TLV_RAW_SET TLV container with the parameters.
>+         */
>+};
>+\end{lstlisting}
>+
>+The TLV container in the response is of the same type as in the request and it
>+contains the actual values of the set parameters supported by the
>+device. The values set by the device can differ from the requested values
>+depending on the device's capabilities. If the TLV container in the request is
>+empty, the response is also empty. \textbf{Note:} lengths of the
>+VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES and
>+VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT TLVs are always 8 in the device's
>+response in order to save memory and make eventq descriptor size more
>+predictable, i.e. they include only the \field{resource_id} fields. Missing
>+TLV for a resource means that it is not attached.
>+
>+The backing memory for resources can only be attached when there is no chance
>+for it to be simultaneously used by the device.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}
>+
>+The device MUST initialize each parameter to a valid default value.
>+
>+The device MUST allow each parameter to be read even without the driver
>+explicitly setting a value for them beforehand.
>+
>+The device MAY adjust any received parameter to a closest supported
>+value if the received one is not supported with the current settings.
>+
>+The parameters received and returned by the device MUST fit together into a
>+pair of linked sets returned in
>+\field{struct virtio_video_device_query_caps_resp}.
>+
>+The parameters MUST be applied in the order of appearance in the TLV
>+container.
>+The device MUST send an async response with an error flag set as soon as it
>+encounters an invalid not correctable input and stop processing the TLVs
>+afterwards.
>+
>+The device MUST process parameters changes, that are embedded in the input
>+stream, in the same way as if there is a VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
>+command queued into inputqX changing the outputqX parameters. A standalone DPC
>+event MUST be sent in place of the command's async response in this case.
>+
>+The device MUST return the changed inputqX or outputqX parameters in the
>+async response.
>+
>+If the command is interrupted with a RESET operation on inputqX or a CLOSE
>+operation, the device MUST send the async response with
>+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}
>+
>+\field{stream_id} MUST be set to a valid stream ID of an open stream.
>+
>+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS MUST be sent to mainqX or inputqX or
>+outputqX where X equals \field{stream_id}.
>+
>+The driver MUST put exactly one TLV container to the request with type
>+selected according to the queue type.
>+
>+The driver MUST check the actual values of the parameters as set by the
>+device and work with these values, or try to set different ones if it
>+cannot, or fail properly.
>+
>+After creating a new stream, the initial value of all parameters is
>+undefined to the driver. Thus, the driver MUST NOT assume the default
>+value of any parameter and MAY use VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
>+in order to get the values of the parameters it needs.
>+
>+If some of the resources were detached as a result of this command the driver
>+SHOULD reattach the backing memories of these resources and queue them again
>+to resume the device operation.
>+
>+The same type of backing memories (either guest pages, or virtio objects)
>+MUST be used for all resources within a queue.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / GET PARAMS}
>+
>+Get the current values of all parameters supported by the device for inputqX
>+or outputqX of a given stream as reported by
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>+The command is very similar to VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, except that
>+the TLV set in the command is always empty and all supported parameters are
>+returned by the device in the async response.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}
>+
>+Unblock the access to outputqX after output format and resource parameters
>+negotiation between the device and the driver is finished.
>+
>+The driver sends this command with
>+\field{struct virtio_video_stream_unblock}:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_unblock {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_UNBLOCK -> mainqX */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to continue.
>+\end{description}
>+
>+When the outputqX is unblocked the device sends the
>+VIRTIO_VIDEO_CMD_STREAM_UNBLOCK async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}
>+
>+The device MUST set the VIRTIO_VIDEO_EVENT_FLAG_ERROR flag if the outputqX is
>+not blocked.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_UNBLOCK}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}
>+
>+VIRTIO_VIDEO_CMD_STREAM_UNBLOCK MUST be sent to mainqX.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_DRAIN}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN}
>+
>+Complete processing of all input resources queued before this command
>+and make the resulting output resources available to the driver.
>+
>+The driver sends this command with
>+\field{struct virtio_video_stream_drain}:
>+
>+\begin{lstlisting}
>+struct virtio_video_stream_drain {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_DRAIN -> inputqX */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to drain.
>+\end{description}
>+
>+The device begins the async DRAIN operation. When the operation is completed
>+the device sends the VIRTIO_VIDEO_CMD_STREAM_DRAIN async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN}
>+
>+Before the device sends the response, it MUST process and respond to all
>+the commands on the inputqX that were sent before the drain command, and make
>+all the corresponding output resources available to the driver with async
>+responses to their VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE commands.
>+
>+The device MUST be able to accept commands to inputqX while a DRAIN operation
>+is ongoing, but any resulting async responses MUST NOT be sent before
>+the async response to the command, that started the DRAIN operation.
>+
>+If the command is interrupted with a RESET operation on inputqX or a CLOSE
>+operation, the device MUST send the async response with
>+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
>+
>+The device MUST retain certain state after a DRAIN e.g. VPS, SPS, PPS.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN}
>+
>+VIRTIO_VIDEO_CMD_STREAM_DRAIN MUST be sent to inputqX.
>+
>+The driver MUST keep queueing output resources until it gets the
>+async response to this command or cancels it using
>+VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET or
>+VIRTIO_VIDEO_CMD_STREAM_CLOSE. Failure to do so may result in the
>+device stalling as it waits for output resources to write into.
>+
>+The driver MUST send a VIRTIO_VIDEO_CMD_STREAM_DRAIN command when it does not
>+have any further input to ensure it receives all the output.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET}
>+
>+Immediately cancel all queued resources in inputqX or outputqX without
>+processing them and discard any processing results, that are not yet dequeued.
>+This command is useful for decoders that need to quickly jump to another point
>+in the stream (i.e. for seeking), or in order to clear the queue as quickly as
>+possible.
>+
>+The driver sends this command with
>+\field{struct virtio_video_queue_reset}:
>+
>+\begin{lstlisting}
>+struct virtio_video_queue_reset {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET -> mainqX */
>+        le32 reset_queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_{INPUT|OUTPUT} */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to reset.
>+      \item[\field{reset_queue_type}]
>+            is the queue type to reset.
>+\end{description}
>+
>+The device begins the async RESET operation. When the async RESET operation is
>+completed the device sends the VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET async
>+response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET}
>+
>+The device MUST send async responses with VIRTIO_VIDEO_EVENT_FLAG_CANCELED
>+flag set for all active or pending commands in the selected queue before
>+sending the async response to this command.
>+
>+The device MUST interrupt operation as quickly as possible. Doing a RESET of
>+inputqX MUST NOT depend on output resources being queued by the driver.
>+
>+% If the device must accept more input after the beginning of the RESET
>+% like it was required in the previous versions of the specification, then
>+% some more measures are necessary because these are different queues now.
>+% For example, adding a "generation" field into the commands. At the moment
>+% this doesn't look like a problem because this is not supported in V4L2.
>+
>+The device MUST retain certain state after a RESET e.g. VPS, SPS, PPS.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET}
>+
>+\field{stream_id} MUST be set to a valid stream ID of an open stream.
>+
>+VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET MUST be sent to mainqX.
>+
>+\paragraph{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / RESOURCE QUEUE}
>+
>+Provide an input or output resource to the device for processing.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_MAX_PLANES                    8
>+
>+#define VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME         (1 << 0)
>+#define VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME           (1 << 1)
>+#define VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME           (1 << 2)
>+/* On dequeue only */
>+#define VIRTIO_VIDEO_QUEUE_FLAG_V4L2_DPC_LAST     (1 << 3)
>+#define VIRTIO_VIDEO_QUEUE_FLAG_V4L2_DRAIN_LAST   (1 << 4)
>+
>+struct virtio_video_resource_queue {
>+        struct virtio_video_stream_cmd_header hdr; /* VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE */
>+        le32 resource_id;
>+        le32 flags; /* Bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* */
>+        le64 timestamp;
>+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
>+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{hdr.stream_id}]
>+            is the ID of the stream to provide the resource to.
>+      \item[\field{hdr.queue_type}]
>+            is either inpuqX, or outputqX.
>+      \item[\field{resource_id}]
>+            is the ID of the resource to be queued.
>+      \item[\field{flags}]
>+            is a bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* values.
>+
>+            \begin{description}
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME]
>+                        can be set on decoder input resources when the
>+                        resource contains an encoded key frame.
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME]
>+                        can be set on decoder input resources when the
>+                        resource contains only differences to preceding frames.
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME]
>+                        can be set on decoder input resources when the
>+                        resource contains the differences between the current
>+                        frame and both the preceding and following frames.
>+            \end{description}
>+      \item[\field{timestamp}]
>+            is an abstract sequence counter that can be used on the inputqX for
>+            synchronization. Resources produced on the output queue will carry the
>+            \field{timestamp} of the first input resource they have been produced
>+            from.
>+      \item[\field{offsets}]
>+            is the starting offset for the data in the buffer for each plane.
>+            The number of planes depends on the format. Set by the driver for input
>+            resources.
>+      \item[\field{data_sizes}]
>+            is number of data bytes used for each plane. Set by the driver for input
>+            resources.
>+\end{description}
>+
>+The device uses the resource in the video processing. When the processing of
>+the resource is completed the device sends the
>+VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE async response, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
>+
>+The command-specific async response
>+\field{struct virtio_video_resource_queue_async_resp} is defined
>+as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_resource_queue_async_resp {
>+        struct virtio_video_event_header hdr;
>+        le32 flags;
>+        u8 padding[4];
>+        le64 timestamp;
>+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
>+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{flags}]
>+            is a bitmask of VIRTIO_VIDEO_QUEUE_FLAG_* flags.
>+
>+            \begin{description}
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME]
>+                        is set on encoder output resources when the
>+                        resource contains an encoded key frame.
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME]
>+                        is set on encoder output resources when the
>+                        resource contains only differences to preceding frames.
>+                  \item[VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME]
>+                        is set on encoder output resources when the
>+                        resource contains the differences between the current
>+                        frame and both the preceding and following frames.
>+            \end{description}
>+      \item[\field{timestamp}]
>+            is set on output resources to the \field{timestamp} value of the first input
>+            resource that produced the resource.
>+      \item[\field{offsets}]
>+            is set on output resources to the starting offset for the data in the
>+            buffer for each plane.
>+      \item[\field{data_sizes}]
>+            is set on output resources to the amount of data written by the device,
>+            for each plane.
>+\end{description}
>+
>+VIRTIO_VIDEO_EVENT_FLAG_ERROR is set in event_flags of the async response on
>+resources when a non-fatal processing error has happened and the data
>+contained in the resource is likely to be corrupted.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / RESOURCE QUEUE}
>+
>+The device MUST set VIRTIO_VIDEO_EVENT_FLAG_ERROR in the async response if the
>+resource has not been attached prior to queueing it, or for an attempt to queue
>+a resources that is still processed asynchronously, or for resources that might
>+contain corrupted content due to an error.
>+
>+For output resources, the device MUST copy the \field{timestamp}
>+parameter of the first input resource that produced it into the async
>+response.
>+When many output resources are produced from a single input resource, the
>+device MUST copy the timestamp of the input resource to all of the output
>+resources.
>+
>+In case of encoder, the device MUST mark each output resource with one of
>+VIRTIO_VIDEO_QUEUE_FLAG_KEY_FRAME, VIRTIO_VIDEO_QUEUE_FLAG_P_FRAME, or
>+VIRTIO_VIDEO_QUEUE_FLAG_B_FRAME.
>+
>+If the processing of a resource was canceled due to a stream event, a
>+VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, or a VIRTIO_VIDEO_CMD_STREAM_CLOSE,
>+the device MUST send the corresponding async response with
>+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
>+
>+When starting or resuming processing after a RESET or a DRAIN operation, the
>+device MAY skip input data until it finds a point that allows it to resume
>+operation properly (e.g. until a keyframe is found in the input stream of a
>+decoder).
>+
>+The device MUST properly handle the case when a dequeued but still referenced
>+resource is queued again.
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / RESOURCE QUEUE}
>+
>+VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE MUST be sent to inputqX or outputqX.
>+
>+\field{resource_id} MUST be an ID of a resource, that is both allocated and
>+attached for the queue.
>+
>+The driver MUST be able to handle the output resources in decoding order in
>+encoder case, i.e. with timestamps out of order.
>+
>+\subsubsection{Device Operation: Standalone Events}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}
>+
>+These events are caused by state changes in the device, not as an async
>+response to any command.
>+
>+\paragraph{Error Event}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}
>+
>+The error event is sent by the device when an unrecoverable error occurs
>+during processing a stream. The device operation is the same as when
>+it receives a VIRTIO_VIDEO_CMD_STREAM_CLOSE command, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+except that it also sets the VIRTIO_VIDEO_EVENT_FLAG_ERROR flag in the
>+response. Note that this is different from other async responses carrying the
>+VIRTIO_VIDEO_EVENT_FLAG_ERROR flag. The latter indicates that e.g. the
>+particular output frame might be corrupted, but the stream still exists
>+and can recover.
>+
>+\paragraph{Dynamic Parameters Change Event}
>+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}
>+
>+A Dynamic Parameters Change (or DPC) event is sent by a decoder device when it
>+detects that the parameters of the stream being decoded have changed.
>+The device operation is the same as if it receives a
>+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS command in the inputqX at the exact same
>+point in the stream, that changes outputqX parameters, see
>+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}.
>+This includes activating the outputqX block if necessary.
>+
>+% TODO add QoS events and overall think about quotas. Codecs are normally
>+% limited by bandwidth/macroblocks per second. How can we accommodate this?
>+
>+\subsection{Device capabilities and parameters}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters}
>+
>+\subsubsection{VIRTIO_VIDEO_TLV_CODED_SET}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED}
>+
>+These parameters are defined for the coded parameter sets.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_CODED_FORMAT}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / FORMAT}
>+
>+The following coded formats are defined:
>+
>+\begin{lstlisting}
>+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG2  1  /* MPEG-2 Part 2  (V4L2_PIX_FMT_MPEG2) */
>+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG4  2  /* MPEG-4 Part 2  (V4L2_PIX_FMT_MPEG4) */
>+#define VIRTIO_VIDEO_CODED_FORMAT_H264   3  /* H.264          (V4L2_PIX_FMT_H264)  */
>+#define VIRTIO_VIDEO_CODED_FORMAT_HEVC   4  /* HEVC aka H.265 (V4L2_PIX_FMT_HEVC)  */
>+#define VIRTIO_VIDEO_CODED_FORMAT_VP8    5  /* VP8            (V4L2_PIX_FMT_VP8)   */
>+#define VIRTIO_VIDEO_CODED_FORMAT_VP9    6  /* VP9            (V4L2_PIX_FMT_VP9)   */
>+#define VIRTIO_VIDEO_CODED_FORMAT_FWHT   7  /* FWHT           (V4L2_PIX_FMT_FWHT)  */
>+\end{lstlisting}
>+
>+The coded formats and the expected data units per buffer are documented in
>+\hyperref[intro:V4L2]{V4L2 header} and
>+\hyperref[intro:V4L2 compressed]{V4L2 compressed formats documentation}.
>+
>+\field{struct virtio_video_tlv_coded_format} represents both the coded format
>+in a coded set of capabilities and the specific parameter values:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_coded_format {
>+        le32 format; /* VIRTIO_VIDEO_CODED_FORMAT_* */
>+};
>+\end{lstlisting}
>+
>+\paragraph{VIRTIO_VIDEO_TLV_CODED_RESOURCES}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / RESOURCES}
>+
>+Setup common coded resources parameters.
>+
>+\field{struct virtio_video_tlv_coded_resources_caps} represents capabilities:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_coded_resources_caps {
>+        struct virtio_video_range num_resources_range;
>+        struct virtio_video_range resource_size_range;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{num_resources_range}]
>+            is the supported range of resources number of a particular coded set.
>+      \item[\field{resource_size_range}]
>+            is the supported range of resource sizes.
>+\end{description}
>+
>+\field{struct virtio_video_tlv_resources_val} represents the parameter values:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_resources_val {
>+        le32 num_resources;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{num_resources}]
>+            is the number of resources that can be addressed for the queue, numbered
>+            from \(0\) to \(num\_resources - 1\). Setting this parameter to zero is
>+            allowed even when \field{num_resources_range.min} is positive, this results
>+            in detaching all the resources.
>+\end{description}
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / RESOURCE GUEST PAGES}
>+
>+This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET, see
>+\ref{sec:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE GUEST PAGES}.
>+Note, that a coded resource can only have a single buffer, so only the first
>+element of \field{num_entries} is not zero.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / RESOURCE VIRTIO OBJECT}
>+
>+This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET, see
>+\ref{sec:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE VIRTIO OBJECT}.
>+Note, that a coded resource can only have a single buffer, so
>+\field{num_objects} is always 1.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS}
>+
>+Inside this TLV container only selected V4L2 control IDs are allowed to be
>+used as TLV types. The subset is listed in subsections below. Values of the
>+V4L2 controls can be converted to TLVs by taking their representation as
>+\hyperref[intro:V4L2 ext ctrls]{struct v4l2_ext_control} and replacing the
>+pointers with values. Capabilities of the V4L2 controls can't be converted to
>+TLVs as easily, so they are described below. This is mostly useful for
>+encoders. Most relevant V4L2 controls are codec-specific. All definitions
>+related to V4L2 controls can be found in
>+\hyperref[intro:V4L2 controls]{V4L2 controls header}, their descriptions
>+can be found in \hyperref[intro:V4L2 codec controls]{V4L2 documentation}.
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}{Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS}
>+
>+The device MUST NOT advertise codec-specific parameters not corresponding to
>+the coded format of the particular coded set.
>+
>+\subparagraph{V4L2 controls: 32 bit integers}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS / V4L2 controls: 32 bit integers}
>+
>+Integer V4L2 controls are signed by default, but this specification doesn't
>+define any signed integer types, see \ref{sec:Structure Specifications}, so
>+not every integer V4L2 control could be used directly. Still for many of them
>+negative values don't make sense, so these controls are allowed in the range
>+from 0 to INT32_MAX:
>+
>+\begin{itemize}
>+      \item V4L2_CID_MPEG_VIDEO_BITRATE: bitrate in bits per second
>+\end{itemize}
>+
>+For capabilities the TLV value is defined as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_v4l2_int_caps {
>+        struct virtio_video_range range;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{range}]
>+            is a range of possible values of the control.
>+\end{description}
>+
>+For the control values the TLV value is defined as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_v4l2_int_val {
>+        le32 value;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{value}]
>+            is one of the supported control values.
>+\end{description}
>+
>+\drivernormative{\subparagraph}{V4L2 controls: 32 bit integers}{Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS / V4L2 controls: 32 bit integers}
>+
>+The integer V4L2 control values MUST be in the range from 0 to INT32_MAX.
>+
>+\subparagraph{V4L2 controls: Enumerations}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS / V4L2 controls: Enumerations}
>+
>+The following V4L2 controls with values defined as enums are allowed:

Suggestion: mention that the values are taken from \hyperref[intro:V4L2 
controls]{V4L2 controls header} here as well

>+\begin{itemize}
>+      \item V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE
>+            % enum v4l2_mpeg_video_mpeg2_profile: V4L2_MPEG_VIDEO_MPEG2_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL
>+            % enum v4l2_mpeg_video_mpeg2_level: V4L2_MPEG_VIDEO_MPEG2_LEVEL_*
>+      \item V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE
>+            % enum v4l2_mpeg_video_mpeg4_profile: V4L2_MPEG_VIDEO_MPEG4_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL
>+            % enum v4l2_mpeg_video_mpeg4_level: V4L2_MPEG_VIDEO_MPEG4_LEVEL_*
>+      \item V4L2_CID_MPEG_VIDEO_H264_PROFILE
>+            % enum v4l2_mpeg_video_h264_profile: V4L2_MPEG_VIDEO_H264_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_H264_LEVEL
>+            % enum v4l2_mpeg_video_h264_level: V4L2_MPEG_VIDEO_H264_LEVEL_*
>+      \item V4L2_CID_MPEG_VIDEO_HEVC_PROFILE
>+            % enum v4l2_mpeg_video_hevc_profile: V4L2_MPEG_VIDEO_HEVC_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
>+            % enum v4l2_mpeg_video_hevc_level: V4L2_MPEG_VIDEO_HEVC_LEVEL_*
>+      \item V4L2_CID_MPEG_VIDEO_VP8_PROFILE
>+            % enum v4l2_mpeg_video_vp8_profile: V4L2_MPEG_VIDEO_VP8_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_VP9_PROFILE
>+            % enum v4l2_mpeg_video_vp9_profile: V4L2_MPEG_VIDEO_VP9_PROFILE_*
>+      \item V4L2_CID_MPEG_VIDEO_VP9_LEVEL
>+            % enum v4l2_mpeg_video_vp9_level: V4L2_MPEG_VIDEO_VP9_LEVEL_*
>+\end{itemize}
>+
>+For capabilities the TLV value is defined as follows:
>+
>+\begin{lstlisting}
>+#define MASK(x) (1 << (x))
>+
>+struct virtio_video_tlv_v4l2_enum_caps {
>+        le32 bitmask; /* Bitmask of MASK(<enum value>) */
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{bitmask}]
>+            is a bitmask of supported enum values used as bit numbers, see
>+            \hyperref[intro:V4L2 controls]{V4L2 controls header}.
>+\end{description}
>+
>+For the control values the TLV value is defined as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_v4l2_enum_val {
>+        u8 value; /* <enum value> */
>+        u8 padding[3];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{value}]
>+            is one of the supported enum values, see
>+            \hyperref[intro:V4L2 controls]{V4L2 controls header}.
>+\end{description}
>+
>+\subsubsection{VIRTIO_VIDEO_TLV_RAW_SET}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW}
>+
>+These parameters are defined for the raw parameter sets.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RAW_FORMAT}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW / FORMAT}
>+
>+DRM fourcc format definitions and DRM format modifiers are used to represent
>+raw formats capabilities and values. The layouts of raw formats are documented
>+in \hyperref[intro:DRM formats]{DRM} and \hyperref[intro:V4L2]{V4L2} headers,
>+as well as in \hyperref[intro:V4L2 RGB]{V4L2 RGB} and
>+\hyperref[intro:V4L2 YUV]{planar YUV} formats documentation.
>+
>+% Some DRM and V4L2 formats can be matched with this table:
>+% DRM_FORMAT_ARGB8888 = V4L2_PIX_FMT_ABGR32
>+% DRM_FORMAT_BGRA8888 = V4L2_PIX_FMT_ARGB32
>+% DRM_FORMAT_RGBA8888 = V4L2_PIX_FMT_BGRA32
>+% DRM_FORMAT_NV12     = V4L2_PIX_FMT_NV12
>+% DRM_FORMAT_YUV420   = V4L2_PIX_FMT_YUV420
>+% DRM_FORMAT_YVU420   = V4L2_PIX_FMT_YVU420
>+% DRM_FORMAT_YUYV     = V4L2_PIX_FMT_YUYV
>+
>+\field{struct virtio_video_tlv_raw_format_caps} is used to describe the
>+capabilities:
>+
>+\begin{lstlisting}
>+enum virtio_video_planes_layout {
>+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1,
>+        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS = 2,
>+};
>+
>+struct virtio_video_tlv_raw_format_caps {
>+        le32 planes_layout_mask; /* Bitmask of VIRTIO_VIDEO_PLANES_LAYOUT_* */
>+        le32 fourcc; /* DRM_FORMAT_* */
>+        le64 modifier; /* DRM_FORMAT_MOD_* */
>+        struct virtio_video_range width_range;
>+        struct virtio_video_range height_range;
>+        le32 stride_align_mask;
>+        le32 height_align_mask;
>+        le32 plane_align_mask;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{planes_layout_mask}]
>+            is a bitmask of supported planes layout types according to
>+            \field{enum virtio_video_planes_layout}.
>+      \item[\field{fourcc}]
>+            specifies the raw format, to which these capabilities apply.
>+      \item[\field{modifier}]
>+            specifies the raw format modifier.
>+      \item[\field{width_range}]
>+            is a range of widths in pixels.
>+      \item[\field{height_range}]
>+            is a range of heights in pixels.
>+      \item[\field{stride_align_mask}]
>+            is a bitmask of all supported power of two alignments of the distance in
>+            bytes between two lines of data (stride).
>+      \item[\field{height_align_mask}]
>+            is a bitmask of all supported power of two height alignments in pixels (scanlines).
>+      \item[\field{plane_align_mask}]
>+            is a bitmask of all supported power of two alignments in bytes of planes
>+            within a buffer. This field is valid only if \field{planes_layout_mask} has
>+            the \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
>+\end{description}
>+
>+\field{struct virtio_video_tlv_raw_format_val} is used to describe the
>+values:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_raw_format_val {
>+        le32 planes_layout; /* VIRTIO_VIDEO_PLANES_LAYOUT_* */
>+        le32 fourcc; /* DRM_FORMAT_* */
>+        le64 modifier; /* DRM_FORMAT_MOD_* */
>+        le32 width;
>+        le32 height;
>+        le32 stride_align;
>+        le32 height_align;
>+        le32 plane_align;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{planes_layout}]
>+            is the actual layout of the planes.
>+      \item[\field{fourcc}]
>+            specifies the raw format.
>+      \item[\field{modifier}]
>+            specifies the raw format modifier.
>+      \item[\field{width}]
>+            is the width in pixels of the stream frames.
>+      \item[\field{height}]
>+            is the height in pixels of the stream frames.
>+      \item[\field{stride_align}]
>+            is the power of two stride alignment in bytes.
>+      \item[\field{height_align}]
>+            is the power of two height alignment in pixels (scanlines).
>+      \item[\field{plane_align}]
>+            is the power of two alignment in bytes of planes within a buffer. This field
>+            is valid only if \field{planes_layout} has the
>+            \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
>+\end{description}
>+
>+% TODO: add colorimetry
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_RAW_FORMAT}{Device Types / Video Device / Device capabilities and parameters / RAW / FORMAT}
>+
>+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit in
>+\field{planes_layout_mask} if the plane layout with planes of a frame laid out
>+one after another in the same buffer is supported.
>+
>+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS} bit in
>+\field{planes_layout_mask} if the plane layout with planes of a frame laid out
>+in separate buffers is supported.
>+
>+% TODO: not sure if !VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG should be compatible
>+% with VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS or not.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RAW_RESOURCES}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCES}
>+
>+\field{struct virtio_video_tlv_raw_resources_caps} represents capabilities:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_raw_resources_caps {
>+        struct virtio_video_range num_resources_range;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{num_resources_range}]
>+            is the supported range of resources number of a particular raw set.
>+\end{description}
>+
>+\field{struct virtio_video_tlv_resources_val} represents the parameter values,
>+see
>+\ref{sec:Device Types / Video Device / Device capabilities and parameters / CODED / RESOURCES}.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE GUEST PAGES}
>+
>+Setup guest pages as backing memory of a resource.
>+
>+The parameter capabilities are empty. The empty TLV with zero length indicates
>+the support for attaching guest pages to resources.
>+
>+\field{struct virtio_video_tlv_resource_guest_pages} represents the parameter
>+values:
>+
>+\begin{lstlisting}
>+struct virtio_video_resource_sg_entry {
>+        le64 addr;
>+        le32 length;
>+        u8 padding[4];
>+};
>+
>+struct virtio_video_tlv_resource_guest_pages {
>+        le32 resource_id;
>+        u8 padding[4];
>+        le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
>+        struct virtio_video_resource_sg_entry entries[];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{resource_id}]
>+            is the ID of the resource.
>+      \item[\field{num_entries}]
>+            is the number of scatter-gather list entries in each of the separate buffers
>+            forming together the resource according to currently set format. Unused
>+            array elements are set to 0. Sum of the array is the length of the
>+            \field{entries} array.
>+      \item[\field{entries}]
>+            is an array of the scatter-gather list entries:
>+
>+            \begin{description}
>+                  \item[\field{addr}]
>+                        is a guest physical address of the start of the SG entry aligned to
>+                        the physical guest pages size.
>+                  \item[\field{length}]
>+                        is the length of the SG entry in bytes aligned to the physical guest
>+                        pages size.
>+            \end{description}
>+\end{description}
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}{Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE GUEST PAGES}
>+
>+\field{resource_id} MUST be an integer within the range of resource IDs
>+currently allocated for the queue.
>+
>+The memory regions identified by the elements of the \field{entries} array
>+MUST NOT overlap.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE VIRTIO OBJECT}
>+
>+Setup virtio objects as backing memory to a resource.
>+
>+The parameter capabilities are empty. The empty TLV with zero length indicates
>+the support for attaching virtio objects to resources.
>+
>+\field{struct virtio_video_tlv_resource_virtio_object} represents the parameter
>+values:
>+
>+\begin{lstlisting}
>+struct virtio_video_resource_object {
>+        u8 uuid[16];
>+};
>+
>+struct virtio_video_tlv_resource_virtio_object {
>+        le32 resource_id;
>+        le32 num_objects; /* Up to VIRTIO_VIDEO_MAX_PLANES */
>+        struct virtio_video_resource_object objects[num_objects];
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{resource_id}]
>+            is the ID of the resource.
>+      \item[\field{num_objects}]
>+            is the length of the \field{objects} array according to currently set
>+            format.
>+      \item[\field{object}]
>+            is an array of objects exported from another virtio device, see
>+            \ref{sec:Basic Facilities of a Virtio Device / Exporting Objects}.
>+
>+            \begin{description}
>+                  \item[uuid]
>+                        is a version 4 UUID specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>+            \end{description}
>+\end{description}
>+
>+\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}{Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE VIRTIO OBJECT}
>+
>+\field{resource_id} MUST be an integer within the range of resource IDs
>+currently allocated for the queue.
>+
>+\paragraph{VIRTIO_VIDEO_TLV_CROP}
>+\label{sec:Device Types / Video Device / Device capabilities and parameters / RAW / CROP}
>+
>+% TODO There is no reason in doing crop if it doesn't affect the output.
>+% So the output frames have to be smaller, than the full size. In the decoder
>+% case this means, that the buffers can't be used as a reference. So when crop
>+% is enabled, the decoder probably has to have some intermediate buffers.
>+% Is it reasonable to reallocate output buffers then? It could be. So it has
>+% to be decided (probably in the same way it is usually done in V4L2). In the
>+% encoder case this is not a problem.
>+% Is setting compose rectangles useful at all?
>+
>+This parameter sets a rectangle covering the visible area of the frame.
>+
>+The parameter capabilities are empty. The empty TLV with zero length indicates
>+the support for cropping.
>+
>+The parameter value is defined as follows:
>+
>+\begin{lstlisting}
>+struct virtio_video_tlv_crop_val {
>+        le32 left;
>+        le32 top;
>+        le32 width;
>+        le32 height;
>+};
>+\end{lstlisting}
>+
>+\begin{description}
>+      \item[\field{left, top}]
>+            are coordinates of top left corner of the crop rectangle in pixels.
>+      \item[\field{width, height}]
>+            are dimensions of the crop rectangle in pixels.
>+\end{description}
>+
>+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_CROP}{Device Types / Video Device / Device capabilities and parameters / RAW / CROP}
>+
>+The crop rectangle MUST be reset to full frame size on every resolution
>+change.
>diff --git a/device-types/video/device-conformance.tex b/device-types/video/device-conformance.tex
>new file mode 100644
>index 0000000..64960ac
>--- /dev/null
>+++ b/device-types/video/device-conformance.tex
>@@ -0,0 +1,22 @@
>+\conformance{\subsection}{Video Device Conformance}
>+\label{sec:Conformance / Device Conformance / Video Device Conformance}
>+
>+A video device MUST conform to the following normative statements:
>+
>+\begin{itemize}
>+\item \ref{devicenormative:Device Types / Video Device / Feature bits}
>+\item \ref{devicenormative:Device Types / Video Device / Device configuration layout}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / OPEN}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET}
>+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / RESOURCE QUEUE}
>+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS}
>+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / RAW / FORMAT}
>+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / RAW / CROP}
>+\end{itemize}
>diff --git a/device-types/video/driver-conformance.tex b/device-types/video/driver-conformance.tex
>new file mode 100644
>index 0000000..ca59885
>--- /dev/null
>+++ b/device-types/video/driver-conformance.tex
>@@ -0,0 +1,20 @@
>+\conformance{\subsection}{Video Driver Conformance}
>+\label{sec:Conformance / Driver Conformance / Video Driver Conformance}
>+
>+A video driver MUST conform to the following normative statements:
>+
>+\begin{itemize}
>+\item \ref{drivernormative:Device Types / Video Device / Feature bits}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / OPEN}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / CLOSE}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / SET PARAMS}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / DRAIN}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / QUEUE RESET}
>+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / RESOURCE QUEUE}
>+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / CODED / V4L2 CONTROLS / V4L2 controls: 32 bit integers}
>+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE GUEST PAGES}
>+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / RAW / RESOURCE VIRTIO OBJECT}
>+\end{itemize}
>diff --git a/introduction.tex b/introduction.tex
>index 9a9cbde..52efa16 100644
>--- a/introduction.tex
>+++ b/introduction.tex
>@@ -113,6 +113,15 @@ \section{Normative References}\label{sec:Normative References}
> 	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
>     Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
> 	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
>+	\phantomsection\label{intro:V4L2}\textbf{[V4L2]} &
>+	Linux V4L2 interface.
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/videodev2.h}\\
>+	\phantomsection\label{intro:V4L2 controls}\textbf{[V4L2 Controls]} &
>+	Linux V4L2 controls definitions.
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/v4l2-controls.h}\\
>+	\phantomsection\label{intro:DRM formats}\textbf{[DRM Formats]} &
>+	Linux DRM format definitions.
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/drm/drm_fourcc.h}\\
> 
> 	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
>     Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
>@@ -194,6 +203,18 @@ \section{Non-Normative References}
> 	\phantomsection\label{intro:Virtio PCI Draft}\textbf{[Virtio PCI Draft]} &
> 	Virtio PCI Draft Specification
> 	\newline\url{http://ozlabs.org/~rusty/virtio-spec/virtio-0.9.5.pdf}\\
>+	\phantomsection\label{intro:V4L2 compressed}\textbf{[V4L2 compressed formats]} &
>+	Detailed descriptions of V4L2 compressed formats
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst}\\
>+	\phantomsection\label{intro:V4L2 RGB}\textbf{[V4L2 RGB formats]} &
>+	Detailed descriptions of V4L2 RGB formats
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst}\\
>+	\phantomsection\label{intro:V4L2 YUV}\textbf{[V4L2 planar YUV formats]} &
>+	Detailed descriptions of V4L2 planar YUV formats
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst}\\
>+	\phantomsection\label{intro:V4L2 codec controls}\textbf{[V4L2 codec controls]} &
>+	Detailed descriptions of V4L2 controls
>+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst}\\
> \end{longtable}
> 
> \section{Terminology}\label{Terminology}
>-- 
>2.43.0
>
