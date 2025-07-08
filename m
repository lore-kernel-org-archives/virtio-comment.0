Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29C10A1F
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961995; cv=none; b=YA/wcrYCCIyT5LgDNx1608GOifeFVQYzlI37bOluLgfoKqgk3pPZp3MMavKBcTb6/Wp/pfwlewhi/75o3v7lI0I/TXKEWRR9U9mM6Rr4/97qsU6kCRsFe1ma8NQ5pGnqSWaDZs5W2lU8W/kacdIgSE9N59/MyDsJRrCo8RnjukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961995; c=relaxed/simple;
	bh=xx0RQCXEXRrCoejYLTOL6824vspV2kPR/slRAVPuhjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g1YYIyiqGeZIekjYtPi2cWTchZi5VXG/WB11ALe24B9CDPjqIyAaVe4S/Uvym/Nvo4itVZWDTr0m1SYXg6MGa/nM9/0S5cSlev46jrMSntBYTmOtwd/AeMa374zQYyYtPPfRmdTk0VDskPYYhKOnz3kolNA9Ou77VElwUbj652M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SkkujO3a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SkkujO3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751961992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CvACQVc18P8BHRjirAq4MK19keL9y7LP3DvUQw7Hhx8=;
	b=SkkujO3aBA8eZLDxMHPXMYyZcvdbaY8MeQUA3AGAecY69OiiHe7vdQZ5Rcj930hAjyiY1a
	WHuDAM/mHEu9GzMdwfdRO/LU64fwpTUChmP2ETDJO1TJ6pz3Jm0AkwQy8yYZ4soVyhGE4s
	bDN+6v5FXpM4kR8ZI+Upw37dvAuOatA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-VVBmqWG2Nh-cKLSDN5D_Iw-1; Tue, 08 Jul 2025 04:06:30 -0400
X-MC-Unique: VVBmqWG2Nh-cKLSDN5D_Iw-1
X-Mimecast-MFC-AGG-ID: VVBmqWG2Nh-cKLSDN5D_Iw_1751961990
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1788508f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 08 Jul 2025 01:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961989; x=1752566789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvACQVc18P8BHRjirAq4MK19keL9y7LP3DvUQw7Hhx8=;
        b=N334IPc4+aDYoFR4QzDqS2qReGoda9VCPRr9Ql1yG5CdJfvG7LmyZiT4b4HxnKGN18
         PG2pcznJUiMYZToA+r9gfbnx+ZUDGVojubzN0Lc9h/UNeNrPfgMboYZrFJ8UP1USi4HC
         RiZc4kxvDGc080HdEEOOGCh81ZDRniwSteJmRSU7OKY7FLZdzblRHzN7YaZWMDLTe+jR
         nxpoSkKTm/v5bPPx8yUHki5pmTdjeuX91k1vtNosGga9pmGy164pDksorNZrPVUZ9Qzs
         nFaHLBpM753Bsx/UxUjszhwHQRXI65+Q5JxBL3zUXnwUj/13m1MMpm5y5bogZ3FSVo5T
         2wuw==
X-Forwarded-Encrypted: i=1; AJvYcCWQYBSKsnz0moBH+S2nVe+BNSP+NZStBekVeboiUHL8wqlg7ZWxdlBBn4oy45Ijfl5wiX/XL7GfpwLQXYPOrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCBzCwemOLReFsPss0tDeQAqm5zcv0mBqdS+DkGK/GPryl7clE
	RNOJvMIBcD/aSvPA9INgT45d8hDklep+vcdUAEdGyvDTa5ekoM6hkfB9S7JOAXG0wlmEyHkKrNM
	03P2b97fCWM2tbfUJK4lOQAh19VqLhB6wUJihNEl4n/LTNHlZQQFJNxjEn19PJ2zy+yJQ
X-Gm-Gg: ASbGncvgiqQRxPnzMXDm7ZGI3JE0G3Tcc34kcLk6aBf0IVWELY8F5ItsaZVDlPzJ/d7
	rMKu4uR05rzjK03Z9OVpPqDnYsD2i7LWtqeE8Hj4SMIP0EZLsUXq31v5usE/tS0KEcuZKt1vMP2
	BfSDbmnRHZtBZXFaJmdRCgCweitQd9eQ0Hko5Hz2BMDC/rgrM8deUD8KuNxeJAx8DkzAO/ZSOOJ
	NX00f/pfu3AWoxfv6xVXw5/pNAL6qDGDQ3bzIUGdkGfvi2wC/emTdUTq9ni5J92+cJMRkMqq5Hy
	rwb1TL5Bt6qBrexX
X-Received: by 2002:a05:6000:4601:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3b4970118a3mr9177449f8f.4.1751961989471;
        Tue, 08 Jul 2025 01:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHTSZ4cKL3lgb/kmY+X5b/DML2YcbjYNSGo8yaIlMT7K337gG46RSEqpkPqKUca0VGQWyaA==
X-Received: by 2002:a05:6000:4601:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3b4970118a3mr9177423f8f.4.1751961988922;
        Tue, 08 Jul 2025 01:06:28 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm12539152f8f.35.2025.07.08.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:06:28 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:06:26 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"slp@redhat.com" <slp@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] virtio-gpu: Fix missing driver conformance file
Message-ID: <aGzRggamdIHMnHnR@fedora>
References: <20250614181302.277794-1-parav@nvidia.com>
 <aE/yNzLLs+lZh/we@fedora>
 <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wOpsoX-l4CH6rSOXiBgoXjzMKCuYJVHmRS8DMAkY-3c_1751961990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 08, 2025 at 06:56:26AM +0000, Parav Pandit wrote:
> Hi ,
> 
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: 16 June 2025 04:00 PM
> > 
> > On Sat, Jun 14, 2025 at 09:13:02PM +0300, Parav Pandit wrote:
> > > Cited patch in the fixes tag missed to include the driver-conformance
> > > file. Add it.
> > >
> > > Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment information")
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  device-types/gpu/driver-conformance.tex | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >  create mode 100644 device-types/gpu/driver-conformance.tex
> > >
> > 
> > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> 
> Can you please raise the voting ballot for this patch which fixes https://github.com/oasis-tcs/virtio-spec/issues/223?
> I didn't create a new github issue as 223 is open and its half written patches are not merged.
> It is fixed with this patch.
> 

Why is it still open if the ballot has been voted?

Thanks, Matias

