Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD015531A
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525711; cv=none; b=j+zX1SaHHMtxGGAzEeUwxnlCPaXulr/rNsEGtdc9Xy9LCaYF4bjc2o6XF2j7U3zSVQIFXB/+8WmelhNz0W1GwbhxK8C2kdeW7GVqCEbw00Y788NiwpBcyzrshf6pWSY1EGJzERHjwy1Va6w2CbtqUuwvGe3VKtM8sOimG9cv3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525711; c=relaxed/simple;
	bh=mjRA+4vN/BTgY2TygDJksXyI7yDoawEc9bipsr2G55s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5Q0ji9S4gEl9+0bkZYHvl0+N+s1KzAJ57TGasU4Q8YIj8CX3WhswD8TcW4AosnKv4VpRryTPlWv9Zn09+/vRw5afHe/X+zx0spEcvqud2NdSF0pdbxyDi1jY5K4XcElFNUrPokZGwLTNs2dxV1u6qcJgtNjXpvQvXqKWwm8q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Za8Ul99Z; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Za8Ul99Z"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so6042481fa.0
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725525708; x=1726130508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx6+7jseatcJ20zMlbMBqNGAqFuqL5IrB9lbwwTqFYw=;
        b=Za8Ul99Zhc+zQJmKZUe3GxYkmbdOl5PJAzVSaR/P87SeTQqOdgDkiagxEjUANUZn0z
         CAMfeaYVwyIb9ctxnjPvaL5cX6ydvjJJLxQTA4ECye79kkEbVgtZvvBabmIUwgiC/Oo5
         M07rMFL9SGU/SDr4nDRZAitjc8aWkEU1anaB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725525708; x=1726130508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx6+7jseatcJ20zMlbMBqNGAqFuqL5IrB9lbwwTqFYw=;
        b=CB1OaMGjDRluC1MeA2I2UgjYkf+NFyl3rhDjE4+rIi1Gl/Q4CUbtbXk9WoVw4j/frm
         /VDdERQYj1v9C1gRA0//3lZi9baYh6r7M4b0sH1aEBkmuakxiAjMLXyTCiEZbSYerAjy
         y1LkojZa6lEStPn78HUO+ezw4xnnWbY6Q78KQj+ysCzrght/ss4+V1D4+FyMEDwW4dxx
         wps+TjeeHXHPNIdGYlTooRalc/095GOQrdFZtQUDBdHNcSZaLURlu6rkA/X5fNg2st2d
         s3V2rb3fSVcHmfhOr6vvmKj8pNlybEyat3vmvJQYe3//Iv6U87Ws5A/VSRZxJFxy++Gd
         k5cA==
X-Forwarded-Encrypted: i=1; AJvYcCV9coeR9bMYVlBR0UhhSlSTWK1TGdqTtFbv+xRyZcvZw11BQYAnT+tz83RTWAKjsv05h4vTmS0dP2n6Bxt7SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzar40aU0+qkk9DCB5gDKz1tU2YT2Q+QUKqHE2TPHViS6lHgFKO
	hy+ywbJBJpST9lPQ8LikZp491M3iqwqIlTdkZL/A4Qv9J0gdvrhIhbHyB/QL/nItho7Smv078c1
	ogFuu2w+7uRkvSTM4olavsNJKGTNUeGsciZkJ
X-Google-Smtp-Source: AGHT+IFcDQEmsBKqOVJFf7fLC+j0IkcaEUeZipD2/w/Z73w3PcvOvtEfX+0esxuR7Fjdy+u3yEGICChlYqUR3xRFbFI=
X-Received: by 2002:a05:651c:19ab:b0:2ef:1db2:c02a with SMTP id
 38308e7fff4ca-2f651d54329mr40601981fa.6.1725525707648; Thu, 05 Sep 2024
 01:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com> <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com> <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org> <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org> <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com> <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com> <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <d42bd62a-5527-4468-9714-2555a52a361d@amd.com> <IA0PR12MB8713676643C6A258BAFA332BDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <6ba5f119-3613-49a4-b368-b8f745556723@amd.com>
In-Reply-To: <6ba5f119-3613-49a4-b368-b8f745556723@amd.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 5 Sep 2024 17:41:36 +0900
Message-ID: <CAD=HUj4Ac=5pgu6X5wqCLBpQGmBca1Qonnd1KM5An2ewDrDZ2Q@mail.gmail.com>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:31=E2=80=AFPM Zhu Lingshan <lingshan.zhu@amd.com> =
wrote:
> On 9/5/2024 3:35 PM, Parav Pandit wrote:
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Thursday, September 5, 2024 1:00 PM
> >>
> >> On 9/5/2024 3:16 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Thursday, September 5, 2024 12:45 PM
> >>>>
> >>>>
> >>>> On 9/4/2024 2:46 PM, Parav Pandit wrote:
> >>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Sent: Wednesday, September 4, 2024 12:09 PM
> >>>>>>
> >>>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
> >>>>>>> On Wed, Sep 4, 2024 at 12:03=E2=80=AFPM Michael S. Tsirkin
> >>>>>>> <mst@redhat.com>
> >>>>>> wrote:
> >>>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> >>>>>>>>> On Tue, Sep 3, 2024 at 6:37=E2=80=AFPM Michael S. Tsirkin
> >>>>>>>>> <mst@redhat.com>
> >>>>>> wrote:
> >>>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin
> >> wrote:
> >>>>>>>>>>>>> But I don't like it that looking at the registers, one does
> >>>>>>>>>>>>> not know the device state. Hidden state is bad for
> >> debuggability.
> >>>>>>>>>>>>> We have 4 states:
> >>>>>>>>>>>>> suspending->suspended->resuming->resumed
> >>>>>>>>>>>>> so we need a register with at least 2 bits.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> >>>>>>>>>>>>>
> >>>>>>>>>>>> This is why letting the status tell the status and control
> >>>>>>>>>>>> register to
> >>>>>> control thing is elegant.
> >>>>>>>>>>> No argument here.
> >>>>>>>>>> Or, to be more precise, our status is driver status.
> >>>>>>>>> It looks like the device actually otherwise there's no need for
> >>>>>>>>> re-read or poll for things like reset and others.
> >>>>>>>> The need is there for complex device state transitions, which ca=
n
> >>>>>>>> not reasonably block a read response.
> >>>>>>>> Another standard approach with PCI is to specify the time
> >>>>>>>> transitions can take. I consider that less elegant - is this wha=
t
> >>>>>>>> you are advocating? The advantage is that driver does not load
> >>>>>>>> the pci bus with constant re-polling.
> >>>>>>>> The disadvantage is that it is hard to pick a universal number.
> >>>>>>>> A combination of these approaches might work, e.g. a recommended
> >>>>>>>> timeout then poll.
> >>>>>>> We've already had msleep() for vp_reset(), anyhow we can increase
> >>>>>>> the sleep time, if it can overload the pci:
> >>>>>>>
> >>>>>>>         while (vp_modern_get_status(mdev))
> >>>>>>>                 msleep(1);
> >>>>>>>
> >>>>>>> We can do the same for suspending.
> >>>>>>>
> >>>>>>> The main blocker for timeout is that it may break migration and
> >>>>>>> complicate the hardening. Another proposal in the past is to have
> >>>>>>> a notification.
> >>>>>>>
> >>>>>>> But what I don't understand here is that suspend/resume should be
> >>>>>>> lighter than reset. If we can afford a reset, so did the
> >>>>>>> suspending/resume. If we want to have something new, that's fine
> >>>>>>> but it should be orthogonal to a specific new status bit?
> >>>>>> I agree, if we want new status indicator, then the new indicator
> >>>>>> should not be specific to SUSPEND.
> >>>>>>
> >>>>> Sounds good to me as long as new functionality does not force the
> >>>>> device
> >>>> to react in 50nsec.
> >>>>> In the current state it forces the device so please upgrade the
> >>>>> proposal as
> >>>> Michael guided.
> >>>> Trap and emulate is very often in virtualization, of course the
> >>>> sooner the better for emulation.
> >>>> But there are no 50nsec assumption and no one can force the
> >>>> hypervisor to finish any emulations within a certain time
> >>>>> Thanks.
> >>> You are completely ignoring the comments.
> >>> Good luck..
> >> VM_EXIT and a VM_ENTRY work in a pair.
> > For hw pci pf where there is no virtualization used?
> > How?
> you bring the VM_EXIT problem to me, if without virtualization, there is =
no VM_EXIT.

The problem Parav is raising is that the single bit approach
effectively requires that the device handles updates to the status
field synchronously. In a virtualization context with
VM_EXIT/VM_ENTRY, this synchronous handling is easy. However, it's not
necessarily easy with bare metal.

Even in the virtualization context, it's entirely possible to
implement a virtualized device where the status field is plain memory
that is periodically checked by the device. If the device only checks
the status field once per second, then it's pretty clear that the
single suspend bit approach won't work at all. I don't know why
someone would implement a device like this, but it's not something
that the virtio spec should rule out.

-David
