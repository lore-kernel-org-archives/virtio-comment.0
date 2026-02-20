Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445A3126D4
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581810; cv=none; b=NkO5ccXQd65pJGB8VmpaJKYD06TcNGNMbBJqUdq9te+uMbp/vSZnjatkAW6F5QOpC78IL6grtTD/5OUl5QynrWniv5JxnbgXk2bpZ+UieJxxEptCaWBYMqdAdJxx3xB9DbakjhTOi4YW5Rp97ip9Bzj72Nmk3cRzsypCrqjRjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581810; c=relaxed/simple;
	bh=NaneQZXxu8K40Np2buRzepRZkFzczFAHhhQ5Rll4HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GqXaLVqXlO9YH9bR9D+26TS8QJVHn6q1yEFBM2n2RxiQZQQL+sjjiASI8ZpmSQcc1+c5Qd4kLH4dAZ7a2xdf0+VpGylICDU09DyqPivgZxsylG/MQdwLm/83s+++ku0oseIxmreD3wCFEbFcYcq627aY4qdp+JveJ6ivDU31G9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvkjFqAG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvkjFqAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771581808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9hMttMg6KMQwPuvnTfMFM4MPiIjvkUHy8KrQ5tB0lQ=;
	b=dvkjFqAGh9G0W8XvxbAyZ1SUnrArjmaI4Qtkv/UWjQWIMyp3ohnBuxVXQrb+hMHoi9axNn
	/VmVWEMOwuauCcjw8CiDW9d3N+aNLFabfriV0VMgR2/x1h6b4hqFTgR06ovMjgYJowaqxh
	+Lhq0p6ZnOmFGebnOdPiq/qOCJ23yT8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-DB0yLMl6MtyV4SLkyF8xUw-1; Fri, 20 Feb 2026 05:03:26 -0500
X-MC-Unique: DB0yLMl6MtyV4SLkyF8xUw-1
X-Mimecast-MFC-AGG-ID: DB0yLMl6MtyV4SLkyF8xUw_1771581805
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43771113b3bso1689413f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 02:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581805; x=1772186605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9hMttMg6KMQwPuvnTfMFM4MPiIjvkUHy8KrQ5tB0lQ=;
        b=Gn14jwvh+iHbvqELpZeAGCCP8V+0cGWZ3+kZ/aJbKUKNh4linPMe2LxZxy48nh61sn
         tgMA1HjezMXXDAreY0s7y3POUjmD6iBRgLTIW0FdW+roA7vWggMujwAkrHPF9PMT17al
         tSmuQWNMH23x3XhYV0Hgov33oHWXpLxkN00oC8xRigh4jFT+voM++wkAjfE/CbPplYpr
         X7BIhI4gMoZXVnLAiYafznuTVToV08mOc9Z2D6+IskX8qZRPBqlFgz0jhTm+fwq9vowd
         1f93CQjGM4OLGziYupQy5fOyAsAq1cTJ2HAmrms3AWsZZ3NlIU2GSueow2X3ZLlQzfto
         GAuA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLL497dnbSRuzxxkoTJRmbxgN32UFuJrDQL6BWS7XBCHzywTTE7z6rFpZEm4WpMGmGfWmxV52kdmH9CyBZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp2OX+1+s42RznFiTOeOnLLV1LRZR+lwTFiqY98ZkDgluZqeSi
	FGUnlkyiWulpk9vESdkoyfO0/vMB/CsLzXmRinvfI0OB0cDDTYaqe5RSDCiOub/dinM1MjNvn6U
	mBEQk/0qCyvGLAAZbQlhCBv96/7IWxNKOl6C0+vn5uOPwjlFj6ISvkireBO6Dn7hQOQ79
X-Gm-Gg: AZuq6aLBHVByUqwlPH8Ka2YAwSFl0kcsZHFZuexi0GEAjkIXSVxKzq8VkIQ1f3D6d8D
	c2nI8CigtISKz3P4yrINZmSJu63K5/5cK9uGElkr+iJFLJCwp0/ItlkLVHhy1lc3T3jFWQArvY5
	rfqXwi0rtuZgkI/i4P9LRNJcQvyEB+SqaEEYHR9SaKoZHy7hJcGosGB1A/2uaZOrA3kSsHsSNBn
	Igl2Eq9TzDTAMeOsL/hwY9BsZbhu7QARyQV9plOpQIXVsBxotJQGnay0XgzLjw9dTT5Rnc/MPC0
	3i6PtuUtCj9b3LE1YMUx45nWbd7szr/6KJeRHE6PcEqsJ34JXfPMvzAt0UtEZ6llZG2BCVh68bG
	dEdgzTjocQmeqoPPVEXUXq18qVkNNfiR9pabgUYdrcybMgA==
X-Received: by 2002:a05:6000:228a:b0:436:1d80:b663 with SMTP id ffacd0b85a97d-43958e5428amr14956082f8f.58.1771581805437;
        Fri, 20 Feb 2026 02:03:25 -0800 (PST)
X-Received: by 2002:a05:6000:228a:b0:436:1d80:b663 with SMTP id ffacd0b85a97d-43958e5428amr14955960f8f.58.1771581804492;
        Fri, 20 Feb 2026 02:03:24 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm59310906f8f.19.2026.02.20.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:03:23 -0800 (PST)
Date: Fri, 20 Feb 2026 05:03:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Bill Mills <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260220050136-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 54LvFsLl46tGSqF1Jx5-Xak39MM4yAjkwWXwQ2N0Wto_1771581805
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> > > 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
> > the virtqueues.
> > > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> > 
> > surely this can be an optional transport feature bit.
> > 
> How is this optional?
> How can one implement a transport without defining the basic data transfer semantics?
> For example for TCP transporting, driver side OS is implementing header format foo, and device side is using header format bar.
> How does it work?

I'm not sure what do foo/bar refer to, or what TCP transporting means.
The simplest way to do TCP on top of virtio is to layer it above virtio
net. That uses VQs for data transfers.

-- 
MST

