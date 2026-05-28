Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653F32B13B
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953003; cv=none; b=p6WMexDg40FfVilD2mp0k+HT7Krn60CmwZMdUZ4/7+LY149qyBgZyYh6aUEQ3PzO+YX/+jLtKzK0WjcgKjqz/nskKTa+5ZNsKTaUSusUJ29fsVSCNK16ZJ4FhMseVLmpMXPBioatl8DEacBJkgZ6Dcl2MUtdNPcnQHIJEivde4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953003; c=relaxed/simple;
	bh=5KQ1lFfdhc1Ozpb4bERu9fceA22UEL5EtxVFLrZ9nbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eLf62boq5Lmu+tSSMivxhXmMZxl1QZ+jxkeOO6V52cnHM7Bvju8OpIUmvaNdGDpfS7cqXvkEW/n11FUQ3NajFJkoX6x3+45T53Eq5mMhVcfXENAkjU2sYIVRy5zT3xndeNNVT21KgVw0JnerWPJDy5Y8aushYlxy41LwGBQxpnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MLafNreV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MLafNreV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779952997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qb8qbxfX9vZbaQ6sxiJTlXxEBO77xAazHgGBb6lwHg4=;
	b=MLafNreVObWQ4MiBhnsFyusVmevbgaFlHj+VSPfEVrOCdibgwWRXQMiTeC0M/h3IwGn2Qe
	O8gEEjVJp2N3CA4rwn7XFwXQk4rBoxEoSJ+uD85WsW4nV9ZHo9ez+fcvDK3DZgegpJEmBs
	5J+unf2A5l9gTTvEvf2wQyfqNlFUVEM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-ilfQPNZ1OKWg6i-vM88tnw-1; Thu, 28 May 2026 03:23:15 -0400
X-MC-Unique: ilfQPNZ1OKWg6i-vM88tnw-1
X-Mimecast-MFC-AGG-ID: ilfQPNZ1OKWg6i-vM88tnw_1779952994
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49048e21ea7so30618175e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 00:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952994; x=1780557794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qb8qbxfX9vZbaQ6sxiJTlXxEBO77xAazHgGBb6lwHg4=;
        b=m9ThdQ/cjKfIObOx7cyfh0GmK6SLS9+QeoUy5Mt+kFldbEGjbuwcKBbTT+/7TBK7l/
         5s9drj+5OLcqgbcB0MD8dFUP+pSD6C5LJjFwaejJje4Gu66QKCrXSFCLGKx9kRiYd9Bj
         KEhenKfkvajYkK+hGuIzi7wCRqN4amofE5mwGyMmgbmWXwXM9nEPD46SxsyXd5BbL029
         TG+007z4vzjA4ic+yLWdCq4iOYp8U6UHe4F6VP3JlJpQFsIDtDlUmszU1wD7tM81CyhN
         NAUQ4k8wjmaZO6aBrSGNvjFmS7GsERsnTQv+cx6BmSW7R38cQxGiY7DPImxGXyA4KeYr
         FRYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mBAQIYftKP61vXA0q1JFVrMpVCq91RfB/mi5+7ogFUgf7wzjEMsK9o6dbFBzhyGfKgeyRSwzJu365ZDrvag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUMzBOJ/w/SHVDE6FD2zZgR/sY0Mp7pKX/h3xzKmJxi6fpx5nn
	5GTUhGavzTRJgViDBAlfQuL7ZbAIhMqDIUEGhM0m5s+cZOs+6BxjlbvTLuS2F2DrHAGu5TeSIa8
	gvobtU5picsohV6u7lwlKB7oVa9IqtnFMixyiup6st8iBnmC/UC7UmUnzcY0cle+En3z7Y0zeZ8
	j/
X-Gm-Gg: Acq92OGmJ8wXhVow1bCyi7iYNP5NiXHHCT2Gu/p2U2tVzswBxbCkUcSSJVlTHVipQRM
	vk1cnT0EGYMQVEGfz73QyWJqt05PZnsBmEUIHhRVl9hlb+1/h6aWEX1VZioqY8sQhkHbftzEVJW
	cMgbeARnPEsCd8QosWz0eaMVSCs1yUM5zxoJ4vKa2U9mffVAtMEpYLksGBLRplJHeUEY4QWlKaE
	kNVjWAQDeAlSw6l1Wf8+WBPBcdyDXwW6ICrxySI73IedSA7hEWCtBWifQLUhzLWo/BEkHzohmd8
	zmaj1l5eW5iiYKKHs6cDNY5os6Ia26K+aAzzkUtHI0k0D/HSNjTu+tKaIMP4Tu/V9PX5pa40GJD
	S6h1bclrCuxzb0StFC87wa6s=
X-Received: by 2002:a05:600c:870b:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490947ae0bdmr6147955e9.11.1779952994196;
        Thu, 28 May 2026 00:23:14 -0700 (PDT)
X-Received: by 2002:a05:600c:870b:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490947ae0bdmr6147605e9.11.1779952993731;
        Thu, 28 May 2026 00:23:13 -0700 (PDT)
Received: from redhat.com ([46.210.234.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b427d71sm16182025e9.0.2026.05.28.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:23:12 -0700 (PDT)
Date: Thu, 28 May 2026 03:23:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: MSI-X vector limits and reserving a virtio device ID
Message-ID: <20260528032227-mutt-send-email-mst@kernel.org>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <0f70bfea-3344-405e-bb69-c36ab8c353bc@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0f70bfea-3344-405e-bb69-c36ab8c353bc@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qOTtkS7w3hy-54VfoeZoe4Xia20VxFHRgSavN4IQvZ0_1779952994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 28, 2026 at 03:03:00AM -0400, Demi Marie Obenour wrote:
> On 5/28/26 01:22, Parav Pandit wrote:
> > 
> >> From: Demi Marie Obenour <demiobenour@gmail.com>
> >> Sent: 28 May 2026 05:23 AM
> >> To: virtio-comment@lists.linux.dev
> >> Subject: MSI-X vector limits and reserving a virtio device ID
> >>
> >> I'd like to reserve a virtio device ID for virtio vhost-guest,
> >> formally virtio vhost-user.  Would this be possible?
> >>
> > Vhost user is an implementation of the device.
> > I believe it stays as implementation and not a new device type.
> 
> Virtio vhost-user is a device used to implement a vhost-user device
> from another VM.
> 
> >> Also, I'd like to know which systems have a small limit on the number
> >> of MSI-X vectors.  
> > I didn’t follow the question. Typically, Intel cpu has a limit of 256 vectors per core.
> > 
> >> The vhost-guest device uses lots of MSI-X vectors.
> >> Typical implementations will use 256 * 3 + 7 = 775 of them!  That can,
> >> of course, be reduced by sharing vectors, but this is undesirable
> >> as it comes at a performance cost.
> > Did you get a chance to measure the performance, for which device type?
> > Interrupts are generally moderated.
> > In other devices (scalable functions of mlx5) I have measured perf of 8 to 16 queues sharing a vectors has < 4% perf drop.
> 
> I'm more concerned with whether it is a problem to assume that
> 775 MSI-X interrupts can be exposed by a virtual device.

Why not? But many hosts will have to share them.


> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





