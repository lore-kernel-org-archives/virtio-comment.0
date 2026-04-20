Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556473BED0E
	for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694742; cv=none; b=JvmpR5LjDnLyoH4XH7/qhX+U4mGrKWRCqj/MRupI+3Iaa3Dm81tEXCQPg1Oh8vOZzE6fNijquZpDtWsr9UM/VJgNtMu6RUmFzaeLl+mfEG+xI7JNexbNzSjJsTmN+2+3ryAPLP62B+sQqFK8Z14i+sbATfa16g3zWT+nV/Zi9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694742; c=relaxed/simple;
	bh=yHbdVlC8tONcQbbDgwxw3YftFTI/IzNvy95OXL67oLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o89niKwg97gC8BqJe5wvleaaGcgSJrrcaGkOjBvbBL2jYrCxA9VokDxnU8KDn/I3d909BG5GjYbM3FGFb+ATo+Bc40wQyDopr4FXTzPK7Kg7vl+B6asPnQ1D6IKxyxtl8Ft29w7e/mALV1aVQJNPDCtNcdbMYgc8JPcavMijvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuXjm6vZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuXjm6vZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776694740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2YMu7NRkRLWYGDDLe1xU9fitVW55owoWr+qRp9Rw0s=;
	b=VuXjm6vZLv03TE821lCfvs0ZYRbaJsYsThxOJ3DF/lu8JQn+fnzuOrJjY1cWJ/zKmw8Gzs
	8n/ty+Up3U4TKn0jiN/eljAKesPNHBuma70k0HwwQhp9qrkpAiE8Zr1HB7iszp+euRxi2k
	7PhZ4z6ZVZa2ViRyYAMo2wDwmhEMyGw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-mmsiS-3GN0CdMBu18FZYwg-1; Mon, 20 Apr 2026 10:18:57 -0400
X-MC-Unique: mmsiS-3GN0CdMBu18FZYwg-1
X-Mimecast-MFC-AGG-ID: mmsiS-3GN0CdMBu18FZYwg_1776694736
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b45cd0bb96so31686715ad.3
        for <virtio-comment@lists.linux.dev>; Mon, 20 Apr 2026 07:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694736; x=1777299536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2YMu7NRkRLWYGDDLe1xU9fitVW55owoWr+qRp9Rw0s=;
        b=MREixsQctDM9HYcHtGXNLULxvrNng/4qIfVhqwun6AF+rDpBUZoh4xEE2Tip7457EB
         jkBAWP/YOPR7C9w2b2Ub2Z5rH/YOX6OC7BVltFtlBkigxebtpcPm1ye3JX8p23DAKJ2d
         tNf23xKcL0z8CF76q47CHjsOOuS6jT7aspaNqvgQ9MisDPr14cIfDjA5mvuYNg5Io9pF
         3RrUqcmTI6evBLAGpZ8IiSqMM/fMVWB6zLl01p0RWKbnk3XDrsrLLGf1Hf8F2GYBSClD
         X5kKz6tRSYLn4YVri3B803MBcnjUrYINSy77Trwmm+uZ6RZav6tU2XX9W5Je8zQrK2Uw
         AdLQ==
X-Gm-Message-State: AOJu0YwdLnPsqVb9+s+tURIc3s0iTFycAX/qWUPVwo6tBVAurTwuvHbG
	pw8OKt86gz/cpHp6b50J1ycnYmGpOHgVoEnlrdrzc/k8h/F3y9GH1I7j3RiGzpH6t7vWhodaE/7
	6btl22M4kymmjkIlp4ji7cvLJ35V509iv1XiKOo5unUMODjwOFNEi4PMtUIAOzloiHglStnZ4tg
	G0kdPzeKj1+lL1xpFBH6lI2eu3+KxBInmzSdwaqFJUVHw=
X-Gm-Gg: AeBDieuSPMR/ls44+ymGmr1k3MPCyaCaZVka+k/jkGuYoNjZATCiWPbZz6um1Stc0wu
	jEvjAoed2jph3cOQFnLX2xXrIn2bq4ExQ0AlZHss5NrUm2hvoTNfs8pxrusfQ2SyMNtWQiDB0Qp
	8QmBw3NuNKQFxGqBjC9MsbtOwJdjZwYG+Fwg9OFwpIEs0AnouP7wX7fqP9uBU9yMtfTdScNZgX4
	zB8faEp34bm0HK5BZhzHmPyZAV7VGcJz8zm807xkCy1a5vGyImz1uB/Fc5Vg3nw3eD31LWWZAFt
	huFCyxVaR6YvMEd0H2gWYuO/YucyBcvcm8c=
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b5f9e8195fmr148790425ad.11.1776694736277;
        Mon, 20 Apr 2026 07:18:56 -0700 (PDT)
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id
 d9443c01a7336-2b5f9e8195fmr148789995ad.11.1776694735608; Mon, 20 Apr 2026
 07:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415145435.2023866-1-marcandre.lureau@redhat.com> <aeYvqOTMziofz2yF@fedora>
In-Reply-To: <aeYvqOTMziofz2yF@fedora>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Apr 2026 18:18:44 +0400
X-Gm-Features: AQROBzDc24VnjELv4pOV4rIg-rQXk3xwiRAVSb4i_ezxOVwLdnHKGTZ0mwswMws
Message-ID: <CAMxuvaxmuz=HQHnpO+JP-VkH2yiY_1kWsA9SgXidSDcXe-H5Rg@mail.gmail.com>
Subject: Re: [PATCH RFC] virtio-mem: add shared/private memory property details
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, david@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X3mUumeeYlZxDHOXjvn2aNBnByCxv_eFYB-wcxwhGTk_1776694736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Apr 20, 2026 at 5:52=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Hello Marc,
>
> I did a first review of the patch:
>
> On Wed, Apr 15, 2026 at 06:54:35PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Add specification text for platforms where system RAM has a
> > shared/private property (e.g., confidential computing environments such
> > as AMD SEV-SNP or Intel TDX). Define the device and driver requirements
> > for memory state transitions during plug/unplug operations, and
> > guidance for VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE case.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  device-types/mem/description.tex | 37 ++++++++++++++++++++++++++++++--
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/mem/description.tex b/device-types/mem/descri=
ption.tex
> > index 9acf63f..1eefea0 100644
> > --- a/device-types/mem/description.tex
> > +++ b/device-types/mem/description.tex
> > @@ -42,6 +42,18 @@ \section{Memory Device}\label{sec:Device Types / Mem=
ory Device}
> >  provides the exact same properties with the exact same semantics for
> >  plugged device memory as available for comparable RAM in the same conf=
iguration.
> >
> > +In some configurations, system RAM might additionally have a shared/pr=
ivate
> > +property, indicating whether memory is accessible to both the guest an=
d the
> > +host (shared) or only to the guest (private). \footnote{For example, i=
n
>
> How does the driver know if the platform has this memory property?,
> i.e., shared/private property.

This is up to the platform at this point (both on host and guest
side). Given that the setup are different for the different platforms,
I think this should remain outside the scope of virtio spec.

>
> > +confidential computing environments such as AMD SEV-SNP or Intel TDX.
> > +The mechanism for converting between shared and private states is
> > +platform-specific; for example, it might involve dedicated CPU instruc=
tions
> > +or hypercalls.} The device provides unplugged memory in the shared sta=
te.
> > +When memory blocks are plugged, the driver is expected to convert them=
 to
> > +the private state before use. Unless VIRTIO_MEM_F_UNPLUGGED_INACCESSIB=
LE
> > +has been negotiated, the driver is expected to convert them back to th=
e
> > +shared state before unplugging.
> > +
> >  \subsection{Device ID}\label{sec:Device Types / Memory Device / Device=
 ID}
> >  24
> >
> > @@ -58,8 +70,9 @@ \subsection{Feature bits}\label{sec:Device Types / Me=
mory Device / Feature bits}
> >  configuration is valid and corresponds to an ACPI PXM.
> >  \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allow=
ed to
> >  access unplugged memory. \footnote{On platforms with memory properties=
 that
> > -might get modified implicitly on memory access, this feature is expect=
ed to
> > -be offered by the device.}
> > +might get modified implicitly on memory access, or on platforms with a
> > +shared/private memory property, this feature is expected to be offered=
 by
> > +the device.}
> >  \item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the gu=
est
> >  to enter suspended state (deep sleep, suspend-to-RAM).
> >  \end{description}
> > @@ -176,9 +189,15 @@ \subsection{Device Initialization}\label{Device Ty=
pes / Memory Device / Device I
> >  The device MUST NOT modify memory or memory properties of plugged memo=
ry
> >  blocks during device reset.
> >
> > +On platforms with a shared/private memory property, the device MUST NO=
T
> > +change the shared/private state of memory blocks during device reset.
> > +
>
> Is this additional requirement needed? Is not already covered by the
> previous one about `plugged memory blocks`? Is shared/private a memory
> property?

True, it's mostly redundant.

>
> >  The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platfor=
m
> >  supports suspending (deep sleep, suspend-to-RAM) with plugged memory b=
locks.
> >
> > +The device SHOULD offer VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if the pla=
tform
> > +has a shared/private memory property.
> > +
> >  \subsection{Device Operation}\label{sec:Device Types / Memory Device /=
 Device Operation}
> >
> >  The device notifies the driver about the amount of memory the device w=
ants
> > @@ -256,6 +275,15 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Memory Device / Device Op
> >  If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
> >  MUST NOT read memory or query memory properties of unplugged memory bl=
ocks.
> >
> > +On platforms with a shared/private memory property, the driver MUST co=
nvert
> > +plugged memory blocks to the private state before initializing or othe=
rwise
> > +using them.
> > +
> > +On platforms with a shared/private memory property, the driver MUST co=
nvert
> > +memory blocks to the shared state before requesting to unplug them (fo=
r
> > +VIRTIO_MEM_REQ_UNPLUG_ALL, this applies to all plugged memory blocks),=
 unless
> > +VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated.
> > +
> >  The driver MUST NOT request unplug of memory blocks while correspondin=
g memory
> >  or memory properties are still in use.
> >
> > @@ -285,6 +313,11 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Memory Device / Device Op
> >  The device MAY modify memory of unplugged memory blocks or reset memor=
y
> >  properties of such memory blocks to platform defaults at any time.
> >
> > +On platforms with a shared/private memory property, the device MUST pr=
ovide
> > +unplugged memory blocks in the shared state.  If
> > +VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the device MU=
ST
> > +convert memory blocks to the shared state after unplugging them.
>
> I wonder if the device can always do such a conversion, i.e., from
> private to shared, or it should go through the guest.

Since it is marked inaccessible, the guest can legitimately not to
convert it to share. But since we want to return it in the initial
share state, the device has to convert it back to share itself. If it
can't, then it's a hard failure - or it should just discard that
memory.

>
> > +
> >  The device MUST NOT modify memory or memory properties of plugged memo=
ry
> >  blocks.
> >
> > --
> > 2.53.0
> >
> >
>

