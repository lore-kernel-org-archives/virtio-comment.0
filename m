Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3DF1474AF
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303004; cv=none; b=PTJcA9thAHNleBDa/GsQPknDvbDaHsGxetw8psjIuz9Hbajd9DpZxWSu3CYHcy2k7HNSKsFj6gHh5CYOhBpHxVo12SlbPhzMqf28uDT4CrLSjYX3GldVWSSwbFax4p+tEt68azeie81YMhQQjW+sV0T2NNZnXBfGMAElkV8TbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303004; c=relaxed/simple;
	bh=hGWAuvbHn30Cl64KHNzXsuDQmRw7y+zGNSRzvnoEukA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E9/U+Ql5MjEmI5N/H0MmJM9LGDpryGe9Cu+KQe02S09pxe9o5gmu6X8xsAY8N/qVBthySRJKmJq0bUldEgRzpv5ENzVx7CBKmxOfbry7gayaugVpWkxhpMjdiqR6pU5ydJy5Zz8/t66cP430rH2F3pG8rdnsY63xtfkbrRuOd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBUIjcZq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBUIjcZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719303001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TrYBMAF7ZCXxAvIfEGbeiusLdRMD/IC8M66xBhciszU=;
	b=CBUIjcZqBPHOyCIb8kD8NsfmIeNMUT74q3HlMjiU/IFtARcqRd1mqOs+ZrZFRE2eidjSBg
	jve1Wp32EWraVjCt2TaI/GtBD7/pqPAJCSErOZv0GixUSAyGBC+40eRa5d+F0UTmfb2xHQ
	0ZWC+8O+C7oi7auzS4+c+UjWI1RMJKQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484--w3NngGhOcum4Lc5scSPew-1; Tue, 25 Jun 2024 04:10:00 -0400
X-MC-Unique: -w3NngGhOcum4Lc5scSPew-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ec5bafd65cso17665511fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302999; x=1719907799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrYBMAF7ZCXxAvIfEGbeiusLdRMD/IC8M66xBhciszU=;
        b=tKf+fKLjdu9tAaR8NYNVbHkHDqyKR7f11uFA40K37YKbAlg4NTgUvBSjAkLkMHQys4
         MYgi0VJ0TNKBwLoxAPZSdxTbbt3j4gXW2BSM6z4eISLjC8BtQPeeWnXhsbLgNmDoTTF/
         L92iuBp7kj9DjxGiJQ9MVLtlKfc3dwk37qBUEFiZG4iq+nR4Ehkh/GLco9+fGAhMTh3G
         CBRSKUdgAZbRXvFz2ZVZWdGIbBqsDev27TiiYIqjjsaJj3C5lHah7KvZB89TN8WPHL0k
         sbmhKzz54+eXv7MIppR9wMtJBQgEM0QiXXpL5gds0UPp9AFYpDYkA0uy/2p+iAx5n4G9
         /0vw==
X-Forwarded-Encrypted: i=1; AJvYcCUq/MgHPJ6HzfNfwYcOJH01Lm9/tw9CitWqynbfeML7PHCQjOFEd4gcpJ+XxNgU5ooheZe8RSEHNYr/TKRtyNb5aiTSO75/UeyRIcRxuiA=
X-Gm-Message-State: AOJu0YwErkgqE6+rQqdsgZ8IJjHjQ2tzVXETNMvGln7d3ovXDsCrIi0b
	cTBx9x8XQybJ6r4Xqb+KFRIJ1EnzovKKzTrSgCOxur8GM1ERlvUwC+vNcU4XhTB+pMTcmxbV6s3
	C3pfsEq2+51rtRbKawOQ9M6dGHyhd/Isj+F2vfviAkIFrtO6GmIaHM3s6lBrQiRMw
X-Received: by 2002:a2e:80da:0:b0:2ec:52f8:17ad with SMTP id 38308e7fff4ca-2ec57a02ea5mr46632391fa.45.1719302998808;
        Tue, 25 Jun 2024 01:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw9dwtWAtjS+UMgis+biLD76r3bwg5rBcHAtl2m2aD0mhNLBR35762uuL7TXXrXsfTbAXepQ==
X-Received: by 2002:a2e:80da:0:b0:2ec:52f8:17ad with SMTP id 38308e7fff4ca-2ec57a02ea5mr46632141fa.45.1719302998081;
        Tue, 25 Jun 2024 01:09:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910dcesm169931395e9.35.2024.06.25.01.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:09:57 -0700 (PDT)
Date: Tue, 25 Jun 2024 04:09:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625040729-mutt-send-email-mst@kernel.org>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625035343-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F6B84ABAF617B0571242DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F6B84ABAF617B0571242DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 08:00:45AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 25, 2024 1:25 PM
> > To: Parav Pandit <parav@nvidia.com>
> > Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>; virtio-
> > comment@lists.linux.dev; mie@igel.co.jp
> > Subject: Re: MSI for Virtio PCI transport
> > 
> > On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> > > > So MSI-X is clearly an optional feature which simple devices tend to ignore.
> > > > But if both are supported, then obviously Virtio will make use of
> > > > MSI-X, but that's not the case here.
> > > >
> > > If both are supported, and required scale by the driver is <=32, driver can
> > choose MSI due to its lightweight nature.
> > 
> > Unlikely, MSI vectors are tricky to mask and this is a problem for interrupt
> > balancing. So MSIX is better for performance even if the # of vectors is low.
> Masking to my knowledge is not used by MSIX.

There's a mask bit per vector, yes.

> Didn't follow how MSIX helps with performance.

Linux uses mask/change/unmask to balance interrupts between CPUs.
*That* is important for performance.


> The benefit of MSI is it does not need to store addr+data pair per vector.

The addr/data thing wasn't invented just to make hardware costs go up.

> > 
> > --
> > MST

