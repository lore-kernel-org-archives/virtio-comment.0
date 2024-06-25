Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F30145FE8
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303241; cv=none; b=nUl8El2bNQDLKJ8687q9rzwafmoeKbuwHKiHvJWEiQzBpsHFPZn68wkiSQWLR973OjLoQUl0bpGNS1Dnun+pP5aNZDSOrkatGFlnGOZ6DY+56tNVVRcW8EMrkRwSmyhJVSefFFX2P06H5e9/CRFhItI0Bp7Vlkjuwm1bAk3R7Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303241; c=relaxed/simple;
	bh=KFWpqEzqlBJ0ku7dylqmJOsh9y55+9IVa5ZX0Qtttu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPC81j4b12zteB3+Ex7xc9B7T2Bc8+UsrEDOzfLSlnIT0Km80T3yHpcQKRVpzm2IRNZWaaYiIPa5aPcrPtwHIlVGPrbX979hiwoUKtO5cWPw3MdC58g/ptbRl1ulV3rdSDlFpadKA2tbIa2AHB/AO5cpyo6Gh+aGpuap1+nK9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAc840Pk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAc840Pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719303239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFWpqEzqlBJ0ku7dylqmJOsh9y55+9IVa5ZX0Qtttu8=;
	b=iAc840PkteQDgVX6aL5II99Z9cdTuxTCVkg8e/jQxW+FHtRYhwF7FDzKk3y2/L7kZ7kTTX
	+eCoeJCz8ZRdmpCa/dukDz3gg4Xyl4Omll7mki1lFeHvB/QAikHuNgNuJcPsoLYB0fJanL
	RrASN2tQgJOsKbEPlo1FPcSmDqtKRlU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-yM80AZEmOd2F0lQf-gr5WA-1; Tue, 25 Jun 2024 04:13:57 -0400
X-MC-Unique: yM80AZEmOd2F0lQf-gr5WA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c7ef1fcf68so5956162a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303237; x=1719908037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFWpqEzqlBJ0ku7dylqmJOsh9y55+9IVa5ZX0Qtttu8=;
        b=CPoZP2htW3xw3IlEGFteHfKerGUDFn5DSh4EKY2y4gZlMMxK/vowOUqUraI6lF8PnE
         TRhRIltSOdqqBA/wD1Hw8ZPq85ph9FD3S+ezdhfTJPEYhBsaL7AJvJyYgSBz/r7UhTeo
         nzfwu5mziwNpadpd9BUNIQCz6lBgLTMbOiWDU1yjHqENv14YZoKCTcK7MuYnixXY67N0
         NSDL4Tc9+6mkf6613sr9m2BqK2KkB+uhkonQEs7Zn2zAdx1FpxDygyo75iDqQ4T1LzIs
         LMGaXHWf91AGQynoko7Tj9+toXLUBR4KRxLeZaNdBeOiVNUPovLrIIdXm0QclO954u5G
         E3uA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Gg+/hQipkvetp4XLq1AZHFwknn0wqckeUScVH2p7PmEgnyZa0AjQuPq2x70YV1QY0OnooAd3icSOGBf4qXaIn525M7U+l+LvHxT2sSk=
X-Gm-Message-State: AOJu0YyOlK3G+BODvCveSvJvf6M5bPhf3l6/aS255zusoHv49CSiJmwt
	C0V0nLXrACB/f8z/+9mUZivNb5vDwrG8Xrjg/CmeCXrPlJeDGFJJJ6+YMFDB57iGtjxcgJ/U8dy
	LFHmwpZzdtSs8FRI4V6X17lB4n7iHAeieuxKPC8hEDwZ6Atjd59DA53Dir3cNTw0F0LbNIpn6fU
	qEhZMCNwmps4C+gdbCbcqaV9RBZCyeKRwX0vMLXO8=
X-Received: by 2002:a17:90b:3ec3:b0:2c2:d163:d761 with SMTP id 98e67ed59e1d1-2c85067faa2mr5088481a91.47.1719303236661;
        Tue, 25 Jun 2024 01:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgGBPEsw949MXtG72d1qiz3s/xpJb51LRgU5yCQRbZLTpz08geM9bdL/cCZdSVTtkV2ch/syuHVBfYbn7VkH4=
X-Received: by 2002:a17:90b:3ec3:b0:2c2:d163:d761 with SMTP id
 98e67ed59e1d1-2c85067faa2mr5088462a91.47.1719303236133; Tue, 25 Jun 2024
 01:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org> <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com> <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com> <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com> <CACGkMEvFmh-xq5TWqf16YMPSVkmz1BfKcuR7H9vw1zmouD-kZw@mail.gmail.com>
 <20240625040500-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240625040500-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Jun 2024 16:13:44 +0800
Message-ID: <CACGkMEu2ziqC+Byv=XBYmeuxjUSQdyq45SFEuQmSYBTU18+v5w@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 4:06=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jun 25, 2024 at 03:53:33PM +0800, Jason Wang wrote:
> > On Sat, Jun 22, 2024 at 7:46=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.c=
om> wrote:
> > >
> > >
> > >
> > > On 6/20/2024 8:24 PM, Heng Qi wrote:
> > > > On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle=
.com> wrote:
> > > >>
> > > >> On 6/20/2024 12:40 AM, Heng Qi wrote:
> > > >>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@orac=
le.com> wrote:
> > > >>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
> > > >>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@r=
edhat.com> wrote:
> > > >>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> > > >>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> > > >>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
> > > >>>>>>>> How we can we make progress with
> > > >>>>>>>> the realease but sure we don't make backwards compat a pain?
> > > >>>>>>>>
> > > >>>>>>>> Ideas?
> > > >>>>>>>>
> > > >>>>>>> There is no functional break with this relaxation.
> > > >>>>>>> Device set some non-zero defaults and driver didn't modify th=
em....
> > > >>>>>>> Anything broken? Unlikely.
> > > >>>> Generally it's inappropriate to leave this decision making to th=
e device
> > > >>>> for what would be the best / most performant default config, as =
the
> > > >>>> device is generally considered agnostic to the guest load...
> > > >>> Instead, the performance of the virtual machine and the driver de=
pends heavily
> > > >>> on how the device is implemented, just as we have proposed variou=
s ways to
> > > >>> offload the data queue in the device to the hardware. The reason =
why most
> > > >>> devices use software to simulate ctrlq instead of using hardware =
offload is
> > > >>> that the driver has no requirements for the performance of ctrlq =
before, that is,
> > > >>> the device implementation is responsible for and meets the driver=
's performance
> > > >>> requirements.
> > > >> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
> > > >> thought that it was for the debate why we need coalescing on hardw=
are
> > > >> offload device in the first place, instead of reusing event index =
or
> > > >> similar s/w based notification suppression. I don't doubt the valu=
e of
> > > >> coalescing, but how's it relevant to the default value disposition=
?
> > > >> Generally the default config disposition is not considered to be p=
art of
> > > >> device implementation, especially when it comes to the situation w=
here
> > > >> device can't easily figure out the specific workload to occur in t=
he
> > > >> guest, and there's no perfect single default value that could meet=
 every
> > > >> single performance metric across the board. This is a typical tuni=
ng
> > > >> knob left up to the user to adjust, why the device or driver needs=
 to
> > > >> set or load the initial value? The driver just needs to start with
> > > >> certain value, be it 0 or non-zero, which guest user can override =
at any
> > > >> point of time, depending on his/her need, and that's it! I guess I=
 still
> > > >> don't understand your user case here, why device / driver default =
is of
> > > >> such importance.
> > > > I've explained that, and I understand your argument is why default =
value is needed,
> > > > and users should be able to adjust them, right?
> > > Sounds about right. You'll soon realize that there's no perfect defau=
lt
> > > that could work with everyone - in that it's just a static value to
> > > begin with, no matter whatever initial value the device comes up with=
,
> > > one user or another will come over to you and complain that what is
> > > loaded from the device doesn't match the workload they have, so those
> > > users are still expected to adjust manually tweaking for their own. A=
s
> > > long as it's a tunable that guest user can control and override anyti=
me,
> > > I don't feel it too much different what initial config the device wou=
ld
> > > start with.
> >
> > Think hard of these, I think there's probably no conflict between the
> > points of each.
> >
> > Generally, it's very hard to have a default value for virtio-net modera=
tion as
> >
> > 1) various implementations of virtio-net
> > 2) various setups of virtio-net (from virtual to physical, from 1G to 1=
00G)
> > 3) various kind of workloads
> >
> > But it doesn't mean the device can not have something by default which
> > the vendor thinks it works well for in most cases. And anyhow the
> > value could be overridden by the driver if it wants (e.g several Linux
> > networking drivers will try to set a good default moderation value
> > during probe).
> >
> > Thanks
>
> Do we want to just burn a feature bit on this then?

It might be more safe to do that.

> I also think we need to have a way to reset to that
> default value. Maybe setting #packets to 0 should do that?

Or a dedicated command.

Thanks

>
>
> --
> MST
>

