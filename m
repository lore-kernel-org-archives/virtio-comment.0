Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6142857FF
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292840; cv=none; b=WkBcYtxpgdCg6NcdXrI4J0aVMwvoeFQxgkn+EUWnGmVWH64wOS9w45L/Z4CCtEeQGNXMHzp5RvP4FxEmBTfyE/5pJVG0toW4WPWLsHDBIADrXQ4B7Bp9wi6xvz3vZGGRv9fCsDPFqwJLB0u2sme+QVTNT+8J+hmfb07gndKHvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292840; c=relaxed/simple;
	bh=uczfNU1ZPnLmTfmldMhvF0OHZVyfpTIQVIfG5TTYoxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FnJCbJ89oWMl9vwYgRyPdx0lnh9/LudLHf3duB2JLNLHHdy97MsE36sb6lqW7hALEvOCwl+48lIGNcjBTOS2C9xpExv++fpNab3iOLEU3SgD2/dkG3h02nh2O99KjbmZn3yXxMrr9YS2Y1EDvSb6XF3cRWvDNBIRVjqacF+3/IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLfdgpeu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLfdgpeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744292837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtuvIIbo7VXBTNDNxRsztLzQPgSGjdsKvlMr53El1V0=;
	b=OLfdgpeullnHK4MbNQqzLIoQF8HMjw7NsZ7zjxpjdBXJ2tudIGNxc/mjrePPSwJAd7LxKk
	8mNk4ST69X37QHZjJSYxVp+bosFgL2ryFDG7pQWu4E4CXCvcen/qE3LqiqliIB+ztbA32I
	wx8FjjjqWP9SvjU3lyJuAEanm+QTf9w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-tJMjLll3P8unDC04oyuxeg-1; Thu, 10 Apr 2025 09:47:15 -0400
X-MC-Unique: tJMjLll3P8unDC04oyuxeg-1
X-Mimecast-MFC-AGG-ID: tJMjLll3P8unDC04oyuxeg_1744292833
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d22c304adso8806475e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 06:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292833; x=1744897633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtuvIIbo7VXBTNDNxRsztLzQPgSGjdsKvlMr53El1V0=;
        b=e6KsGNwys6il2GqNY4GCvHCbTSzTaMxb0x/2YXgd1Xwxipwj9/vef6RXpuh3koAoBL
         uhDGmAquXKN0LE/ofpUGRxPv1HHrbOHeyDWKeutbmUimNW7yz9/C70aYpGXK6dSsQKPS
         2keVBKOhOyvMI89sRgURyV53qjrTfWybdOZc7NlpkFhhNuwQqyzlBYeEMlsBeRIzP7tE
         Shj6P6fOLz+BOT1s3x7wCF8jFMxtOps6RLx/7bMA30eZlNsNEHAncCnigkCwoiYFdfAx
         u2rVxZ0mkCNd5VZ5sqb8uO0whMshTkJQl4HGtZbAKk5JfNxzDIH8Xls0+sNEcQ4F1+hL
         oaZA==
X-Forwarded-Encrypted: i=1; AJvYcCULh/XQpbAHQeVIBFvLJx14TZLkuAC7bcdVltcojZwLBwQ1A6Xf0z/mBoQrUxqveFxRcfJOzUDjRWs9m2A9Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhoLjGD35MUNSk5qOK5PdBpjNZA/ePny3Wv5MqjSKvveiK2iw+
	AuAhmzMj1vPKuxY3P6Hu6otce/bmutCnu+sf3LgYHsKEIDYVTrAiiIhcujh0TYPvZzo7iWwNlfJ
	KMXrxclPc3RbfuAjsnWjL8NfxMIPoVKTdMaZaF028NKB+PmNEooOzb0uwqkuvqgg9
X-Gm-Gg: ASbGncvWC6sIWSAc1zncSnc6mogvAOlshLJz9F53Ug7dljXLAD9SGa4dN4FD5WtLIrK
	e4jMqUtwKIuX1cw5COCyAIQeB2xSX4jeY1+7AR7TeFrgJ/Y/XPywExThlunjbJ7H8+Ve2lL/qDR
	xuKCChS2ynD52BnYx181flD1F3OL0MilOYMMdATLVI6DgyS/ig8QEz6oHzvPLFaUuJYfR9rRZnf
	OemfQ5Ww7Aw84VdUTENoLO6v567QdJp7G+zQlGAGMQtAMnSXNRgPPM5SmMoQHdm2XDLVhaJ4VJy
	wdNAQQ==
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39d8f4dcd59mr2639258f8f.25.1744292833487;
        Thu, 10 Apr 2025 06:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvoZyy4+fYWK2bvjcSiEnAgEcJZbkzEs2V//k4HCuEQvWNtdeKFzuNxHbDRM8dfzszNz1cLg==
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39d8f4dcd59mr2639232f8f.25.1744292833128;
        Thu, 10 Apr 2025 06:47:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2f64sm52169095e9.16.2025.04.10.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:47:12 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:47:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, fupan.lfp@antgroup.com, niuxuewei.nxw@antgroup.com,
	parav@nvidia.com, stefanha@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <20250410094703-mutt-send-email-mst@kernel.org>
References: <CAGxU2F4c4E4Bg4F+GhO3pQBk=3Bj7D1jaNisbnyNXUNvjVUs5g@mail.gmail.com>
 <20250410104727.3149826-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250410104727.3149826-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yChivu1uATqTLKe-ZDZ_1shmpLFxUFaSxkSfi1qDVWQ_1744292833
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2025 at 06:47:27PM +0800, Xuewei Niu wrote:
> > On Thu, 10 Apr 2025 at 10:59, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Thu, 10 Apr 2025 at 05:06, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > >
> > > > > > On Wed, 9 Apr 2025 at 08:56, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > [...]
> > > > > > > >
> > > > > > > > The idea is to inform the guest which addresses are reachable by the
> > > > > > > > device, so the guest can easily decide which device to use. I'm
> > > > > > > > talking about the destination, so CID_HOST(2), CID_HYPERVISOS(0) or a
> > > > > > > > sibling VM (CID >=3).
> > > > > > > >
> > > > > > > > >
> > > > > > > > > We have had the guest_cid field in the config space. The guest knows all
> > > > > > > > > devices present in the VM.
> > > > > > > >
> > > > > > > > Okay, but how can the guest figure out from this information which
> > > > > > > > device to use to talk to the hypervisor or an application in the host?
> > > > > > > >
> > > > > > > > >
> > > > > > > > > If the app tries to bind a random CID, it will fail since the driver can't
> > > > > > > > > find the device by the CID.
> > > > > > > >
> > > > > > > > I'm not talking about the source CID on which to do bind() (which I
> > > > > > > > honestly don't like), but I'm talking about the destination CID on
> > > > > > > > which to do connect().
> > > > > > > >
> > > > > > > > > > so that the guest knows which device to use depending on the destination
> > > > > > > > > > CID.
> > > > > > > > >
> > > > > > > > > Yes, this is what I was describing in the previous comment. The message
> > > > > > > > > will be directed to the device by the destination CID.
> > > > > > > >
> > > > > > > > Sorry, I don't understand how you do this without having an
> > > > > > > > information from the device about what addresses it supports. Can you
> > > > > > > > elaborate a bit?
> > > > > > >
> > > > > > > Thanks for your explanation. So things you were talking about are as
> > > > > > > follows:
> > > > > > >
> > > > > > > 1) guest app as a server: the app MUST do `bind()` to a CID that is
> > > > > > > available in current VM.
> > > > > > > 2) guest app as a client: the guest driver picks a device and uses the
> > > > > > > device's CID as src CID, so that the guest app don't need to do `bind()`,
> > > > > > > but only do `connect()`.
> > > > > > >
> > > > > > > The key point is who takes responsibility for picking a device:
> > > > > > >
> > > > > > > 1) I prefer the guest app to do such thing: do `bind()` to pick one, then
> > > > > > > do `connect()`.
> > > > > >
> > > > > > Why?
> > > > > >
> > > > > > This implies that users must be informed in some way that they must
> > > > > > use a certain CID to communicate with the VMM and another to
> > > > > > communicate with the host application, when they could just as well
> > > > > > use CID_HYPERVISOS(0) or CID_HOST(2) for that and everything would be
> > > > > > transparent.
> > > > >
> > > > > Sorry, I didn't express it clearly. I just listed my original idea and your
> > > > > idea.
> > > > >
> > > > > What types of services can be considered as hypervisor services?
> > > >
> > > > TSI.
> > > > The vsock used to implement it end up in the VMM (i.e. libkrun), right?
> > > >
> > > > > In our
> > > > > case, the kata-agent is a control service for Kata, so could we consider it
> > > > > as a hypervisor service?
> > > >
> > > > Nope, kata-agent is clearly a host application.
> > >
> > > Make sense for me.
> > >
> > > > > How does the driver know which device is for hypervisor? A possible way is
> > > > > to add a feature, like `VIRTIO_VSOCK_F_HYPERVISOR`? If it is possible, I
> > > > > think the CID_HYPERVISOR can still be used in the case of 3+ devices to
> > > > > maintain the same behavior.
> > > >
> > > > Or adding a bitfield in the config space, where the device set several
> > > > flags depending on what kind of CIDs is able to handle.
> > > > They don't need to be negotiated, IMHO. Just advertised by the device.
> > >
> > > Will do in the v7.
> > 
> > BTW this could be part of another proposal if you don't want to speed this down.
> > I think we are talking about 2 features here: multiple devices and CID
> > supported per device.
> 
> IMO, it could be considered as one proposal but two features:
> CID_HYPERVISOR support and per device CID support. My idea is to split
> these two features into two patches.
> 
> WDYT?
> 
> Thanks,
> Xuewei

Split is always good.

