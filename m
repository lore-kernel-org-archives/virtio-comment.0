Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA972623
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963302; cv=none; b=O7Cy6Ag2cQ5vICEGoZEtqzguslWku8ZoDmH5pBDWv8iIUKLuCZM2xKTBiS5Lq9TyDght7xvL8rCrVFqOmrecf6zMyST32wHhPSlCKcUJ274fDaJ2A9z3Z1Tiz3HXc1tnzyu1y/3wL5cer7n593+AdWWtB/uxqLmP6uqI52H0F9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963302; c=relaxed/simple;
	bh=WU5CFbauNyqc0xfd3MEjjqcAnmrRzyvEsarCnPIpvR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XS6dR0NpKhxsHN/AzZI1Qyl5PthdX5SLxXuwasWpZV7J6Yhzg8pLcBM+QsbXbignfACzHe53IfG2Csrp59G48SGcvxNifVVSW9JIuihcpTeTl77pXiM+PGpqYlUU0jPKd5DJLdTF11uhWvGQ+WinjLrwo4jPzgQWqwmE+Lf7onM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1evhfyD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1evhfyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751963299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CllzoCMvwjg56di8rD1L5jTsrC/Hio0u1A7kk2inTpY=;
	b=Q1evhfyDSZzGgeQz48FeXJPwn68TRHr3yg6K4ekz3J2IOBBIPTYbYM7U/e8g90Mtgoymvu
	PbiAo964jvhIMhNlrDgd8eTvgMusGvrP236hbPdg2p3CFtbeAq9bE2VuiEpQ05bN1YggEe
	+had1ifRpLVtebXVJcO/EBIPhVtP8lU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-A3xrHcs5MRCtJt4MLxLASw-1; Tue, 08 Jul 2025 04:28:17 -0400
X-MC-Unique: A3xrHcs5MRCtJt4MLxLASw-1
X-Mimecast-MFC-AGG-ID: A3xrHcs5MRCtJt4MLxLASw_1751963297
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so1483166f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 08 Jul 2025 01:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963296; x=1752568096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CllzoCMvwjg56di8rD1L5jTsrC/Hio0u1A7kk2inTpY=;
        b=j4DqWyjWwpTn49JGTXhKbHK8naZmyJySrKfCdhprjadCbmYqZ8zB9AppnFVIAYq7zR
         2PcXh2c2TEBtCqCF3uCt6Eag8+JBRQ4yf+O3pu7B4GSLGqmDSnVRRzREJ+5ch2IhDDnz
         RQH7cYpw3hVCyKAJRNoCIUIbc8QS4mIBH/6YvuBA59QzDV0z5VjJcntzax3/RXcX7k1s
         MvvgST0+bNpB93LZ+BpG8sx35F9fQzVJ3DToQtWfm4CpYUKVC/yyIAKyv3vPxSM0421V
         HyK9CPsX6oRPH4EHZMfL86eGdzVnO/N7VEUJxU5QNIyhEgknPczqGiYAjVcbXYpv+IQB
         RTtw==
X-Forwarded-Encrypted: i=1; AJvYcCWkFSAsrYxkQx3Gd3o+T6ICcGiP1X64/vWEpQ8ZFWVtatC2v6FsVrMlkM+pumoKp9Krx0Xz+vRSDGzLxcrr6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ/8R8Al6KYMVc7gIbEVT4MhgctCTlD+kfPBJo9LPB1BwsPX4N
	GwpJlYI3qcshjihIL6RMa3oHJQKjILBXgFz2GqWhxrAZ63BO2vKMFsOXE5xz7XasNNhP+AKb9bB
	Ydlk3/geGuu68pLxBVVgPRj1yi35tHIIGdBVziVo7we1o/ZSABAcXA6i2qTQ/xMe5bntU
X-Gm-Gg: ASbGncvm+MkR38ztxdS4BXrbnYvGaiSD/bqpyvCCCyjD8Dl7cb2yVljNMG2YcVN4BtF
	xIr3i5wqcStbBIXSmRe2KiQepkqEeZ//95v+8P1zfxifdnSV10ppN4lvVjZ4HXzb6UsPeypB9E0
	HQ6iyHQ41guls+Ti/IRUrL0SgWq1vrtNjZ+4oSg188/jrgxLcW6ntNbR1qAtxV0cGt6rSRlt4Ck
	mENOHQmGfFOVbm0AbxgW1mMbj3tbFRGBL+aQzieP90pp9bAA6+oSpsWx8c0q+Qbhde2XjOcFZVI
	vW5ec6zxhnH70k8A
X-Received: by 2002:adf:9dcb:0:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5dde84890mr1250074f8f.7.1751963296475;
        Tue, 08 Jul 2025 01:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6GaR4NucF2R/si4zDZ92K36bvRkFoshqW/SoacOAyqYWoaLWtaa5CWzFRwgD6BJ/hMElIsA==
X-Received: by 2002:adf:9dcb:0:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5dde84890mr1250060f8f.7.1751963296061;
        Tue, 08 Jul 2025 01:28:16 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285e236sm12338276f8f.100.2025.07.08.01.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:15 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:28:14 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"slp@redhat.com" <slp@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] virtio-gpu: Fix missing driver conformance file
Message-ID: <aGzWnpWZJhFMcA1S@fedora>
References: <20250614181302.277794-1-parav@nvidia.com>
 <aE/yNzLLs+lZh/we@fedora>
 <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGzRggamdIHMnHnR@fedora>
 <CY8PR12MB7195AC481F68F1F828646192DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195AC481F68F1F828646192DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xRh73tLl4mxyIcEiCphzv3f-mkyp2cu3bAHpjGQrFHg_1751963297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 08, 2025 at 08:11:43AM +0000, Parav Pandit wrote:
> 
> 
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: 08 July 2025 01:36 PM
> > 
> > On Tue, Jul 08, 2025 at 06:56:26AM +0000, Parav Pandit wrote:
> > > Hi ,
> > >
> > > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > Sent: 16 June 2025 04:00 PM
> > > >
> > > > On Sat, Jun 14, 2025 at 09:13:02PM +0300, Parav Pandit wrote:
> > > > > Cited patch in the fixes tag missed to include the
> > > > > driver-conformance file. Add it.
> > > > >
> > > > > Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment
> > > > > information")
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > ---
> > > > >  device-types/gpu/driver-conformance.tex | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >  create mode 100644 device-types/gpu/driver-conformance.tex
> > > > >
> > > >
> > > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > >
> > > Can you please raise the voting ballot for this patch which fixes
> > https://github.com/oasis-tcs/virtio-spec/issues/223?
> > > I didn't create a new github issue as 223 is open and its half written patches
> > are not merged.
> > > It is fixed with this patch.
> > >
> > 
> > Why is it still open if the ballot has been voted?
> > 
> > Thanks, Matias
> 
> I dint merge because basic makepdf etc scripts fail without this proposed fix.
> And this proposed fix is non editorial in my view.
> So this proposed patch needs vote. Once voting passes, I will merge the original patch + this fix for the same issue 223.
> 

I see, since it looks like a non editorial change, should we open a
ballot for that? Can't we just merge it?

Matias

