Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C007014A4C1
	for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867824; cv=none; b=JOhDeKxg36TEzrEMOYM7bkcx4/BIvWVdciRivj9POEibXua171LWV1Mgc0P5U4QsaBIDSrb6CVY33IIfj6QO07bnXbKdjN0cTJ6aZR1pGYz5F5B1z06qEDA64VH1D4obZ5pPmzY6ookkkL9BFNtCXRddzPL7VVvwJ6pf0pRBUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867824; c=relaxed/simple;
	bh=qWSKbAOtsZhfSSxtyf+cbzCeQ+qRdNMQiDNTJwpChsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BS7viuTNqsNyd5PRFjms4W56WWETcZKhOqPDvIHKBuQ27MRMIk29D10cEgenPs+4jJ7YhvsIv4cQkvJrImBkrwFVHRBryveYpUVsSnSlk5LQdXAjx0RrX9zc2jnkqFdUR59xHxP//doOqF28GtgHxWrF90xm6c/y2N5VveV5kE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXZSJ5kK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXZSJ5kK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736867821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rV+kytWS+Nk2QMgoQM+cEdAUCJY3MTBGBGNcE68J2DA=;
	b=AXZSJ5kK7cz3nCGWb3e/3cTmSTEXfitAEwnWZXzIM3+tTg1Y3aLqNPrxrCfhxBmHuTE4o7
	j7kbAwB4c3BuPjma95F5MFAhsZXXS8OsSSEWjjrgY9noFpeHV4EoUwlFpXt8JRFRltmD9H
	QKOpgopKhoypZ54Sxl2h0MJr6YYdSS8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-jFbVw0UBOwa_3fNcGHJ83g-1; Tue, 14 Jan 2025 10:16:59 -0500
X-MC-Unique: jFbVw0UBOwa_3fNcGHJ83g-1
X-Mimecast-MFC-AGG-ID: jFbVw0UBOwa_3fNcGHJ83g
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso29823475e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 07:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867818; x=1737472618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV+kytWS+Nk2QMgoQM+cEdAUCJY3MTBGBGNcE68J2DA=;
        b=Rrnekw0clxeFJNJ4W/LJ81DoXpVqAino9572m5MMM1DzXmxOCUrDWc0sfP7dMf4MJe
         yUnVBBqTyF5FvUk83TFNyQ4pzrRVWTsu0QB+UM2H6UYN4cIt6apKA5HEVIdhcaUtDQxW
         JtldTayisRjyDZzJY5k4YNVCtpga2hRKWQfIjIqfUjYrPwTeMWNSTXhL+S/jAjzdieqe
         msX2CLG33RYC0nijJDV0Gjcrs6Qp+f9r1OQ14K53VNz5mQquFPDNZkRAMCsfxn6N+v8T
         cRXIUs9vyR7+YPFvJUrlAVcCXfJKYGogbDSP0Xamk78ln0EjzuZZJjMxG3LSOwrvMrI8
         0XeA==
X-Gm-Message-State: AOJu0Yzizi8X/qZAmbLr4c7ZLAcpCXMYvWGoaWTa1zInyTXZYVHq9LcS
	Iy2mGbL1brfWRxNRou1XSg3HTxYztjEBHGPU2GWiGdNw7xyiowlB2SoV9CzzTAsShSdfP/QV8zl
	tHy8j7PbosYwon+cgd4ZGTPDWVNGIdMAhQZUot69LzjEMezrnrwaqWlfTXoS/8ggf
X-Gm-Gg: ASbGncv9TkACLfaqCpYSGpI/DWLMBPfZm6D6nmm5UhxTpdbv7r7f4LjMREhFCQ6AQKF
	2kLIPtIwM544l2UKbQQXPk/NiqNECiaYR6OkvvhA+NJsbve+qRceFYzTKZwCFMkQouAa7ZYydNC
	oBSVYpgq8TB44xBgQdRkJ3h7Jk8QunnPdfBf2ZeM/y6OmxY58N3iWX0tv5F99CWQWauPdqpD6eK
	kbSfFFxsB9dJsl66j8dg1zho6xyK88LMqy3UVqarusye4M6Mg==
X-Received: by 2002:adf:a44e:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38a8730e0admr17959518f8f.40.1736867817883;
        Tue, 14 Jan 2025 07:16:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqBzBuQQYEURO1KDymCtsXnOWTi20folREIyghzfRQWUYembvaCsC5iDMqANkcaROb6zxSHw==
X-Received: by 2002:adf:a44e:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38a8730e0admr17959491f8f.40.1736867817545;
        Tue, 14 Jan 2025 07:16:57 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:f243:3731:6014:d7c:f11f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6249csm176726025e9.38.2025.01.14.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:16:57 -0800 (PST)
Date: Tue, 14 Jan 2025 10:16:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
Subject: Re: [PATCH v11 0/4] virtio-net: define UDP tunnel offload
Message-ID: <20250114101553-mutt-send-email-mst@kernel.org>
References: <cover.1732699986.git.pabeni@redhat.com>
 <fe15607a-1431-438d-956b-bfec70e94507@redhat.com>
 <175a0b29-5901-4393-9390-64a018bec260@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <175a0b29-5901-4393-9390-64a018bec260@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p2yc7ftnV0bFvFQIXnROrBdy-em6LBaE5kmCBHuob8w_1736867818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2025 at 04:04:35PM +0100, Paolo Abeni wrote:
> On 11/27/24 10:48 AM, Paolo Abeni wrote:
> > On 11/27/24 10:36, Paolo Abeni wrote:
> >> UDP tunnel usage is ubiquitous in container deployment, and the ability
> >> to offload UDP encapsulated GSO traffic impacts greatly the performances
> >> and the CPU utilization of such use cases.
> >>
> >> This series includes:
> >> - clarifications on the current semantic of NEEDS_CSUM offload
> >> (patch 1) and DATA_VALID offload (patch 2) to make later changes easier
> >> to follow,
> >> - new features definition to handle both UDP tunnel segmentation
> >> offload (patch 3).
> >> - new features definition to handle UDP tunnel outer checksum offload
> >> (patch 4).
> >>
> >> A PoC implementation is available here:
> >>
> >> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
> >> https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
> >>
> >> Note that both implementations has not been updated since the previous
> >> iteration, since there are no additional functional changes in v11.
> >>
> >> Changes from v10:
> >> - added patch 2
> >> - clarified only a single encapsulation level is supported (patch 3)
> >> - s/TCP or UDP GSO packets/GSO packets/ (patch 3)
> >> - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
> >>   checksum' (patch 4)
> >> https://lore.kernel.org/virtio-comment/cover.1731084277.git.pabeni@redhat.com/
> 
> I understand all the points under discussion have been addressed. I'm
> wondering the next steps are and what I could do to move things forward.
> 
> Thanks,
> 
> Paolo


See
https://github.com/oasis-tcs/virtio-spec?tab=readme-ov-file#use-of-github-issues

for the process to get a change merged once there is concensus.

-- 
MST

