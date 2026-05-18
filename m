Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34369372EC4
	for <virtio-comment@lists.linux.dev>; Mon, 18 May 2026 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104364; cv=none; b=k52fIU9glahxrF1mBS6FnoB0o0VZB27DuleOvCjo5Wz/UHevEPFrJHow2ZC475e+U8iB8xqWDbIKTAlrCNmAeV/t1H73JDKYKeCpWCj0r+iJ+AVJ+tsfYJdsSQYBHzEagtwj/fTKW7zFS+NZ67bRDsaqeInvPQCWARCytfP0J+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104364; c=relaxed/simple;
	bh=jkgAUovd4e9X3Cr5ssXXJgnadAeFn6lOKIt5IdEiTXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6bjEp7q2P4A2lwx4DNiE5XYZCEaAttKpQni5bXFf4/JgPDD+PHQRlo0/ALMxn+V92vKOO9TlXzVc801dudhbHELEC//8BhNN8/UVBAEb4GaMP5sCmc9pN93xDQ1SK2D8VtD+U4xTuivQWNaWlkeGknGGWxjpHCO0w9qo7razNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDI9HRSS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDI9HRSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779104358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jhb7XesaNpxdzbfoOWNO2TvcfYBlLxkc5ygx+5zzFvc=;
	b=KDI9HRSSVgNz1mLyLXUYuWLpbG1s74xTpt3Te6s4hiQit9pKQ3F/gictmkvS+YH8D36bbk
	kFEAyyTUokBs86pJyYjqzpPE7GRvzdtsXlwOHIYsXs3nWIj0trC2YL0Zepi5x5t4DKCOkm
	AiZZWPeThJRl5mO6hVcHjhTVca8Qm1M=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-QF-h5UrvNxq00C86f-EBLw-1; Mon, 18 May 2026 07:39:15 -0400
X-MC-Unique: QF-h5UrvNxq00C86f-EBLw-1
X-Mimecast-MFC-AGG-ID: QF-h5UrvNxq00C86f-EBLw_1779104354
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba15e384c7so15392415ad.3
        for <virtio-comment@lists.linux.dev>; Mon, 18 May 2026 04:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104354; x=1779709154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jhb7XesaNpxdzbfoOWNO2TvcfYBlLxkc5ygx+5zzFvc=;
        b=QO5nH8Mp1iBYQJF4zU+fiJyL21O6BqmKNFwhKxy7jQ2gOFUFATpyojYz4UIzQCQN3f
         UON/6L4oFd6lYArqKapnwQkTOHxO05Hg/+gJUxrX5WJi3By4x9FOMJyqnxvYwMqwHUgL
         aAe4deEJ68HAM8usS3RMqsrqHQpi0yvaq3mcF1iV4OFAfloRFYb5wo32q1bDNj5+Ernn
         CTlaf8MHuFbtwrC0El+hmfH+hy9XLOh4hv7t7zGaDxe2C1vKf5DiKcWg2SXTwFOTGxqc
         4b+FOimpJ+19G1Y3zYlZ32ddt785QGZ4r95NCKQlIOMB+hGVKOwVUr0W1xzZYPAkBkle
         VLiA==
X-Gm-Message-State: AOJu0YwgrGXOEEjHf/jI0zFB8Rs29nFK9IukqExoj0nYVk1xwjh9pixe
	k8V88qbLO659qHJiMrIzbV4a5KUoJ/PFozHVG73YesK21d7eBFDu+r9KNDl5IvdB4VRMjT4WC91
	mgHcttVaAlvYKG6bm+WiAqnNWyDD8uhvtGNtDTngzjxYYkBMv6kODRlJWAdEDEv9RwWh9f0IPrw
	NHrM9FplgSz9YUWlyZWCzfHAAXF4yrqMVwOAPPWKVe+48=
X-Gm-Gg: Acq92OGCNJoz7gmDp+bLnmi2o12JHKOVUDGKWlJCjIh0jVI8J/oSEebAvqKnu1/KW5L
	zBailUlblZr4T4jyYvenjw/I0+ZarZadpkgz2bLm2CRN8bIpPBmf4OixxE1ThDgjnP4c+8JBtgw
	BExQ/0tYY/IT0HFKSWEoPYeRxSH/bzMkxHER4e5Ok9ILYJ9nmvFY7RWfG4KkdWkPltRPTXBNKm4
	4y+xxYupUNmGkgDWOBq5Qvm/LbhZsu7sEhiPnUy0lWDXCLqckEVZGZfpKijYawAwg9lsdPN1bLt
	f54JV+lqGSF6PNKeriw+VDw=
X-Received: by 2002:a17:903:46c4:b0:2b9:e82f:bfef with SMTP id d9443c01a7336-2bd7e88f2d7mr152862655ad.21.1779104353871;
        Mon, 18 May 2026 04:39:13 -0700 (PDT)
X-Received: by 2002:a17:903:46c4:b0:2b9:e82f:bfef with SMTP id
 d9443c01a7336-2bd7e88f2d7mr152862315ad.21.1779104353303; Mon, 18 May 2026
 04:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415145435.2023866-1-marcandre.lureau@redhat.com> <9452396c-e1be-43da-83f7-f4ea4fb997ec@kernel.org>
In-Reply-To: <9452396c-e1be-43da-83f7-f4ea4fb997ec@kernel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 18 May 2026 15:39:01 +0400
X-Gm-Features: AVHnY4IYDnvI46pBWZj2IwCGWSPbQOrP62Iqy4WneSIxkkuZIwYS2l7njNXoNsM
Message-ID: <CAMxuvazkD6csS1yUd2=oVQhm7-CCU3P4wkCzV7aJPq_fUKUqRg@mail.gmail.com>
Subject: Re: [PATCH RFC] virtio-mem: add shared/private memory property details
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NXmGfNEwBTAhDpUHI0wgX4IVnSPy-pdbiJONb5dLOMg_1779104354
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 13, 2026 at 8:07=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 4/15/26 16:54, marcandre.lureau@redhat.com wrote:
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
>
> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is a legacy leftover.
>
> Should we rather enforce that such devices in CoCo environments MUST adve=
rtise
> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE? So they would always have to be conv=
erted back.

If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is negotiated, the guest
doesn't have to convert it back.

I am not sure enforcing VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE for CoCo
is the right call.

> Note that negotiation with VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE does not r=
eally
> apply: if the device has VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, but the gue=
st
> driver does not support it, the expectation is that feature validation fa=
ils
> (see QEMU).
>
>
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
>
> That makes sense. But doesn't that fall under "memory properties" above?

Yes, it's a bit redundant, we can drop it.

>
> > +
> >  The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platfor=
m
> >  supports suspending (deep sleep, suspend-to-RAM) with plugged memory b=
locks.
> >
> > +The device SHOULD offer VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if the pla=
tform
> > +has a shared/private memory property.
>
> Again, I think we should turn that into a MUST.
>
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
>
> Is it guaranteed on all platforms (TDX/SEV-SNP/CCA/...) that hotplugged m=
emory
> will appear in the shared state? I have some faint recollection that some
> platforms would start out with new memory in the private state (that they=
 would
> still have to accept before use. But cocneptually, the memory is in the p=
rivate
> state).

My knowledge is limited. I think the platform doesn't enforce this; it
depends on the implementation. To fix plug/replug I propose to enforce
the state from either fully shared or private:
https://patchew.org/QEMU/20260504-rdm5-v4-0-bdf61e57c1e1@redhat.com/2026050=
4-rdm5-v4-13-bdf61e57c1e1@redhat.com/

