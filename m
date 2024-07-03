Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55B813666D
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995317; cv=none; b=SSwoebS7HddSziSEWVx1bwivn+ZHzvpObZ05wpaIgAXj5WIwDqWcEINYPILH/sSaEhRrV/Wt37suHVqb6UO9ODBbsUCvNZmwu/+BH4XlBYFsRUbMgs87+oV2NtDDILb6lsY91WasgmnFFKFsqwdD/rydN0zjPEqU4ABMSvuR9s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995317; c=relaxed/simple;
	bh=5oM2lsr00hXro+bHi0vsRwv//Vz53dVAJ4P/+EEW4fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bNIHM+R6MpuGfqu4aeiyX5Cd/rcW60OttakP00OUHWttrS/rxq8SYl626byiLJ9fN4DPFV9mYNXqLaaQar7OO+6xzss1ABqtkGj0MMNE7+F1JSPj2p61HGoDHvTkmAIjF/UkVGxMzQkmYnmFBVmHH0OzFqL7X44J9vNQK2DuixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWhL+hea; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWhL+hea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719995314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SoTqLEGkZhviGOeZl2NzvWBllyqtg+U63NqcihC3zc4=;
	b=iWhL+heanEEsO6UlcPFRgyh0DHE0AaiuOEOW9T23sAIPPHTnN530havDVP+iZwIs6jKu7I
	DJsNncHVyUvQheAsORrEG5rA69ebvtmp74qmiAGhypJHlu4SHYEtQM/r7LlHg95axJpgnO
	d4MfrXqhwV4aV0dovZNx4zB9hJGwwS0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-add2zwXPNbmrHUjMstpIhw-1; Wed, 03 Jul 2024 04:28:30 -0400
X-MC-Unique: add2zwXPNbmrHUjMstpIhw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7246c24b00so364028766b.0
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 01:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995309; x=1720600109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoTqLEGkZhviGOeZl2NzvWBllyqtg+U63NqcihC3zc4=;
        b=RA1wci/ugDAGIRZqiehiIQldxptj+rN3WwW0ViVmdRvRYU/RmvC8VFVQQ4uYpEbija
         GEJF96Z5qzh/FcmEWjwYwDq2X38qRrV4EyvtZpwRVEH3wTThJiSaqZNx9krTeY8ou0Rn
         lkKoqUZRbxYG5jM6QAKlHMEe97ZDYzIm3sSlR5SoxdJOwlUZ7TdCNBrQ1WlKCQqbXUoR
         y3WZ4CEEQRY0NyMHX/bneAGiQjzjZ8s6yl00cuffTMfmm15g5JZMlaOyh3YubR2oj9Av
         JMzbOB+ChZ6la8+9OgJhqfrolQOYeUVGY8IvyaK35cmIY3Bk9A9khmVbqBT9ZYxMTACI
         Xy4Q==
X-Gm-Message-State: AOJu0YxkEg6+rWb6dNlUdLUzqnnAUpsBbOagHmEObuy+j1CS6tJi5NFq
	NqQpImnVV3O83zucwzMI9Kcq0OhMaqfJyW6b2FbETw+6QDoaEtgn5gudYQEIYbY7q7LBIDETVZI
	dU0LLGygDnU5pY0HbyQ+x8qvSwMQsfsWBCXh2194hDTH2efrSD/5TjEHyWyGedHdz
X-Received: by 2002:a17:906:f5a9:b0:a6f:718f:39b6 with SMTP id a640c23a62f3a-a751440f449mr1017378866b.25.1719995309433;
        Wed, 03 Jul 2024 01:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVPdjZypCyK6a8PSZDdKzGHo6vfzjjsLDinylNrcVHuD3BYkPEcWojIZnN/ZE+G+Zx96B0xQ==
X-Received: by 2002:a17:906:f5a9:b0:a6f:718f:39b6 with SMTP id a640c23a62f3a-a751440f449mr1017376766b.25.1719995308831;
        Wed, 03 Jul 2024 01:28:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf18950sm485282466b.20.2024.07.03.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:28:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 04:28:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lege Wang <lege.wang@jaguarmicro.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240703042525-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 06:52:03AM +0000, Lege Wang wrote:
> > > +
> > >  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options /
> > Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> > >
> > >  The VIRTIO_PCI_CAP_ISR_CFG capability
> > 
> > 
> > After reading this and the text, I can't figure out how is this feature
> > supposed to work without races.  What if the device uses a buffer while
> > the driver notification is in flight to the device?
> Hmm, I think it doesn't matter, Only the used buffer enable notification is
> transmitted to device successfully, device starts to judge whether it's time
> to send used buffer notification to driver according to its internal interrupt policy.

I don't understand what you are saying. If device has some magical
interrupt policy why do we need a notification from the driver
at all.

Conversely, if device relies on the notification and thinks that an
interrupt is not needed (because it did not get the notification yet),
while at the same time the driver is blocked waiting for an interrupt,
we get a deadlock.


-- 
MST

