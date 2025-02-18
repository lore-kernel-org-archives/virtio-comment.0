Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB11ACEBD
	for <virtio-comment@lists.linux.dev>; Tue, 18 Feb 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739881886; cv=none; b=j48H5f4OPcRXuLbmMuo2682VVC2I3ztaoA2KJ7MLET2lx8xcbybs/Rh6JpaTbRs7AlAL7huGaC6G8DSfM2SdpwTml2AWryZ52o8eMWPEjXraTnFi5Fo1hrbSNK4iXrDDmMPYcn9YjrULZnfjzMolqEtJ13Xud2LVZ49pLjq7TeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739881886; c=relaxed/simple;
	bh=znng5ab2v0mgN1DvTNFjSc+XzQfFkWuefKXMStFLW9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lipjF8CudHSDUWkj7Ed8nsuMELmcHD8QrcEjRr7rJRqbmODu0tjHBPVTH8xoYn5COZ/ku0IBvzRz0+I+imWWdjC9kudkrqynI9y9aVp+WoRRc3G36FOdqmteKPM1ddGW6lapOy2sZxbkznNGERMs8oSnbyBCtjk+0kjw1TylRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqZuHfI/; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqZuHfI/"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061513d353so57410951fa.2
        for <virtio-comment@lists.linux.dev>; Tue, 18 Feb 2025 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739881882; x=1740486682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fXedf+0734MUh5lNLO7ks56FazV2dNLStLyIJ706jI=;
        b=XqZuHfI/uOvMoJzlUC8pDUs/ojzKkeJPK54S5OMoLUV3OSOrt6wkwZ40ICYRc2QQD6
         KCj0HEYrl5zJGxTeCAKWJTrd38cXUGI2JCvHk3LFeW1UL6yke5HX4/emdA8TWVuG7cgD
         FwpRqbhNm5VrPAsEkKOxMN326oK9rCKN1eiRFOlEG1m+GVK+HEso1kT2zFuYPeiZaEuJ
         Q5NRS3QlvJZNIY3Eqbfhiw0IfBAmE1dNZfQUdsbJOdUjZy7LaU9QLx+EfI6lBmrwaee3
         hCkZEQCJ9MwW0q+AnZ16f6/T8zo5OOv2KBQoUD/DRGTjOCZo4hlynSAuy9FATRP3vFff
         9dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739881882; x=1740486682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fXedf+0734MUh5lNLO7ks56FazV2dNLStLyIJ706jI=;
        b=WNdmSq4JtjvdkLCj0Uh+1aDvCXPdtFCt4KPM78aD/7gAeAX9vtswUoIQuy9LlpajDO
         tNFsvgi7Je4FsDFQ/faNEXQIiR2jgNBinEkd1ZaRKE4pdAD+Q16ytMKwaCE43wUXtfG2
         zg8wVqBn+BDy2g6yBwCQzahPjjq1DCwQheZ5ZAW/idc9ixf4tQGj6E+ZjNSBlhkBUQQ4
         40Drac0IkSyQD4umAlZrdty0RvC8UDWjCQB3VYinEE9D9d09GD+huVrGUDqVdUW1/kbH
         kZFDbZWwhx0Y3huG8Xp57wrLjU9nTlhA43aYYpHiSMMFY5lY/U07hyPYrPT4ZRVaYFw7
         uXcw==
X-Gm-Message-State: AOJu0Yzs2O2WZuakNtuJCun6h5FwvHDtozwfoNIQchnnslsRjKxi0VeS
	ETDW02n+F0NHAy09On0kEzIWhj2t6lu7m/190V+bZYxngqAbNqEolcmgM91dSOuaT/x9ZPrg/tC
	QFkEzGxDHNU6VNQdg6kcvI6acjAo=
X-Gm-Gg: ASbGncuETlZJxVqjMEY0YVBmg0uZZviaGUnsodkdbDTlVOOd/l1BTwoCorL4LE3Tdfx
	W/PKYByiJFMfK4ePLzBpsfbBYhAV+bpTiqBYuD+l9NU/TYhn0sJadrDkirnBy0OuHSoOw5yRoyc
	hV89/b5/NmpE+b1wsJpsqCnxSRgQ0=
X-Google-Smtp-Source: AGHT+IFH4ZYxTjjvIaZWmzQxDqYDP9mRYzCDIsz90m7pjHyQRt96cn3sYn0S68Fcs0mzsVQiGvvKtSNCK7LUK3CVI7c=
X-Received: by 2002:a05:6512:a91:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-5452fe6fb77mr4057222e87.38.1739881881720; Tue, 18 Feb 2025
 04:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205153301.133040-1-aesteve@redhat.com> <20250205153301.133040-2-aesteve@redhat.com>
In-Reply-To: <20250205153301.133040-2-aesteve@redhat.com>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Tue, 18 Feb 2025 21:31:07 +0900
X-Gm-Features: AWEUYZmeOeRr1jyOqyV7gZqckHrStE_dqevwtE6dWlitbt2eMKzcIBM-jxUxOSo
Message-ID: <CAAVeFu+yYhHyTP+90r7q9F9cEyMAHL_OWUB8GdE3PuVBb_73yw@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device specification
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, adelva@google.com, 
	cohuck@redhat.com, daniel.almeida@collabora.com, ribalda@google.com, 
	dverkamp@chromium.org, agordeev@qti.qualcomm.com, alex.bennee@linaro.org, 
	nicolas.dufresne@collabora.com, gurchetansingh@google.com, 
	mvaralar@redhat.com, changyeon@google.com, hverkuil@xs4all.nl, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Albert,

On Thu, Feb 6, 2025 at 12:33=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
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
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  conformance.tex                           |  13 +-
>  content.tex                               |   1 +
>  device-types/media/description.tex        | 617 ++++++++++++++++++++++
>  device-types/media/device-conformance.tex |  12 +
>  device-types/media/driver-conformance.tex |  10 +
>  5 files changed, 649 insertions(+), 4 deletions(-)
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
>
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
>
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional D=
evice and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -152,6 +155,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/media/driver-conformance.tex}
>
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Devic=
e Conformance}
>
> @@ -238,6 +242,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/media/device-conformance.tex}
>
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
>
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>
> diff --git a/device-types/media/description.tex b/device-types/media/desc=
ription.tex
> new file mode 100644
> index 0000000..9f6bd4e
> --- /dev/null
> +++ b/device-types/media/description.tex
> @@ -0,0 +1,617 @@
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

I think this looks good for me in the current form. There is just one
last point I want to confirm related to feature bits and configuration
layout.

if/when this spec is extended to support V4L2 requests, the
configuration area will need to be expanded with extra information.
Requests support will probably be signaled through a feature bit, and
if this extra bit is set, then the driver can read beyond this initial
configuration zone to take advantage of them (if the driver ignores
the feature bit, then it can work without requests all the same).

If this (extending the configuration area size depending on a feature
bit) acceptable wrt. virtio?

Thanks,
Alex.
