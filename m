Return-Path: <virtio-comment-return-7828-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7EBCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 04:44:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 315522AC4D
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 04:44:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 104419868CD
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 04:44:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E98C79863D1; Thu, 19 Oct 2023 04:44:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3E849868C3
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 04:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0fwP91f3POaX8-RtG5VNIA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697690690; x=1698295490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkk/ML+jwvLK2JhqEtA98i8TXaNl/CuZJKK8vBp84w4=;
        b=kqxgolSUT2W0MK2yu2QZU/b6xAlK25zfE0n8lNDV87Cmu8v1Q1XSpkSnNvBHfMCD3U
         X7U3YPoKMHdDzI3J2SDHtWKvQ1Tj66j5QTqUQNibDLDB0CJo3FP/BnxYZt6Lx9XJnsBL
         4BEfuHdKgYkcqw86m76qrUgDn/yRmwK8gLDPxtComqqpkszgGHBUrmrZ1KTDoUfrXb4b
         BKCHvFt4eFfrVZe+umTx13fhMwZR68YovYfxH2jnTtTRYGvfZROoCjXdq9NhbOtuudIy
         D6SdGBX9ZjtBpT8cSsoOT00GTboWyQ7gJTkkY27sd9Ka7JAa+qPHIOx9ZDJfeEZMZ3hx
         f4fg==
X-Gm-Message-State: AOJu0YxPA01xIa+2agEBImNc0N8VgO6GdEODKOqdVNOog7oFUcb8q+fg
	nXWMN2zzTh0rlbU6y76pWRQx/IDGIc1GWSVLjRMvbN+EaFeAZDEVyT8YuVMSxX1W3Mibc03Vg0m
	XIXuETqVd0YtxRJ+vrwb5DtJz5s+sCotZsH2C/MXG88q12ImEhw==
X-Received: by 2002:a19:ee14:0:b0:500:7685:83d with SMTP id g20-20020a19ee14000000b005007685083dmr592443lfb.48.1697690690134;
        Wed, 18 Oct 2023 21:44:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpkU3XJx7JcGtASEtoI37KWxjnYjMhFR0OjOGI3R+LTD0lDL97pay3U1UoCSXSHLe5uncv8KUw/ROhdvLs0z0=
X-Received: by 2002:a19:ee14:0:b0:500:7685:83d with SMTP id
 g20-20020a19ee14000000b005007685083dmr592431lfb.48.1697690689788; Wed, 18 Oct
 2023 21:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com> <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Oct 2023 12:44:38 +0800
Message-ID: <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

> > Again, if you don't want to talk about transport virtqueue, that's fine. But let's
> > leave the scalability issue aside as well.
> >
> Registers are related for functionality and scale.
>
> Lets first agree on use case before the design, that I asked above.
>
> I will wait to respond to any other emails until we agree on use case requirements.

There are more than just me who want you to define "passthrough" first
where you refuse to respond.

How could we make any agreement without an accurate the definition of
"passthrough" who is a key to understand each other?

Thanks


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

