Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97C21858D
	for <virtio-comment@lists.linux.dev>; Thu,  8 May 2025 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684921; cv=none; b=FWa9kTQfxrhnsE4IuTsFd9A8PBLbjzQVbQFqpfSAnaF/WYJK6jtm/tU+UQ1ubsx/3X4ypgn3URfHdbcdGQXBtl52g3QDxgcTPTD20QEhwYRzUUnPF4yJzMbwfSwPHBOfMqKNbFkCFMEn2jom4nlxq2tfzC0ZARgys6lHr7zC7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684921; c=relaxed/simple;
	bh=OnEDNpQCTAdJgJdiZJT/KPf4U2QiMKRPGVHklb75MgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mO0945W6Ng8GL5Gl0pO1nbf0o9mnkg6Z6CI+DCDJOe82dxh1z42aWqxTh60w682zS6GcZomtqBBn8XCZ0UpT0NEvBfow+SSRXZt3zPZupkFnkk6CXL2MXTK/BHv1z2DHBmcWu5lLovUXf/HXg0/iKxvoSH7uFpMiIli1bGEja3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TOVXmMG5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TOVXmMG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746684917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P7OBzP6mHf9NgSr7FulmLRgSnecuEav2J0N3Hks69Ro=;
	b=TOVXmMG54EPQuIHxNkp2XApVCcd19+jd2SvX9yJCNkyTgH4xRSBlLj2yiCdWFYsexalB7F
	fddEhjfATbmeZOk7Y8MUC97ejiDf7p0VZxHSIwWUkDywt9uziTTPy8BkgWzOSjIjhGmwKT
	H3k714u40kwi0WdNch/7j+x45B6grks=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-uIOHzCj8Nca1-SAJa6BPrw-1; Thu, 08 May 2025 02:15:16 -0400
X-MC-Unique: uIOHzCj8Nca1-SAJa6BPrw-1
X-Mimecast-MFC-AGG-ID: uIOHzCj8Nca1-SAJa6BPrw_1746684915
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b6cb5606so203104f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 07 May 2025 23:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746684915; x=1747289715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7OBzP6mHf9NgSr7FulmLRgSnecuEav2J0N3Hks69Ro=;
        b=HI6wM1PiyOBESC7dcqXRoYHAsFchNPmPUJR/jhPYOB2wVjCuZH7wF4v/jQcPX5//pN
         6D/MuEJKqF5KlqduRK6dHuaZ6pi9riw+BLvKk8W/OPe56ZeH7BJ9CRtf8O/HPD/s2OWu
         USrh5ZXKYnLLr2uMQe7QukYuhzkLWaYJ9GHweZ6RxnugrZWEuqljOllenmCrLo9ci9xq
         8eMIYdKtNmIHKUvVQNgeYumqnh9ngacPoyZyEnhR7NWnIMOGpnrxyEFcPHFuI5suQhWU
         /gKcbtsobrmiJJk3D4KOd+DQxXI24vIEp4EgRl9tmQsLrGr66Y+XOUcln0NG2bUGOT+N
         VxIA==
X-Forwarded-Encrypted: i=1; AJvYcCWKal4J96YQbrpdm2suudZOzcaIFtXEeDv5YWP/OIB9zGaswniHByLe/UwNrZtwGv5V+JVgKWcJ/D/MH9arfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTSHrLS2O6OFzJs3frgSaF+WAMPqtdeIABKwg03ojIG1zPqZE7
	PL2A4fTD+K5MFXS6bwNpD4YVzM1tl65vAdVZj/YxGIRE4W+bZY4unn1QmonKliIeAw/TVUdjcZo
	MeWAl5wy1g3DQl6newuDohMy0KV6mSXnSCGwoamZTO5PgUa1wIErFYxoI4tVooQrj
X-Gm-Gg: ASbGncu4jhDKruwwEWYcVtTf70IIpUTotoptrIT9u9aAzmPQc4RhgiXh/wU9xN0Hjil
	HLyLU78GPYuRS2gN8Eu9J6VPtD0e+ZMbgCNdJ/LaSIE44tka74LG5woaeJsQaGFGsDkbj1QOl9S
	P/75PCqT+3YTp0Im18OE16C3AieAARkv6cOfMXnH10dO9bRXSIYmbfadfk7QYcDZgvgQMN0QDrB
	xq//UM5LUNhosDO2c7ftniFMUE+ekbQr4ilWXY9WVu1AxC32GKaHRyzqAiiK1v+iEzvKju7Q0k2
	tlxB1A==
X-Received: by 2002:a5d:5f45:0:b0:3a0:90be:fe79 with SMTP id ffacd0b85a97d-3a0b4a02954mr4887347f8f.9.1746684914977;
        Wed, 07 May 2025 23:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEknqbbcsHtv0BE1A+5fUemcE7zlTFrq11Ro6UeuyIZKv+INw+5pa2Q6L0ZThfdqfgyGFNn4Q==
X-Received: by 2002:a5d:5f45:0:b0:3a0:90be:fe79 with SMTP id ffacd0b85a97d-3a0b4a02954mr4887323f8f.9.1746684914601;
        Wed, 07 May 2025 23:15:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b501a197sm4829456f8f.76.2025.05.07.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:15:13 -0700 (PDT)
Date: Thu, 8 May 2025 02:15:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250508021358-mutt-send-email-mst@kernel.org>
References: <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
 <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <20250506035434-mutt-send-email-mst@kernel.org>
 <PH8PR12MB720860F36BE0C9E7C1C35A0EDC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
 <CY8PR12MB7195FC058918DCC17E56FF80DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <2c880e08-9d92-45ee-be92-3bfc758e928c@redhat.com>
 <CY8PR12MB71953CA2DC3CD5608BA54D02DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -4MV69VRrKXcGEHx8udmx2yTQGjN0xj2vOVHObXRALc_1746684915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 07, 2025 at 11:57:26AM +0200, Paolo Abeni wrote:
> On 5/6/25 6:20 PM, Parav Pandit wrote:
> > From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 9:10 PM
> >> On 5/6/25 5:00 PM, Parav Pandit wrote:
> >>> From: Paolo Abeni <pabeni@redhat.com Sent: Tuesday, May 6, 2025 8:09 PM
> >>>> On 5/6/25 10:56 AM, Parav Pandit wrote:
> >>>>> Are you good with #3?
> >>>>
> >>>> I'm sorry for the latency. Let me double check to avoid possible
> >>>> misunderstanding; #3 means:
> >>>>
> >>>> - 0 to 23, and 50 to 127 Feature bits for the specific device type
> >>>> + 0 to 23, and 45 to 127 Feature bits for the specific device type
> >>>>
> >>> No change in above feature bits.
> >>>
> >>>> using bits 46-39 for UDP tunnel offloads and likely bit 45 for
> >>>> VIRTIO_NET_F_OUT_NET_HEADER.
> >>>>
> >>> This also to use bit 69 as proposed.
> >>>
> >>>> The VIRTIO_NET_F_CTRL_GUEST_OFFLOADS mapping should be specified
> >>>> after eventually a new offload feature will be defined using a bit >= 64.
> >>>>
> >>> No. UDP tunnel feature bits 65 to 68 maps to command bits 46,47,48,49.
> >>> This is the only description change in
> >> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS command.
> >>> Would it work?
> >>
> >> AFAICT, yes, it should work.
> >>
> >> But it will not avoid the immediate need to expand the virtio features
> >> negotiation above 64 bits, with the already mentioned complexity.
> >>
> >> I would preferably avoid that, if possible: I restarted this thread with such a
> >> goal.
> >>
> > In that case we should adopt #2.
> 
> Do we have quorum? Should I send a patch?

I'm curious how hard is 128 bit support, gimme a couple
of days to try and maybe post a patch, just for comparison.

