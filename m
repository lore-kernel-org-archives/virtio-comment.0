Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CE13A400
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720447036; cv=none; b=APSn4/c91yrkzmjSG59cuozupW12TRFzv4yjGs1svEozhB6jG2VjtNRNwJtMzFgyrUBMmgaQaIYxkCzEa/PLgqszJKWZOhaVOZNq03ZsdxI+HnMrAv2o16WQMnOLBi9oFSdSVUO1nTX6rAnmtFhfuBlHrurdHqf/JJL4mZ4tfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720447036; c=relaxed/simple;
	bh=AHdyLvuWqrrz8kHHRv+Ry9zmlBvgdOjg4VFy6IEgr6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvBpfCOtASVNwFU+wl9cHpfbrF4GwK+tD2p/tRon2sj/hd6gq0NB0EgOF7yAT6r17pgTE3F7s8GeR+9GQDSbln/356o0asPs4X965V8Fjxk41xSTJ93z3quMYETW0GkpyfdMFjFa8/Lc6IJvBdzhn75vKvikIALyqEsfdtAgwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IyqD1spf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IyqD1spf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720447033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=NeECr+AgV4o+IfrBr2/QLGJssF/YN+0AD0ZAgv1brmQ=;
	b=IyqD1spfp5cgujvo/hge27SCrGKez1Mo70kPcNdjc1YSNW0VXTyPSAF6dZ1593ZaN4AJge
	Ekpz2MDwraJIh3O54YrjVJQ82qYTbVvbY+HR15IMnPxcJJj39qQ6vJ94fQU5CWVeoHd5/W
	EDNTTh0ZojQpWlgZIGFnowujoCK6v7I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-6NIOCyFmM_G0Cjq-mNUBDg-1; Mon, 08 Jul 2024 09:57:12 -0400
X-MC-Unique: 6NIOCyFmM_G0Cjq-mNUBDg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3678f403afaso2394964f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 08 Jul 2024 06:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720447030; x=1721051830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeECr+AgV4o+IfrBr2/QLGJssF/YN+0AD0ZAgv1brmQ=;
        b=UpeDCHD/7Um0d+a/0rbVoxSgkOaX8F+tstPhMQQe6mba7Ug4MDMjZbunOU3LOUp4tu
         njhF3EfKvmPNp6dkPUf7s8PvZCxEYbxdCOrx/VGNqA8O4ZOs9g/lSfrUdEnR+vMFg2Ko
         nt8cQbbq1FrpzRDaUrCzVz8hYWdu0z5jpWu6xtbP9F+3AA0z07hPLyu3FzFHCVAL8+Ew
         I4gDYJNmXsrt326odRxeyllg7NT1wo3xx0hKcNb8BPIcgUYs0IymX0YeT0NgJTOKHIKs
         tNL2XAhxr+3piLWXZ/u411E4oaLDRw+SxmfvalF0tYJYdKHY6Vc/ymlj4b1HRtQSaqrm
         JUEw==
X-Gm-Message-State: AOJu0YwTmemcgh5ONP76/5udy8xNIkdL7iizaJPqmqBoY1u1Iw5c+Ubg
	37ouqHFoHPBGoIbp7sLVaxdfdBciKxp2HC5CZnezoL2qS9NjGYvGQpqdbWTT4O+o5N3iAIszTYz
	ITT1GN7SbLOF9o83+s1m58LrGPAHGGBCuZW1BLy6B11uUymEhFQtM/sxDhW8go1grv6HHpfrQaz
	+RHh6yMTvAMLg2jDBHEukwkt1xIQuLvxFW6V/pdmYWALeSKKnL
X-Received: by 2002:a5d:4d52:0:b0:35f:10ac:ea50 with SMTP id ffacd0b85a97d-3679dd3634bmr9951275f8f.37.1720447030650;
        Mon, 08 Jul 2024 06:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2N9z9LFAMTOWaT1/ePptRbQjcOcHmi8pXwATxqr/9vn66aDYX1dcT8E8VfGYrP78zBgvWhw==
X-Received: by 2002:a5d:4d52:0:b0:35f:10ac:ea50 with SMTP id ffacd0b85a97d-3679dd3634bmr9951252f8f.37.1720447030082;
        Mon, 08 Jul 2024 06:57:10 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679983882csm11722581f8f.78.2024.07.08.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:57:09 -0700 (PDT)
Date: Mon, 8 Jul 2024 15:57:08 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com
Subject: virtio-can: question about updating the status
Message-ID: <ZovwNMzPC5i5jsPG@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

in section 5.20.5.1 of the virtio-can device, the spec states:

`If a status update is necessary, the device updates the configuration
status before marking the request used.`

When an update of the status would be necessary? The only bit defined in
the status field is the BUSOFF bit. Is this statement talking about this
bit? 

For example, this means that if the driver sends a
`VIRTIO_CAN_SET_CTRL_MODE_START`, the device would disable the BUSOFF
(in case it is set) thus updating the configuration status?

Thanks, Matias.

