Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0643D1A4F15
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720082387; cv=none; b=aBzJw4O8LesyhxE4N59ohce9fUqI9mU77GAwhtJbfvpBC0B5ylTRg+108Yq4mzTpV3b+IP+W9gR9LuXiYb5BukrXYFQ8bgKlwVEbSSw7Tk68Yppkl2s5f/Ek8Yysu2bQyIWHFQaWc+AiauFoYVRQtlyxZsb3iVwzNdREeHgulQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720082387; c=relaxed/simple;
	bh=GySBMUJqoNvbYL3v64thXSpwREKPy9oGZoU3c87XFdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWiTKb3CGVH+/D6wWBCxhEV0qvE1gSAcoVh8C2rLT6cWNLfetro2n2lTM7dcCOiTjuK7x5DCmOoGBw1hqwhCf3SJmNvl4tt51elZqZDnIojt0Ci4SpZBHHNew22UqdoLhNvj+pV8k5A4bURxUhHHeaJEzdxau+G/65a24OkvzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G/ncxDfC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G/ncxDfC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea0f18500so252366e87.3
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 01:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720082383; x=1720687183; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=040DzJvcHthrZzCPxg78Mki90SyzLj3HnXV1U7EgP1w=;
        b=G/ncxDfCWez/CSyp2aEr0Hi1fsGJDA9pECZuZnO746CMrhdMKHeOhoq1mQcaRZFCPO
         7PUrgorMq8WHbbJLk9oRDx/I7KFCikh0uUfkQjazUHPEWoneATGo/fEdC125QLW5qclP
         V091lRvpiEh/TPoCmsvR8G3/K76SaHRRofYd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720082383; x=1720687183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=040DzJvcHthrZzCPxg78Mki90SyzLj3HnXV1U7EgP1w=;
        b=RbuTyEMXqawU67LmQOX17g4CLZLBAXGZpvf+jEEfjDCzljPXPDMbIWgjrcG4tkryko
         jGbEQcPbPW/XyTrfqNvAlnGsyMrpB2VFew1WbtgGYRd/QEUaL2OglN6BrVqkML2xB0MI
         +j4l8sBpfh7JLfx1JXuXxHoU4ufanMh/2oHPOc1174JxNSKT3hM890WJqvLiNEUo4zkd
         BaV3DLM5aCB6HHrQJas8leC1jIuPcmJaRHgAJJ9RQYaL0b6GIGn+LYb9+zPDdo+jh0ct
         qn8gnFBisTcrViUSmqiXJkS3enyBgFonLyDbBLALpjxg07weYGQJ5tCcvo34hcSaRjSY
         FKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFtfkRkUwx+JFfNFWkq77rfYV4eKyU2uYp9Y2yvhkXU7JOxcTu1YHjFaoSRkHich8HpMKdQC1dqtfl5gV/o6nvdPIo3i66FKKmdIWAXyA=
X-Gm-Message-State: AOJu0YzgmX0gu/Sp/TcQbJBiCIzBmM688LJJm5YnHcslTjXQohvpeXZ9
	969SIRN5Vxqo+CHf+dHvyIW7k+xqWJwOAmE5mYChD8/0ZG9S6OCm87uWEaJLxtZaB3EIzs0AhHd
	Os57jAsyPmis5fuvKLuklWn2Rtoe27pM/RI7K
X-Google-Smtp-Source: AGHT+IFYbGoOMRQaEJsBh4ULt54Zgj2yrF1y18Vm65heDO6YTlngIMVJGZNQwBFvfUkmME6Zkgbvg7UCxg+oAYKIDeE=
X-Received: by 2002:a05:6512:716:b0:52c:dec1:4578 with SMTP id
 2adb3069b0e04-52ea06ebef5mr557814e87.60.1720082383102; Thu, 04 Jul 2024
 01:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240703031057.37565-1-lingshan.zhu@amd.com> <20240703044005-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703044005-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 4 Jul 2024 17:39:32 +0900
Message-ID: <CAD=HUj6uxtq2WobmAaOeOk4UR-TeZ0nHL8SeE9MnuDaap5uY+A@mail.gmail.com>
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, jasowang@redhat.com, 
	virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 6:01=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
> > This commit allows the driver to suspend the device by
> > introducing a new status bit SUSPEND in device_status.
> >
> > This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> > which indicating whether the device support SUSPEND.
> >
> > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Your signature would normally be last.
>
>
> > ---
> >  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 61 insertions(+), 10 deletions(-)
>
> At a high level, I think this is somewhat overspecified.
> Generally e.g. if driver is forbidden from accessing
> a field, then we do not also add specific requirements for
> devices - with no driver doing this, such functionality will
> remain untested and unused, and when we finally decide we need
> it it's not going to be there.
> Similarly for when device is not touching a field - no
> reason for driver not to touch it.
>
>
> > diff --git a/content.tex b/content.tex
> > index 0a62dce..8c974d3 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Bas=
ic Facilities of a Virtio Dev
> >      this bit.  For example, under Linux, drivers can be loadable modul=
es.
> >    \end{note}
> >
> > -\item[FAILED (128)] Indicates that something went wrong in the guest,
> > -  and it has given up on the device. This could be an internal
> > -  error, or the driver didn't like the device for some reason, or
> > -  even a fatal error during device operation.
> > +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> > +  drive the device.
> >
> >  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all =
the
> >    features it understands, and feature negotiation is complete.
> >
> > -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> > -  drive the device.
> > +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates tha=
t the
> > +  device has been suspended by the driver.
> >
> >  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienc=
ed
> >    an error from which it can't recover.
> > +
> > +\item[FAILED (128)] Indicates that something went wrong in the guest,
> > +  and it has given up on the device. This could be an internal
> > +  error, or the driver didn't like the device for some reason, or
> > +  even a fatal error during device operation.
> >  \end{description}
> >
> >  The \field{device status} field starts out as 0, and is reinitialized =
to 0 by
> > @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic=
 Facilities of a Virtio Dev
> >  initialization sequence specified in
> >  \ref{sec:General Initialization And Device Operation / Device
> >  Initialization}.
> > -The driver MUST NOT clear a
> > -\field{device status} bit.  If the driver sets the FAILED bit,
> > +The driver MUST NOT clear a \field{device status} bit other than SUSPE=
ND
> > +except when setting \field{device status} to 0 as a transport-specific=
 way to
> > +initiate a reset. If the driver sets the FAILED bit,
> >  the driver MUST later reset the device before attempting to re-initial=
ize.
> >
> >  The driver SHOULD NOT rely on completion of operations of a
> > @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities =
of a Virtio Device / Feature B
> >  \begin{description}
> >  \item[0 to 23, and 50 to 127] Feature bits for the specific device typ=
e
> >
> > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > +\item[24 to 42] Feature bits reserved for extensions to the queue and
> >    feature negotiation mechanisms
> >
> > -\item[42 to 49, and 128 and above] Feature bits reserved for future ex=
tensions.
> > +\item[43 to 49, and 128 and above] Feature bits reserved for future ex=
tensions.
> >  \end{description}
> >
> >  \begin{note}
> > @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initial=
ization And Device Operation /
> >
> >  Thus a driver MUST ensure a virtqueue isn't live (by device reset) bef=
ore removing exposed buffers.
> >
> > +\section{Device Suspend}\label{sec:General Initialization And Device O=
peration / Device Suspend}
> > +
> > +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> > +SUSPEND bit in \field{device status} to suspend a device, and can
> > +clear the SUSPEND bit to resume a suspended device.
> > +
> > +\drivernormative{\subsection}{Device Suspend}{General Initialization A=
nd Device Operation / Device Suspend}
> > +
> > +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_=
SUSPEND is not negotiated.
> > +
> > +Once the driver sets SUSPEND to \field{device status} of the device:
> > +\begin{itemize}
> > +\item The driver MUST re-read \field{device status} to verify whether =
the SUSPEND bit is set.
>
> If it's not set, then what? Device error, have to reset?
>
>
> > +\item The driver MUST NOT make any more buffers available to the devic=
e.
> > +\item The driver MUST NOT access any fields of any virtqueues or send =
notifications for any virtqueues.
>
> what are these "fields"? the area in memory where the vq lives? why is
> doing that a problem - you want device to be able to write something
> there?
>
> > +\item The driver MUST NOT access Device Configuration Space except for=
 the field \field {device status},
> > +if it is implemented in the Config Space.
>
> what is "the Config Space"? device status is never in
> a device configuration space, it is part of the common configuration.
> so what exactly are you forbidding here?

IIUC, referring to the common configuration here wouldn't make sense.
The common configuration is part of the PCI transport specification,
so in this part of the specification it should only be referred to via
the "transport specific" phrasing. This wording appears to be taken
from Cornelia's feedback on v5. Specifically:

> > +\item The driver MUST NOT access Device Configuration Space.
> ...except for the status field, if it is part of the config space?

I asked for clarification [1], because Cornelia's feedback seems to
contradict your feedback here and on the (unfortunately unarchived) v3
patch. What is the definitive statement agreed upon by both editors of
the virtio specification as to whether or not the device status field
is part of the device configuration space?

[1] https://lore.kernel.org/all/CAD=3DHUj4RBeLS4L=3DehyPGtejeu+sGZ5j8PRtrK8=
AvxjEgEBd5ZA@mail.gmail.com/

-David
