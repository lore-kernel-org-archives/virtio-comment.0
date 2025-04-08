Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2B1EA65
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119260; cv=none; b=ZTuhya/hR2xgPhJjT2EfRMDev+ot0+wy1nJvzOHV2+Ac7iOngy2Re+G6S3zX6HqlQ+PDg0bkxjQO3wAF3jTJMOr+Jb3lXqll0ItD1qI5o9ej6CAd9EgPgwjdCVIqy9Lntx8v7AB/quOPI/t33WgP/2m21nerQbW0D11IxmVG21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119260; c=relaxed/simple;
	bh=5+cE22l5I50JqZE0YkvRdpRyzoTbXW84wZCKL8d7ke0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnkd+pn0hM81zv/qQhsqA7RPITZA4+Q8eWxoyvR2WbA62zIQIDaA+DID2mlLSWpv/5ZEetlEOCPdR+m0AwcpOQC8SAzJ+dmSobq807xUpnmOkJOJcZ13gajOq0AKt+gJqQBAh/0L87pMK4bJaWuJgGjsIBb8gMvb4zyyitkmiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aYJEjSlV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aYJEjSlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744119256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3VASef1NNjlRib0FWE+rFYye1R+RS1APkFyB61mUX8=;
	b=aYJEjSlVTSUhkZoJ0pUMvSwbn13mUbOheAGJnbBnYzo/Tq8MMdrZ5tj6A3SJWpGOA6tOQ7
	i+1QuHZP7YPzRG9ZJbKzvDpSicW53IJ8kFYVX4bQ0vIPt0Rm+O5+tWR49PbXS9klCanwpi
	WAWquvYAm30zG0W/8VuSfj1fBg3xTiQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-KG0uPQtUM82S_HCytzvFeg-1; Tue, 08 Apr 2025 09:34:14 -0400
X-MC-Unique: KG0uPQtUM82S_HCytzvFeg-1
X-Mimecast-MFC-AGG-ID: KG0uPQtUM82S_HCytzvFeg_1744119253
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70267bb7ed8so64468617b3.1
        for <virtio-comment@lists.linux.dev>; Tue, 08 Apr 2025 06:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119253; x=1744724053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3VASef1NNjlRib0FWE+rFYye1R+RS1APkFyB61mUX8=;
        b=V0KdONn7231XVvx1iyI5ZZvgEqLSABbZXjb0B2NlZbsyc249gVRNgXtHNKNUhHiunf
         JudltI+IfpxQh8vey+oygZwg+4LwEjrnT8dY4OWU0ZuyBZUyjjB1Fm8iWJQAH9yAIiO7
         hEG+jTRctfH0jScxkKAw6maw38Zd2SeZSXrR75TKoO6mPk2kZ4ITKGYW/Hs5DDy1rhKh
         i3GvbZsq2a4fvxgSJXn81yhfrTG1/itj9fCGwi7Jz40pB9YjgA1e0YzXq5cyIDPVefW6
         JFBoB2GR43EVbs6ks8nXy1zU0uSpnymrNi3vqQKajeMWKemJE9nYmyvvb/qH5sOUwVlP
         v++w==
X-Forwarded-Encrypted: i=1; AJvYcCU94RAfJeeMVvo+Lkzz1i+Ydstm4OcaCFzkLhfSyFcDg7SEw1wH8Zh3RxPfA2RDDOw7IGe2058U2nHK4R2a+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoQUbIfqExaxMFUUbPKN8EM08FJ30tA4RxH0w2WPqbCStpYvON
	w6r9Xx+MtqToM6v9w0pKLjI3u2Z7V59MkKTxqcZ+3AYtRUQ4lja/94ocM2ebD6y3si1JQ0uBMDV
	neTKxFJaSvAItz7+PVf6IJhOqsUFZd1+addbQu46DpaIcyHaUeEHNLjj9De5MDNf9va6NKvOYWq
	7BRwAb6nkLtNPyU7c1sblR44/mNwVvQHvkH/b3vnY=
X-Gm-Gg: ASbGncv9Tgx9XGbw8jlmLJjwZwK0tRXsZIeZnLBr/qkm4e3OX4lPMbT5sDa2bTrqLt/
	ELrr/Kr5yzxW3mTer8Shn03L4tpQyipgW0lA2PzwT6k7nw+cjBsKo8BvAPh4kQe8HcNcz974=
X-Received: by 2002:a05:690c:380a:b0:6fb:ae6b:a340 with SMTP id 00721157ae682-703e15fc46amr296440507b3.30.1744119253191;
        Tue, 08 Apr 2025 06:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPIe/YpiDGIXGiIPv2k42FrKp2WoQhTMDmyEj8tKLBxTbP1Os+mu5KDhVImYiyqx19MY0XBhydDdYfyarKvhQ=
X-Received: by 2002:a05:690c:380a:b0:6fb:ae6b:a340 with SMTP id
 00721157ae682-703e15fc46amr296440177b3.30.1744119252821; Tue, 08 Apr 2025
 06:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <lr6fvhjts6ytekqnlbvccvvjbnmbgspzynme4yii4bla6fiyig@mzgor4y3ojsh> <20250407021715.2736840-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250407021715.2736840-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 8 Apr 2025 15:34:01 +0200
X-Gm-Features: ATxdqUG66riViKfXktvXVqjPjVM70A8-xwxdX8AmR0fh-VF_1cCsR9icFIsnYWg
Message-ID: <CAGxU2F4Qejw2hd45SduH=OwzUZVR6xYJATRyDskukHU8+2nkGw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PphBt88GZ6yartOfhZjDVhfJGz6oZY7EJF59KE5iXPM_1744119253
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 04:17, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Mon, Mar 31, 2025 at 02:18:27PM +0800, Xuewei Niu wrote:
> > >> > On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > >> > > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> > >> > > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> > >> > > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> > >> > > >> >> >This patch brings a new feature, called "multi devices", to the virtio
> > >> > > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > >> > > >> >> >"device_order" field to the config for the virtio vsock.
> > >> > > >> >> >
> > >> > > >> >> >== Motivition ==
> > >> > > >> >> >
> > >> > > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> > >> > > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> > >> > > >> >> >in the inability to enable more than one backend. For instance, two devices
> > >> > > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> > >> > > >> >>
> > >> > > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> > >> > > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> > >> > > >> >> it. Could this be the use case?
> > >> > > >> >>
> > >> > > >> >> We could in this way add a new feature for those devices that
> > >> > > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> > >> > > >> >> So instead of having multiple CIDs per VM, we could continue to have a
> > >> > > >> >> single CID, but the transport could support 2 devices, one to
> > >> > > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> > >> > > >> >> apps (CID = 2).
> > >> > > >> >>
> > >> > > >> >> Maybe this is orthogonal to this proposal, though, because it might
> > >> > > >> >> still make sense to have multiple vsock devices, even though it's not
> > >> > > >> >> very clear to me.
> > >> > > >> >
> > >> > > >> >In terms of the current situation, two devices are enough.
> > >> > > >> >
> > >> > > >> >We are the team of Kata Containers, so we are focusing on cloud-native
> > >> > > >> >computing. What I mentioned below might be beyond the scope of the virtio
> > >> > > >> >spec, just for your reference.
> > >> > > >> >
> > >> > > >> >The background is that the architecture of proxy mesh has been evolved over
> > >> > > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> > >> > > >> >
> > >> > > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> > >> > > >> >both host and guest network stacks. It is possible to establish a fast path
> > >> > > >> >between the pod and the proxy.
> > >> > > >> >
> > >> > > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> > >> > > >> >does vsock.
> > >> > > >>
> > >> > > >> Be careful though, we don't want to complicate vsock to become like a
> > >> > > >> NIC.
> > >> > > >>
> > >> > > >> >
> > >> > > >> >When multiple networks are availble, it means that it is possible to have
> > >> > > >> >multiple proxies(i.e. user processes). In this case, two devices are not
> > >> > > >> >enough. This feature makes vsock more flexible and scalable.
> > >> > > >>
> > >> > > >> This is a good point, but I really don't understand why a VM should have
> > >> > > >> multiple CIDs assigned.
> > >> > > >
> > >> > > >I think priority is not the biggest issue here. So let us focus on how to
> > >> > > >route the connection to the right device among more than two devices.
> > >> > >
> > >> > > That's why I was recommending a different approach. IMO the user should
> > >> > > not do this, but that should be transparent, hidden in the driver.
> > >> > >
> > >> > > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> > >> > > be sent to the VMM, then we have to use the device that supports it.
> > >> > > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> > >> > > device.
> > >> > >
> > >> > > The user doesn't have to do anything, only use the right destination CID
> > >> > > if it wants to talk to the VMM or another host process.
> > >> >
> > >> > Obviously, if we want to support more than 2 devices, we need this
> > >> > that you are proposing. But IMO we need also to support
> > >> > VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
> > >> > bind() on a random CID if one of the two devices only talks to the
> > >> > VMM.
> > >>
> > >> I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
> > >> work on this later.
> >
> > Would be nice to have both together, but I'm fine if you want to
> > postpone it.
> >
> > >>
> > >> > Because, again, how does the user know which CID to bind?
> > >>
> > >> Nice catch! I am trying to give a solution for this issue regarding the
> > >> scenario of more than two devices.
> > >>
> > >> Let users access the `device_order` and the `guest_cid` field. Host user
> > >> program and guest user program can make an advance agreement. For example,
> > >> the first device (whose `device_order` is smallest) is used to communicate
> > >> with host process 1, the second device is used to host process 2, and so
> > >> on.
> > >>
> > >> The guest user program want to direct the message to host process 2, then
> > >> the things would be:
> > >>
> > >> 1. Guest user program gets the second device's `guest_cid`.
> > >> 2. Guest user program binds to the CID.
> > >>
> > >> This could be worked because the `device_order` is a VM-level
> > >> configuration. (On the contrary, the `guest_cid` is a host-level
> > >> configuration).
> > >>
> > >> If people don't need this feature (use 1 or 2 devices only), they can use
> > >> vsock as the simple way. Otherwise, people should accept the more
> > >> complicated way.
> > >>
> > >> WDYT?
> > >
> > >Or we can replace the device_order with the guest_lid (aka local id). The
> > >guest_lid is a VM-level address space, while the guest_cid is a host-level
> > >address space.
> > >
> > >```c
> > >struct virtio_vsock_config {
> > >     __le64 guest_cid;
> > >     __le16 guest_lid; /* previous device_order */
> > >};
> > >```
> > >
> > >With this design, the relationship between the device and the guest_lid
> > >should be set properly before building the guest app and launching the
> > >VM.
> > >
> > >For example, host process 0's guest_lid is 1000, and host process 1's is
> > >2000. Their guest_cid will be determined when the VM started. The device
> > >table should be like this:
> > >
> > >* device0: process=VM   guest_lid=0     guest_cid=0 <default device>
> > >* device1: process=0    guest_lid=1000  guest_cid=x
> > >* device2: process=1    guest_lid=2000  guest_cid=y
> > >
> > >The driver should expose an interface, such as ioctl, receiving a
> > >local_cid. Guest apps can use it to obtain the actual guest_cid.
> >
> > No, please, I don't think adding virtio-specific behaviour in AF_VSOCK
> > is what we want.
> >
> > Let's continue with device_order and see what others say.
> >
> > I think we need to try to get a better understanding of what to do,
> > depending on the direction:
> >
> > - host -> guest: it might make sense multiple devices with different
> >    CIDs, and the host will know which one to use depending on the CID
> >    assigned to the device (e.g. vhost, vhost-user, device in VMM)
> >
> > - guest -> host: again I think we should differentiate the device to use
> >    depending on the destination CID which can be VMADDR_CID_HOST,
> >    VMADDR_CID_HYPERVISOR, or in the case where sibling communication is
> >    supported a CID >= 3, so maybe we should have some features or flags
> >    in the config space to describe destination CID supported for each
> >    device
>
> I don't understand the point of adding a new features/flags. Could you
> explain a bit more?

The idea is to inform the guest which addresses are reachable by the
device, so the guest can easily decide which device to use. I'm
talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
sibling VM (CID >=3).

>
> We have had the guest_cid field in the config space. The guest knows all
> devices present in the VM.

Okay, but how can the guest figure out from this information which
device to use to talk to the hypervisor or an application in the host?

>
> If the app tries to bind a random CID, it will fail since the driver can't
> find the device by the CID.

I'm not talking about the source CID on which to do bind() (which I
honestly don't like), but I'm talking about the destination CID on
which to do connect().

>
> > so that the guest knows which device to use depending on the destination
> > CID.
>
> Yes, this is what I was describing in the previous comment. The message
> will be directed to the device by the destination CID.

Sorry, I don't understand how you do this without having an
information from the device about what addresses it supports. Can you
elaborate a bit?

Thanks,
Stefano

