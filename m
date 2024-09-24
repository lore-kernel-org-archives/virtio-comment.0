Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927C185928
	for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 23:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219231; cv=none; b=gi+T1hWiHdvPsrQbIxtMnElDIuywmqDhH0TPEMfQVNNpnCMekE3BxzGWu/Kijy28NegkBh8lYPyzWWaB+x0HOq0s/vKCP7+u9d3QDrlq4JsAW12tSsvh8Vj0KAlVJFrK6O5iZ8Usk3WAO6tXejx7LAEKofLdGtKlmwhpQ/2Vsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219231; c=relaxed/simple;
	bh=YTK2Yz4to9JkZs/CSpd+wKnbr2RFwShHwKYt301nU5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oxbKuoB0OkWdJCzcm01wNH4QErcIgriBjh3auKBU/TrWVJ6Vah1aDr40NxF654cQTfr3A2MBSwNHpUI4cDQTUwZAy6ITIrtvMR/qgsXhMXFMCGy1Lqup+E1sHyjQ09yfKeo3jVFAxl9VTAtXFjyxH2RSnQhUkj5Rwd9yxTvGf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MmBXXLYt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MmBXXLYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727219228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FTTCbG4ptlA7IHsJgMc97vJveE9/YOWm98TUjtsf90=;
	b=MmBXXLYtGfcEBzKcjjokxtnRX+II86ThP4PGB2AvhUJaKKx2adIwFTpq44XJaiklS5x8Cp
	KuPMZpHe/Yyvu6cgaxGd6xhf6ZhRQXQKdmiEkrydtsGrW6BFidGSgVMVG68OdDNYJVyuOI
	8+5vkDOo3D6bQL8FkvMWX6j8gw8Gib8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-9OvnsO5zOAmVKDwh3Attjw-1; Tue, 24 Sep 2024 19:07:07 -0400
X-MC-Unique: 9OvnsO5zOAmVKDwh3Attjw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-374c3402d93so3373860f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 16:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219226; x=1727824026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FTTCbG4ptlA7IHsJgMc97vJveE9/YOWm98TUjtsf90=;
        b=lA9x6jTxIT1PG1bdhofbqxExNWavPBMO4GBlTUx89pjvYP1omfLcjp/MfbJuefT7Wv
         yLpzqNu8S4Ylsb034Ftl/JqDhMMCjFlNoqLMApvy/9aNhyL53G424kBZleD9fcX2f2ym
         qfN1RMY1IXT0JdLhvx0ne5iD+XV0FoN4T0aE6v4rjNirMCXSkd9hVR/98x/Wne2P0Hn7
         xMBnRAy4XKdjbZYDpAjBBm4m/CTUgrB2wRmMm9se8zHLUkjFDsEErQbG9xK2jg7wcdMF
         coiZhSKLrPT9PQ1MKyRemClTZRK4dBizWMHCo8oNID4Uo/JcACCj+DyqVWYwegwqYNgO
         n6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUY1r9bzN3s3pYlb23dfEY3LFYF+rXNi37lZtbYC6UlJGS/LZ+wZHQ2wTHO6ig3z/NlKVComXoZDKh36CJGaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNnMAjrfIt0GuYgmsLhG+tOZ7QJ1C6NBOynLkgExnTQeySW6Yg
	Q+JNiV7afK4ZGDmsUfFafKekMjsuUNyEzpoqsORgfY9hzw0Q6rdYjDRq2R5YIUpPvxegctk2LAx
	aHM3WIbmX17NIZLq8Z0xGLB9kdMu97hvDPmfcf2smYS9JwzNB9QsCkBVkrdaRikTW
X-Received: by 2002:a5d:4608:0:b0:374:cd32:f84e with SMTP id ffacd0b85a97d-37cc2477047mr485035f8f.29.1727219226064;
        Tue, 24 Sep 2024 16:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGV+TWU0rxWJcxyWG2uzgY9226rZ6drtv3qx4+IfeP7Gcs7hzJfQq3/b1/v6gdbI23gBy/ag==
X-Received: by 2002:a5d:4608:0:b0:374:cd32:f84e with SMTP id ffacd0b85a97d-37cc2477047mr485025f8f.29.1727219225636;
        Tue, 24 Sep 2024 16:07:05 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7405:9900:56a3:401a:f419:5de9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a9eb7sm2573653f8f.2.2024.09.24.16.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:07:03 -0700 (PDT)
Date: Tue, 24 Sep 2024 19:07:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240924190643-mutt-send-email-mst@kernel.org>
References: <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
 <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
 <20240903053418-mutt-send-email-mst@kernel.org>
 <67a32abf-daaa-4afc-9a74-3ea6b1e827a4@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <67a32abf-daaa-4afc-9a74-3ea6b1e827a4@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 05, 2024 at 03:27:25PM +0800, Zhu Lingshan wrote:
> 
> 
> On 9/3/2024 5:36 PM, Michael S. Tsirkin wrote:
> > On Tue, Sep 03, 2024 at 04:51:18PM +0800, Zhu Lingshan wrote:
> >>
> >> On 8/30/2024 11:10 AM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Friday, August 30, 2024 8:07 AM
> >>>>
> >>>>
> >>>> On 8/15/2024 11:07 PM, Michael S. Tsirkin wrote:
> >>>>> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: Thursday, August 15, 2024 4:23 PM
> >>>>>>>
> >>>>>>> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> >>>>>>>> That means, PCI HW needs to return suspend=0, until the device is
> >>>>>>>> not
> >>>>>>> suspended.
> >>>>>>>> In this example, the device cannot build special circuitry to
> >>>>>>>> answer
> >>>>>>> suspend=true within 50nsec, or in other words building special
> >>>>>>> circuitry to return suspend=false is too complex for the slow operation.
> >>>>>>>> If this understanding of burden is clear,
> >>>>>>>>
> >>>>>>>> The proposal is, can you please extend the interface such that,
> >>>>>>>>
> >>>>>>>> 1. driver writes suspend command.
> >>>>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
> >>>>>>>> This is
> >>>>>>> the default value.
> >>>>>>>> 3. When the device completes suspend, it changes the polarity of
> >>>>>>> suspend_status=true.
> >>>>>>>> This has two main benefits:
> >>>>>>>> [A] This will enable software-based devices to write data to slow
> >>>>>>>> files and
> >>>>>>> does not have to force VM_EXITs.
> >>>>>>>> [B] It also enables hw based devices to not build special circuitry
> >>>>>>>> to answer
> >>>>>>> within 50nsec, which can get very complicated for tens or hundreds
> >>>>>>> of PCI PFs.
> >>>>>>>
> >>>>>>> I read this several times, and I don't understand what is proposed.
> >>>>>>> A special register for suspend/resume? Is this the difference?
> >>>>>>>
> >>>>>> Yes, a command register for suspend/resume operation.
> >>>>>> And device_status new bit that Lingshan defined returns the status of this
> >>>> operation.
> >>>>> Ugh, it's all quite messy IMHO.
> >>>>> We have 4 states:
> >>>>> - operational (resumed)
> >>>>> - suspend in progress
> >>>>> - suspended
> >>>>> - resume in progress
> >>>>>
> >>>>> What I'd do then is a two bit register.
> >>>>> To suspend:
> >>>>> - write suspend in progress
> >>>>> - re-read, waiting until suspended
> >>>>> To resume
> >>>>> - write resume in progress
> >>>>> - re-read, waiting until operational (resumed)
> >>>>>
> >>>>> How does this sound?
> >>>> This can work for sure. but is it a must?
> >>>> I mean, the driver has its own knowledge of how it operate the device.
> >>>> When device presents SUSPEND == 0, It know whether the device is in
> >>>> normal operational state or in the progress of SUSPENDING.
> >>>>
> >>>> But if you think we should add a new register which applying for all
> >>>> device_status transitions, NOT only for SUSPEND. we can surely do that.
> >>>>
> >>>> Thanks
> >>> New register beyond suspend+resume can be useful too.
> >>> For sure it will simplify the suspend + resume flow.
> >> There should be no difference in how the driver handles SUSPEND
> >> and other device status like RESET.
> >>
> >> If we want to add a new register, then it is not only for SUSPEND,
> >> but for all status transitions. 
> >> We need Michael to confirm we should implement this new register
> >> that apply to all device_status transitions for common interests.
> >>
> >> Thanks
> > There is a difference between SUSPEND and RESET.
> > RESET is not a state. Thus a single bit is enough to
> > signal "reset in progress".
> >
> > I don't really see any other transitions that can take
> > a long time. We can start with just suspend, and
> > extend it later if appropriate.
> Yes, that is what I mean, the register should not only work for SUSPEND.
> To be more specific, the definition should be:
> 
> // The device_status is still in a status transition
> #define DEVICE_STATUS_TRANSITION_IN_PROGRESS     0
> // device status transition is done
> #define DEVICE_STATUS_TRANSITION_DONE                     1
> 
> They should not be defined as:
> #define DEVICE_STATUS_SUSPEND_IN_PROGRESS     0
> 
> Thanks
> 


in case we add more commands down the line? ok, sure.

> >
> >

