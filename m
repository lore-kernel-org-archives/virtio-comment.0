Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3C15531A
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523960; cv=none; b=Fe2/OlR5/mbvmUXuxoAeJmLY5pv1k81AgkD0o/DM954g+HmGdVBbqORgxSfL7MLQwvqVqQVi2jI3VQR6WeVg7vdSm/yzqb2x8SyGUlwRFN5nXv/g2ixQC2Bx8J/rFzPCbgpAoi9lQmd0IHiKGZNNFxXqJpncz+iGRLrc/5vH97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523960; c=relaxed/simple;
	bh=TCHi+TV1RPkWNSsgMYG1DsHAHBnaB/W8vyrDeWC49wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=btE6huA77kyCmN6HsqaMQEjbwgpqd0mdzZ2GGAR7WFRv6gaKVcEfcgt2cwlwYa7JGXOILuCt6kgY+i/qLHYnoMVPeJ6q1UUaB7beOcGyRbwEMfyf6C4mlXvAIFzx0xU89oBS9riQK9t2G5NIy9QojzVJ/HKHP3ZXicyrgYsmeQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eeggeEMY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eeggeEMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725523957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7MruIqpUqh8gohgKXpHW62I3XDRifYNkHrou0FTYDY=;
	b=eeggeEMYDa9/8Crj875dEC3dNsoBElOVAud24K6tv4xyu77d0RZkgm5W9j83w8gJGszBad
	Co4M2BwAzDGNZvGl8Enj+vRZ3n5N1aenf5KxZsjcD7KLf+u5p4WP4fUSxTet+BxDSn4yso
	9Hlh2m1aixlICOKuTo5c2Rg3xwq5DHY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-uEaWxQvtN_6DsBkH7TvZvQ-1; Thu, 05 Sep 2024 04:12:36 -0400
X-MC-Unique: uEaWxQvtN_6DsBkH7TvZvQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374c90d24e3so365875f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 01:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523955; x=1726128755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7MruIqpUqh8gohgKXpHW62I3XDRifYNkHrou0FTYDY=;
        b=v0lL4gyJlC7W434q9nu+nDtQZJgWPVoEZnG6jEI4KUdlApJ8rKWc3brEQn1IMrOGsV
         HcbTvhq5bYEViW08n7zTYLLR8/0HeGZzJHj2yIDNmDhB7L+oyitRcz++KjgOZkAoVeIE
         AQY3pLF9fc7mQYOvSpMo7Sn4w4LrUoHzTIfQ+PmTXeNPH1yXkMTkx8v3AJXiClY8sGHl
         +F42XrVv01j6Qun5EPJI1cnthPM++NaGIDo7zPLWhk9V4qWwU4yQXLsVdOEcC8oUUFJU
         QUVePoHgt45oOUrVf6jqTCmAKfVGbw3Hddw7EWAR0NfoiSx+OdzEYwz7mdzoYPQSE/Ib
         tsAw==
X-Forwarded-Encrypted: i=1; AJvYcCUWWSyNICzUXe1UqqSRGMDD6EWBhnXFz5Uxp3t/A7bwnIWvFZ+WySujsi4TMRbJuWO+OQacM5Z6cueOH3w0EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzMSfa91jsx438O8D18SJnkB02e6QO7cNUy5ayOZvGhK2JKhzM
	X/+lWE0U2HtQoTLdLSuwdG0/zHf2hvVGsUkJaq9UAoBFXXtvvbPmA5/Xt/Z/mph4HDZ3fXEd4Uj
	wJ1+Q1qut9BJmuZJzlwKWZU5EAsV5XeXBUBzxP2e2PznHLW1vruQcnrHF7TzxvnGq
X-Received: by 2002:a5d:6801:0:b0:374:c69b:5a24 with SMTP id ffacd0b85a97d-374c69b5b9amr11386174f8f.51.1725523954801;
        Thu, 05 Sep 2024 01:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRFafmvGdUqGkt4Owzur61yK19zD2FJMpEyygwqG7+Bo62u3f10mMLOEw2Qo3ixWb+Hnk56Q==
X-Received: by 2002:a5d:6801:0:b0:374:c69b:5a24 with SMTP id ffacd0b85a97d-374c69b5b9amr11386146f8f.51.1725523954207;
        Thu, 05 Sep 2024 01:12:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:25b:d02e:ab32:7c17:4d7a:fa4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b960ef94sm15636686f8f.103.2024.09.05.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 01:12:33 -0700 (PDT)
Date: Thu, 5 Sep 2024 04:12:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240905031759-mutt-send-email-mst@kernel.org>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
> 
> 
> On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> > On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
> >>
> >> On 9/4/2024 2:31 PM, Jason Wang wrote:
> >>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
> >>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> >>>>>>>>> But I don't like it that looking at the registers, one does not know the device
> >>>>>>>>> state. Hidden state is bad for debuggability.
> >>>>>>>>> We have 4 states:
> >>>>>>>>> suspending->suspended->resuming->resumed
> >>>>>>>>> so we need a register with at least 2 bits.
> >>>>>>>>>
> >>>>>>>>> we could steal 2 bits from status but it seems a bit much.
> >>>>>>>>>
> >>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
> >>>>>>> No argument here.
> >>>>>> Or, to be more precise, our status is driver status.
> >>>>> It looks like the device actually otherwise there's no need for
> >>>>> re-read or poll for things like reset and others.
> >>>> The need is there for complex device state transitions, which
> >>>> can not reasonably block a read response.
> >>>> Another standard approach with PCI is to specify the time
> >>>> transitions can take. I consider that less elegant -
> >>>> is this what you are advocating? The advantage is that
> >>>> driver does not load the pci bus with constant re-polling.
> >>>> The disadvantage is that it is hard to pick a universal
> >>>> number.  A combination of these approaches might work,
> >>>> e.g. a recommended timeout then poll.
> >>> We've already had msleep() for vp_reset(), anyhow we can increase the
> >>> sleep time, if it can overload the pci:
> >>>
> >>>         while (vp_modern_get_status(mdev))
> >>>                 msleep(1);
> >>>
> >>> We can do the same for suspending.
> >>>
> >>> The main blocker for timeout is that it may break migration and
> >>> complicate the hardening. Another proposal in the past is to have a
> >>> notification.
> >>>
> >>> But what I don't understand here is that suspend/resume should be
> >>> lighter than reset. If we can afford a reset, so did the
> >>> suspending/resume. If we want to have something new, that's fine but
> >>> it should be orthogonal to a specific new status bit?
> >> I agree, if we want new status indicator, then the new indicator should not be
> >> specific to SUSPEND.
> >>
> >> Thanks
> >> Zhu Lingshan
> > If you mean reset, we have a problem.
> > Specifically, reset has to work before feature
> > negotiation. So we can not do as we would with
> > SUSPEND and use a feature bit to expose presence
> > of the indicator register.
> I guess the driver can reset the device even after DRIVER_OK.

in fact, unlike suspend - at any point at all.

> IMHO the indicator should work for all device_status transitions,
> not only for RESET or SUSPEND, it should also apply for FEATURE_OK
> and DRIVER_OK.

I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
FEATURES_OK brings with it more issues, e.g. it can fail.


> So we don't need a feature bit, we may just
> place it in the common config space as you proposed before to
> define common config space for all transport. We can do this for sure!

I have to say, this project is really ballooning out ;)

> Of course another approach is what Jason proposed, the existing
> msleep and poll, driver knows whether the device is in progress
> of status transitions because it is the driver writes device_status.
> 
> Thanks

or just a register for suspend transitions, worry about
extending it later/

> >
> > Regrettably, reset will have to still be supported
> > through clearing status just because this is always there.
> >
> >
> >>>>> Anyhow driver know
> >>>>> its own status.
> >>>>>
> >>>>> Thanks
> >>>> indeed, the status register is there to inform the device about
> >>>> the driver status.
> >>>>
> >>>>
> >>>>
> >>>>>> If we need
> >>>>>> to reflect and control device status, we need something else.
> >>>>>>
> >>> Thanks
> >>>

