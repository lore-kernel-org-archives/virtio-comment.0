Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAA17A319
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282164; cv=none; b=EjlGn3P0dVPMA6oEFQvgTGwcvNe/fS/t/OMEflE+JjrON3xThhnwGJD1CxO/dvgdKbcHhlZsQ4x1r8lcoCiSy8s22VoVmqM1Nl7+94psSAZ3ATbextSX32jXrOVlwCAQdQiM4Vs/Sz6QTOCY7TmUYV3pte6Lo7zo+PL8DqScRF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282164; c=relaxed/simple;
	bh=sske1z+PrxlmV+yannarBd0CAwpMbs9raSq6QqLNmXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eO3Ll1COpRQfjv1QpB3mZZSGYTUgGjsie8nHbEoVN/2CJypxWWjN0tVej+me7QvfsRcPXhy1U18Q292S2bEa/UA1MqWv829h3rZJNPsm5s53zKhrSo62IB5WKTj3PFbuPx+Nju+ZGSDsa5/cSjhWKo0S9HW7aV9nKqpJul2dfwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZ7FFBbe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZ7FFBbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744282161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sske1z+PrxlmV+yannarBd0CAwpMbs9raSq6QqLNmXw=;
	b=EZ7FFBbea2Cz3NNYknRqqRMpeHKaOIjfR9H91CxbxLtEbRJYJk9ZDpX+xOUxsyaoKra5io
	YVPonrkMXz8Gx/vaT6RtGoYqB5U21186AqetUMwk8AArRsz5VggvC5KdMuO2PeUEDFANDt
	v8J1WyFaFPduPRtN9p0BbPCcUKhwxaM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-gMu7qvvsPEy5axurH6m_SQ-1; Thu, 10 Apr 2025 06:49:20 -0400
X-MC-Unique: gMu7qvvsPEy5axurH6m_SQ-1
X-Mimecast-MFC-AGG-ID: gMu7qvvsPEy5axurH6m_SQ_1744282160
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6ef85037f3bso25199407b3.1
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 03:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282160; x=1744886960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sske1z+PrxlmV+yannarBd0CAwpMbs9raSq6QqLNmXw=;
        b=VxFYz9/8mPZRL7aDbFYpmuQd6iXMgu28EHeg4oDXyE7KZ9AET1i6u4sEgsy6f1Z4Vt
         rwyADn+AgCGtwihz8UdmfhUQMRnzSbg8BSU0DTaTXVUA3j4oURvR/HYDytyR0h5P68Ze
         B4q0Kkaj524UH8Lr+sDtiQYbs+GQBEZ4O89SNQ04AilHMPNr+kmnRvoSkRZ5234A63pC
         XCSQ8QnsWjC57bESmGNw0HyIFrByAr/fFaWfnhzr8dVjreIhn8u29U1L64321F7tEUWK
         NS5MEGcJNjEBY/p3Fhyo18zjV/WtfZqoB/PCYiskWNb6t3xEh2F/yJ9KQw3NUm1GXdnt
         SkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNGeghdP5ESUxs/6zAu9+/HCHXMjVGvW4dT9Tbl3y+26zfoRp3h+I+a/w7bAtSx4Eq4cMCy/fLF4MALOv27g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/9syKUL/qsaSvKMNbV/CP2iLOMSTcNAEVeTnOfjYDFs0ysu7
	xvS+SQjElGgPuQcYifl7xCX1LNIKDSqYpUR0FQekyqRawVy8MZvNY4LE3cgE1OMnyv1NZPQDFYn
	VXS1v/sgvDbJFDwyCUodhWpeTcsZ/3lF0mdhSDCsg+xwPTIutSZHsbY79hcoWyzQZ+zCk1cbBm9
	HfOoCPhpfenIOWR0G9U+P6ai1OwMeFAH9oVQ9m5vk=
X-Gm-Gg: ASbGnctC/JVQ/0u855Lv7z00ZxhI8TfVHtrLdStuw5n0dDMbQ/152oCu61D1QLPW1WA
	u6VFsIxqGCLgPFXQKIfieNJZ2KVGzwJ3ymSBHAyz1EDM4MfigylypAdq7pJ2SkZxoqh4=
X-Received: by 2002:a05:6902:124d:b0:e6d:ec89:be4d with SMTP id 3f1490d57ef6-e703e6dcfa1mr3169729276.7.1744282159890;
        Thu, 10 Apr 2025 03:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO50eXsuD6B7Vw31W/atGdlotDvtNbOOtWLI3AM49oANQDJmbzPCD+y2Y8tdho3UdH7m1A6OHJGncnw0SEI1c=
X-Received: by 2002:a05:6902:124d:b0:e6d:ec89:be4d with SMTP id
 3f1490d57ef6-e703e6dcfa1mr3169693276.7.1744282159450; Thu, 10 Apr 2025
 03:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F4c4E4Bg4F+GhO3pQBk=3Bj7D1jaNisbnyNXUNvjVUs5g@mail.gmail.com>
 <20250410104727.3149826-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250410104727.3149826-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 10 Apr 2025 12:49:08 +0200
X-Gm-Features: ATxdqUFBgtK9nPwvafusIjRRfvl-WtS9yFfjp8gOfiROSqYdJWAec3qVDWcv6uk
Message-ID: <CAGxU2F7WcmYHMO4P7PzQRE8a-Pe5WhehugGa8tTSWX0Xary04g@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PTSGyrJyMOQQ5H_JWIJxhVg-HIJXqpkPCQWxWjrrgpc_1744282160
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 12:47, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Thu, 10 Apr 2025 at 10:59, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > >
> > > > > > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > [...]
> > > > > > > >
> > > > > > > > The idea is to inform the guest which addresses are reachable by the
> > > > > > > > device, so the guest can easily decide which device to use. I'm
> > > > > > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > > > > > sibling VM (CID >=3).
> > > > > > > >
> > > > > > > > >
> > > > > > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > > > > > devices present in the VM.
> > > > > > > >
> > > > > > > > Okay, but how can the guest figure out from this information which
> > > > > > > > device to use to talk to the hypervisor or an application in the host?
> > > > > > > >
> > > > > > > > >
> > > > > > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > > > > > find the device by the CID.
> > > > > > > >
> > > > > > > > I'm not talking about the source CID on which to do bind() (which I
> > > > > > > > honestly don't like), but I'm talking about the destination CID on
> > > > > > > > which to do connect().
> > > > > > > >
> > > > > > > > > > so that the guest knows which device to use depending on the destination
> > > > > > > > > > CID.
> > > > > > > > >
> > > > > > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > > > > > will be directed to the device by the destination CID.
> > > > > > > >
> > > > > > > > Sorry, I don't understand how you do this without having an
> > > > > > > > information from the device about what addresses it supports. Can you
> > > > > > > > elaborate a bit?
> > > > > > >
> > > > > > > Thanks for your explanation. So things you were talking about are as
> > > > > > > follows:
> > > > > > >
> > > > > > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > > > > > available in current VM.
> > > > > > > 2) guest app as a client: the guest driver picks a device and uses the
> > > > > > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > > > > > but only do `connect()`.
> > > > > > >
> > > > > > > The key point is who takes responsibility for picking a device:
> > > > > > >
> > > > > > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > > > > > do `connect()`.
> > > > > >
> > > > > > Why?
> > > > > >
> > > > > > This implies that users must be informed in some way that they must
> > > > > > use a certain CID to communicate with the VMM and another to
> > > > > > communicate with the host application, when they could just as well
> > > > > > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > > > > > transparent.
> > > > >
> > > > > Sorry, I didn't express it clearly. I just listed my original idea and your
> > > > > idea.
> > > > >
> > > > > What types of services can be considered as hypervisor services?
> > > >
> > > > TSI.
> > > > The vsock used to implement it end up in the VMM (i.e. libkrun), right?
> > > >
> > > > > In our
> > > > > case, the kata-agent is a control service for Kata, so could we consider it
> > > > > as a hypervisor service?
> > > >
> > > > Nope, kata-agent is clearly a host application.
> > >
> > > Make sense for me.
> > >
> > > > > How does the driver know which device is for hypervisor? A possible way is
> > > > > to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> > > > > think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> > > > > maintain the same behavior.
> > > >
> > > > Or adding a bitfield in the config space, where the device set several
> > > > flags depending on what kind of CIDs is able to handle.
> > > > They don't need to be negotiated, IMHO. Just advertised by the device.
> > >
> > > Will do in the v7.
> >
> > BTW this could be part of another proposal if you don't want to speed this down.
> > I think we are talking about 2 features here: multiple devices and CID
> > supported per device.
>
> IMO, it could be considered as one proposal but two features:
> CID_HYPERVISOR support and per device CID support. My idea is to split
> these two features into two patches.
>
> WDYT?

Yeah, LGTM!

Stefano

