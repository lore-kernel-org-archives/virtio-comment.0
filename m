Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6C3D6B
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725422585; cv=none; b=krfgBWsYw1QWkuFT6NHGtNn48lTEC8pnIIeNj1urkjMgqy4i8S2EewOv1M+zuG+Myheorsu//kxCNN/Y1NXMk/o4aMrU8Mkvq8R4+W5pep+2QFg7AynBRNdXbviiNWteCKJsg0ao73L9LB2ezGGh/l5RnxGQwfwzjHmRqFGudLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725422585; c=relaxed/simple;
	bh=qq2Y76whB+O2teoj4+ywPc8Ybb3PYIhkJhH1TEr3iGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ghu8cTCNLta0oJ25WBadtbBC2M8TbS4VSKOm4mF+5/1yfgPA5Wxd9f1XkE6hVyK1B/mVi85lQXf5oT09SoSp1RSb8SucSyzlrOivoVS3jGb13dQdJIzqCmnzJ74kbp6XpETGiAWt+9As3tJp1LuOwDPeY9lcx/I5lqsgOFMOclI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUZ4xah+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUZ4xah+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725422582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpCYAoWT8DaeqxD7loxaHm9QzyERWcDODEkwHTWbbrY=;
	b=dUZ4xah+VxAWhBrh2BDkVQRLEQnZye+zOzMTX45pE3wFMFwf2QYIIZ0p/NTJ4dDfuM+3NU
	qck+w6bbIGOCr6GL/2r4xBS38X4YuNtAtTJyIkS763jZxMwn9ojLpnmJuSRVtJy+f6nHk2
	vPsa3edrlfWyDrTjlNukEesVLf+x2XU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-dMUJNnLwNYmIbNWhAfvkdQ-1; Wed, 04 Sep 2024 00:02:59 -0400
X-MC-Unique: dMUJNnLwNYmIbNWhAfvkdQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5334573b3e6so273313e87.2
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 21:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725422576; x=1726027376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpCYAoWT8DaeqxD7loxaHm9QzyERWcDODEkwHTWbbrY=;
        b=ez0nM0HSesfLOfy1br9VO1PzeYpmrYg6WFJRygTjVOWI4xilYWjjdlFMFrk+ERVcCl
         Y/8Jhe2ToEky14kXBYiEkR/uT6C40qYq9RTJtiNjWSrtNx/Z/oImSxnOQOYLdP7bsBu2
         /48ktE//RkOIuI2BeDN9B4BBWc20849xriNRYlNz7K69icxJSIA29IsuMqAll63LhJFr
         0QXUiGNAuoS8l7LVADHjanxx0CGjPs+E97d109JnbgKSBa+THaQXrN9/LJtC4lXU9z5D
         10A4H17Nr+sxSPOEqb4I7NyxuHCdquzN9+M+NiwRQ7ocjn8ag+DP+r53NGQWCDcjDyIY
         sUQg==
X-Forwarded-Encrypted: i=1; AJvYcCUI4ks1LJWNo5V/ShP1+IUNCo4ERtayAhPGGEeIdtbvMbKJokiBV5I1h2D01QdXtP6OvONg8Yu5VJrkcQ5RKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/rjl1MIjO0mPbQi1HFRSmRDBNXGbnQxD95uAxsbBRqgHUIIpt
	yEfV0ewkZJ5iQQNR2jhdq78F9f0Sy48g65uTs8HIjPVEJUwzrkswrXru0anPa0WRAhWy/HNENfa
	K4P/PuiXwE0/Nx9bfyVxJlXX9LvOYrX+oWfl8NPHrVKkFjhOzmgqoe1c7vv48XBzW
X-Received: by 2002:a05:6512:2820:b0:52c:7fe3:d3e5 with SMTP id 2adb3069b0e04-53565f55009mr761377e87.50.1725422576248;
        Tue, 03 Sep 2024 21:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELQD9noug9r1W6C+Z+0lOlFw3ow3S/E1OuHm1jHJ/u7hkCXyboTVP4gvl/dwFTkniWgs/CMg==
X-Received: by 2002:a05:6512:2820:b0:52c:7fe3:d3e5 with SMTP id 2adb3069b0e04-53565f55009mr761333e87.50.1725422574904;
        Tue, 03 Sep 2024 21:02:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:25b:d02e:ab32:7c17:4d7a:fa4a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891da22bsm755161566b.182.2024.09.03.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:02:54 -0700 (PDT)
Date: Wed, 4 Sep 2024 00:02:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240903235727-mutt-send-email-mst@kernel.org>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > > >
> > > > > But I don't like it that looking at the registers, one does not know the device
> > > > > state. Hidden state is bad for debuggability.
> > > > > We have 4 states:
> > > > > suspending->suspended->resuming->resumed
> > > > > so we need a register with at least 2 bits.
> > > > >
> > > > > we could steal 2 bits from status but it seems a bit much.
> > > > >
> > > > This is why letting the status tell the status and control register to control thing is elegant.
> > >
> > >
> > > No argument here.
> >
> > Or, to be more precise, our status is driver status.
> 
> It looks like the device actually otherwise there's no need for
> re-read or poll for things like reset and others.

The need is there for complex device state transitions, which
can not reasonably block a read response.
Another standard approach with PCI is to specify the time
transitions can take. I consider that less elegant -
is this what you are advocating? The advantage is that
driver does not load the pci bus with constant re-polling.
The disadvantage is that it is hard to pick a universal
number.  A combination of these approaches might work,
e.g. a recommended timeout then poll.

> Anyhow driver know
> its own status.
> 
> Thanks

indeed, the status register is there to inform the device about
the driver status.



> > If we need
> > to reflect and control device status, we need something else.
> >

