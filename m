Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1263212FB4
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590975; cv=none; b=bx664UvjgIUl9Olfx8Oh2d9ecNTaQEFPiPYIouwle/dNc1Fw40Fnl2V8hOhLYnbfdo+1LVdiq7CF3pWrJIldQ7Bui8hy++OYDgMLdBYb7sGLKHr5ous9blGb1QnxWzJp9R+xA5E0TNqMrGqlbJ+XCJIEAWBouxr2c+Yq+qzgH7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590975; c=relaxed/simple;
	bh=43B8S8/3cOWM2wT57nWXqZ6AzNtPbX/MQ29XJc4ppVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qFeBKAC+xwe9lKHCxw/Me4/4Yc4VjxuftXCCfoGGhLA2grms1r4yFNIsTqJcuXI9oqMgtCDIF4RHS/GKlwtqp+g4bNkJGMb+GWzDmyV7U3xcaJ10tFRNODYz4XIvM/i6gqb1HL1dlJUc/G+l0WTSVYfWku4/KGBV742twsPZua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFx5U6PX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFx5U6PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740590972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVgzGpBOdVG4Dimb9/AaKHgXzhV/wXCh9/eXafRcuu4=;
	b=AFx5U6PXEDVQoJNI4pOuBO81Zvc348pa+aWIsslJLeGdwC5iDlHXzuIkR07tQKpPdNJT2f
	vH3mPmOUsnommCDqP0IOpNeDQS1YefPNDHiYlnrUp0TTaRhYO5dW4ektn286HglZifGpsr
	cp89Yi19PjmWgIjl4egTLdoJ7iKd+Us=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-r8NhNEh3N5aG6mPgP3JGIg-1; Wed, 26 Feb 2025 12:29:31 -0500
X-MC-Unique: r8NhNEh3N5aG6mPgP3JGIg-1
X-Mimecast-MFC-AGG-ID: r8NhNEh3N5aG6mPgP3JGIg_1740590970
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f455a8e43so2732f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 09:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590970; x=1741195770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgzGpBOdVG4Dimb9/AaKHgXzhV/wXCh9/eXafRcuu4=;
        b=XoxxkSeiZQ2/X7WdLUiUpcr+Uqf+Na+cdY56kP557xP5RGY/FtarX8CA9ZrJAnijkk
         31A9jAPdFP0CDjQIN1FMP4KfB2YpnXVyidXCp8jlm5d04jC1gqQiiJqJ8x1k5EOMWBYy
         j6aJ8bN7MmNBFlsjgdFMIZbYbCBiIkzYCCeZJkFP63ko4YLdx3qNC1YVUlXA8wKHIGOP
         ycEu4vAwQfumbYPOIHzVLXqu2mDbniCqxxlsRGmoFL9oUaFOEUEshj+5BtIFE/AVTg1+
         2wTj09ltfghbJbISQvYPOVKWqNghZpF6/HtHLN9+l4IbJGllYaNAA4Y/Os8ytvfdZXG7
         /bIA==
X-Forwarded-Encrypted: i=1; AJvYcCVX7rjvTcuxS79afKVcOEfDUXTdwL99kuAOVVY8K6jIR4rCGo/YHbM9rfLJr9ru7wGHe6jC3g27m3d/KwqpHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBZ3mfcsMmlckS3KFWrCbBFnpc1b3Y6RuohVdtsz+jiKXYKsA/
	sOjA6c5MHiu7YBAFHragU/p6XzfUybc2OjxGZEP14LZzGVrRcUpM21tH4tgp3f+NxiZRCcD5f8M
	mqNSfFfKvwcIJMWVKHj2S6CVHd/QqUvcPpXgln6VG4hfa5EM2dWTXZZwhziCuefdD
X-Gm-Gg: ASbGncvSQ0LYaw36O6E4ajNtYUOLlRafNhGpHOxEawvWfDET+6vsT1IQsJDp1FuoTHV
	d4WlB9fiUsG65AnmlyseIBz1Pj8XnBHWfk5o82da/gbuzSrSSeM0Q4p3v0lXRj2bMLQAGZxbglq
	xfHXSgZ2Ymfet2Kbg2nhjtILoRovCXAT/LCNAjvg5DFPSJwRZO5vcioa8y3XwVBupB22cYAQbaR
	K8q8FTsDMQemNLjgrF7ntJVUj3kbj/KCSrkXlgPPISdyfDM8JEbBpGxS0/SkiphkOjw5xfg/P9R
	Vc8AEy9a6w==
X-Received: by 2002:a5d:6c68:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-390cc3b1c30mr7188777f8f.0.1740590969791;
        Wed, 26 Feb 2025 09:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXhcRpHU25jUvD2zIMMEJp8vjNyiH+0BXVs3wR578ndom46uZ0rTwdTfx0iu1gGkdsWNCQOA==
X-Received: by 2002:a5d:6c68:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-390cc3b1c30mr7188749f8f.0.1740590969399;
        Wed, 26 Feb 2025 09:29:29 -0800 (PST)
Received: from redhat.com ([2a02:14f:1eb:e270:8595:184c:7546:3597])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539450sm28481295e9.21.2025.02.26.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:29:28 -0800 (PST)
Date: Wed, 26 Feb 2025 12:29:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>,
	Sergio Lopez <slp@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 0/3] VirtIO-GPU spec improvements
Message-ID: <20250226122903-mutt-send-email-mst@kernel.org>
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
 <de02684a-8f36-48ba-b505-85b6d74f5e8b@collabora.com>
 <Z788Yrh6qy9dJOVP@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z788Yrh6qy9dJOVP@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4kFoFXV1X4MGTxbcxC_J10vNep67bbGUpyjo-L7Kokk_1740590970
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 05:08:02PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Wed, Feb 26, 2025 at 01:59:06PM +0300, Dmitry Osipenko wrote:
> > On 7/19/24 15:06, Dmitry Osipenko wrote:
> > > Hi,
> > > 
> > > This is a repost of v2 to the new virtio-comment mailing list.
> > > Michael Tsirkin suggested to repost the patches, here they are.
> > > 
> > > Dmitry Osipenko (3):
> > >   virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
> > >   virtio-gpu: Document VIRTIO_GPU_CAPSET_DRM
> > >   virtio-gpu: Update venus-protocol URL
> > > 
> > >  device-types/gpu/description.tex | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > > 
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/182
> > 
> I think what is missing is to explicitly request a vote as is explained
> in 2) at
> https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues.
> 
> Thanks, Matias


if a vote is already desired, then yes.

