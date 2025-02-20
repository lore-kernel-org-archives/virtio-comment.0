Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18621E7660
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043236; cv=none; b=o+Q7F087qdXSOhSmVFXkn968B6JgtyTsNeeLQaK2Z48PwyR4CGfTKn4Jik2hZ4hON4F9iPE1wB4RKBlKDCScuEWIuxeV6AWdyvGd0YLOeKMS7I/j7lN3MBHQy0yaS94Us8yxCyuk2ZBF5rUvytpfY15aTEP8C1vaZN/fyrF/y9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043236; c=relaxed/simple;
	bh=O1VUsI15eP3BcyYpEZJzSM7ii/qlHsUOWfgUgOLiU4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4rILTSTfMdvT6ao1/9Gd3Bq2yBwQtNgK72eMchYC3mv8/m9RTuKyZYk90DOXo5v+MJ2aoV95J14/SM76kaFeyjGs60vSCl+NvKkM3/HH0Q4VlMan8DHdDPpmF/Ofk7qoKgWZQVxsnvblxr9qx5sUqn9p7J2secATUw1hPBihL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ht7lqJc7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ht7lqJc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740043232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/wMAtE+XUMaU/B60vWvHxjLseKVVR+pUVeMYeC3E70=;
	b=ht7lqJc7+pUY0b18J48kG0B0ZePStDUJy53o+JAaUwq1ivATbWnLwglyYRz8GmvZYMJIYm
	cOz2S7EmGl2cbm/oJmbWE8E9jqnEt4NUXtu53Y0pNYjbHruQVWeDejFhbfOQPX82jBrUqC
	xJoEiRNhcRwNMWNs5kL/XC3c56GCX3M=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-eQ89yTmNOsi6ejlMekQVHw-1; Thu, 20 Feb 2025 04:20:29 -0500
X-MC-Unique: eQ89yTmNOsi6ejlMekQVHw-1
X-Mimecast-MFC-AGG-ID: eQ89yTmNOsi6ejlMekQVHw_1740043228
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220f0382404so14924585ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 01:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043228; x=1740648028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/wMAtE+XUMaU/B60vWvHxjLseKVVR+pUVeMYeC3E70=;
        b=itEetABjhtoMX+ssrTIiW87l3rLdiDGL4xAWgQc1uu4uND98OT97gHq030eu3z0EgO
         nk6v3Q7Jlu+kEpJxokqxtMyZhvIaPVuFm7iOsIWHZUe+dfu1Ew9A/ByOljogc052nJ2t
         VVAdujYxsWAbzA9Ffr617KM/1risEYgaxpMtPmelSE4XUw1afNBg1kj5f+tWcTOqpzsY
         2ZRLOYGatH8uGAHzI8CG8mR+ZZR+0tcoLe8ki2tFfdThgUfleFHPInaFBx8oalvZQKhN
         nLzz0qzD7fCAx8Xq0nNU4Y8194Sy8wXWGgg8PIQRnBcCEpYtlGqTJVelXw77070D0B7K
         sduQ==
X-Gm-Message-State: AOJu0Yx5Nlh4daBp/zmX9Mwir+TBaLn6l3c+0rI1xfnsy0pnrKkPMIla
	AfQYrwa/ZF1aAwk8plRFFfx5xaeZ81mwtBlPFRzLzs8bVm9SqlkEIm3mnOp7TOy+URigPAvyUNc
	xDiNf8C4AeiB1cXrH+UfXXfP6FugsConaEQ/2ioBKeA/9R6DQ6Sme6qQ10nkmw9jS8ycffdh+jF
	DWK4jXEod9AUveIvsOd0jfzvf1HN9MwsKoueStaKA=
X-Gm-Gg: ASbGncuJ+Qf/RNzleMtkgle5R1Oj+9Wr42GGOeDDa5s2hwwaPqQtqrcoUaN6bUyo1jE
	uaKOkLYg8n++o882nOGKP7nI31PcitdQaHtYkPuCqWAIOv/+Z6EmBahvuPkp8Ur2d
X-Received: by 2002:a17:902:d505:b0:220:c2bf:e8c6 with SMTP id d9443c01a7336-221711d22f0mr119572855ad.53.1740043228039;
        Thu, 20 Feb 2025 01:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsTANpeAAPsLxSLFmx5rGidwsV6xDHj/Bq/UY3ZPgjGx/EKgWYC7jxaV/KbciBpBy94RmXsUxl/y5Iiy+IeGY=
X-Received: by 2002:a17:902:d505:b0:220:c2bf:e8c6 with SMTP id
 d9443c01a7336-221711d22f0mr119572385ad.53.1740043227620; Thu, 20 Feb 2025
 01:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205153301.133040-1-aesteve@redhat.com> <20250205153301.133040-2-aesteve@redhat.com>
 <CAAVeFu+yYhHyTP+90r7q9F9cEyMAHL_OWUB8GdE3PuVBb_73yw@mail.gmail.com>
In-Reply-To: <CAAVeFu+yYhHyTP+90r7q9F9cEyMAHL_OWUB8GdE3PuVBb_73yw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 20 Feb 2025 10:20:15 +0100
X-Gm-Features: AWEUYZmaakbTTuxpgSqSHjl64gHHXvkegHV0Uw1aiuhnLYCzaresnqnxxst6Bh8
Message-ID: <CADSE00+vhooseWmq3ohUs+r45mi4_WcHy=aHVB+qTGsniYtgDQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device specification
To: Alexandre Courbot <gnurou@gmail.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, adelva@google.com, 
	cohuck@redhat.com, daniel.almeida@collabora.com, ribalda@google.com, 
	dverkamp@chromium.org, agordeev@qti.qualcomm.com, alex.bennee@linaro.org, 
	nicolas.dufresne@collabora.com, gurchetansingh@google.com, 
	mvaralar@redhat.com, changyeon@google.com, hverkuil@xs4all.nl, mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: otEX8DmeuCR0xsGNtcHy2-l2bk75nmWn3n_RelGlKx8_1740043228
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 1:31=E2=80=AFPM Alexandre Courbot <gnurou@gmail.com=
> wrote:
>
> Hi Albert,
>
> On Thu, Feb 6, 2025 at 12:33=E2=80=AFAM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2.
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver on the host or guest side -
> > V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 617 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  12 +
> >  device-types/media/driver-conformance.tex |  10 +
> >  5 files changed, 649 insertions(+), 4 deletions(-)
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
> > index 0000000..9f6bd4e
> > --- /dev/null
> > +++ b/device-types/media/description.tex
> > @@ -0,0 +1,617 @@
> > +\section{Media Device}\label{sec:Device Types / Media Device}
> > +
> > +The virtio media device follows the same model (and structures) as V4L=
2. It
> > +can be used to virtualize cameras, codec devices, or any other device
> > +supported by V4L2. The complete definition of V4L2 structures and ioct=
ls can
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
> > +\subsection{Device ID}\label{sec:Device Types / Media Device / Device =
ID}
> > +
> > +48
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
> > +    le8 card[32];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{device_caps}] (driver-read-only) flags representing the d=
evice
> > +capabilities as used in
> > +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v=
idioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
> > +It corresponds with the \field{device_caps} field in the \textit{struc=
t video_device}.
> > +\item[\field{device_type}] (driver-read-only) informs the driver of th=
e type
> > +of the video device. It corresponds with the \field{vfl_devnode_type} =
field of the device.
> > +\item[\field{card}] (driver-read-only) name of the device, a NUL-termi=
nated
> > +UTF-8 string. It corresponds with the \field{card} field of the \texti=
t{struct v4l2_capability}.
> > +If all the characters of the field are used, it does not need to be NU=
L-terminated.
> > +\end{description}
>
> I think this looks good for me in the current form.

Thanks! Maybe you could add a Reviewed-by comment, if not for this,
for the next (hopefully last) version of the patch -- addressing the
latest comment from Alex Gordeev?

I think the spec is now mature enough, so I plan is to start a vote
soon. Just trying to get more evidence that this has been thoroughly
reviewed.

> There is just one
> last point I want to confirm related to feature bits and configuration
> layout.
>
> if/when this spec is extended to support V4L2 requests, the
> configuration area will need to be expanded with extra information.
> Requests support will probably be signaled through a feature bit, and
> if this extra bit is set, then the driver can read beyond this initial
> configuration zone to take advantage of them (if the driver ignores
> the feature bit, then it can work without requests all the same).
>
> If this (extending the configuration area size depending on a feature
> bit) acceptable wrt. virtio?

Yes. You can check for example `VIRTIO_SND_F_CTLS`, which does
basically what you describe, but for virtio-sound.

>
> Thanks,
> Alex.
>

