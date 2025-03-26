Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715019F495
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742985420; cv=none; b=fVnluAlR6jHzDICKh6F4GqdkjyU6ySVEekwV48mljKRg/ToqRK/PvH0OPTT31g4zilIvYDkf4sJFMKAzPu0xN5kkL+LlF4WelK72gjYlV1LtRXiR+vw4uUdrIM03lyHIp6ABoQFtTxTKLBtj4u3/zfHWbp0vWU3EMDZFM4ER93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742985420; c=relaxed/simple;
	bh=TzcYC5BYVgTcSVZptO3dDmcDhVrJbKZUz+IN7UKbp3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Neap6CWG8b3PUaX+ukKz6xun01kFWtPv8EMBwmPzMdVwbX4PGQIcBMaiiEaDctUu70JKB0DGNAuEsXhnx4VmFKnsnfvD0jevtahGE9QBJe2O2RawC14l92I592cXj9zvz8UNXWPgy2Yu6XMHmbgM2idkF8aH81oWriDmoKGLxQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igr4Jh8B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igr4Jh8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742985417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzcYC5BYVgTcSVZptO3dDmcDhVrJbKZUz+IN7UKbp3s=;
	b=igr4Jh8BEKTLY29qc3s3ryJl8OQpCIP3T5htufpgIak1ivlh9vTCg9AxYRGd/mQJuoxwMi
	L7PZxXvYlaGoRPDs0/WGpXyHCskt58n6pOswxzHuSyT2IRe7k5a5PIjH03kdwyraMmREhh
	4S9/86NoSpfAxu0F1Lm7yw0F5YuIMK0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-VZhMEvEiPeGxJaOejRRVYA-1; Wed, 26 Mar 2025 06:36:53 -0400
X-MC-Unique: VZhMEvEiPeGxJaOejRRVYA-1
X-Mimecast-MFC-AGG-ID: VZhMEvEiPeGxJaOejRRVYA_1742985413
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e634a124439so9339398276.2
        for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 03:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742985413; x=1743590213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzcYC5BYVgTcSVZptO3dDmcDhVrJbKZUz+IN7UKbp3s=;
        b=F1c1evsFrn2oroGOGaU9C4Hb4ERPv42wGHT48LdmFZ9Ms5IwEtHw9dN6bLZqWvNFJB
         ZxnYqUVF+pen4uOe2jeZbMxzD7FvpXmxdk3UHL2LDhyMWjVCS/sUr6i4rSAqe8CyrZJ9
         lsNsvx77hIxhRgXwpZ6oecc7kXkz8muEngiSKDU4nTG/QyYTv/mdtwEbBpIZBT5Fh+Ul
         CKxwdlqStG1Hvcl01zpv0BdUCf6FEspwI970pzaGCzqF+dRXmDm951IKrtm/MGYghL4W
         Bk62mnGJRuX4TFI3XJLtdWbrLTongpF1iglQZvyWu6Ma6w8+SAnWMtvOjmA2vPGWlggf
         DZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ad+gT6bsHABYjx1bhZDIms9DwGolwb3Lk4fAbLLgqXJcyEhtcKpfgB1frOzkd3VE6uk/coG6OZbHVkytKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLQdWvzYSCSmyzj0NkECVpHymuohVlUBz1lA1mDcn/9WLKfu2y
	CIfca4MizAfYfaqtGkhBS/e/GB2y/zIPmsn5oabsNlj+1fYETF6CWbv2Jylg55El9rJZlEhdAib
	auahte8e/lLNVn0PjpAhsUpnS5XwHFHbGGsGqnZ/NCYci763ZvLdyZyGOVZrjgmPB4/Mi1UIbwl
	V8woUSbIIJExbakJCIKJVp6LLfB6L7nr3IKtP2/SQ=
X-Gm-Gg: ASbGnctWMyqI6GVBLtDDso6HR7xAKlNKZUXC5NK7zKkSftCzsC4yDv4AYvTD/Vhhj40
	1UJAKiNFewtsfI4Z4Y/UIOcFu+/Yz3ldugy4TrbHQVmAOn944Kmii86jvkqya7X4oHrLkKA==
X-Received: by 2002:a05:6902:220d:b0:e63:d632:6139 with SMTP id 3f1490d57ef6-e66a4d2df50mr24363331276.5.1742985413188;
        Wed, 26 Mar 2025 03:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKL0gek8SWfAZ9mEgX2JbS89omYTZoPKLLTvI9x6VdJyAmbOUyBmnLR/Eag2ulArrAlUlgAuUWb68q3zFPXos=
X-Received: by 2002:a05:6902:220d:b0:e63:d632:6139 with SMTP id
 3f1490d57ef6-e66a4d2df50mr24363305276.5.1742985412685; Wed, 26 Mar 2025
 03:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7o7pkrmbwp6zyybgqqliybesezk2zpnopwwgzlbfpnw2m7relz@mxyhzve6lote>
 <20250326100031.2197645-1-niuxuewei.nxw@antgroup.com> <fiqrmwvxg36dljg6krolmxbjquazjbnu7vwg2savfk7y4pn7en@ejvem5zwoydz>
In-Reply-To: <fiqrmwvxg36dljg6krolmxbjquazjbnu7vwg2savfk7y4pn7en@ejvem5zwoydz>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 26 Mar 2025 11:36:41 +0100
X-Gm-Features: AQ5f1JqTvKlY8W1im_JU_q84RA57LrRRplZ6QWBnRVerzgB-nKr1jfMBqIvrvks
Message-ID: <CAGxU2F5haeggJjW0Y+BF=A4jXpOy-yOa-ZY_Y=F-rErbFLskTQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M4iplWn7LpfqYnRB1CizJPicZQOlhRJj2xp6iSnmR6I_1742985413
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
> On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
> >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
> >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
> >> >> >This patch brings a new feature, called "multi devices", to the virtio
> >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> >> >> >"device_order" field to the config for the virtio vsock.
> >> >> >
> >> >> >== Motivition ==
> >> >> >
> >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
> >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
> >> >> >in the inability to enable more than one backend. For instance, two devices
> >> >> >are required: one to transfer data to the VMM via virtio-vsock,
> >> >>
> >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
> >> >> communicate with the hypervisor, but in virtio-vsock we never supported
> >> >> it. Could this be the use case?
> >> >>
> >> >> We could in this way add a new feature for those devices that
> >> >> communicate only with the VMM, where the CID of the VM is quite useless.
> >> >> So instead of having multiple CIDs per VM, we could continue to have a
> >> >> single CID, but the transport could support 2 devices, one to
> >> >> communicate with the VMM (CID = 0) and one to communicate with the host
> >> >> apps (CID = 2).
> >> >>
> >> >> Maybe this is orthogonal to this proposal, though, because it might
> >> >> still make sense to have multiple vsock devices, even though it's not
> >> >> very clear to me.
> >> >
> >> >In terms of the current situation, two devices are enough.
> >> >
> >> >We are the team of Kata Containers, so we are focusing on cloud-native
> >> >computing. What I mentioned below might be beyond the scope of the virtio
> >> >spec, just for your reference.
> >> >
> >> >The background is that the architecture of proxy mesh has been evolved over
> >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
> >> >
> >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
> >> >both host and guest network stacks. It is possible to establish a fast path
> >> >between the pod and the proxy.
> >> >
> >> >When we have multiple networks, it is intuitive to have multiple NICs. So
> >> >does vsock.
> >>
> >> Be careful though, we don't want to complicate vsock to become like a
> >> NIC.
> >>
> >> >
> >> >When multiple networks are availble, it means that it is possible to have
> >> >multiple proxies(i.e. user processes). In this case, two devices are not
> >> >enough. This feature makes vsock more flexible and scalable.
> >>
> >> This is a good point, but I really don't understand why a VM should have
> >> multiple CIDs assigned.
> >
> >I think priority is not the biggest issue here. So let us focus on how to
> >route the connection to the right device among more than two devices.
>
> That's why I was recommending a different approach. IMO the user should
> not do this, but that should be transparent, hidden in the driver.
>
> By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
> be sent to the VMM, then we have to use the device that supports it.
> Whereas if the user connects to VMADDR_CID_HOST we have to use the other
> device.
>
> The user doesn't have to do anything, only use the right destination CID
> if it wants to talk to the VMM or another host process.

Obviously, if we want to support more than 2 devices, we need this
that you are proposing. But IMO we need also to support
VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
bind() on a random CID if one of the two devices only talks to the
VMM.

Because, again, how does the user know which CID to bind?

>
> >
> >Our solution uses CID as device identification. From the users'
> >perspective, they can direct the connection to the appropriate device by
> >specifying a CID in either the `connect` or `bind` syscall.
>
> How does the user know which device/CID to bind if it wants to talk with
> the VMM or with the application?
>
> >
> >Assigning one CID to a VM looks good to me. But I am not sure how to
> >distinguish the devices. For example, should we expose a ioctl or a
> >sockopt?
>
> Nope, just simply use the right destination CID in the connect()
> (VMADDR_CID_HYPERVISOR or VMADDR_CID_HOST), without doing any bind().
>
> For receiving, the user can check the source CID after connection and
> decide to discard connections from VMADDR_CID_HYPERVISOR or
> VMADDR_CID_HOST depending of the service.
>
> Thanks,
> Stefano
>

