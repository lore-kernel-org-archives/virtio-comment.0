Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276A13D276
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167922; cv=none; b=FlNPjs2b8ChBIAFKKOVD15utESdGV1Vki52FPNpw8s174AMxnMpSlpA4nVCRhcTL5sQ3kDqUfJmXW1L/SnBpr+CRL24v4lbFpgXgThLIEQvR81hqaQzd6FU65t1aguRxTey4VepB3nI/NpO2bvr5+fiuuM+BBQfbskiyAn2tK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167922; c=relaxed/simple;
	bh=D7JL7BwNeVLt97MUNI+bqFqB/AULEjWBnFvdXxVXIW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bOWCIw62KCCxHXHv4Y8o7r6wmAmFzSxDPBWja0LrhM2nJW6c8o50RcJsCYJ6/ptphENVWzZmLo+9IxaEnoUprbEWgwi2dH3RLSD3dABj7z4snTLQRt3w2gS4XqrsoYuRywqzH9R9fjeJ31H27IriabtZmpF7A53WMuJ3lGsyLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AaJX0GW4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AaJX0GW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720167919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mXVlMoEL50exdsEOgTsK0Kn8iTNpvMBaBmiEZUK2Amc=;
	b=AaJX0GW4BnBsXwm4kumpq9mf+v4EtymNsvMtqTHBNt6XJA8kgq/lCWPWnUb2RSrpmYNboE
	NU9ulSlbUgS26pPnMBO79cpZ5g3qoVmZi5RfYX7yWC+DC8jNm63pS/Usb62j5Da2wSZObk
	BRCRXqiuU1wJjl2b+jIG9PWHXE+PtJM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-wA2hK0jdOZeQYpvxrfrqfg-1; Fri, 05 Jul 2024 04:25:16 -0400
X-MC-Unique: wA2hK0jdOZeQYpvxrfrqfg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-425739141c2so10309335e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720167915; x=1720772715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXVlMoEL50exdsEOgTsK0Kn8iTNpvMBaBmiEZUK2Amc=;
        b=XAYeBjdM8BeEOJhtiEIjiGfpK7f6uEs3a7MUJUwC7SneZLAolePd+QCCtCzNmADPql
         9uJGW989Vp5UxqJiAqrlOS1S1qxYt53Ag+C1NCefaDGreWUbIoEA+p9jJY3MSuYgE5Oz
         7F9Ut/gIxAFwRmL9x2Il9vqGabcoOC0ih1Ee4zcF3FQnh7Eol+xLXtwqBiDX0qSraG8z
         KnFw8vRiU06qIddttTYr9StLK5Zds3dK84FtDjPHhap/2DZoNGmlY7XfS28S6F/A3oeY
         xH9j4Gg5nuRvmPwYFW9wPTGkYC6DCALRUgrxozfAOewxu0T2lm7L/rnxrJKmGhgKXjaS
         WiBg==
X-Forwarded-Encrypted: i=1; AJvYcCW4g7/oCXp1i3WV/HN0hIM0mrcb9dtDFSx3U42QBoqctImIojwuEN0sha5WG5SB/nqnJROfei5CWb6RYjjI3yfUBr7mD5T6pt5od82sbO4=
X-Gm-Message-State: AOJu0YzKM+do4vV3tvLjlfuU6R06jcvAGkUnlmbMft6izq9b1WbkpCxg
	nBsH8M2DgE06IirZoBJCYaCi+W3E9FFJwEWQsREt9NowCDxWvsTCt1d90hLa9n65xS3nYO1hLUF
	QFyyc4dl+IPD4KcuopEHqzDdkB9pXaXWz0+/h58k7Ajx+TtnnIpvMTtsz7oaHKQ5J
X-Received: by 2002:a5d:6451:0:b0:367:963e:91f2 with SMTP id ffacd0b85a97d-3679dd7c341mr2713443f8f.69.1720167915706;
        Fri, 05 Jul 2024 01:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENyXZHolTOf5i+brtcVZpB9UujU/WWcYwBPnE8LmDsp5BipXrXC4HTt/Ryir+cRXXeJskGWg==
X-Received: by 2002:a5d:6451:0:b0:367:963e:91f2 with SMTP id ffacd0b85a97d-3679dd7c341mr2713412f8f.69.1720167915136;
        Fri, 05 Jul 2024 01:25:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a5a31a1asm1605453f8f.7.2024.07.05.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:25:14 -0700 (PDT)
Date: Fri, 5 Jul 2024 04:25:04 -0400
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
Message-ID: <20240705042420-mutt-send-email-mst@kernel.org>
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
> 1. pci capability area (non-extended cap) is full to its capacity. New addition can only work in theory.
> An obvious alternative is to add the extended cap and add there.
> However, it is not a good idea either as the PCI spec strongly recommends to not keep adding vendor specific stuff in the PCI capability section.
> (even though an option is kept for the vendor capability).

To stress, we need to solve this problem, even if the specific issue
can be worked around differently, we keep adding new caps.

-- 
MST

