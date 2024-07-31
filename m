Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAB1AAE08
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428189; cv=none; b=rmb1xjmxI2xs4/6KZKgTPJVsDdgR9DZiVd0JMXpweXMVQDkaZN2OkWUWm7bqYZxeXkVjw7wwlNETPzeQknSS9F11FFM+2e+ll3FfBArb11KCFV38FxQhda3VnewiKpS3QS+kSYEIftTbWQVcfbXAwPi1TWIbwCF/MYXRY/HSaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428189; c=relaxed/simple;
	bh=47Ao2Mih28K1PxqL/IcnTqb++GCeqNhw0zXWjEUzzXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dNCaw8UozMo0KNHug74gxw6ZsWBN6TeQZI/xSA7pPnXpxoXfr12C7g9h2BlZY784l/1VIBvh0nnLvfMU5N2WJy9ThMLM57GpbWHASdmZHU06LcsLQcFRLvEgBmTox3zIMFIllFeG5EaZLqITwuchG+Mv1tkGvJYAssHhj8A50dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hb7NJj6R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hb7NJj6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722428186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ygKW/wlrtIecDJ2dKzESfH1h9tNX43Bgc3N05qD2Q60=;
	b=Hb7NJj6RDEzsiAqQP2oNJZuGE0ljhkve5y7s+TZFNqgwOU9+S44skT7MBS5d+7/lEnwBMb
	6RDXB1pE/ZsinRQIyDMIImYJAMQrzvWogrfXp6bjmD6X/MdEeU1OimNZ06iChp+R5rRDHd
	BT+wPXlOAnJzqgZAW0SYHWP7PPzX1Ss=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-halNeqR0MPOA0lv8zeXOsQ-1; Wed, 31 Jul 2024 08:16:24 -0400
X-MC-Unique: halNeqR0MPOA0lv8zeXOsQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5b58f321a2dso696535a12.2
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 05:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428184; x=1723032984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygKW/wlrtIecDJ2dKzESfH1h9tNX43Bgc3N05qD2Q60=;
        b=Ld5/OU082Q3tnPurIgVK4qMZhrumXOvsnSnA8GgstWhUi+2RQpVbq9sfa49iqCOvjP
         ljCewKD2umbuhk/TOkAmmwXcp/IL0C0xFMYmgcQPLFN+sfmTC6cDs78YicXq2FYL2+hv
         KVZ9H13ogsjo/XUsE3flSnbXbjUTsnRz/bos4vgLonzSLCUJIO4wLmQV/Vs6EW4TRdYb
         1CRespPpOimm9NOsM/T16uBPtV8s4uZnKlbkfNEVd0AsUiwmG4M7T3SSIMzeixKlxwvA
         knptQUMl5Ledxr9BlevunOR2h4TVK2KncxCOzg6HhBX/cZphkzMMdaimQj755qpnWGGa
         LspA==
X-Forwarded-Encrypted: i=1; AJvYcCVLNbk34t/QBdDdG7x7Jtws5t6viA28Zfj1ZBpoljdpjts31etlX/mAg8lgeJh7damT3RoqasP/WLjOlx4EeNHKUOf1m8Dmq6Xc9vCbuFc=
X-Gm-Message-State: AOJu0YwaNfNXUCMsaHjWdVPEvGe1O3fpk6gXHjihTbg7fmlb76XrKEJ6
	TeEMtNXbQUVtzHE07qlDlE3vjpV7/yaWF0FaIZVPm3NpEBGeFW6CRER0ka+QHYgBfbQHsfY6VgA
	pyX3gNGvVzyItpoF19K9vs8qWFXUjtX3dqznB5Lws+PyNYoKmA5zEyKi3Eal4jq4G
X-Received: by 2002:a05:6402:5109:b0:5a0:ec55:86dc with SMTP id 4fb4d7f45d1cf-5b0205d5fe7mr10654680a12.14.1722428183714;
        Wed, 31 Jul 2024 05:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+RbVdo0FSQgbuYljdf1ZRM2dz3+5q4DKN6wC/D5pe3TqK7p4b7BSG+8FOGbaCGiGC6pbIYw==
X-Received: by 2002:a05:6402:5109:b0:5a0:ec55:86dc with SMTP id 4fb4d7f45d1cf-5b0205d5fe7mr10654643a12.14.1722428183044;
        Wed, 31 Jul 2024 05:16:23 -0700 (PDT)
Received: from redhat.com ([2.55.44.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b04e1sm8620468a12.12.2024.07.31.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:16:22 -0700 (PDT)
Date: Wed, 31 Jul 2024 08:16:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240731081509-mutt-send-email-mst@kernel.org>
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
 <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
 <87a5hx99se.fsf@redhat.com>
 <20240731055129-mutt-send-email-mst@kernel.org>
 <877cd198al.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <877cd198al.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2024 at 12:15:30PM +0200, Cornelia Huck wrote:
> On Wed, Jul 31 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Jul 31, 2024 at 11:43:13AM +0200, Cornelia Huck wrote:
> >> On Wed, Jul 31 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >> 
> >> > On 30-07-24, 09:14, Michael S. Tsirkin wrote:
> >> >> Let's order it sensibly though, in the order in which stuff is used
> >> >
> >> > Right.
> >> >
> >> > diff --git a/newtransport.tex b/newtransport.tex
> >> > new file mode 100644
> >> > index 000000000000..3b760250a4c0
> >> > --- /dev/null
> >> > +++ b/newtransport.tex
> >> > @@ -0,0 +1,44 @@
> >> > +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> >> > +
> >> > +Devices and drivers utilize various transport methods to facilitate
> >> > +communication, such as PCI, MMIO, or Channel I/O. These transport
> >> > +methods determine multiple aspects of the interaction between the device
> >> > +and the driver, including device discovery, capability exchange,
> >> > +interrupt handling, and data transfer. For instance, in a host/guest
> >> > +architecture, the host might expose a device to the guest via a virtual
> >> > +PCI bus, and the guest would employ a PCI device driver to interface
> >> > +with the device.
> >> > +
> >> > +This section outlines the mandatory requirements that a transport method
> >> > +implements.
> >> > +
> >> > +A transport provides a mechanism to implement configuration space for
> >> > +the device.
> >> > +
> >> > +A transport provides a mechanism for the driver to identify the device
> >> > +type.
> >> > +
> >> > +A transport provides a mechanism for the driver to read the device's
> >> > +status bit.
> >> 
> >> Either "status bits", or "status" (as below.)
> >
> > It is actually "FEATURES_OK status bit" I think.
> 
> Also DEVICE_NEEDS_RESET?

Good point.

> I don't think it makes sense to say that the
> driver needs a way to read individual bits, it should be able to read
> the whole status.

It depends on the transport, I can imagine a transport that
saves some space by not keeping a copy of e.g. DRIVER.

-- 
MST

