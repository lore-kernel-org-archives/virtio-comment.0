Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F12AD22
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718590958; cv=none; b=Sr6h7SRZJk4WinJ+60c5sapKx4wiWIC9LE4NmRugCLmnLKRepALD0Ppt06iaGoWS9evjrtLw9lCAm010rTmgtCL9wbbjKuImQz6NEs2kFQEDJt1ZGo5rv2+Al2Rx+zJ11jD8O2tDI+3nHtXXXK1x0/9u4EzM+6VTBQvPkGSYTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718590958; c=relaxed/simple;
	bh=b2LzKE793noC5AJwxd6/kwsxAgtWPeT66iw84nieNso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpIJaxg6xzM453w2DrCzBAmgTJ5QX5sJlvTIqQ+swMPOdK9aZKBj67zDGj1flKyIdxEpZyrqbW1tWRCh5R1djWyQ97ILDHViu9Lq6F8IHuudKxOZhYlkpK42oWxKLzp4TqO/OCPka4ALBY4nnYlEhRCDoCAeTt3sJYlrm3ObSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3/D5NO9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3/D5NO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718590955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AEYWSfV8p+BDXYjJL6QQ/EZ5ZCynMZMF2yGHgQNQiI=;
	b=P3/D5NO9fkbHdcXItVIwm63x3FhEvziEUfmegFRr3hRqmM1Bs4RJj+DntvSVS44SsByVlg
	c4yk6X1Ckv3/D/m1kfTvwtDE8bbl7q+ZxRafrUBOlhFhQPS5FgQqLXrBrzN+FETPZHjWl5
	D671g9F9qpy3nR5hcohBW0+moiJLKhY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-DYKUgVAePNmp9l_BjvpCqQ-1; Sun, 16 Jun 2024 22:22:33 -0400
X-MC-Unique: DYKUgVAePNmp9l_BjvpCqQ-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c2dd7fb263so4233029a91.0
        for <virtio-comment@lists.linux.dev>; Sun, 16 Jun 2024 19:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718590952; x=1719195752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AEYWSfV8p+BDXYjJL6QQ/EZ5ZCynMZMF2yGHgQNQiI=;
        b=MyTRHzNzuHlUqlzlvEQIaxf11zU8HJauqoS3/wsjP4KA5xGwmogh1HgDysNxaSEZ6R
         ABTfNj9+iiqT28SieZVAjfKeFb1y5aH+wUwyhVBu3QyDOlBIiXe/TbfyuY+UCjXwge88
         GmkOWV8q6LtrTSQ/36zT1JiBH5Bpqa7Fewck2sCl8pKlFnKYGD6dd6pyvYsQx7hbbC9u
         YcGLwdUH2RTYL4hrGI8joE+ZhHmrDjJkcbHS0KhWVu3d9lk66WlVFRrFJDdFU6sRHcgq
         M7Mig6eb8TJ34FbuCLjXaRsxo04SS/1TH0E53HO5aUzF93Uo6pBGuojGiuS8CfBT1SW5
         Mpjw==
X-Forwarded-Encrypted: i=1; AJvYcCWYqPStrzzOrwWej4R9E/QfoKOIKpscgh2Goe3hEAuVXMlkBqAwUynAQDjXSme6/w4VJXaBARcwctCk3R/MBiiU9hHSQCVyWC9MV/RwtH0=
X-Gm-Message-State: AOJu0YyeI9t4NnMOd2cdEwplPQWXKFxWloWb4jTYjMjXqIlImVgccO+y
	HZ3JT7dusycP6Z3Y1AOIpkF2ELjbbBBhp0IfNp0Mrjq84WjAbOel+UcQzje9qtHz1AQe2fZ0gX7
	hMEwgHmoaY4FfIgQmSHEbrjMiPnWnnJM+znWkRLAM1jgECR0llKvKWlYmtfWt5AYoiS6FbeEeZP
	H4YfQb7CP6+EkmxCP89g7FrfmSQC4q8p7s8TQBqBM=
X-Received: by 2002:a17:90a:fd97:b0:2c5:24a0:adcc with SMTP id 98e67ed59e1d1-2c524a0bd2amr1699813a91.38.1718590952447;
        Sun, 16 Jun 2024 19:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE75LPNgwjvZttHNAQVDpf/rqUbpx9yzNMrmLYirlQl0KlCe2g4j4lJaPCLGFdDPtUHiRtyGG/yKqcpM9mWbn0=
X-Received: by 2002:a17:90a:fd97:b0:2c5:24a0:adcc with SMTP id
 98e67ed59e1d1-2c524a0bd2amr1699801a91.38.1718590952037; Sun, 16 Jun 2024
 19:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com> <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com> <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com> <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com> <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com> <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240612081135-mutt-send-email-mst@kernel.org> <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
 <40c1d6fb-c04e-41b4-a4d3-baf36aba7d15@amd.com> <PH0PR12MB5481C44455741A4A1F36C8FFDCC32@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481C44455741A4A1F36C8FFDCC32@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Jun 2024 10:22:20 +0800
Message-ID: <CACGkMEu09XU-1E4ib4nD3Fk=tz40-sEu=C14XbEpUZ9SwQdJcg@mail.gmail.com>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, David Stevens <stevensd@chromium.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 12:33=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
> > From: Zhu Lingshan <lingshan.zhu@amd.com>
> > Sent: Thursday, June 13, 2024 3:29 PM
> >
> > On 6/13/2024 1:58 PM, David Stevens wrote:
> > > On Wed, Jun 12, 2024 at 9:20=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com>
> > wrote:
> > >> On Wed, Jun 12, 2024 at 11:26:39AM +0000, Parav Pandit wrote:
> > >>> No locks are needed. Hypervisor is accessing the admin vq on the PF=
.
> > >> I'm not even going to try and get through a jumble of this thread
> > >> heavily corrupted by outlook and whatnot, but from the glimpses I go=
t
> > >> this discussion looks like just two people talking past each other.
> > >> Lingshan, Parav's not the only one bothered by how the device
> > >> seemingly has to block a transaction until it completes suspend.
> > >> Parav, I feel how to address this is up to the author to resolve rea=
lly, leave
> > it at that.
> > > IIUC, Prava's concern here is that with the current proposal, the
> > > device's state can't be determined unambiguously by reading the devic=
e
> > > status field. If the SUSPEND bit is 0, it's ambiguous as to whether
> > > the device is running normally or if it's in the process of
> > > suspending, and there is a corresponding issue for suspended vs
> > > resuming. The device and driver can know based on their internal
> > > information what state the device is in. However, some hypothetical
> > > admin tool in guest userspace wouldn't be able to tell simply by
> > > reading the values in the PCI BAR.
> > >
> > > Assuming that's actually a problem that we want to solve, then I thin=
k
> > > the most straightforward way to address this would be to use another
> > > bit in the status field as a SUSPEND_TRANSITION bit, with something
> > > like:
> > >
> > > "After the driver writes or clears the SUSPEND bit, the device MUST
> > > present the SUSPEND_TRANSITION bit until it completes the requested
> > > suspend or resume transition. If the device is unable to successfully
> > > complete the transition, it MUST present DEVICE_NEEDS_RESET."
> > >
> > > Doing that would give distinct values for each of the
> > > running/suspending/suspended/resuming states. That said, although the
> > > device status field doesn't have a defined width, both the PCI and
> > > channel transports assume that it's a single byte, so we'd be using
> > > the last remaining bits those transports have available.
> > Current spec does not handle status transitions well, not only for SUSP=
END
> > and resuming.
> > other status transitions may also take longer time than expect depends =
on
> > how the device is implemented, it can be sluggish if implemented by SW
> > during high traffic, even when handling FEATURES_OK or present
> > NEEDS_RESET.
> >
> > This patch wants to copy the mechanism of handling FEATURES_OK, but if =
we
> > want to resolve the problem of device status transition, I agree to add=
 a new
> > status bit: TRANSITION.
> >
> > The device should present TRANSITION until it complete the requested st=
atus
> > transition.
> > Combining the knowledge of the device, the driver can tell the exact de=
vice
> > status.
> >
> Yes, this will be good idea.
> The TRANSITION bit which must turn very quickly to 1 on an MMIO write req=
uires very special circuitry.
> It needs to turn 1 just before the next read arrives from the guest drive=
r.
> This is roughly 10nsec of time (write followed by a read).
>
> To simplify this aspect, a better approach can be,
> 1. device_status to have SUSPENDED bit, which starts with 0.
> 2. a new ctrl_register is added. When cmd is written there, its status re=
flects in device_status.
>
> 3. So even if the device takes 30nsec or 30usec to respond, things don=E2=
=80=99t break.
>
> For example,
> a. driver writes device_ctrl =3D 0x1 (cmd=3Dsuspend)
> b. driver reads device_status =3D (suspended=3D0) -> not yet suspended
> c. driver loops on #b few more nsecs.
> d. finally device turns it suspended.  So #b returns supended=3D1.

Is there any real difference? Currently, transitions could be spotted
by the driver easily: read after write doesn't match.

>
> And we can extend it more to better restructure the other operations too =
such as features_ok, driver_ok etc.
> And can also make the current "reset" from SHOULD to MUST.
>
> Its one time price to pay for the extra register but it is far easier to =
implement for the devices (and works fine for sw backend too).

Well, I don't know why this needs to be addressed in this series as
it's not specific to suspend.

Thanks

>
>
>
>

