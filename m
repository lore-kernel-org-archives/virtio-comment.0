Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80951A7F7B
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722419706; cv=none; b=SzG1zll+7xnKAFtfEMIq4GjcNI0t4xZ+BYAkV8g7r4V0dELcrmU6Uv0nDhWUQe1Vw9OfeV6T3JJyBs2aqVKVCNBt1SPZEKktXm0FcKjc2+/bOVo9v9Sp8Untqc4jFZWE5VTJwV9YNCN0HdVbpfpFeUH9k85jqMQmvvp4qFRYpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722419706; c=relaxed/simple;
	bh=9/EBdBseSakitVYevy7/G/lY9hNjMj1wFFg6QzmMKYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uq+rm313Rg/QFaH07ECWewSB4DFMifm2jD/lO8dnKyszEABbRmpWloC2wTq+bcezaGDfDuzwzPQhU/erprqWuB40wUkSCNFqkoXVPNq6ZL5+qvjsrcARqRDqp89mkzU3inmu+cKbmefZFwCNflCzefqWnYOJ+6bb2Ic/KeoqHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvbysSGW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvbysSGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKHbem7OIWMVjnxKgIsYF2MPpTFLcfQgTQTwwGYp2jg=;
	b=YvbysSGWJJHszZFvL8E9vzGB8n12abjXxG1DUEMhp74E+RrulkwL1PekjppplzWHjrIoRS
	PB4raKo58wyHUxFp+vdInmtvZkvlbrUgqLIafxhWH8T4PqCIQKh2olBIDzJw67HCBncR4r
	q1nwYvnBBNLf8Ngbmuk8+rSEbIcxAhU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-Zc0Sld0kP6O-W_j1Xm8p6w-1; Wed, 31 Jul 2024 05:54:59 -0400
X-MC-Unique: Zc0Sld0kP6O-W_j1Xm8p6w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7ac5d81e2dso527408166b.3
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 02:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722419698; x=1723024498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKHbem7OIWMVjnxKgIsYF2MPpTFLcfQgTQTwwGYp2jg=;
        b=fa6+ezUOYH6VoZ4ef+AasvOTHEqJG66W801xVLJZ3sSDEsPbBsBcpsiqcAQ8nnemPw
         4GOoF3FPxZohjJkmCUzqvdBSM6lnfbhywsxlcRDpwgrTd6C0YpGJyOajEQBvhpoDAp5z
         X/Lxf8EzE5Jg0vOduTYRr1l1fuGEg19lJluO8zVLjW/s6FMqAJpnrwHIU2q3KAT6llr4
         rYfKQThxcBM4N0gUN/gn/2Cd45SiP+eu6jkozMpp0BFfeALE7gY7a0TQZOfKEwrSqcvE
         Zv3xpl6/nQnAo17Gn3azCDfaPHAvjfVydE0AZ4B9/huOeXErEqhdVNWO8veD1mPbpO6A
         cchA==
X-Forwarded-Encrypted: i=1; AJvYcCWIYjzZL8WjCNAlpZFzRWAwTCCQn39YnjimY3mxU+BkW+mzgiwTVFuX0o8HfP/RfFZr8jhh/WMBPq7GhdWopt0Gaac0mbkze5WtMzF63pg=
X-Gm-Message-State: AOJu0Yz5EIhdPxSgqJJ1KRWu+hBTtdSR2Raeq9fFUVk6pcoBDv6Lb6Ul
	fc3v6CCwM7vyH5b4KO96QANd3BXLvgwiiShBIO0HxEbHuj+KiSAg7GSe+gnuF9gwI0XU3T/+V7Q
	YzMSMaJC39p64y//ZQeIef3+wPTx44Nx7AyNCazYzhcpo7XOjd9SamMAFNtPoBoZJ
X-Received: by 2002:a17:907:7ea0:b0:a77:d773:54ec with SMTP id a640c23a62f3a-a7d3ffadc81mr1025419866b.8.1722419698602;
        Wed, 31 Jul 2024 02:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvZN6tbVg+dHcQzSq10qF1b/GljfBHt01tHuZQlRyWiLRGCZ08DqkHHvirj7pGI8IPYVbAaQ==
X-Received: by 2002:a17:907:7ea0:b0:a77:d773:54ec with SMTP id a640c23a62f3a-a7d3ffadc81mr1025418166b.8.1722419697882;
        Wed, 31 Jul 2024 02:54:57 -0700 (PDT)
Received: from redhat.com ([2.55.14.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41479sm748084666b.123.2024.07.31.02.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:54:57 -0700 (PDT)
Date: Wed, 31 Jul 2024 05:54:53 -0400
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
Message-ID: <20240731055129-mutt-send-email-mst@kernel.org>
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
 <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
 <87a5hx99se.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87a5hx99se.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2024 at 11:43:13AM +0200, Cornelia Huck wrote:
> On Wed, Jul 31 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 30-07-24, 09:14, Michael S. Tsirkin wrote:
> >> Let's order it sensibly though, in the order in which stuff is used
> >
> > Right.
> >
> > diff --git a/newtransport.tex b/newtransport.tex
> > new file mode 100644
> > index 000000000000..3b760250a4c0
> > --- /dev/null
> > +++ b/newtransport.tex
> > @@ -0,0 +1,44 @@
> > +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> > +
> > +Devices and drivers utilize various transport methods to facilitate
> > +communication, such as PCI, MMIO, or Channel I/O. These transport
> > +methods determine multiple aspects of the interaction between the device
> > +and the driver, including device discovery, capability exchange,
> > +interrupt handling, and data transfer. For instance, in a host/guest
> > +architecture, the host might expose a device to the guest via a virtual
> > +PCI bus, and the guest would employ a PCI device driver to interface
> > +with the device.
> > +
> > +This section outlines the mandatory requirements that a transport method
> > +implements.
> > +
> > +A transport provides a mechanism to implement configuration space for
> > +the device.
> > +
> > +A transport provides a mechanism for the driver to identify the device
> > +type.
> > +
> > +A transport provides a mechanism for the driver to read the device's
> > +status bit.
> 
> Either "status bits", or "status" (as below.)

It is actually "FEATURES_OK status bit" I think.

> > +
> > +A transport provides a mechanism for the driver to modify the device's
> > +status.
> > +
> > +A transport provides a mechanism for the driver to read and modify the
> > +device's feature bits.
> > +
> > +A transport allows one or more virtqueues to be implemented by the
> > +device. The number of virtqueues is device specific and not specified by
> > +the transport.
> 
> Do we also need to say that the transport provides a mechanism for the
> driver to discover the number of virtqueues?

Some do, but it does not have to. Legacy pci did not do it,
modern does but it is mostly used for sanity checking.

> > +
> > +A transport provides a mechanism for the driver to communicate virtqueue
> > +configuration and memory location to the device.
> > +
> > +A transport provides a mechanism for the device to send device
> > +notifications to the driver, such as used buffer notifications.
> > +
> > +A transport provides a mechanism for the driver to send driver
> > +notifications to the device, such as available buffer notifications.
> > +
> > +A transport provides a mechanism for the driver to initiate a device
> > +reset.

