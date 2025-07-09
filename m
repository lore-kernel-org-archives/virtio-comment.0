Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBAB289813
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063518; cv=none; b=AWEvB5WZbmQ5tBmDfd/r+PICevZH/9aewotqM15Ui4EjLDTR6HzDb3ztSMn5ijlQ/HRtRiTBqkqlWZVHFJkZk5H5G4iOGqVLyeirnK5zock5VlalSQp92JN+7igFUupkwGk06fVItipeo5vQhoeElG937Ao648bTI4JOAH+tgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063518; c=relaxed/simple;
	bh=mAsWJrMu9TTIDjIwvaWnokkHew03Wg8Hl0zSNlzPGmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmsBGC4+kmDaOqK3nPyvMZ31lbYHluURniF5w31iFsqqHKz+l4wFEl2mM4SzeTINEB82wonR7suEytZ9+33XnEXqVdtyNpiGRGzjPT2F6e+B3J/6P20DmB5Ii0LaUXWWiDAT1LJfreA8lUlbD67a8ms11DOQmtaWiUnOxSWD2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HW+ElRUw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HW+ElRUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752063513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9CjamOnsoTTNdX+Re0Fp6J6klOPyG6rBsMVTim6kARY=;
	b=HW+ElRUwDuBpvgdUTNiVZ3M1EfU4KuXRdbjSfcudX0HMFLo35Tooqj2fxrCz+fuohCHdo1
	Hn+yP3z4a/HlPNKzOQbRT+WyTJnaU/vZkKI9UhvjfUf8/nn/Nr+KOqRWipvaAlfX5am2ou
	LaVdA3ikN9GGEY9AcFXKE54Q4/v1PCs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-eYxFcq6nNmG1NPL7UnSMYA-1; Wed, 09 Jul 2025 08:18:32 -0400
X-MC-Unique: eYxFcq6nNmG1NPL7UnSMYA-1
X-Mimecast-MFC-AGG-ID: eYxFcq6nNmG1NPL7UnSMYA_1752063511
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b38ec062983so3659161a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 05:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752063511; x=1752668311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CjamOnsoTTNdX+Re0Fp6J6klOPyG6rBsMVTim6kARY=;
        b=w+xnjzjzz8vytBKj/WZLpyZLZGMB0tdStG3fAxbOqI+DlTcYaYoilQ447cqiBK7xsq
         N2HcxOGiF28v/RpE/Hn8iQp0kBD5UP6Vav+xoNG5TRmqnLy525oPcbzL/3jySQ1d/VqB
         ObG0yntQdj8p29khAGP/7It74FNApzAfj0TqKlCFZUL7MUCPYBWMlN9kMRyFl67OGUhT
         JFURjVBSaDuKak1houLN92fCdcd+nJPhdkNnYv1M8wHMJpKDTArpgLZ09ftnG14izBfV
         VM817xC0RkxqjLgPZEAGsR4dx3j3gTXayZGKplf9cDrhjsCMl5pP71yUSF5xrJKptBMJ
         U9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVUGSS89910MjUWLkt4HvLPdCHpgIHRkKabunri6ygIr7y4zneImquh8IFnzRShG9lBrfIoEKvH0BDdcydeag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqCUX/UKcdx8lCjO0vNk8RVDR0qqekz4g6mezuCMgIbDdegdRF
	wsGrpeRJ+TTaTCHwaijNDN2MIZt0ioxCAyTa55uAzk1ckfmqcZGfWzr/4NzI6tt98IJdOV3B/pQ
	zGo3lgzt+tcxvTZin0WxvDHoHk6RA3sVUnBcrPTxmQ1DgkzF37tWp9a89/1KZVoVDO5JVnlYn7H
	Ob70mRsT7hxtmqOJYRrK60CDKM8IGBSetf11Jg1/tKlMY=
X-Gm-Gg: ASbGncvD2Goy2Se5hf7iLL942flqjliAs/Md/ZOFaWdiDzClrMzATMBtdGhM9FBybCL
	MgNH9agCyXIl1AZuDN+guy7/tTcJF5VxYIyBQMhq0L/FrOjspnSHLajfsYEQtYqXY+hLeAZWJSR
	UplHo=
X-Received: by 2002:a17:90b:2c83:b0:312:1ae9:1529 with SMTP id 98e67ed59e1d1-31c2fdbc51bmr4180477a91.27.1752063511307;
        Wed, 09 Jul 2025 05:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNOBBop/8Jcf1XSfe4/724UY8ndrNP3Y6zUpfX7MzUp/VwQ9OJqRtu64W1AAQtNEvN3yq49Aacg31Hq75omEs=
X-Received: by 2002:a17:90b:2c83:b0:312:1ae9:1529 with SMTP id
 98e67ed59e1d1-31c2fdbc51bmr4180417a91.27.1752063510708; Wed, 09 Jul 2025
 05:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304130134.1856056-1-aesteve@redhat.com> <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com> <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
 <87a55dvhfa.fsf@draig.linaro.org> <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
 <CADSE00+gAfgCz0N8ceS2kdZkvEF6=nBHEghrmm8eXfuyZ10_Mw@mail.gmail.com>
In-Reply-To: <CADSE00+gAfgCz0N8ceS2kdZkvEF6=nBHEghrmm8eXfuyZ10_Mw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 9 Jul 2025 14:18:19 +0200
X-Gm-Features: Ac12FXzhHq4OGnDkWbbgZnLCk-ncbMvF-NZJEj3-2-lNw_1g4jKVeIR5gcMf5eQ
Message-ID: <CADSE00JOBEqiFjAioJxf-PAB-FfSSy+1Z8WMuU9ktyf=dk-1TA@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, virtio-comment@lists.linux.dev, 
	nicolas.dufresne@collabora.com, cohuck@redhat.com, adelva@google.com, 
	mvaralar@redhat.com, hverkuil@xs4all.nl, mst@redhat.com, 
	dverkamp@chromium.org, gurchetansingh@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, eballetb@redhat.com, 
	ribalda@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OkXgzhhm5HgKuSztfuYs2wdKMv2EpKvAk5F_kUFNewc_1752063511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 2:09=E2=80=AFPM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> On Wed, Jul 9, 2025 at 11:38=E2=80=AFAM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On Wed, Jul 9, 2025 at 11:32=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@l=
inaro.org> wrote:
> > >
> > > Albert Esteve <aesteve@redhat.com> writes:
> > >
> > > > On Fri, Mar 14, 2025 at 2:26=E2=80=AFPM Alexandre Courbot <gnurou@g=
mail.com> wrote:
> > > >>
> > > >> Hello Albert,
> > > >>
> > > >> On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
> > > >> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > > >> > virtio, able to virtualize any video device supported
> > > >> > by V4L2.
> > > >> >
> > > >> > Note that virtio-media does not require the use of a
> > > >> > V4L2 device driver on the host or guest side -
> > > >> > V4L2 is only used as a host-guest protocol,
> > > >> > and both sides are free to convert it from/to any
> > > >> > model that they wish to use.
> > > >>
> > > >> Thank you for your patience with this. I have done a final pass on=
 this
> > > >> version and it looks great to me!
> > > >>
> > > >> Reviewed-by: Alexandre Courbot <gnurou@gmail.com>
> > > >>
> > > >
> > > > Thanks! Could we please open a voting ballot for these changes?
> > > >
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/214
> > >
> > > What was the result of the ballot?
> >
> > AFAIU the ballot was approved. There were conflicts with the
> > virtio-1.4 branch, which may have delayed the integration. I've just
> > sent a new version of the patch rebased to virtio-1.4 to try to ease
> > the process.
>
> Adding the diff here on the v8 instead, to avoid having to vote again
> on a new patch version.
> The diff should allow applying the original v8 patch cleanly to
> virtio-1.4. Let me know if this is enough.
>
> ----
> diff --git a/content.tex b/content.tex
> index 59925ae..56b2cb1 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -100,7 +100,7 @@ \section{Feature Bits}\label{sec:Basic Facilities
> of a Virtio Device / Feature B
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>
>  \item[24 to 41] Feature bits reserved for extensions to the queue and
> -  feature negotiation mechanisms
> +  feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>
>  \item[42 to 49, and 128 and above] Feature bits reserved for future exte=
nsions.
>  \end{description}
> @@ -493,7 +493,7 @@ \section{Driver Notifications} \label{sec:Basic
> Facilities of a Virtio Device /
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
> Device / Exporting Objects}
>
>  When an object created by one virtio device needs to be
> -shared with a seperate virtio device, the first device can
> +shared with a separate virtio device, the first device can
>  export the object by generating a UUID which can then
>  be passed to the second device to identify the object.
>
> @@ -503,11 +503,12 @@ \section{Exporting Objects}\label{sec:Basic
> Facilities of a Virtio Device / Expo
>  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>
>  \input{admin.tex}
> +\input{device-parts.tex}
>
>  \chapter{General Initialization And Device
> Operation}\label{sec:General Initialization And Device Operation}
>
>  We start with an overview of device initialization, then expand on the
> -details of the device and how each step is preformed.  This section
> +details of the device and how each step is performed.  This section
>  is best read along with the bus-specific section which describes
>  how to communicate with the specific device.
>
> @@ -649,7 +650,7 @@ \chapter{Device Types}\label{sec:Device Types}
>
>  Discovering what devices are available and their type is bus-dependent.
>
> -\begin{tabular} { |l|c| }
> +\begin{longtable} { |l|c| }
>  \hline
>  Device ID  &  Virtio Device    \\
>  \hline \hline
> @@ -737,9 +738,17 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  44         &   ISM device \\
>  \hline
> -45         &   SPI master \\
> +45         &   SPI controller \\
>  \hline
> -\end{tabular}
> +46         &   TEE device \\
> +\hline
> +47         &   CPU balloon device \\
> +\hline
> +48         &   Media device \\
> +\hline
> +49         &   USB controller \\
> +\hline
> +\end{longtable}
>
>  Some of the devices above are unspecified by this document,
>  because they are seen as immature or especially niche.  Be warned
> @@ -767,6 +776,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/scmi/description.tex}
>  \input{device-types/gpio/description.tex}
>  \input{device-types/pmem/description.tex}
> +\input{device-types/can/description.tex}
> +\input{device-types/spi/description.tex}
>  \input{device-types/media/description.tex}
>
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>
> diff --git a/conformance.tex b/conformance.tex
> index 2564034..0856353 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -33,6 +33,9 @@ \section{Conformance Targets}\label{sec:Conformance
> / Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conforman=
ce},
>  \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Confor=
mance},
>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
>  \ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
>
> @@ -61,7 +64,10 @@ \section{Conformance Targets}\label{sec:Conformance
> / Conformance Targets}
>  \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conforman=
ce},
>  \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
>  \ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
> -\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
> +\ref{sec:Conformance / Device Conformance / CAN Device Conformance},
> +\ref{sec:Conformance / Device Conformance / SPI Controller Device Confor=
mance},
> +\ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>  \ref{sec:Conformance / Device Conformance / Media Device Conformance}.
>
>      \item Clause \ref{sec:Conformance / Legacy Interface:
> Transitional Device and Transitional Driver Conformance}.
> @@ -78,6 +84,7 @@ \section{Conformance Targets}\label{sec:Conformance
> / Conformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Device Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtque=
ues}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Message Framing}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -96,6 +103,9 @@ \section{Conformance Targets}\label{sec:Conformance
> / Conformance Targets}
>  \item \ref{drivernormative:General Initialization And Device
> Operation / Device Initialization}
>  \item \ref{drivernormative:General Initialization And Device
> Operation / Device Cleanup}
>  \item \ref{drivernormative:Reserved Feature Bits}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device and driver
> capabilities}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device resource
> objects}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device parts}
>  \end{itemize}
>
>  \conformance{\subsection}{PCI Driver
> Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver
> Conformance}
> @@ -154,6 +164,8 @@ \section{Conformance
> Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/driver-conformance.tex}
>  \input{device-types/gpio/driver-conformance.tex}
>  \input{device-types/pmem/driver-conformance.tex}
> +\input{device-types/can/driver-conformance.tex}
> +\input{device-types/spi/driver-conformance.tex}
>  \input{device-types/media/driver-conformance.tex}
>
>  \conformance{\section}{Device Conformance}\label{sec:Conformance /
> Device Conformance}
> @@ -165,6 +177,7 @@ \section{Conformance
> Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature=
 Bits}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device =
Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Device Configuration Space}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Message Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -176,6 +189,9 @@ \section{Conformance
> Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Packed Virtqueues / Scatter-Gather Support}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Shared Memory Regions}
>  \item \ref{devicenormative:Reserved Feature Bits}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device and driver
> capabilities}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device resource
> objects}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device /
> Device groups / Group administration commands / Device parts}
>  \end{itemize}
>
>  \conformance{\subsection}{PCI Device
> Conformance}\label{sec:Conformance / Device Conformance / PCI Device
> Conformance}
> @@ -241,6 +257,8 @@ \section{Conformance
> Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/scmi/device-conformance.tex}
>  \input{device-types/gpio/device-conformance.tex}
>  \input{device-types/pmem/device-conformance.tex}
> +\input{device-types/can/device-conformance.tex}
> +\input{device-types/spi/device-conformance.tex}
>  \input{device-types/media/device-conformance.tex}
>
>  \conformance{\section}{Legacy Interface: Transitional Device and
> Transitional Driver Conformance}\label{sec:Conformance / Legacy
> Interface: Transitional Device and Transitional Driver Conformance}
>

A cleaner attempt, noticed a duplication of one listed item. Also
removed the parts of the diff that caused no collision beforehand.

---
diff --git a/content.tex b/content.tex
index 59925ae..56b2cb1 100644
--- a/content.tex
+++ b/content.tex

+\end{longtable}

 Some of the devices above are unspecified by this document,
 because they are seen as immature or especially niche.  Be warned
@@ -767,6 +776,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/can/description.tex}
+\input{device-types/spi/description.tex}
 \input{device-types/media/description.tex}

 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}

diff --git a/conformance.tex b/conformance.tex
index 2564034..85a227f 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -33,7 +33,9 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance=
},
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / SPI Controller Driver
Conformance} or
 \ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.

     \item Clause \ref{sec:Conformance / Legacy Interface:
Transitional Device and Transitional Driver Conformance}.
@@ -61,7 +63,9 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance=
},
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
-\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
+\ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
+\ref{sec:Conformance / Device Conformance / CAN Device Conformance},
+\ref{sec:Conformance / Device Conformance / SPI Controller Device
Conformance} or
 \ref{sec:Conformance / Device Conformance / Media Device Conformance}.

     \item Clause \ref{sec:Conformance / Legacy Interface:
Transitional Device and Transitional Driver Conformance}.
@@ -154,6 +162,8 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/can/driver-conformance.tex}
+\input{device-types/spi/driver-conformance.tex}
 \input{device-types/media/driver-conformance.tex}

 \conformance{\section}{Device Conformance}\label{sec:Conformance /
Device Conformance}
@@ -241,6 +255,8 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/can/device-conformance.tex}
+\input{device-types/spi/device-conformance.tex}
 \input{device-types/media/device-conformance.tex}

 \conformance{\section}{Legacy Interface: Transitional Device and
Transitional Driver Conformance}\label{sec:Conformance / Legacy
Interface: Transitional Device and Transitional Driver Conformance}

> >
> > >
> > > --
> > > Alex Benn=C3=A9e
> > > Virtualisation Tech Lead @ Linaro
> > >

