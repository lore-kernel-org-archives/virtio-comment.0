Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB81B29D2
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725580286; cv=none; b=ZZoTpEUsjqkCqKJqBkGnK88WYt+JpA1ArckwGrLnYb1tQG3AizWRyOlRc7TE+yzUO3V5W3lU55cmFvKUtV5HW6nXB8m0mGuJN9efJC12Nl3WJwmptdzRmoIm7oNDgKA/+gfY00nWOh5+tUERvaHUNMyAy7Vw7SnCeb6yaTEwVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725580286; c=relaxed/simple;
	bh=NqSJ5D6a4i29yvgaQFc8YV3HIIqN/jCukStQMXm1N/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzUBTaitQqLiDzKR+C4yVhoqiJTFNkUK0RXvtpr5pc4tjr8I9xAExsrgi1N40YyfKsV6xmLiWGDN4twmLMlZLWzdni6yKK+452ZvtE+T52NTJPYcU5ySWLczVNGYQ4GtdEzB4Er6Ug6PYAYUxiVU7sk6CVj88CkwyduwIdcTcGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrdZWjZB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrdZWjZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725580283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYWqQRNU4uf0iRFYpae5qJNfaa7KDhhBqRZ08pEE/us=;
	b=KrdZWjZBURkFf1u14/XHyXnp6zOl8VSZF8VyDkLJMQ900K0JP77dAIOjaXUsBWPcyWGrEz
	OOUyPhPC6Ms+3ORX9S5r9YD8FlxAe328pYDyVe+2t+V6oQxRb9yr72HtazbFBDbTn3VRWV
	dTLAhYr2USudGo8oD/ds1uj3iIEyibI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-NdhYmGu8OPy1CZJU5v5TzA-1; Thu, 05 Sep 2024 19:51:21 -0400
X-MC-Unique: NdhYmGu8OPy1CZJU5v5TzA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-717453c0677so2174535b3a.0
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 16:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725580280; x=1726185080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYWqQRNU4uf0iRFYpae5qJNfaa7KDhhBqRZ08pEE/us=;
        b=BukJDv1NIfaEjVmOwlIq7r+QgLZd4dmOy0Ss9Fpsej+E1jiOBvxw1Xhfq63Z144R4h
         dHaMbnC+U8jRiMiFQmege0u5zBuGaTWR5uE/KP7DdCvDkeRHl9+bFT5m1TTORFf/cFyk
         j6LQMI3S9XBKkPWr/XJButszWYPPvjoCrioyWvZ/o1bj7ctNU+4B9MalBNQ1BBtDUzDp
         /r+LNAr/WWjSKu1JmujlR71Tav8/rkteAL1I377vybt5wQpscdbdRRp6C0lVw/Wo1AZb
         lbpSILxP9Mjoh1LxZLk/xtd9OKSeeQblBXSV5zOWzKtcfqdWbtFpV+WXxSrbCKW/F8vv
         oj+A==
X-Forwarded-Encrypted: i=1; AJvYcCXE6TDvERynXcbMb4rRFiIZPIq9x7D2ifwbjHP6ldAKuV3J4xwZxRNVWJFKWDUfI2EXgfiwINAIp6+OZGhtDA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2sj1/lCLm99tMLRtXaIV8XHkE99GHvNtXp/slEEuf/7k9UMWF
	DOe0pl6Ixs2r5KZfHQduoqkLh+7kRRMQM/GXdYuUmc0jGyhjlTfe+XI2eE5bDN+XounCSpxmYY1
	i4RgIpBjhF2+y3GsDMCi4yLTXqngs+ZoH6x0ADw5Aptfzpcm9vqTSTyo9/yo/Jq27GrUCHNk2uz
	DNaRxqe9FoQ4sWuG97v6uJQKDjMuvNKsbTfJGD1fU=
X-Received: by 2002:a05:6a20:ae86:b0:1cc:e41d:58f0 with SMTP id adf61e73a8af0-1cce41d59b5mr20785736637.13.1725580280305;
        Thu, 05 Sep 2024 16:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2eLG4mxVAI1ob7jVArCbT0vfu4J1KdZ9xuzqdxCHNcJHaj64xaNKFLc9iD9a8n4FhmPA0tSo1SPapIdB/7a4=
X-Received: by 2002:a05:6a20:ae86:b0:1cc:e41d:58f0 with SMTP id
 adf61e73a8af0-1cce41d59b5mr20785723637.13.1725580279697; Thu, 05 Sep 2024
 16:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org> <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org> <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com> <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com> <20240905031759-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240905031759-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 6 Sep 2024 07:51:08 +0800
Message-ID: <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	David Stevens <stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:12=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> >
> >
> > On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> > >>
> > >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > >>> On Wed, Sep 4, 2024 at 12:03=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> > >>>>> On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin <mst@re=
dhat.com> wrote:
> > >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wro=
te:
> > >>>>>>>>> But I don't like it that looking at the registers, one does n=
ot know the device
> > >>>>>>>>> state. Hidden state is bad for debuggability.
> > >>>>>>>>> We have 4 states:
> > >>>>>>>>> suspending->suspended->resuming->resumed
> > >>>>>>>>> so we need a register with at least 2 bits.
> > >>>>>>>>>
> > >>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> > >>>>>>>>>
> > >>>>>>>> This is why letting the status tell the status and control reg=
ister to control thing is elegant.
> > >>>>>>> No argument here.
> > >>>>>> Or, to be more precise, our status is driver status.
> > >>>>> It looks like the device actually otherwise there's no need for
> > >>>>> re-read or poll for things like reset and others.
> > >>>> The need is there for complex device state transitions, which
> > >>>> can not reasonably block a read response.
> > >>>> Another standard approach with PCI is to specify the time
> > >>>> transitions can take. I consider that less elegant -
> > >>>> is this what you are advocating? The advantage is that
> > >>>> driver does not load the pci bus with constant re-polling.
> > >>>> The disadvantage is that it is hard to pick a universal
> > >>>> number.  A combination of these approaches might work,
> > >>>> e.g. a recommended timeout then poll.
> > >>> We've already had msleep() for vp_reset(), anyhow we can increase t=
he
> > >>> sleep time, if it can overload the pci:
> > >>>
> > >>>         while (vp_modern_get_status(mdev))
> > >>>                 msleep(1);
> > >>>
> > >>> We can do the same for suspending.
> > >>>
> > >>> The main blocker for timeout is that it may break migration and
> > >>> complicate the hardening. Another proposal in the past is to have a
> > >>> notification.
> > >>>
> > >>> But what I don't understand here is that suspend/resume should be
> > >>> lighter than reset. If we can afford a reset, so did the
> > >>> suspending/resume. If we want to have something new, that's fine bu=
t
> > >>> it should be orthogonal to a specific new status bit?
> > >> I agree, if we want new status indicator, then the new indicator sho=
uld not be
> > >> specific to SUSPEND.
> > >>
> > >> Thanks
> > >> Zhu Lingshan
> > > If you mean reset, we have a problem.
> > > Specifically, reset has to work before feature
> > > negotiation. So we can not do as we would with
> > > SUSPEND and use a feature bit to expose presence
> > > of the indicator register.
> > I guess the driver can reset the device even after DRIVER_OK.
>
> in fact, unlike suspend - at any point at all.
>
> > IMHO the indicator should work for all device_status transitions,
> > not only for RESET or SUSPEND, it should also apply for FEATURE_OK
> > and DRIVER_OK.
>
> I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
> FEATURES_OK brings with it more issues, e.g. it can fail.
>
>
> > So we don't need a feature bit, we may just
> > place it in the common config space as you proposed before to
> > define common config space for all transport. We can do this for sure!
>
> I have to say, this project is really ballooning out ;)
>
> > Of course another approach is what Jason proposed, the existing
> > msleep and poll, driver knows whether the device is in progress
> > of status transitions because it is the driver writes device_status.
> >
> > Thanks
>
> or just a register for suspend transitions, worry about
> extending it later/

Is this for PCI only? Another question is that, if suspend needs that,
reset would also want. Or it doesn't justify itself as reset needs to
take longer time than reset.

Thanks


>
> > >
> > > Regrettably, reset will have to still be supported
> > > through clearing status just because this is always there.
> > >
> > >
> > >>>>> Anyhow driver know
> > >>>>> its own status.
> > >>>>>
> > >>>>> Thanks
> > >>>> indeed, the status register is there to inform the device about
> > >>>> the driver status.
> > >>>>
> > >>>>
> > >>>>
> > >>>>>> If we need
> > >>>>>> to reflect and control device status, we need something else.
> > >>>>>>
> > >>> Thanks
> > >>>
>

