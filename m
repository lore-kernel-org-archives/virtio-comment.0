Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A284DFF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683296; cv=none; b=GyHn9agsfQnnOwnzMFrW7D3DsdEKT+OwTK90G2DhQo9Zw+atm4WF3p1YGxG4shJn7npWlW2PqyVYbtR1HX4hbJ2IwZoRzWuoA93+GRLH65ZIHC6lWm00Nw5GHNUr47/7nZHNpbh+l+rxAn37Sa1H7cst49J+/1aFDEJ8iyuoNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683296; c=relaxed/simple;
	bh=krBEYwiMnRqa0SaCLEcjQjIvIhx59TBl3cv3ahfpXF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Yt6wuIDJczUg3vVblWO/rjb+YRTF/zHWiGjovvEJsj8g2w+JMR5Stm2qQuJ9cJo1LkOBMpBYwVKsoWnexbHthzRMCnf3vl0I1I9kmlfvtie30mDgpa31u0zlebWt3FjjzTo5uvy0XXTp7e1HmrlqVyPCI/YnnA9p8h6fXz5ZVas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioHF5mDe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioHF5mDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720683293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XAYitE9nJzpqfov8vMCR3+HCtp2l1CFo9UonUICbFXc=;
	b=ioHF5mDeNjCnyRyk3jRMxTwFODOHSSidNmCAwT3IufLPDiY126q4dFM8xDEFI24PzW1Xjk
	YWDttN7gptwhpj7tqGELWnS+LUwEtxilQCoTgh8tm1nLFMdRVkO+47YdWZ8Fe3jToYLaje
	e4U7QkE6YIhIGuTH1UxGiDMcuuu02qM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-9Jf0Gw0eMwGy4YQiRwEr0g-1; Thu, 11 Jul 2024 03:34:51 -0400
X-MC-Unique: 9Jf0Gw0eMwGy4YQiRwEr0g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4279418eb2bso3401395e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 00:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720683291; x=1721288091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAYitE9nJzpqfov8vMCR3+HCtp2l1CFo9UonUICbFXc=;
        b=uYhC1tvMTp+nCBc1gH8PcISIfqV0eJZNAGGVE1XvQkAyi9LgvQp95Bc//cAktVu9qU
         wrz5jTPSZ5U3kuE7nW01tJXygH2wR3FkmzHFeN8ZKDkgiLd1r4L7/DUkRK4HznyHh5vi
         PYPHZeoCImKXggRo3pCdVMRsaU2SCb5EzLV2VxqSAK8VRAEURzDLi9XWajgeDHs5tGb3
         yX26d0HZLiNAxCejAMiuypfaNcP183SJp3boQzhit38JshC4vUSPLrpKErVxOvRUQ+9W
         nB3O0S/vr6WS02fM0NPn9wJYQVLsdnaR6cZGHcw7D7rHFJImCjJf4dVrXNqCYVgp0aui
         IJdw==
X-Forwarded-Encrypted: i=1; AJvYcCVC/a4U3z+KIQNySdzTcUv5z5id3wan5A5k8UjQY0+f/XTHzfERJ8Hd7/O0yvWJhS75A4BEy2DhqeIqjfO2PPuR/O+feaYR6NY2s3cxRKk=
X-Gm-Message-State: AOJu0Ywu6GWCFalfma/Z9OgcLP3Q82B2vt0VbJviCWwVw6mbDA4tTWwe
	CnvQEojEaAOcFzzjaQ7Ucm3MIQJwUXYN/kayfatVyEgpS6AjEEi3EnzGRLtrQ1UPbqTW1KguSr7
	05jkAaGLejZpt93V5aw7MgG+7ZxBSd++a/wouBb1QBRioZFl5Xe7nvd0+yBTYx3o6
X-Received: by 2002:a7b:ce8c:0:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-426708f2043mr52761845e9.30.1720683290809;
        Thu, 11 Jul 2024 00:34:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHquGbf/jcoIz0Pe2vhQVKRXL0EqHdzd82stVkgyghueKYzAOub709SsibO85AbeuZV3A1VVw==
X-Received: by 2002:a7b:ce8c:0:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-426708f2043mr52761625e9.30.1720683290222;
        Thu, 11 Jul 2024 00:34:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42725d2e132sm86323795e9.32.2024.07.11.00.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 00:34:49 -0700 (PDT)
Date: Thu, 11 Jul 2024 03:34:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH V6] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711033414-mutt-send-email-mst@kernel.org>
References: <51a926b4ea2240753bcda6041a9076d58e980082.1719299462.git.viresh.kumar@linaro.org>
 <ZnrZh5lfnFNMn5bM@fedora>
 <20240626024130.z2g2ypjyn23sgwmf@vireshk-i7>
 <20240711072128.ptal2sigsg5cu3dv@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240711072128.ptal2sigsg5cu3dv@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 12:51:28PM +0530, Viresh Kumar wrote:
> On 26-06-24, 08:11, Viresh Kumar wrote:
> > On 25-06-24, 16:51, Matias Ezequiel Vara Larsen wrote:
> > > > +\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
> > > > +
> > > > +The device keeps any data associated with a device-initiated transaction
> > > > +accessible to the driver until the driver acknowledges the transaction
> > > > +to be complete.
> > > > +
> > > > +The device doesn't access the contents of a virtqueue before the driver
> > > > +notifies, in a transport defined way, the device that the virtqueue is
> > > > +ready to be accessed.
> > > > +
> > > > +The device doesn't access or modify buffers on a virtqueue after it has
> > > > +notified the driver about their availability.
> > > > +
> > > 
> > > Why are the last two requirements in this section? Are not these
> > > requirements independent of the transport layer?
> > 
> > Hmm, maybe you are right. Cornelia ?
> 
> Hi Michael / Cornelia,
> 
> Can we please get this merged a bit sooner ? It has taken a huge
> amount of time to get this upstream. I posted the first version on
> 5th December :(
> 
> Please see if we can get done with it a bit sooner. Thanks.

Iterate faster then.
Are you going to address Matias's comments?

-- 
MST

