Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C152313DBB6
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432246; cv=none; b=llaGvqcU171GM667jAsWJXluEkhs2DWVVQ2J6iLTQRqb8ghtfTNxTxtJMQo4RBR+5VWczlqDZkqvR1UuEElM/bVRpMl1eP05bAfF8CzOD+vgMzMbLlQomqVk2WRU7Q6l2Gl7ttV+PS3bIGuXEKhAjiIBlIImAegy97ipTGPXync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432246; c=relaxed/simple;
	bh=VE8bErn8JcM/iJheIjBvwcvEVqMHU1LOVzf8Lu9AVo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwoEgL/mmkEK0c/6jmcsbpdTQelgNF2yjteQ43FO9bOC/bM5QuI9JCjZkJvJfKpnXnIUwVKgilRf8BEkibb+l0v2NgUT8LhoioOGiGG/QcnqKDCjj6B4nS0jFczdst+ZldS79uCkrjdmZM7nYQfQwgEkT1wIAKNVK9H2AvGNpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fat6GygS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fat6GygS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725432241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7bp7+4isR02MODOqY6MYW0dLCaeNnA3gVN1GWaRAUs=;
	b=Fat6GygShXcJYW1FYyZXmhqfw38aRed0DlKaz9HY3UH5h9eFDvrL8NZiTnCgUfFRQVgt8d
	MvAv4Fhh3AeDQcxoShlkjPEWtVcRHiE96m4vYI1IVmn7IhE71YZtrPXaI74Mn18acxNWv3
	T5A6XmW8aR/TYszUNLSrpVuid6V/ZGY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-_rgux-rlN6mx2MJvOBPMjQ-1; Wed, 04 Sep 2024 02:31:34 -0400
X-MC-Unique: _rgux-rlN6mx2MJvOBPMjQ-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7174080fb23so4054917b3a.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 23:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725431473; x=1726036273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7bp7+4isR02MODOqY6MYW0dLCaeNnA3gVN1GWaRAUs=;
        b=sStLuMZD8igZ6iUJttpWgVoQ5XMcMzolShxs4onF9roqKA/rI5OtaNfEZVcRtr82wM
         CkI2orpqcFrrZJrwvmFo3kxk8zzb1R31K+296ltXWx875X3k4/IBzRmMHqlRufR+K8Iy
         8dkyIJDuVv11X5okOed4b08L3qLQRpRL2VlFFYBcEnUPSS4vPcxguRkf6fwfA/G80EJS
         GVSDg2fJ75HPBBaWGJUsGhmtrMv1jgBmKWQxblTnnle1ZuSlOayNNpL5wKi2/7/edFTq
         wHNp8ud0blOk9Eqzylu2ATz34lBEqOGquPV1uSl3Ba4cqdaGrqp9vlALKM2+FTzn/QSI
         OvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7wwkn+E0wYjsUbGMNjWTjCVMT0XtEh0wjLhysgcf/AqpddnU2Nj4Biyz0QH9e2UpaCE1aILG+n7DFDpa5jg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4B7TVxW4uumb7Qz093r5D2LcmpVaQWn7iPD8Fynchycb5ERED
	5/wyXF315HL/dJEe0ZgerMywXWh8F6HdeW0v5VdBqJU3W+dftTypISv4sixHg/Gk8ocQqHvljfm
	+f5zZaTrGAlJL4fO9Fv2yvZAI4uMRELNAvNbGJg7qf9mStIgoRw9e6054j3NMCiHVwr9FYejWkI
	2d50lRgHsVsgB3MbuBsm4YqVU6tzUeaHx4V5eBsLtj1z0riLHBqA==
X-Received: by 2002:a05:6a20:cd91:b0:1ce:cce2:f16d with SMTP id adf61e73a8af0-1ced04bef2emr11336949637.31.1725431473004;
        Tue, 03 Sep 2024 23:31:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/IS8LEmIXD7DQef8OP+nqvEVBB1iEaP9fN0x5fFdFX8vC1MxCkmxzmVVzsoyiIvOpqZODAQFXe3DWw1gwzEQ=
X-Received: by 2002:a05:6a20:cd91:b0:1ce:cce2:f16d with SMTP id
 adf61e73a8af0-1ced04bef2emr11336931637.31.1725431472489; Tue, 03 Sep 2024
 23:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com> <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com> <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com> <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org> <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com> <20240903235727-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240903235727-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Sep 2024 14:31:01 +0800
Message-ID: <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@amd.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	David Stevens <stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 12:03=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> > On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > > > >
> > > > > > But I don't like it that looking at the registers, one does not=
 know the device
> > > > > > state. Hidden state is bad for debuggability.
> > > > > > We have 4 states:
> > > > > > suspending->suspended->resuming->resumed
> > > > > > so we need a register with at least 2 bits.
> > > > > >
> > > > > > we could steal 2 bits from status but it seems a bit much.
> > > > > >
> > > > > This is why letting the status tell the status and control regist=
er to control thing is elegant.
> > > >
> > > >
> > > > No argument here.
> > >
> > > Or, to be more precise, our status is driver status.
> >
> > It looks like the device actually otherwise there's no need for
> > re-read or poll for things like reset and others.
>
> The need is there for complex device state transitions, which
> can not reasonably block a read response.
> Another standard approach with PCI is to specify the time
> transitions can take. I consider that less elegant -
> is this what you are advocating? The advantage is that
> driver does not load the pci bus with constant re-polling.
> The disadvantage is that it is hard to pick a universal
> number.  A combination of these approaches might work,
> e.g. a recommended timeout then poll.

We've already had msleep() for vp_reset(), anyhow we can increase the
sleep time, if it can overload the pci:

        while (vp_modern_get_status(mdev))
                msleep(1);

We can do the same for suspending.

The main blocker for timeout is that it may break migration and
complicate the hardening. Another proposal in the past is to have a
notification.

But what I don't understand here is that suspend/resume should be
lighter than reset. If we can afford a reset, so did the
suspending/resume. If we want to have something new, that's fine but
it should be orthogonal to a specific new status bit?

>
> > Anyhow driver know
> > its own status.
> >
> > Thanks
>
> indeed, the status register is there to inform the device about
> the driver status.
>
>
>
> > > If we need
> > > to reflect and control device status, we need something else.
> > >
>

Thanks

