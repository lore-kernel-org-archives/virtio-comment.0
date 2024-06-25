Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A618146A69
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302032; cv=none; b=Bm1pITiuSDU6t0hykPEymb95lr55Vpvy7DJm355pBLxHDmYaB9TlOESjefMbLq+qwBSJTrB68zUAPQ1V1lDfY9oECebVbVKxD8yLG77/3uUSZBi0RiEebrHScfLCC8fryaf2risGwQnNp1/iwLprNX3Wb8m5kO9kDNOMzVoTSrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302032; c=relaxed/simple;
	bh=aFHJUN65d6CHQNwNJ5lb2lMQ7iNTzl7XKsG2FDleqKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSSL3lHSZG+9iwB7212dtBTXNX6rBLXzVb9pGCtFUdtnPCItvgWR3HiOInHxRmBK5aBkfDOyF7IxTX5zDcaE8PFDyZ3Bs4Efm0kNBQ+aFVxMGm4zDIOdbNA5ztIRJezVWipkOKm2PWe1msGzWzBtj+yRrg5/XTV2rGShz2tJhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYUx1Qxw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYUx1Qxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719302029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFHJUN65d6CHQNwNJ5lb2lMQ7iNTzl7XKsG2FDleqKM=;
	b=PYUx1Qxwb0CrEECUG8zAeG1WlDU7hI1Oha94NpV/R/6i+rD7zG2/yJ/ZQ6dHOXYLLU95B1
	qRubvE1EvkLCtr0XMSqA60Tz8/B96CenP6n2uJBV6VYqmLC2lQCrRENYUoKXmxop3YM3Er
	Bvp4pGdUlGDo8AuxQ5Iz0+MtjPGCQek=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-pVaeD-MNNb-oyKGCxtsAUQ-1; Tue, 25 Jun 2024 03:53:47 -0400
X-MC-Unique: pVaeD-MNNb-oyKGCxtsAUQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c30144b103so4383982a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 00:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302027; x=1719906827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFHJUN65d6CHQNwNJ5lb2lMQ7iNTzl7XKsG2FDleqKM=;
        b=DDo6UidThdXxnpBEGcUOzFZD06vQl/CVRu9cbU4HXBtmxAOHLbvScl3b2KjHfhoUY5
         QNCNQ7EhXRVe8aEN+8hEJd3+srNTMpdhmC0RhAvIr4GjIUp+Ec6dNUQynlao5fCXNQtS
         tScHdEOMKkwOpo2DX0h3dL9zoSEB+6StdHKI/4dgdKCmldZrmNubdwMj3D/y1z1rMfNy
         C/aBX1SpthtHiG7D4M/J3+h/nM9qAkeZ3lzPzqXHnVJ3mZm76WpLt3WunAnKxbOean7I
         PXk9BrkB1d1ahRc80OkG2vNdCv6tyFlwThVdMweGab6AX6vpNRadMOrjk4GD3MUrzzwE
         rshg==
X-Forwarded-Encrypted: i=1; AJvYcCWxoQ41HZGegdV5woHU97pVGPfptskfA7rz36F1mEu2/5QAiC8RrBL6x8erB+A56OUQLvhY/xtSR+wIbGxYJrMlqt03JADfxeQnElanEmo=
X-Gm-Message-State: AOJu0YzpTJYcgFnu3Q08YmakT2Z3dJyeXlgczDs+zSa37o89WHVWZ2CJ
	36UaF2m+La5FCwHOO+ZZZ5V8DwfbwlwEJ9y585VfWZfWthznp95UfZCrjWffXYOVVT8pv1nk8/X
	SQqpDz4qP4nwSc+NKAi55/EfRcydMdJy3RE4K7Wncec2vsLCthn8d0iGkKZ+K50IplWjNINg/Uc
	6InP69hnVjNE9JbYcCUt7AzFcWXyq23OCfL/sPVzo=
X-Received: by 2002:a17:90b:3548:b0:2c7:9963:cb1c with SMTP id 98e67ed59e1d1-2c8488b8e9cmr9682304a91.0.1719302026903;
        Tue, 25 Jun 2024 00:53:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjcB1npNNeg4Vxfcs3B0nA4lML0Ix4ufVzR0L7yTcwaTogM8sTIAyj7wJZunsbz1drpDo3y50Sp+xsiGuYFSg=
X-Received: by 2002:a17:90b:3548:b0:2c7:9963:cb1c with SMTP id
 98e67ed59e1d1-2c8488b8e9cmr9682268a91.0.1719302026364; Tue, 25 Jun 2024
 00:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com> <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com> <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com> <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org> <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org> <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com> <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com> <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
In-Reply-To: <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Jun 2024 15:53:33 +0800
Message-ID: <CACGkMEvFmh-xq5TWqf16YMPSVkmz1BfKcuR7H9vw1zmouD-kZw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 7:46=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.com> =
wrote:
>
>
>
> On 6/20/2024 8:24 PM, Heng Qi wrote:
> > On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com=
> wrote:
> >>
> >> On 6/20/2024 12:40 AM, Heng Qi wrote:
> >>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.c=
om> wrote:
> >>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
> >>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redha=
t.com> wrote:
> >>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> >>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
> >>>>>>>> How we can we make progress with
> >>>>>>>> the realease but sure we don't make backwards compat a pain?
> >>>>>>>>
> >>>>>>>> Ideas?
> >>>>>>>>
> >>>>>>> There is no functional break with this relaxation.
> >>>>>>> Device set some non-zero defaults and driver didn't modify them..=
..
> >>>>>>> Anything broken? Unlikely.
> >>>> Generally it's inappropriate to leave this decision making to the de=
vice
> >>>> for what would be the best / most performant default config, as the
> >>>> device is generally considered agnostic to the guest load...
> >>> Instead, the performance of the virtual machine and the driver depend=
s heavily
> >>> on how the device is implemented, just as we have proposed various wa=
ys to
> >>> offload the data queue in the device to the hardware. The reason why =
most
> >>> devices use software to simulate ctrlq instead of using hardware offl=
oad is
> >>> that the driver has no requirements for the performance of ctrlq befo=
re, that is,
> >>> the device implementation is responsible for and meets the driver's p=
erformance
> >>> requirements.
> >> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
> >> thought that it was for the debate why we need coalescing on hardware
> >> offload device in the first place, instead of reusing event index or
> >> similar s/w based notification suppression. I don't doubt the value of
> >> coalescing, but how's it relevant to the default value disposition?
> >> Generally the default config disposition is not considered to be part =
of
> >> device implementation, especially when it comes to the situation where
> >> device can't easily figure out the specific workload to occur in the
> >> guest, and there's no perfect single default value that could meet eve=
ry
> >> single performance metric across the board. This is a typical tuning
> >> knob left up to the user to adjust, why the device or driver needs to
> >> set or load the initial value? The driver just needs to start with
> >> certain value, be it 0 or non-zero, which guest user can override at a=
ny
> >> point of time, depending on his/her need, and that's it! I guess I sti=
ll
> >> don't understand your user case here, why device / driver default is o=
f
> >> such importance.
> > I've explained that, and I understand your argument is why default valu=
e is needed,
> > and users should be able to adjust them, right?
> Sounds about right. You'll soon realize that there's no perfect default
> that could work with everyone - in that it's just a static value to
> begin with, no matter whatever initial value the device comes up with,
> one user or another will come over to you and complain that what is
> loaded from the device doesn't match the workload they have, so those
> users are still expected to adjust manually tweaking for their own. As
> long as it's a tunable that guest user can control and override anytime,
> I don't feel it too much different what initial config the device would
> start with.

Think hard of these, I think there's probably no conflict between the
points of each.

Generally, it's very hard to have a default value for virtio-net moderation=
 as

1) various implementations of virtio-net
2) various setups of virtio-net (from virtual to physical, from 1G to 100G)
3) various kind of workloads

But it doesn't mean the device can not have something by default which
the vendor thinks it works well for in most cases. And anyhow the
value could be overridden by the driver if it wants (e.g several Linux
networking drivers will try to set a good default moderation value
during probe).

Thanks

