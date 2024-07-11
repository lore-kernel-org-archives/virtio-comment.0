Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC827E0FC
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708265; cv=none; b=AsFj9qGGE3LPcohBdQHZUkIZsH3xJ3DOaSnzpcQ0CCuBkzVrcdiqmDF+uuh3S7KeYhrMR7R3VDcxLPezD19MMmaXAcRAs27wzizaQwfI5I62BaiHnwLSEXevXUEXY1B40y6BghPAT+qNOrYwmx/EG7K4uozyEPrsxviRKcnG2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708265; c=relaxed/simple;
	bh=dNdWsjDZN89ZRn5kwSI+dPBDgYUdYzfVj0nCkVyyB8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ud1QB0h9fmgm8kpEgiX8+gMkiQyIuJOQ8fCOAQa0XfYH7bDUpxRhd55lkAlpQLF5UJtmMOIuWmOi8NJMjl4t9Tk5a+QWPeaAku1E9FOuIyLy+jty5CTP+mfesA9ItAuLusGVvgXX/9WZJOlbcsq6sCR9HxRX5ci5A9gbWPIow+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+AJ61Z+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+AJ61Z+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720708263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAyqE8XktV2jOEe5zRdbWyznB3B/nyL+Sn+BDU652kI=;
	b=Z+AJ61Z+qcaJjB5Vg8r+7/K+/ZzQv454j+xUh2WGmxJY0ZYUvUm5P2nrW0OWBLi04bMPcZ
	5PZklNvaW5hNngn0kykNDSgFFx28WCSPzBE7+M7MWIboDPsxUr2Iz8SRKXvm7Yd6ZILZQb
	x+I57ajkeBk2NetTAUGowuXnoOLd+98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-fnZjA2XTPN24WLKKIPNR_w-1; Thu, 11 Jul 2024 10:31:01 -0400
X-MC-Unique: fnZjA2XTPN24WLKKIPNR_w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42674318a4eso8308295e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708260; x=1721313060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAyqE8XktV2jOEe5zRdbWyznB3B/nyL+Sn+BDU652kI=;
        b=ZuXXuvpPnv9ikyTtGNPd5oM1rj3ze3d8I9IZZYR/IKx/DL5UwF07iiF84xMHPc3f2v
         W9O8izrUtByWXwTqn4dFfzg8JpUW48QqyV/FzMoWZ8LGrMYqcQtZuvnyFQ6aSpxnnbib
         0bB7mWiuAuDda67FX/4ShwsKs0Tsx8M7T+zVEIX1OwJMgzyTPFwKXCUkRzlGTpruoDLJ
         zgL92/aRp4TSJRda4JIYCUrj8EJJ3g8/ZtQbxPIVAnbiQQIEXN2TkZLoTOhBEq9XH5s7
         v9kGlfb0VSSnBbkFyRl2ruqv4X0x7ModNper15dGnG/2a+rDtNgYcdaZZ48p4qE+IMSU
         VojQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWE4bPGZ9BFnN4OX0RQEcRyLwggQwMVePmCEzg9tcpokur9RAbsP7xDLb2A0RM3BKtN9xXwo7IYG9zBLKHlJODYj3F4ObicBmVva0ZMwM=
X-Gm-Message-State: AOJu0Yynmun9SkUwxbNwuQW5r7Ck7gDA+CU47uyZGk+gq05k5DTBz5IB
	h2c6a/EeVNpisKjcFTQH1gGU0AFGtZhKnV6FDJQZ160nuRyrXnirgt9Iojpsn1aNjArHXplOQdz
	hPNe7rO6ziQFBEfoyUbpDYXAgwLVt+6ENGn/LOzWIesQXssPK7XbkdjjoNkDOtruhT8aQHnmj
X-Received: by 2002:a05:600c:2152:b0:426:6f0f:2b21 with SMTP id 5b1f17b1804b1-426707f892emr69588275e9.31.1720708260172;
        Thu, 11 Jul 2024 07:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2oTIz8oLc6VSZPda7knZenYSPmfAL8kQqhlw1/ud7WCM6Y7M6+OqmWYeqoiPFj2qJEAkQ9A==
X-Received: by 2002:a05:600c:2152:b0:426:6f0f:2b21 with SMTP id 5b1f17b1804b1-426707f892emr69587995e9.31.1720708259556;
        Thu, 11 Jul 2024 07:30:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42799292bfcsm28484745e9.17.2024.07.11.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:30:58 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:30:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711103014-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240711070740-mutt-send-email-mst@kernel.org>
 <87zfqob184.fsf@redhat.com>
 <20240711074942-mutt-send-email-mst@kernel.org>
 <87wmlsb0m1.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87wmlsb0m1.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 01:59:34PM +0200, Cornelia Huck wrote:
> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
> >> >> The virtio documentation currently doesn't define any generic
> >> >> requirements that are applicable to all transports. They can be useful
> >> >> while adding support for a new transport.
> >> >> 
> >> >> This commit tries to define the same under a new Appendix section.
> >> >> 
> >> >> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> >> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> >> ---
> >> >
> >> > I am not sure what is this supposed doing - just listing basic things
> >> > transport does or all things it can do?
> >> >
> >> > If the later, this ignores several things that transports can do,
> >> > such as shared memory, data in notification, etc.
> >> 
> >> Maybe split this up?
> >> 
> >> A transport needs to implement the following:
> >> <list of mandatory things>
> >> 
> >> A transport is encouraged to implement the following:
> >> <list of non-mandatory, but strongly suggested things>
> >
> > Some things just depend on feature bits, and a transport
> > can make a feature bit mandatory if it wants to.
> 
> I wasn't thinking about mandatory for a device/driver, but mandatory for
> a transport (e.g. stuff like per-queue reset which is not mandatory for
> a transport to implement.)

Same thing really.
For example, queue reset is controlled by VIRTIO_F_RING_RESET


-- 
MST

