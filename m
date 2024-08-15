Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7B1A00DF
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734465; cv=none; b=XxgX70Z5WqPSBM7hqD+f99f7xgnN5ygJ84dQwofY9BpD512Cl7LO5XYe00kXngqkWiBJTzgZwgppbfFw/FR61vkrd9XEJk24DHfp0gOvqS7RQTnUe1SC3EhQmUL9CmSm2c7QAhXtKVlr+rp6KimFXhCUNVYPq90zizVS8S9Ux7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734465; c=relaxed/simple;
	bh=kwQWQOe+mBFDuhyVD3TZhIpYmjMWDmi1glHAcFONnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GrznRWwO5qETpGbrS8zyAs/Bok4LYLkc+vwbeXdPjVU5myksrkBtDKQ3t1W4VWbcWb6kWw0YJdFOnPGqR43N4Y4wA7IZQwjVGci/+qbTm6o5xwqh7nMbD/+q9JM4kgoZwvCLb2lRoAECsctlrISWSzzh3lF6dgkgSjBCPkse9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XBDVsVC+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XBDVsVC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723734462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+B29hihnPmhMB0LKxZeq+sB9WuzIbHVBG+jJn6Oosdw=;
	b=XBDVsVC+j2mACY1e+A49JVzDbZk1ydKNufWaG2bUnA7Rw+8gtksOuhpCDPMYOXH+TLRjPr
	EgsdHSmiKXlUFw4y7DZcB4WNblMAZ76Qe0Vazw2hhgxJFAses+Nu/9wg3ZX4iKLbzdWWR9
	ccUaJC8X+2CBfACmtQgjaxBfleJm6BQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-xW7nSXrLOPi1_c1ivq0PMA-1; Thu, 15 Aug 2024 11:07:40 -0400
X-MC-Unique: xW7nSXrLOPi1_c1ivq0PMA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5a30be1c5cfso1042832a12.0
        for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 08:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723734460; x=1724339260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B29hihnPmhMB0LKxZeq+sB9WuzIbHVBG+jJn6Oosdw=;
        b=dmJTndl2N9m1NsnJZdf17Pkx7YvVZv5wVSkm1cykhN2tj0H3+Bpfgu9TDLr12S49IZ
         qotYOOo9NmjyVPLhMeVPvd7W+mFsWT7fvq2SRUJ0Q0MUwj1CVtq1r+5iDO2M4MvcNQGh
         7TGjfcl0wcrvAOkEH88KsXSPr26tL9z4++xRpGtOM6MIoFpnt/ur2oTDIMDJQ+9pyBhX
         mzYY00RvUu6/Dh6AxzKCv2piVnw4YdsjahYc11SeuTgFoRYN0pLAggTnpbSIx9rcwXes
         pj0xG1hh7/2XHQT8BlQ65wVeYRQPZ/YXOk0ZYoWets+7eEC+iXv5LEQZFMjgLqeSUHg7
         9KKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfJz8INMIrI8O5Zc2WTFpG3S8OCyLFsPGRx6gbWO/CWKnuFziGCn/w+DZpVaG/9E5JkTX/SFjNUsufur7m10pHk6uAsC2800jJb6Y9/PY=
X-Gm-Message-State: AOJu0YzqFZHw/H8oA82dhsLV0cXZHVD/IDivRn2CgYGJERQ7gvjOaaDB
	ddRRCoNMtGIZWd0OA23HEcURKu/l6ykVuGlbJmxFRjKquWoVSyZbori8wwn7aSyawzDneIXH2NX
	7oHsB0vkkbM1t1kpevqLFuVgn+Pun34VWjryRoPAEremkLlTeYYXTihsZ94qkPyQK
X-Received: by 2002:a05:6402:358b:b0:5be:9d95:390f with SMTP id 4fb4d7f45d1cf-5bea1c7393emr4363961a12.11.1723734459535;
        Thu, 15 Aug 2024 08:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERwSaXjSPjsr7czYt6uYiyJNZtKf9SW7ujDaYNEY+l8xJXX1ndBQVZX8VReaN0okF92S+e2Q==
X-Received: by 2002:a05:6402:358b:b0:5be:9d95:390f with SMTP id 4fb4d7f45d1cf-5bea1c7393emr4363933a12.11.1723734458691;
        Thu, 15 Aug 2024 08:07:38 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe29ecsm1000610a12.17.2024.08.15.08.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:07:37 -0700 (PDT)
Date: Thu, 15 Aug 2024 11:07:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240815110443-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, August 15, 2024 4:23 PM
> > 
> > On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> > > That means, PCI HW needs to return suspend=0, until the device is not
> > suspended.
> > > In this example, the device cannot build special circuitry to answer
> > suspend=true within 50nsec, or in other words building special circuitry to
> > return suspend=false is too complex for the slow operation.
> > >
> > > If this understanding of burden is clear,
> > >
> > > The proposal is, can you please extend the interface such that,
> > >
> > > 1. driver writes suspend command.
> > > 2. driver reads suspend_status, and receives not_completed=(false). This is
> > the default value.
> > > 3. When the device completes suspend, it changes the polarity of
> > suspend_status=true.
> > >
> > > This has two main benefits:
> > > [A] This will enable software-based devices to write data to slow files and
> > does not have to force VM_EXITs.
> > >
> > > [B] It also enables hw based devices to not build special circuitry to answer
> > within 50nsec, which can get very complicated for tens or hundreds of PCI
> > PFs.
> > 
> > I read this several times, and I don't understand what is proposed.
> > A special register for suspend/resume? Is this the difference?
> > 
> Yes, a command register for suspend/resume operation.
> And device_status new bit that Lingshan defined returns the status of this operation.



Ugh, it's all quite messy IMHO.
We have 4 states:
- operational (resumed)
- suspend in progress
- suspended
- resume in progress

What I'd do then is a two bit register.
To suspend: 
- write suspend in progress
- re-read, waiting until suspended
To resume
- write resume in progress
- re-read, waiting until operational (resumed)

How does this sound?

-- 
MST

