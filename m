Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9B1A0BC9
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356212; cv=none; b=OsLIzpD89H8Af58+MAc6uysLFdcTtZb9jlOTdQCe78q0Vq9KnwJ1qnZi6u5kAPpYYIssru3/dzOaIKVvOecK2PBvXe40DTR9CO2uH9+dvZe3ldFFJ4zsgZHhxpnNFROvEI6O8rowqYSOMBZtBmVOlWgkCO8ibXBgpWEbMDtvvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356212; c=relaxed/simple;
	bh=mXLB93WoOvLbgVxFVDeP7PR/ZWLWObgvxHgKFiwG9rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BN9p6ft7Nr8kABxgfE7d6mvMBqMMD6wgneikz3D3EmtPQn33PharwuEw9UhNE47XPyosI54zJ8jq/st8HQdagBHKNCtV8qxH1KqBZTXaceOqjFY2Y2/vUBccL3vBYoDxOXVtVZpnQanT384wo38PLKk+xVt4Ra488HdQ7vDL+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QgN22+tE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QgN22+tE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zA0AeR5Ulp3FRMXotO0DwVIx2SdmAK5yCsnhNdO9ErQ=;
	b=QgN22+tEDydqa3m8sZmcLC18L3G2aTtcq5pvnuXT7HQKmyLATojk662ReIc1f57ls0Ftti
	i/q7QaSlOP/u73uG8eBgdL5LQvFKMA1u5Xrys5vSGaFUIsvDVOcpqT9qjbGbY9pQAVwI28
	sMbmsiKYqqq+0AzL/w+wNNjNSeHb2gg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-U3FuSNv4NWWe2ewFrShO_g-1; Tue, 03 Sep 2024 05:36:48 -0400
X-MC-Unique: U3FuSNv4NWWe2ewFrShO_g-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42c883c8cf7so7700385e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 02:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356207; x=1725961007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zA0AeR5Ulp3FRMXotO0DwVIx2SdmAK5yCsnhNdO9ErQ=;
        b=pltxSq4WJ1U+pcuq8l5wzEA5MyqeriW/RxXImJvDtV+ow4p3xVdfj03TXO4D4rCoeb
         EhQmNYRo13aCjGFwUMBzz9sRVMTAJfLb0yYCmq/+2yOCCzpa4GPKy/3Qf2WVoEvgV6Vm
         supc4P4qfjJBGZGvnlqLeKeIoyxDiEXwGNIDxWfoHEymF6CS7xoqlOlPIDgjHWNKJS6u
         2h9OKDX+9xjrxlq80SS3Zv4jfQ4E/JRQsfmBrMUC8HCeqPHqQk96rz3f9aGoEaBi2nao
         FwFw0+M8a5Xb/faKq+APyohJTgfaP+iD0Vo7XW+sOR3e+RaY/NsNm/BwpJ5F6/13APTj
         Bs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR0E/I13BPgIRNyi03ViW1STpNJ7id/9vrJQuBFrOSVFvt8Nomm1Ld8GgM7IDeGbqVCg7sWDhcuImZP9sG2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAVv50om+gJEIIP4ycjvDdn/5ytrTLgqm0+7/r2Xf2tPU5dOPd
	4+Vf9UjF0MzqNuOfcUjTFp9sbHLg0Q/pCrAib0IGELiW2ryUxbYsS9+p5lZKgDQWiCo34dykwHf
	CBZYzXcXJVGj20qI5GJ1T1I4jLjQI3304KFTBHhOpsQdeWfRImt9I8pE2aTCUNsWU
X-Received: by 2002:a05:600c:4587:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-42c7b5a8f0amr52218775e9.10.1725356207524;
        Tue, 03 Sep 2024 02:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB8chUutGTRBCCGBNNMwSvo2i+uo1QaJpYCcKeXNqe2YQvD/FkwRLKlcx4U+c1qOG4At4VCQ==
X-Received: by 2002:a05:600c:4587:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-42c7b5a8f0amr52218505e9.10.1725356206625;
        Tue, 03 Sep 2024 02:36:46 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbf00e095sm125229635e9.13.2024.09.03.02.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:36:45 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:36:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240903053418-mutt-send-email-mst@kernel.org>
References: <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
 <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 03, 2024 at 04:51:18PM +0800, Zhu Lingshan wrote:
> 
> 
> On 8/30/2024 11:10 AM, Parav Pandit wrote:
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Friday, August 30, 2024 8:07 AM
> >>
> >>
> >> On 8/15/2024 11:07 PM, Michael S. Tsirkin wrote:
> >>> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: Thursday, August 15, 2024 4:23 PM
> >>>>>
> >>>>> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> >>>>>> That means, PCI HW needs to return suspend=0, until the device is
> >>>>>> not
> >>>>> suspended.
> >>>>>> In this example, the device cannot build special circuitry to
> >>>>>> answer
> >>>>> suspend=true within 50nsec, or in other words building special
> >>>>> circuitry to return suspend=false is too complex for the slow operation.
> >>>>>> If this understanding of burden is clear,
> >>>>>>
> >>>>>> The proposal is, can you please extend the interface such that,
> >>>>>>
> >>>>>> 1. driver writes suspend command.
> >>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
> >>>>>> This is
> >>>>> the default value.
> >>>>>> 3. When the device completes suspend, it changes the polarity of
> >>>>> suspend_status=true.
> >>>>>> This has two main benefits:
> >>>>>> [A] This will enable software-based devices to write data to slow
> >>>>>> files and
> >>>>> does not have to force VM_EXITs.
> >>>>>> [B] It also enables hw based devices to not build special circuitry
> >>>>>> to answer
> >>>>> within 50nsec, which can get very complicated for tens or hundreds
> >>>>> of PCI PFs.
> >>>>>
> >>>>> I read this several times, and I don't understand what is proposed.
> >>>>> A special register for suspend/resume? Is this the difference?
> >>>>>
> >>>> Yes, a command register for suspend/resume operation.
> >>>> And device_status new bit that Lingshan defined returns the status of this
> >> operation.
> >>>
> >>> Ugh, it's all quite messy IMHO.
> >>> We have 4 states:
> >>> - operational (resumed)
> >>> - suspend in progress
> >>> - suspended
> >>> - resume in progress
> >>>
> >>> What I'd do then is a two bit register.
> >>> To suspend:
> >>> - write suspend in progress
> >>> - re-read, waiting until suspended
> >>> To resume
> >>> - write resume in progress
> >>> - re-read, waiting until operational (resumed)
> >>>
> >>> How does this sound?
> >> This can work for sure. but is it a must?
> >> I mean, the driver has its own knowledge of how it operate the device.
> >> When device presents SUSPEND == 0, It know whether the device is in
> >> normal operational state or in the progress of SUSPENDING.
> >>
> >> But if you think we should add a new register which applying for all
> >> device_status transitions, NOT only for SUSPEND. we can surely do that.
> >>
> >> Thanks
> > New register beyond suspend+resume can be useful too.
> > For sure it will simplify the suspend + resume flow.
> There should be no difference in how the driver handles SUSPEND
> and other device status like RESET.
> 
> If we want to add a new register, then it is not only for SUSPEND,
> but for all status transitions. 
> We need Michael to confirm we should implement this new register
> that apply to all device_status transitions for common interests.
> 
> Thanks

There is a difference between SUSPEND and RESET.
RESET is not a state. Thus a single bit is enough to
signal "reset in progress".

I don't really see any other transitions that can take
a long time. We can start with just suspend, and
extend it later if appropriate.



> >

