Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF62F855
	for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727263070; cv=none; b=iE8rjlqv3tX7hjK4Z/bgz+7rBY0Bqdwg54zmt7Pip5xg55v8M1rRGtIEUmuYnyMCot9RBFm1TWF1lS67TQYDbgWgvsa4qqrr4nnjGiU4xBzjm1T+UOVA4ooAyoXML9yc8VwRt8NvGzI25P6uD33rKqun8cX1MTg6CRLtQPvCg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727263070; c=relaxed/simple;
	bh=zGpbf1jdAiuKVcIJo+OdrT6Jgn2hJplcqDqcLCWDqS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EI2ZwVkreISWzaKT7ZPzqtVT0DPYfN/gD+ioYXpWrUvNKgelp1r6an4U10XwfxyTbs7ebqhT9n+F5YCVoaPcb7H518fkxqJl0YioMNj8hn+QS1zqhr5kDqfA6mE7HnF/ZawhPz/3VeGbwbshDP5T6AAkHjkCpdUfpZJOxmC9IQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTJ0V7/g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTJ0V7/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727263068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE9Vtj/jNbbkhbkaFQk+Ts6pfwGcVSTRGHQYfdgB+IA=;
	b=YTJ0V7/gquQXtbFObnwcDj1t33GgKazNe3gyhToMhtfnFTtf//7ffQ+R6WTuTj8P6n7mk2
	og+eAbRvx2ASHp2At3hDHWPxwmf8fajhH6G/yjCyZTrukX0QLVezpIRRy2yLaJFHaWdbsW
	IHtzVe5NsdePveC3/WBAMBzs9VCTqLE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-kZHOQ3XJOKW_Afcwm0bzig-1; Wed, 25 Sep 2024 07:17:45 -0400
X-MC-Unique: kZHOQ3XJOKW_Afcwm0bzig-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb830ea86so46174165e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 04:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727263064; x=1727867864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wE9Vtj/jNbbkhbkaFQk+Ts6pfwGcVSTRGHQYfdgB+IA=;
        b=G/LF3VGKu4/aVDavlrAFddQqMskdyACN0k564TaO6R+ZEdWYuXuExGdsleT6PeVWNP
         0mmMKBERdVQTkF82/fEMln1hpPT+8fCK3THwrtOaLKT/IfnH7a8w9GkTII+WWlvRHNYu
         TTOAB3wkRxa1Cp/3Rys4PgoU9xM0fb8jtmz3NLkFYxbmi3aHL4PFG1+BvJTswXl86NAj
         oYLXc+O9aR2IGKeP1B1b7WSUGtN4IFfRLac/E5E68ajx+HP6yKJmDVhU6XR+bAWe4W45
         g5E8FKWqAew3UH/RT3MBhy6sAxVpgnkuLM/d1qQUjS0yj05t7OYiiE4eoDLJUpkDRlTG
         1DJg==
X-Forwarded-Encrypted: i=1; AJvYcCV+yXedYgEaolNHcJOYTwwcBJTj1ldsMtd+fh2CxDPgcicJm/m84s+U3Qwzwzfk0kxVWMtuiwCUbb+RYvxuDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YysKg1IS/uu0T31kUGt8WwjJL2hK+uOIq/OWK1WlRJqpHo7oId7
	ZHMNgEORMgiqug8j9ETXTkjOZMJDhs3KPCkRUd2TnC3FsEclfY287vz5Kmi1OcEiQgSD2iytt6U
	AwYlYIEb55nikGCBUyIgvoqzwEUvOX06iPmRJfF5BnQPwTq9oiD/UP0Sn/x09+F+G
X-Received: by 2002:a5d:48cb:0:b0:374:c50e:377b with SMTP id ffacd0b85a97d-37cc24d962cmr1392938f8f.57.1727263064572;
        Wed, 25 Sep 2024 04:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeKSHtuN3NCWem2zLPfSMp24/Eb3xNRpsxeaX7CJ50OMQ5J44C94uM9/zlZlwcEa9j9xZWxg==
X-Received: by 2002:a5d:48cb:0:b0:374:c50e:377b with SMTP id ffacd0b85a97d-37cc24d962cmr1392921f8f.57.1727263064186;
        Wed, 25 Sep 2024 04:17:44 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7405:9900:56a3:401a:f419:5de9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a55336sm15000635e9.47.2024.09.25.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:17:43 -0700 (PDT)
Date: Wed, 25 Sep 2024 07:17:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240925071332-mutt-send-email-mst@kernel.org>
References: <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
 <20240911061712-mutt-send-email-mst@kernel.org>
 <CACGkMEtW1B_8mKMEx8tQTsqRXSZSVmFwD1bkPucyjJt3ctj0Pg@mail.gmail.com>
 <20240912013755-mutt-send-email-mst@kernel.org>
 <CACGkMEvWiNLXCUAXfDox=pz4gWvJWQfScHTv5u_LJqdO3Nmz=A@mail.gmail.com>
 <20240924185950-mutt-send-email-mst@kernel.org>
 <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsn3gy1_NaN6KAh9qDGyE2Q7U5b+vzCUFuk3a4duT0zqQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 25, 2024 at 11:47:49AM +0800, Jason Wang wrote:
> On Wed, Sep 25, 2024 at 7:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 24, 2024 at 03:35:57PM +0800, Jason Wang wrote:
> > > >
> > > > > And I still don't see why
> > > > > introducing a single new bit in the status brings any new troubles
> > > > > compared with the existing reset and other state transitions.
> > > >
> > > > reset is not a state.
> > >
> > > Well, I'm not sure I get this. Each value read from status should
> > > represent a device state.
> >
> > What makes you say so?
> > status represents driver state, not device state.
> > In fact, driver writes there and does not double check with the
> > sole exception of reset.
> 
> 
> For example, spec said
> 
> """
> 
> 2.1 Device Status Field

yes, this is confusingly written

> During device initialization by a driver, the driver follows the
> sequence of steps specified in 3.1.
> 
> The device status field provides a simple low-level indication of the
> completed steps of this sequence.

And note the sequence is driver sequence.

> It’s most useful to imagine it
> hooked up to traffic lights on the console indicating the status of
> each device. The following bits are defined (listed below in the order
> in which they would be typically set):
> 
> """




> Driver knows its own state, so there's no need for the driver to read
> it from the device.

That is why it never reads status.


> >
> > > And 0 is a valid status which means device
> > > is resetted:
> > >
> > > """
> > > The driver SHOULD consider a driver-initiated reset complete when it
> > > reads device status as 0.
> > > """
> >
> > It means all registers have their reset values,
> 
> This is exactly the device status? Drivers need to know that there's a
> device state that is safe to start to program.

yes but otherwise, all registers respond normally
device is assumed to be fully operational, and
it is assumed that no time at all is needed to
get from that to DRIVER.


> > but it is
> > not a special state in that device behaves normally in this
> > state, it does not need to be handles in any special way.
> >
> > Contrast with suspend where device does not respond and
> > must be first resumed.
> 
> I think not. Driver can choose to reset the device when the device is suspended.
> 
> Thanks

Yes, reset should take device out of suspend.

> >
> 
> 
> >
> > --
> > MST
> >

