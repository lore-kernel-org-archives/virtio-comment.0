Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B571C1F13
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062980; cv=none; b=BGDBqo3VHZq2fVV4Z/u4iLUf4A5hNSb6xkPerdum6jijT+UCGOidnkl5C8bquE09UrxS/FMK8zQjDqW7WjVEbeICQ2eRn0zPyQ1Gj5U/PrG8WKd2YSjtrFnoXV79MxMjpVzlVwYuEYRmcUx8EhtV2OHspaiIM9reKdYUgGYoMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062980; c=relaxed/simple;
	bh=bMT13I5PM9ThSp4hTPWM4bUTek877nbcq4ATcnAX0UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfdQRwwpkarJHQjnUwcMnOB1B5hSEaBwAc/PlOQWXhoRFTfYYm8OU7ucM5V7y1RIcQznnOxcopKMtxlTuu8kCYoVz/aGy2PlCIwrjsQ9/uK+OzJeRy3i5Ulu5TE22q2eCaukkM14dmEwIilujUqJz9Ye9/kOcPCdcqekUyHvY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNs2IK5v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNs2IK5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752062975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsWXKvnyxLpWsDBVYhokU2yJqfhlyF//csmf15mA8vY=;
	b=FNs2IK5vkMTjl8yOqEGCv71DUp1PxWsuFhuf5XbZ/eDxrQE1tIkE4gmi9SLFyaqzQEGxGq
	PMaPls5bXRu19S/uS7ZQcMlPSPIoh5A+T+7eHW5qwS+/br0cdmeF4LeGwSlhowLMqxaY42
	BtddUhwCLR76Nobzslzel7DXd87M3WE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-VWQsSP_SOIGjiKx7d3KEnA-1; Wed, 09 Jul 2025 08:09:34 -0400
X-MC-Unique: VWQsSP_SOIGjiKx7d3KEnA-1
X-Mimecast-MFC-AGG-ID: VWQsSP_SOIGjiKx7d3KEnA_1752062974
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8146764a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 05:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062973; x=1752667773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsWXKvnyxLpWsDBVYhokU2yJqfhlyF//csmf15mA8vY=;
        b=NfEbjAUEutHKMb7ZBt3cXRoxorlYGjbiS66nnpPhz5ZfviXSWi9EjEhi91KPM3zVD1
         YPVK42bL8QNG/W2Qil+c5IV9JFxdcwjXNIbC7GCGSvZM8ZBavr6ZDQ/94Iis2Q98zfJ9
         WGyqmxt1MywgNRaylrm8PP7RH9Xu0WQndEu3NIHv5qWHrfoT3p1MmNnBThfOmjNExLR3
         UC+mv4Pwj+vlezgrvZoEisf/qYUQGRYPMPnRUcZTPaxAb2KVF560KwlGMkcZaIRYjaWV
         aNL5sF4TwSc4pMI88sBtzeglU3EE5S6icCSMb5AOKMyc/MwpqWjj+Q5u2hJVu2qBqT1i
         0/bA==
X-Forwarded-Encrypted: i=1; AJvYcCWlF2GOAWL5QrIBXOoPFHAKzrvdrp0WJrtuKXCb2wkDFspxlkjLwoDxzfd2wXg8ZjB9t+JzWTm2YEMFGy+NRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrdYoH/6Ch92yp1B6+8S62a4a2PqWWDiAriol7VZzIYgWgMjCV
	3PbzUWrkfs24ASV83sZPDCp5iOkHwWMfVMUf3+d2aY/LQ3LSakmwR5adl/brBHZmCbu6hM7exbq
	vmKVCGGlZ+zejxB+a0KVsr+bfssqZgtReRpNgFFLStvi7vdYXhCYgz3ylHE0YS/+gCG+CNYUOrn
	Q46HSG4R3UwGUk6H4K1KhQ09Zh//eOoauhPZszVy+Vl+Q=
X-Gm-Gg: ASbGncvR5a9pnj0DTZ51b5Zu+vlJ3PaF7ygIdVOmbxhx1LuLx9r/mOY6q7fL5izWThO
	sYim5RR0b4BETPjuI9r2gv3W1rP+gtxV4fJydkrIPMGS89qvNTLwT9jbl62EN7svmji7Vug8yg3
	jPLrk=
X-Received: by 2002:a17:90b:58e7:b0:311:ab20:159d with SMTP id 98e67ed59e1d1-31c2fdaf0ccmr3510725a91.19.1752062973465;
        Wed, 09 Jul 2025 05:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFka3dAwrBZ5nAc/a3DtDBlDE+JyH/llNYAxRKnCVoMxjCVlq7p1skVYaaUpJDNyNC65udLx5ob8qV2XH+x2L8=
X-Received: by 2002:a17:90b:58e7:b0:311:ab20:159d with SMTP id
 98e67ed59e1d1-31c2fdaf0ccmr3510694a91.19.1752062973002; Wed, 09 Jul 2025
 05:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304130134.1856056-1-aesteve@redhat.com> <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com> <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
 <87a55dvhfa.fsf@draig.linaro.org> <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
In-Reply-To: <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 9 Jul 2025 14:09:21 +0200
X-Gm-Features: Ac12FXy-tGl42jfleSv9qKX7IR7PgFDrhxErs3uKtIhbi0SV774ZwOo7RnJPePw
Message-ID: <CADSE00+gAfgCz0N8ceS2kdZkvEF6=nBHEghrmm8eXfuyZ10_Mw@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, virtio-comment@lists.linux.dev, 
	nicolas.dufresne@collabora.com, cohuck@redhat.com, adelva@google.com, 
	mvaralar@redhat.com, hverkuil@xs4all.nl, mst@redhat.com, 
	dverkamp@chromium.org, gurchetansingh@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, eballetb@redhat.com, 
	ribalda@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xn2q_1t4348Rn50aheLuk5SejYmLLfULLmshz3vXKtI_1752062974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 11:38=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Wed, Jul 9, 2025 at 11:32=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
> >
> > Albert Esteve <aesteve@redhat.com> writes:
> >
> > > On Fri, Mar 14, 2025 at 2:26=E2=80=AFPM Alexandre Courbot <gnurou@gma=
il.com> wrote:
> > >>
> > >> Hello Albert,
> > >>
> > >> On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
> > >> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > >> > virtio, able to virtualize any video device supported
> > >> > by V4L2.
> > >> >
> > >> > Note that virtio-media does not require the use of a
> > >> > V4L2 device driver on the host or guest side -
> > >> > V4L2 is only used as a host-guest protocol,
> > >> > and both sides are free to convert it from/to any
> > >> > model that they wish to use.
> > >>
> > >> Thank you for your patience with this. I have done a final pass on t=
his
> > >> version and it looks great to me!
> > >>
> > >> Reviewed-by: Alexandre Courbot <gnurou@gmail.com>
> > >>
> > >
> > > Thanks! Could we please open a voting ballot for these changes?
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/214
> >
> > What was the result of the ballot?
>
> AFAIU the ballot was approved. There were conflicts with the
> virtio-1.4 branch, which may have delayed the integration. I've just
> sent a new version of the patch rebased to virtio-1.4 to try to ease
> the process.

Adding the diff here on the v8 instead, to avoid having to vote again
on a new patch version.
The diff should allow applying the original v8 patch cleanly to
virtio-1.4. Let me know if this is enough.

----
diff --git a/content.tex b/content.tex
index 59925ae..56b2cb1 100644
--- a/content.tex
+++ b/content.tex
@@ -100,7 +100,7 @@ \section{Feature Bits}\label{sec:Basic Facilities
of a Virtio Device / Feature B
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type

 \item[24 to 41] Feature bits reserved for extensions to the queue and
-  feature negotiation mechanisms
+  feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}

 \item[42 to 49, and 128 and above] Feature bits reserved for future extens=
ions.
 \end{description}
@@ -493,7 +493,7 @@ \section{Driver Notifications} \label{sec:Basic
Facilities of a Virtio Device /
 \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
Device / Exporting Objects}

 When an object created by one virtio device needs to be
-shared with a seperate virtio device, the first device can
+shared with a separate virtio device, the first device can
 export the object by generating a UUID which can then
 be passed to the second device to identify the object.

@@ -503,11 +503,12 @@ \section{Exporting Objects}\label{sec:Basic
Facilities of a Virtio Device / Expo
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.

 \input{admin.tex}
+\input{device-parts.tex}

 \chapter{General Initialization And Device
Operation}\label{sec:General Initialization And Device Operation}

 We start with an overview of device initialization, then expand on the
-details of the device and how each step is preformed.  This section
+details of the device and how each step is performed.  This section
 is best read along with the bus-specific section which describes
 how to communicate with the specific device.

@@ -649,7 +650,7 @@ \chapter{Device Types}\label{sec:Device Types}

 Discovering what devices are available and their type is bus-dependent.

-\begin{tabular} { |l|c| }
+\begin{longtable} { |l|c| }
 \hline
 Device ID  &  Virtio Device    \\
 \hline \hline
@@ -737,9 +738,17 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 44         &   ISM device \\
 \hline
-45         &   SPI master \\
+45         &   SPI controller \\
 \hline
-\end{tabular}
+46         &   TEE device \\
+\hline
+47         &   CPU balloon device \\
+\hline
+48         &   Media device \\
+\hline
+49         &   USB controller \\
+\hline
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
index 2564034..0856353 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -33,6 +33,9 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance=
},
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conforma=
nce},
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
 \ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.

@@ -61,7 +64,10 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance=
},
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
-\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
+\ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
+\ref{sec:Conformance / Device Conformance / CAN Device Conformance},
+\ref{sec:Conformance / Device Conformance / SPI Controller Device Conforma=
nce},
+\ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
 \ref{sec:Conformance / Device Conformance / Media Device Conformance}.

     \item Clause \ref{sec:Conformance / Legacy Interface:
Transitional Device and Transitional Driver Conformance}.
@@ -78,6 +84,7 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Re=
set}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device /
Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueue=
s}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device /
Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device /
Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device /
Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device /
Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -96,6 +103,9 @@ \section{Conformance Targets}\label{sec:Conformance
/ Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device
Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device
Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device and driver
capabilities}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device resource
objects}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device parts}
 \end{itemize}

 \conformance{\subsection}{PCI Driver
Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver
Conformance}
@@ -154,6 +164,8 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/can/driver-conformance.tex}
+\input{device-types/spi/driver-conformance.tex}
 \input{device-types/media/driver-conformance.tex}

 \conformance{\section}{Device Conformance}\label{sec:Conformance /
Device Conformance}
@@ -165,6 +177,7 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature B=
its}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Re=
set}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device /
Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -176,6 +189,9 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device /
Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device and driver
capabilities}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device resource
objects}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device /
Device groups / Group administration commands / Device parts}
 \end{itemize}

 \conformance{\subsection}{PCI Device
Conformance}\label{sec:Conformance / Device Conformance / PCI Device
Conformance}
@@ -241,6 +257,8 @@ \section{Conformance
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

>
> >
> > --
> > Alex Benn=C3=A9e
> > Virtualisation Tech Lead @ Linaro
> >

