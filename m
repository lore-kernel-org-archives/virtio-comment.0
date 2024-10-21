Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0F1F4FDA
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533499; cv=none; b=Hw4O16sbwkLGQu4KDqobgr5O2wFMZtOKyHLNITvtvaFPgrm6VB54OhPy8atFAHdC31dTER562t0puhx8FcPnl4JIGPru8dQ3P9v/RX6MLcyb/YunOQaotLNmrY2kxzCE/7w4qwDrD5igr4RCc51WkTVgecjqZMLQVzrGIWx4CJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533499; c=relaxed/simple;
	bh=ZwsObqGq6jU9lZYB0K16LId4AagQEQJaaRWVoa5zUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AJvFRNzkYOiPF8qTtkrxys9KnrjsoQH3QFNBRRh/A4fV9OwShdTrvEUBxZc01hl9tuV6zRn7cEIsstQWb1w4LFzKoaVu8SVAqwScL8KqR6QJ/7lqcWUYL1J6omzqWhIKuTuBABvzs4AgpTh3mCVQCM5XTsKl6iHsPNRPhk0wWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QL8oF0Oj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QL8oF0Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729533495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbHG1aiIa4D5I/U1b80jV0cWoGDmcwjBQWbWEU2mG/g=;
	b=QL8oF0OjPwqVxX24gDWHbhOd3kQTkvtCdwvts4lxONF+prMFMykCsMVA5Dc5yvHfFHJZmr
	cOk7tZOcGT0HM/PbidhjnyjeyO7d1Nu23CH3rSMkn2TtiJXJFrS0bCZ45RcfrlwxYwdTSi
	VAzNBl5ifCHcl9dSaj7GkYfQsSxvNlU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-HRQ2ZA_9POi0cMLgGiXJgg-1; Mon, 21 Oct 2024 13:58:14 -0400
X-MC-Unique: HRQ2ZA_9POi0cMLgGiXJgg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42ac185e26cso38634055e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 10:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729533493; x=1730138293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbHG1aiIa4D5I/U1b80jV0cWoGDmcwjBQWbWEU2mG/g=;
        b=k6nzyeERK86gxPS/TnaNJb7qeofsW/Nmoh5Uq8H5LgY2zjG6WP6tDj2yKUbrHAw+PR
         1Vi3fHVutkhyk36e9gOkRg47o7YizWOdU3rL1uSj9JLvGmA85qJDsxPOfYtgvuXVnneY
         GZoe7bvPsCAE6A66ZLi4WN8BePZzr/mF6C5A7V8WeKNucr1P0OjJK2aBFDJf1qSkiqh3
         auYSYTIc0KSk1/pvox1fY1Z7LvLhGRRTmTt54L0eOoTn7lF/xOwtNABkM6pOWYPZyY7t
         G6p/StseAB+Ro+rUpEneEnYT9NrAxEljizUGp95sIrfT44dZ2n/tetpx3dqtKGEfETHT
         JRYw==
X-Gm-Message-State: AOJu0Yw8z7tI/5QNNzCRf9QY//4OwtPFN7JOMXxs5Ih+QZ7BA9LtAR08
	fKr8EmyL7G3Vja9uu6AHYJSPaRRKnM3WgrHcn8dGwfxlSnUlZTYUwpsc6r27NNFw+PGrV0/NfpQ
	fXoNDmc6hhkhbpi/J7G1n3jhyb37VeByRlYd8HGsSBdO5KrPZACb5VjbCHOGnpHKm
X-Received: by 2002:a05:600c:8719:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-431616331ddmr91340085e9.7.1729533493350;
        Mon, 21 Oct 2024 10:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESfRXQMsUSv0UlpU2nKpzpf1wLriLnHYsMSg6X2UL1iBuWRlxufBEfy9+UC2kG9BCJ8mV2sA==
X-Received: by 2002:a05:600c:8719:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-431616331ddmr91339925e9.7.1729533492972;
        Mon, 21 Oct 2024 10:58:12 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb4dsm4812034f8f.97.2024.10.21.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 10:58:12 -0700 (PDT)
Date: Mon, 21 Oct 2024 19:58:10 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH 2/3] device-parts: Add device type specific raw selector
Message-ID: <ZxaWMkY2vGLS251Y@fedora>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-3-parav@nvidia.com>
 <ZxKJFLT5Ewn5Qhf/@fedora>
 <CY8PR12MB7195D4B28AD9BD2944926644DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195D4B28AD9BD2944926644DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 04:52:31PM +0000, Parav Pandit wrote:
> 
> 
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: Friday, October 18, 2024 9:43 PM
> > 
> > On Fri, Oct 18, 2024 at 04:17:40PM +0300, Parav Pandit wrote:
> > > The subsequent patch defines the device-type-specific parts. For these
> > > parts, the raw selector format is defined to ensure that each device
> > > type can specify its format accurately.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  device-parts.tex | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/device-parts.tex b/device-parts.tex index
> > > e59c0f9..ee743c2 100644
> > > --- a/device-parts.tex
> > > +++ b/device-parts.tex
> > > @@ -21,6 +21,7 @@ \section{Device parts}\label{sec:Basic Facilities of a
> > Virtio Device / Device pa
> > >                          le16 index;
> > >                          u8 reserved[6];
> > >                  } vq_index;
> > > +		u8 device_type_raw[8];
> > >          } selector;
> > >          le32 length;
> > >  };
> > > @@ -77,6 +78,9 @@ \section{Device parts}\label{sec:Basic Facilities of
> > > a Virtio Device / Device pa  only when the \field{part_type} is
> > > VIRTIO_DEV_PART_VQ_CFG or  VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
> > >
> > > +\field{selector.device_type_raw} is only used when a device-specific
> > > +part is utilized, with \field{part_type} ranging from 0x0200 to 0x05FF.
> > 
> > Why is important here to mention the range of `part_type`?
> >
> Not a lot.
> If the rest of the text about device specific part... is clear enough than we can drop mentioning the range.
>  
Thanks, I just asked because I though I was missing something.

Matias

