Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D529A5
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750207771; cv=none; b=mGr/gvQC+Slwqdq6feBz5QjAKhUGP+FV/iiFW+NGLeaHcqq7OUA23jRsA2LtCVffSOPjoKFC7aY9cZKX6qWN7mKoRpnE13mKbCkKFHXDoj/78D8b4WaV7RFAsVFbgwdO6oviwIpcCYtgZmMjyWnpofN9YUEb79j4JkfVeHRD4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750207771; c=relaxed/simple;
	bh=AUIQmSPnw2v0ra0hK8peu5uoPwT2G2t/pBphPyfbyXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyyYoRguIQM10HPMmB8YaXAme4SyWujPq3zzWdjbFNR96AXkJy7ZT9wLdoHzL/Gab9BqPaZ0T7+cyQLzIZF2ncKRaGXamo6oaoR0uvoZPe3vs27/mBc0NwPDLm1PADePxKnu9q/EGVZhU96/4KM2wsu+Z5HsOLpxMVsIINAV9B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OuGO4Beh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OuGO4Beh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750207767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUIQmSPnw2v0ra0hK8peu5uoPwT2G2t/pBphPyfbyXE=;
	b=OuGO4BehJmT+9zR3gFII9MVuYHHzjicR0ssALNpAAFcl7T6vhKVLVqf5j0YQhEeXagFVGc
	Ui/AsySD5fsny1E/1Of7Nf9IEQSTEV3ysd+CdvxlzB+OJ5Vu5vXe1uZFrkx7w+wBE1Gu9e
	iW6GlaWvzbjElLiNveaM/kZPUWBpx78=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-QZyfkipePS-_ScL-QOPiGA-1; Tue, 17 Jun 2025 20:49:26 -0400
X-MC-Unique: QZyfkipePS-_ScL-QOPiGA-1
X-Mimecast-MFC-AGG-ID: QZyfkipePS-_ScL-QOPiGA_1750207765
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31315427249so5789595a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 17:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750207765; x=1750812565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUIQmSPnw2v0ra0hK8peu5uoPwT2G2t/pBphPyfbyXE=;
        b=n1oHMlkK7BxmPgSDBvGZpMbRIefhJizPD/rtWhWa2F0M1QOFbk8p4HaLGm+OUJ4UQX
         S65KsTJvhlhHXLJuXqVDxYLbbUAaxhrmKN4wb6gkjtxrCRfrTO1MVySwem1rei1u/jTW
         fd8/djJ0Bzuf1Q/Mb5adVAL5DAGVmPswsoY2EZqdvLWxkguG0NZgAjGrWUty93terImY
         Qr6kHFuDnp9s7YTG23VP0jHjZnDHV1DOKSKwMtjRa8EjJWqnMCIAT3HtGcEPxqejils3
         B+Cu7Pss3XAeLqPBudfRsTLRnp9j+GqpQBm8HMgKIcMEHAZ5+NbhTANE4/MZiywOwUqe
         owPg==
X-Forwarded-Encrypted: i=1; AJvYcCWvXlhXJpzYPoN1pTcXvXuf0Mh373Om7QbPCbtvQvSIL+Oi9NbPNre4xFXJ/iz+sU2y3YS9vbJHk+MXsVvGhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsyBo0i4XJzVFB99AwD8Uuks9nwyuNvqEi3SoZSTrP6LiMB5ml
	yKSEMF3kL1Km/XRloROUXh1rSA9Y6Wz1o6qcpHNyCWUIxCny7tIaZu1gS99+i4WKPwsnqxgJrPS
	5bs91/zCNJHIvLYuY45PtI+aQDKo3MKanzCXdgNMJVN7wQWAEhKWXsYT3YxJE2dgjA2fRuiJdeJ
	XQYc6cB6J3BNUJynWV0PzfFK53YZyO1fydDpQS4c7tnNoEH3r7Wc1wrwpIAbM=
X-Gm-Gg: ASbGncsYzBts7BKBGvfyP1vS7pE5HLANpGbClCotXpFF3wvGjs0tNdCpy0Lvu0BJA2P
	sxc0I6oga/+aG/CS+PcUqIo7o/Pyyg71vQeWBekd226dUFs5H9/vCNQXt9pEQAJUOZ+ysg5QqFq
	hseQ==
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-313f1ca7f9cmr24455612a91.9.1750207764952;
        Tue, 17 Jun 2025 17:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1Qhn+waC7zz0Hg89PztIKNwzUlTiUNc1qwX9y++d6ZQaIgeWMg1Xrg6trw+a/syC5fLhzZkT8pjxLWZpVjtk=
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id
 98e67ed59e1d1-313f1ca7f9cmr24455584a91.9.1750207764503; Tue, 17 Jun 2025
 17:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEv2-p9XyEmkhe=WTLwAVYdxoqyv=exSxmscE7ZyXOt6tQ@mail.gmail.com>
 <20250617074545.1320089-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250617074545.1320089-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Jun 2025 08:49:13 +0800
X-Gm-Features: AX0GCFuwF0uEa3ujeZwO4VKrxoiIS-kYB0dLI4enFPMGWsXMDNmUpzMU4zt4Ggw
Message-ID: <CACGkMEvWwHSQsAiPt9R+VzwgCkhx=mqW8pXOBfHrK6B1Thc2jA@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, sgarzare@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xWXjw_xS5fCcCEFtXhcqsE-B6lIrUAAKpjjHIzy_qb4_1750207765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 3:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
>
> Resend, because it isn=E2=80=99t listed in the mailing list due to my mis=
take.
>
> > On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella <sgarzare@re=
dhat.com> wrote:
> > >
> > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrot=
e:
> > > >
> > > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei97@g=
mail.com> wrote:
> > > > > >
> > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > > > > > > >
> > > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niux=
uewei97@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > This patch brings a new feature, called "multi devices"=
, to the virtio
> > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" f=
eature bit, and a
> > > > > > > > > > "device_order" field to the config for the virtio vsock=
.
> > > > > > > > > >
> > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > >
> > > > > > > > > > Vsock is a lightweight and widely used data exchange me=
chanism between host
> > > > > > > > > > and guest. Currently, the virtio-vsock only supports on=
e device, resulting
> > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > >
> > > > > > > > > I wonder which part of the spec forbids more than one dev=
ice.
> > > > > > > >
> > > > > > > > No. The spec, however, is designed for a single device, and=
 lacks some
> > > > > > > > specifications for multiple devices.
> > > > > > > >
> > > > > > > > For example, we should have a mechanism to select a device =
from all to
> > > > > > > > communicate with a peer.
> > > > >
> > > > > I wonder if this is a:
> > > > >
> > > > > 1) mechanism that needs to be mandated by the device
> > > >
> > > > Yes.
> > > >
> > > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP d=
id
> > > >
> > > > Not allowed in the current version.
> > > >
> > > > > (Note anyhow the driver can override what the device suggests...)
> > >
> > > I think we should follow what we described in the spec:
> > > "The virtio socket device is a zero-configuration socket communicatio=
ns device."
> >
> > We probably need to define "configuration" first.
> >
> > For example, if it means zero configuration from the user, it does not
> > conflict with 2), the driver can use its own algorithm to elect a
> > "default" device.
>
> IMHO, it can be done, but it is not the current design.

Well, you need at least explain the advantages or why you choose to do this=
.

>
> I prefer to set the default device for VM-HV communication to do some ini=
t
> work. I don't think people have a strong need for this.
>
> > Another perspective, making decisions in guests may be even more
> > helpful for the case where the device is not trusted
>
> How does the guest realize the vsock device is not trusted?

There're various ways to build trust (for example device attestation)
and more might come in the future.

> The guest only
> knows the information from its config space, which is provided by the hos=
t.

The way to build trust is probably beyond the scope of virtio, but it
is something we need to consider.

>
> > > So, IMO the guest (driver) should not be allowed to change anything.
> > > E.g. Right now it's not allowed to change the CID assigned by the hos=
t (device).
> >
> > A dumb question when having two cids (cid1 and cid2) in the same
> > guest, what happens if src=3Dcid1 and dst=3Dcid2?
>
> The packets will be directed to another application, if any, on the same =
guest.

Ok, so in your example, vhost-user-vsock should route those packets
back to kernel vsock?

Thanks

>
> Thanks,
> Xuewei
>
> > > Thanks,
> > > Stefano
> > >
> >
> > Thanks
>

