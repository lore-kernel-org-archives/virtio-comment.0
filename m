Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613042C0B
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519129; cv=none; b=O3emHHKNJ6fCiWlKJNbzGrMqns84Uq6VCd15T1dVT5d7zWQ3P9tw+Muv8lx1PN2m6bu5ehOySaYXiVv7X3yNciU7FzHDceagry64rwx7gQDTWEepFXBdJ8SewkiaVBjAdfbzUaKgyaHicabyZkRNJiiMjyyVvkE/TRM7JgPYqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519129; c=relaxed/simple;
	bh=ZS96RaB83qQ9xm3dnbjc7JxCckfyce52qCUhBw0242I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ugGShOqi+Q7QXnYElTeOzqFcOyBQF25CNvSWk0VzljspYQPOb0KO7Pe56xG1VxDFeO1VFMI9AxDfJDgLFOI/Dxv2TAvvnMsAey4BTewGySE4bTG1jxibSVAqVBm0QP/qGgq7Z2K+ga6lD8Twfciv9Ob6IuhaZsAeIJ7I2xw2XDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMdFaGZ+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMdFaGZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725519126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6s3GE47qFvsYdOqII0y9jXjr3tUSIRLXNVeaUbDOfI=;
	b=KMdFaGZ+ZHmqkFhItuTghuvZsUdmSnYhXF++1oMDyTJTMyo5xJokVxzYIfeFwFvSbGaRG3
	Orfn/IeTM9CHvLSIaAzX03alvqo/VGgtnYU+PpB0J3eHwJf9QGpRyyZuCM4MfCmHiQR+oF
	OO5MTLDjH5lCcQpEdsSBrVfu/VGDQv0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-nCJDoPGzNB69qXqI4i512w-1; Thu, 05 Sep 2024 02:52:05 -0400
X-MC-Unique: nCJDoPGzNB69qXqI4i512w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374bacd5cccso227732f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 04 Sep 2024 23:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519124; x=1726123924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6s3GE47qFvsYdOqII0y9jXjr3tUSIRLXNVeaUbDOfI=;
        b=UvVZJI1wexZz2UsNos8aZdAYeMbbU0g4RJs85PwM0XrT3PRDCd8Lfja+MYV2uKrnMZ
         mjDRGRTPGN8oz1E3K0RWR+kd6UzDtOv7FN1a+Ck/ycSpNQJLp722773MH0iQWpABUysN
         jChtjEg6wNAt8HMv4UohtNUCiGuzk/e/E97wg0LRrTzMVdEB0gaFS5WeMLEEwZf3eMod
         vCKtgb2TxZpfyHhqad2lPC8rlCGiXcBeYrey4gXFEg7dgzEDbGnDmMdNfqQwnnfqgtEY
         TKSley2qHR91SpV0gKTwdEoRz7i55AwZ1C45kAuMl/bVQgOWAfp53TMMZPymIfFX2ozT
         QRjg==
X-Forwarded-Encrypted: i=1; AJvYcCW+hbRy9gxKXymxWxVFhuIsvgjty2C9YhijQbA9y8GWtr5qtzBgLvSD/kbP3vvumyR316NWlkW1kuwsHMJxVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4wbldn5SPy+//zrCgvN2eQkTwW8rhL0DtAtJmDXXLflQW0rkh
	mTXzls57MvqRL7z1Pt7kl6h57j6HB1yg3FG+IUIYfX1IfhKFVU8S1+dJDtI0TY5/LWnpqHv2kgT
	/P3YBD1t5WwQeOEowDQqw6O4QuQ3rVThMX3F6qcQ3KuAjVVRl8XK+8r1XVbXXNF2F
X-Received: by 2002:a5d:438c:0:b0:374:ca54:4065 with SMTP id ffacd0b85a97d-374ca5440a1mr8015361f8f.48.1725519123732;
        Wed, 04 Sep 2024 23:52:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh7ABRhphyNFoHeICm7cYEU9FsIlkuHt6qz4b2mvIXSxQWQjf0bX/2Wz5vltxagkWlCG7yJw==
X-Received: by 2002:a5d:438c:0:b0:374:ca54:4065 with SMTP id ffacd0b85a97d-374ca5440a1mr8015339f8f.48.1725519123049;
        Wed, 04 Sep 2024 23:52:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:25b:d02e:ab32:7c17:4d7a:fa4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c4059811sm12433259f8f.4.2024.09.04.23.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:52:02 -0700 (PDT)
Date: Thu, 5 Sep 2024 02:51:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240905024935-mutt-send-email-mst@kernel.org>
References: <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> 
> 
> On 9/4/2024 2:31 PM, Jason Wang wrote:
> > On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> >>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> >>>>>>> But I don't like it that looking at the registers, one does not know the device
> >>>>>>> state. Hidden state is bad for debuggability.
> >>>>>>> We have 4 states:
> >>>>>>> suspending->suspended->resuming->resumed
> >>>>>>> so we need a register with at least 2 bits.
> >>>>>>>
> >>>>>>> we could steal 2 bits from status but it seems a bit much.
> >>>>>>>
> >>>>>> This is why letting the status tell the status and control register to control thing is elegant.
> >>>>>
> >>>>> No argument here.
> >>>> Or, to be more precise, our status is driver status.
> >>> It looks like the device actually otherwise there's no need for
> >>> re-read or poll for things like reset and others.
> >> The need is there for complex device state transitions, which
> >> can not reasonably block a read response.
> >> Another standard approach with PCI is to specify the time
> >> transitions can take. I consider that less elegant -
> >> is this what you are advocating? The advantage is that
> >> driver does not load the pci bus with constant re-polling.
> >> The disadvantage is that it is hard to pick a universal
> >> number.  A combination of these approaches might work,
> >> e.g. a recommended timeout then poll.
> > We've already had msleep() for vp_reset(), anyhow we can increase the
> > sleep time, if it can overload the pci:
> >
> >         while (vp_modern_get_status(mdev))
> >                 msleep(1);
> >
> > We can do the same for suspending.
> >
> > The main blocker for timeout is that it may break migration and
> > complicate the hardening. Another proposal in the past is to have a
> > notification.
> >
> > But what I don't understand here is that suspend/resume should be
> > lighter than reset. If we can afford a reset, so did the
> > suspending/resume. If we want to have something new, that's fine but
> > it should be orthogonal to a specific new status bit?
> I agree, if we want new status indicator, then the new indicator should not be
> specific to SUSPEND.
> 
> Thanks
> Zhu Lingshan

If you mean reset, we have a problem.
Specifically, reset has to work before feature
negotiation. So we can not do as we would with
SUSPEND and use a feature bit to expose presence
of the indicator register.

Regrettably, reset will have to still be supported
through clearing status just because this is always there.


> >
> >>> Anyhow driver know
> >>> its own status.
> >>>
> >>> Thanks
> >> indeed, the status register is there to inform the device about
> >> the driver status.
> >>
> >>
> >>
> >>>> If we need
> >>>> to reflect and control device status, we need something else.
> >>>>
> > Thanks
> >

