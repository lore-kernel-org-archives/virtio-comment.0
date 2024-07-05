Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02B13A412
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165969; cv=none; b=kE7zDG+ohmRaS6s/XW20lUrJP8Y3zmEqPcebPMPE6b/Wbzdz7jD66RTQBTl/Bx7dsZvu/JKP7fnFmuVX86UM+l/dVGtK2K296n6q1xn3U6iUmf0KDJtPVGgmSPvftZI9vtVsOeyfWZ2GR7O88U4/1s2UKDrKFjbwdBZU2PPPxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165969; c=relaxed/simple;
	bh=Pj/MOCz6XLfMmV6zbz+TCYbroUMyjtB7Cs9SOx04/GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ok3pJjA+Ao3010CtrUumWA229BScUV2GNSQef1HvP5DstIagXdkob8Rf2mFl8LAEVHx3uNIwKDPzQG+Bms96JnHP7W+0TZYj9EZV4LNsIMwe8w3tHdlbeeqRLvcN2vmVay7+sOkBoOH0XXN+cPFxobX0Nc9VfGiBdH+OSJvs+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2BZFpxB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2BZFpxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720165966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2gyz9uGFDEEX705vkxzAqW+vYsne7J+5QSDE5CBy64=;
	b=A2BZFpxBbR6Ly/yhuLmrcbGVE5Q+UGambsur49ubkEMzHzOCoaG2MLjfl/mXC+JxGMNBmI
	v8RIugAAAxG9vQAr1lnSPY8udsM/TljDqacZw8Jlb8Ke++XMhJ0r9z5fel18FMWqsUQwBh
	7Ccq3spNVoTme0ykuP6Wn/WzITIk8rs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-mMqKDzkPNlGg_gIKkvCPhw-1; Fri, 05 Jul 2024 03:52:41 -0400
X-MC-Unique: mMqKDzkPNlGg_gIKkvCPhw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4257f95fe85so10662025e9.1
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 00:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165959; x=1720770759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2gyz9uGFDEEX705vkxzAqW+vYsne7J+5QSDE5CBy64=;
        b=gjX5NgMkzwk6M5TQCNaJUDb0wp6rh52VifzooA/chlOMzjDTXthFAgkBLwfpb6GFzZ
         dYcvAe/1quJ9UAOs9W1RDX3E7Efu9BguUt7xqnRgCBnuGL2J1fyvIOSTYR3HuDEgmPvi
         9RrW4b0zQLYQ9FhfzBDlASXIUdzW+keJUoBRtK7k9euK8YZqZD8ZQS2anWlHM2/4h3V6
         NXNBGxIlEXj6eey73FY7AwKmaQO0nd+7fewk4AfKv0VHawp3x7C0Ri+xnBKzMFN5Eq3H
         wuPqBavQxof3aYMNdEcp4ZqU2OUBxUA9H5lG0eE/A6JQ/qEDOMIIT4CKd2DkNRDrIBhj
         dvtw==
X-Forwarded-Encrypted: i=1; AJvYcCUZoAqzsd9+/TmfdOEap5wnjnK248hM1kbmGoL7++gmQQ8ubsDB6XGaecLK/rm4znddQzlBS3GIyCYHfusR0Tqta2oPCyDZFQ7O524bNO0=
X-Gm-Message-State: AOJu0YyGkEIiZudeW1VAubtXtwjnEhHRgTDYJOI/m2irz6vJx2v9Qvck
	ijkLCe1e5t3dNxoB2ep1TfFMBBMDpiQqjZ/f5v+9y7tSGmol83GyLFOzxEK67jTute+Ufoefp9x
	pf8G6Gm/2qpulwlHdXI3WU6jw5O7xPnnmP5Ea+gjMBbQEI4sb0vLV+CWsLVgWPLAor8c+Fe/Q
X-Received: by 2002:a05:600c:1c98:b0:424:a5b4:6dd3 with SMTP id 5b1f17b1804b1-4264a48c1d0mr27456205e9.36.1720165959530;
        Fri, 05 Jul 2024 00:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk3Yb4NVNudlm9EYFWr98vgxne6r4cmdPXjl1I3555EPd7rp7P3U/a9BWpIEBcQ0MAA43Hyg==
X-Received: by 2002:a05:600c:1c98:b0:424:a5b4:6dd3 with SMTP id 5b1f17b1804b1-4264a48c1d0mr27455985e9.36.1720165958970;
        Fri, 05 Jul 2024 00:52:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d60e6sm50236275e9.11.2024.07.05.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:52:38 -0700 (PDT)
Date: Fri, 5 Jul 2024 03:52:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Lege Wang <lege.wang@jaguarmicro.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240705034926-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB5481C9F0175734E5036FA2A6DCDF2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C9F0175734E5036FA2A6DCDF2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2024 at 04:42:52AM +0000, Parav Pandit wrote:
> Hi Lege Wang,
> 
> 
> > From: Lege Wang <lege.wang@jaguarmicro.com>
> > Sent: Friday, July 5, 2024 9:05 AM
> > 
> > hi
> > 
> > Thanks for your comments in previous discussions.
> > I'd like to confirm that do you understand this proposal's idea now. If yes, I
> > may start to prepare a more formal V2.
> > 
> 
> Notification enablement offset adjacent to current notification offset seems a better approach than adding the new capability for following reasons.
> 
> 1. pci capability area (non-extended cap) is full to its capacity. New addition can only work in theory.
> An obvious alternative is to add the extended cap and add there.
> However, it is not a good idea either as the PCI spec strongly recommends to not keep adding vendor specific stuff in the PCI capability section.

Can you point me to the relevant section in the spec?

> (even though an option is kept for the vendor capability).

Interesting. EP guys are also asking about putting
the capabilities in a BAR. So we might want an option
to move all capabilities there.

> 2. New area adjacent to current offset can further is simple enough to utilize.
> There is no good reason to complicate by another extended cap.
> If there is one, lets discuss it first.

We might want to pass more data inline in the notification
going forward.
Also kick and suppression can be handled by different entities,
they would need to be in different pages.
Basically, don't combine unrelated things in one place.

-- 
MST

