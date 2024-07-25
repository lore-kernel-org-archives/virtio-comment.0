Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC514A82
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 04:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721883234; cv=none; b=udLgrI0dQ2XCSueJgo0h3xu/2jT/9EOYB8DnrKOdvWkz+q1g99yNvwX/rjl09o+VZUtwj4s4xPl8hKNwTdcjTPoWT8uTtCBgmIZ1osJl0oHKHHOhY56b0pwOPS2PMugCh1lgxRsXUx8JtfDsGYrswnbCdoWV0+ylt5vDkYJTOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721883234; c=relaxed/simple;
	bh=TzEuDWkr3D5Mj0Pt5kb4EoSUF6Sj+3V2YTvOOkK2Pug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uyPR7a/Me1luZnAVEqMTezxI6B5MgYWzVECekdjsZvAjmbgSUh2wWttCiOGRSkj9yIx2geccCFOvXrNTNPWRCBom257WuBnklnXzRYafkcImHPfweAmFWCDdKuQxnWMza1AZ/X4cN/vkiELi722CmLQyVUKhxuuI1kBITGFa4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8EKOQjy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8EKOQjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721883231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7iEzcX7QYFfQAwdikF4wqtwv4qKAUpVoYyO07AI4qYc=;
	b=Y8EKOQjyIIYiMVf/ppUojsfZ8a2iUovZyKkKdzvVRSZIliVAPcnY8/XD5TUclu0a+7DfpR
	3CxFeTVPU22PmsE1vmhCnU/5n4OVkBp4w0/yk1tjosL6DFJMTHm0nhzAE+SYg1awnpXB8D
	oP6sx+d87EiW18Q3m6TeQWE4naVkg50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-RbKN9R9tP4qy7aNvNMW1Cw-1; Thu, 25 Jul 2024 00:53:49 -0400
X-MC-Unique: RbKN9R9tP4qy7aNvNMW1Cw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4279b07cd45so3221105e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 24 Jul 2024 21:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721883228; x=1722488028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iEzcX7QYFfQAwdikF4wqtwv4qKAUpVoYyO07AI4qYc=;
        b=jKFFDp8kCpZs3ew4qetS9KtEokVpfjEkw4F9MPUQRfDlemDhdNKpsHmUeyMds/tzVj
         6D2T+NGOI2qk7wIXEhAbg+jnmA2ZpRSfzuWvjHMmyHQl8/pyQxiWR+mci4lEVf0Pm5vq
         LWfhwlVX8Tu9GE3PrdE2f6H83hJ98ChcgVakwo9Y2l6xgtkAGz9llqgPGkw/OSDO4y5j
         R194JGr4vwIwDmNxgCzY1AmW3XQDH8jt3lAebIfsIUGP+8kMaSSyeuctgh2aCavIi4ky
         O0FYG1Fakp6ZDgxsd76jwhhxsVYCHBMCPM6KE2mZQxU09Zv3yB3cV8UVCabA7igGWhhV
         oPMA==
X-Gm-Message-State: AOJu0Yzs6WsRZe3ZymU6Y6X1/IwLqjjitVGYme+ek5Yt2I57kpg8cX+K
	P2JozG2detx3zPETA2FiOEgH/AxDGAq4g9pcMcROp9RvMAsQH4G7JpzuHhsuAr7R4v2xmhQoOOl
	Qq6tBPyjoMlrJlHsM39soZ3w4J9jIFq79/qcO02aBpDN0vjilHIFs/ETogeIcO+Gb
X-Received: by 2002:a05:6000:dce:b0:367:96a8:d94b with SMTP id ffacd0b85a97d-36b31a9f526mr1030126f8f.57.1721883227905;
        Wed, 24 Jul 2024 21:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1kPAjVVUZRJyGin68zz+LnupBkai+UY15mCwm+GDii5eRZQEfjsOgCRwZfEC0ct8sSFgJ/w==
X-Received: by 2002:a05:6000:dce:b0:367:96a8:d94b with SMTP id ffacd0b85a97d-36b31a9f526mr1030110f8f.57.1721883227139;
        Wed, 24 Jul 2024 21:53:47 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ed:8427:35e3:731c:3106:ee46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0113sm772867f8f.14.2024.07.24.21.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:53:46 -0700 (PDT)
Date: Thu, 25 Jul 2024 00:53:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [virtio-comment] [RFC PATCH v3 0/4] virtio-rtc: Add device
 specification
Message-ID: <20240725005322-mutt-send-email-mst@kernel.org>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231218064253.9734-1-peter.hilber@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 18, 2023 at 07:42:49AM +0100, Peter Hilber wrote:
> This iteration of the virtio-rtc RFC spec
> 
> - addresses the comments from Parav (patch 1),
> 
> - separates the normative statements into a dedicated patch (patch 2), and
> 
> - adds an optional alarm feature (patch 3-4).
> 
> Summary
> -------
> 
> The RTC (Real Time Clock) device provides information about current
> time. The device can provide different clocks, e.g. for the UTC or TAI
> time standards, or for physical time elapsed since some past epoch. The
> driver can read the clocks with simple or more accurate methods.
> Optionally, the driver can set an alarm.

What is the status here?

-- 
MST

