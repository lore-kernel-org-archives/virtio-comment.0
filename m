Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9B14A15
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725419269; cv=none; b=oLhwUror+W6WVQ4zdLDmUi5hbiJbz2VFqxBa7ccawbLRgAW0FXTh0A+dgdV4odl1WxMWc2/sg4KU9NhZRVIp9jPmHg9chbHxnzyVFBiMoC/CXaRXdxIQLgFNwiJrSg62pSjgCNI0jOW+kor3HR2zhlZVLR7cjRrmtEq7W1NQin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725419269; c=relaxed/simple;
	bh=nsyQNkqvSkgvMGl/mD7Kgg6uqACKQLI9tMm4a1aMoaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHVEy5qxhOxmLrDsDQt/c3vWf3CFHvo7jAebjhZoh9p3EOCvJaomnpYbE5BBBnSGfjJS6qFzCDdpTcnxRQF9mcV2C/xx4qvpNFKkdg/nP+lQ1mOI74tYhKPL8gLxHol0txellPKV3qkQHqdyUgOlUhxtYkDUT53OSDwvmYXsIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4emp/9U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4emp/9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725419266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsyQNkqvSkgvMGl/mD7Kgg6uqACKQLI9tMm4a1aMoaE=;
	b=c4emp/9Us3QKm9LSEXF2h2foHM36p/QBdJaDgn6qHzrpPxpN/iV34lfZzE5fH79O98MoAG
	hUx1eWVftOB9Uk+ofaL1lWrPSvW2yb2yIeMAfgMFhNXS2tJCgFgLpPbBDeWnxQFBca97Bc
	Nj/A3jo5109y3Pc6TFtGwDx9SX6a8qk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-giOef9aVMVmBdIjb3j0e5A-1; Tue, 03 Sep 2024 23:07:45 -0400
X-MC-Unique: giOef9aVMVmBdIjb3j0e5A-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7143fa4e589so5129750b3a.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 20:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725419257; x=1726024057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsyQNkqvSkgvMGl/mD7Kgg6uqACKQLI9tMm4a1aMoaE=;
        b=ME7pfHCK6BDRYwvV1yavDVDAfUGlJfklwmA2Wx2grr8ziYeDIv8f5uy6o2IFsRtYcD
         +ctm0OkdMcmORiQMzYFIRnDQyMpE9iz1J6WOZQvr9PtQcLf536q/tpZ0ZUQ567IAhsAU
         UXLi8nr6yOvYCvh7GpBGbZlB6QhSIF7ACqOV7hfsXlfuKKxZ7AtR9+rysKE27OuatDSX
         Xc5hZzEnJeCe7qUu6N7woHg3VEra/prJXGCrPiOGdijp4/szLUUISSlv0z+nBaOweYM6
         68RQj92UrUvIM4wbomIw2iJr08czfNeRw8ZzN06+sYOISAD5/bLafriD8r3tWqmSor9e
         zz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmp79M4F+7iAr32JVChvbUi5L8RuGl95AGugUqbO/oULiaivWWq3Wdlep+FzTrYPGV6velSmtgemWwZZEW8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI4o0TNNS+C5moGLZ/kfTF3R65zkHd1VaD51cmwS8NYkYhO9ox
	uFXwYm6+j6F+ugDd3M9DdQU4B0bkdk7/eXxEv3lTdwu/hthoEU7uWcRrZRIRI3Ft6N72pI6Petw
	AMCx2pRt1b6WYa6cWTE0nHYZa9l613LhfShPbkjZv2kMb2iMczcj++T6t2MPpIWUHG3h2kf7ExU
	hY3IPJdf7GrOPTdeiD15wE3O/t/0dpPk+XrTJ0DL9sGglrP6XAvw==
X-Received: by 2002:a05:6a21:10f:b0:1ca:e446:c16d with SMTP id adf61e73a8af0-1ced0468c94mr12149602637.16.1725419257680;
        Tue, 03 Sep 2024 20:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaDy4g1IRc+O2Yb1t3yfJm92RYZKhHDk6PO7JDSGFR/4nfHGtBLvaoKZ1wsCAO0jxveqZhNY9bFP3aTWVZSgQ=
X-Received: by 2002:a05:6a21:10f:b0:1ca:e446:c16d with SMTP id
 adf61e73a8af0-1ced0468c94mr12149586637.16.1725419257139; Tue, 03 Sep 2024
 20:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com> <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com> <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com> <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com> <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org> <20240903063625-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240903063625-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Sep 2024 11:07:25 +0800
Message-ID: <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
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

On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > >
> > > > But I don't like it that looking at the registers, one does not kno=
w the device
> > > > state. Hidden state is bad for debuggability.
> > > > We have 4 states:
> > > > suspending->suspended->resuming->resumed
> > > > so we need a register with at least 2 bits.
> > > >
> > > > we could steal 2 bits from status but it seems a bit much.
> > > >
> > > This is why letting the status tell the status and control register t=
o control thing is elegant.
> >
> >
> > No argument here.
>
> Or, to be more precise, our status is driver status.

It looks like the device actually otherwise there's no need for
re-read or poll for things like reset and others. Anyhow driver know
its own status.

Thanks

> If we need
> to reflect and control device status, we need something else.
>

